###
downloads episode wiki pages
###
http = require 'http'
fs = require 'fs'
url = require 'url'
$ = require 'jquery'
pg = require 'pg'
epListUrl = 'http://en.wikipedia.org/wiki/List_of_Seinfeld_episodes'
getListHTMLCB = (response) ->
    str = ''
    response.on "data", (data) ->
        str += data
    response.on "end", () ->
        console.log str
        fs.writeFile "data/wiki/epList.html", str, epListWritten
    response.on "error", (err) ->
        console.log('error')
        console.log(err)
# http.request(url.parse(epListUrl) ,  getListHTMLCB).end()
rows = null
rowsParsed = 0
epListWritten = () ->
    fs.readFile "data/wiki/epList.html",'utf8', (err,data) ->
        rows = $(data).find ".wikitable.plainrowheaders tr"
        parseRow(row) for row in rows
people = {}
peopleNames = []
episodes = []
allEpisodesParsed = false
parseRow = (row) ->
  $row = $(row)
  $tds = $(row).find('td')
  episodeNumber = parseInt($(row).find('th').text())
  if isNaN(episodeNumber)
    rowsParsed++
    return 

  episode = {
    episodeNumber : parseInt(episodeNumber)
    seasonNumber : parseInt($($tds[0]).text())
    title : $($tds[1]).text()
    directors : createNameArray($($tds[2]).text())
    writers : createNameArray($($tds[3]).text())
    date : $($tds[4]).text()
    productionCode : $($tds[5]).text()
  }
  episode.title = episode.title.substr(1,episode.title.length - 2)
  episode.season = parseInt(episode.productionCode.substr(0,1))
  episode.productionCode = parseInt(episode.productionCode)

  episodes.push(episode) 
  rowsParsed += 1
  if rowsParsed is rows.length - 1
    episodesParsed()
stringReplaceAll = (str, search, replace) ->
  while str isnt (tmp = str.replace(search,replace))
    str = tmp
  return str
createNameArray = (str) ->
  newStr = str
  newStr = stringReplaceAll(newStr, "Teleplay by: ","")
  newStr = stringReplaceAll(newStr, "\nStory by: ","|")
  newStr = stringReplaceAll(newStr," and ","|")
  newStr = stringReplaceAll(newStr," & ","|")
  newStr = stringReplaceAll(newStr, "\n","")
  newStr = stringReplaceAll(newStr,",","|")
  names = newStr.split("|")
  for name in names
    names[_i] = name.replace(/^\s+|\s+$/g, "")
  return names

episodesParsed = ->
  pg.connect(process.env.HEROKU_POSTGRESQL_PURPLE_URL, dbConnected)
db = null
dbConnected = (err,client) ->
  db = client
  for ep in episodes
    for p in ep.directors
      if typeof people[p] is 'undefined'
        people[p] = {name: p}
        peopleNames.push(p)
    for p in ep.writers
      if typeof people[p] is 'undefined'
        people[p] = {name: p}
        peopleNames.push(p)
  db.query "TRUNCATE person", (err,result) ->
    db.query("SELECT setval('person_person_id_seq',1, false)", insertNextPerson)
numPeopleInserted = 0
insertNextPerson = (err, result) ->
  personName = peopleNames[numPeopleInserted]
  if typeof personName is 'undefined'
    allPeopleInserted()
    return
  insertName = personName.replace("'","''")
  query = "INSERT INTO person (name) VALUES ('"+insertName+"') RETURNING person_id"
  db.query query, (err,result) ->
    people[personName].dbID = result.rows[0].person_id
    numPeopleInserted += 1
    insertNextPerson()
allPeopleInserted = ->
  db.query "TRUNCATE episode", (err, result) ->
    db.query "SELECT setval('episode_episode_id_seq',1,false)", ->
      db.query("TRUNCATE episode_has_person_in_role", insertEpisode)
episodesInserted = 0
insertEpisode = ->
  ep = episodes[episodesInserted]
  if typeof ep is 'undefined'
    allEpisodesInserted()
    return
  sql = "INSERT INTO episode (title, airdate, season, seasonnumber, production_code, episode_number) VALUES "+
    "('"+ep.title.replace("'","''")+"', '"+ep.date+"', "+ep.season+","+ep.seasonNumber+
    ","+ep.productionCode+","+ep.episodeNumber+") RETURNING episode_id"
  db.query sql, (err,result) ->
    episodeID = result.rows[0].episode_id
    insertWritersAndDirectors(ep, episodeID)
    
insertWritersAndDirectors = (ep, dbID) ->
  insertWithRole(ep, 'writer', dbID)
numPeopleInserted = 0
peopleToInsert = []
peopleRoleInsertEp = null
peopleRoleInsertRole = null
peopleRoleInsertID = null
insertWithRole = (ep, role, id) ->
  peopleToInsert = ep[role+'s']
  numPeopleInserted = 0
  peopleRoleInsertEp = ep
  if role is 'writer'
    peopleRoleInsertRole = 3
  else if role is 'director'
    peopleRoleInsertRole = 2
  peopleRoleInsertID = id
  insertPersonWithRole()
insertPersonWithRole = ->
  personToInsert = peopleToInsert[numPeopleInserted]
  if typeof personToInsert is "undefined" 
    peopleInsertPartComplete()
    return
  pObject = people[personToInsert]
  sql = 'INSERT INTO episode_has_person_in_role (episode_id, person_id, role_id) VALUES (' +
    peopleRoleInsertID+','+pObject.dbID+','+peopleRoleInsertRole+')'
  db.query sql, ->
    numPeopleInserted += 1
    insertPersonWithRole()

peopleInsertPartComplete = ->
  if peopleRoleInsertRole is 3
    insertWithRole peopleRoleInsertEp, 'director', peopleRoleInsertID
    return
  episodesInserted += 1
  insertEpisode()
allEpisodesInserted = ->
  console.log('done')
  db.end()
  process.exit()
epListWritten()
