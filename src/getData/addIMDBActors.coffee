fs = require 'fs'
pg = require 'pg'
NameFixer = require './FixName'
actor = ''
actorLines = []
lines = null
linesRead = 0
actorsLoaded = (err, data) ->
  lines = data.split("\n")
  readLine()
readLine = ->
  line = lines[linesRead]
  if typeof line is 'undefined'
    allLinesRead()
    return
  if line.charAt(0) isnt '\t'
    actorToInsert = actor
    actorsLines = actorLines
    tabLocation = line.indexOf('\t')
    actorName = line.substr(0,tabLocation)
    actorNames = actorName.split(/, /)
    actor = actorNames[1] + ' ' + actorNames[0]
    actorLines = []
    actorLines.push(line)
    linesRead++
    if actorToInsert.trim() isnt ''
      insertActor(actorToInsert, actorsLines)
      return
  else 
    actorLines.push(line)
    linesRead++
  readLine()
db = null
dbConnected = (err, client) ->
  db = client
  if process.argv.length > 3 and process.argv[3] is 'false'
    db.query 'BEGIN', readList 
  else
    console.log 'delete'
    db.query 'DELETE FROM character', (err,result)-> # delete all actors
      # console.log err
      # console.log result
      db.query 'DELETE FROM episode_has_person_in_role WHERE role_id=1', ->
        db.query 'BEGIN', readList 
    
readList = (err, result) ->
  if process.argv.length < 3 or (process.argv[2] isnt 'actors' & process.argv[2] isnt 'actresses')
    console.log 'please specify actors or actresses'
    process.exit()
  fs.readFile('data/imdb/seinfeld'+ process.argv[2] + '.list','utf8', actorsLoaded)
personID = -1
insertingActor = ''
insertingLines = []
insertActor = (actor, lines) ->
  personID = -1
  console.log actor
  insertingActor = actor
  insertingLines = lines
  db.query('SELECT person_id FROM person WHERE name=$1',[insertingActor], personExists)

personExists = (err,result) ->
  if err isnt null
    console.log err
    console.log result
  if result.rowCount isnt 0
    personID = result.rows[0]['person_id']
    insertActorLines()
  else
    db.query('INSERT INTO person (name) VALUES ($1) RETURNING person_id', [insertingActor], insertPersonCB)
insertPersonCB = (err, result) ->
  if result.rowCount is 1
    personID = result.rows[0]['person_id']
    insertActorLines()
  else
    console.log err
    console.log result
linesToInsert = -1
actorLinesInserted = 0
insertActorLines = ->
  linesToInsert = insertingLines.length
  actorLinesInserted = 0
  insertActorLine()
insertingEpisode = ''
insertingEpisodeID = -1
insertingCharacter = ''
insertingCharacterID = -1
characterIDS = {}
insertActorLine = ->
  line = insertingLines[actorLinesInserted]
  # console.log line
  if typeof line is 'undefined'
    readLine()
    return
  if  line.indexOf('"Seinfeld"') isnt -1 or line.indexOf('The Seinfeld Chronicles') isnt -1
    #console.log 'insert ' + line
    episode = line.match(/\{([^(]+)/)
    character = line.match(/\[([^\]]+)]/)
    insertingCharacter = character[1]
    if episode is null
      # doesn't match normal form, possibly the Pilot episode?
      if line.indexOf('The Seinfeld Chronicles') isnt -1
        episode = 'The Seinfeld Chronicles'
      else
        console.log 'invalid episode title ?'
        console.log line
        process.exit()
    else
      episode = episode[1].trim()
    episode = NameFixer.FixName(episode)

    if episode is null
      actorLinesInserted++
      insertActorLine()
      return
    insertingEpisode = episode
    # console.log 'epName: ' + episode
    db.query('SELECT episode_id FROM episode WHERE title=$1',[episode], getEpisodeID)
  else
    actorLinesInserted++
    insertActorLine()
getEpisodeID = (err,result) ->
  # console.log 'getEpisodeID'
  # console.log err
  # console.log result
  if err isnt null
    console.log err
  if result.rowCount is 1
    episodeID = result.rows[0]['episode_id']
    insertingEpisodeID = episodeID
    getCharacterID()
  else
    console.log 'episode not found'
    console.log insertingEpisode
    process.exit()
personInRoleInserted = (err, result) ->
  if err is null
    actorLinesInserted++
    insertActorLine()
  else
    console.log err
    console.log result
allLinesRead = ->
  console.log 'all Lines Read!'
  db.query 'COMMIT',->
    process.exit()

getCharacterID = ->
  if typeof characterIDS[insertingCharacter] isnt 'undefined'
    insertingCharacterID = characterIDS[insertingCharacter]
    insertPerson()
  else
    db.query 'SELECT character_id FROM character WHERE name=$1', [insertingCharacter], selectCharacterIDCB
selectCharacterIDCB = (err,result) ->
  if result.rowCount is 1
    insertingCharacterID = result.rows[0]['character_id']
    insertPerson()
  else
    #console.log insertingCharacter
    db.query('INSERT INTO character (name) VALUES ($1) RETURNING character_id', [insertingCharacter], characterInserted)
characterInserted = (err,result) ->
  insertingCharacterID = result.rows[0]['character_id']
  insertPerson()
insertPerson = ->
  characterIDS[insertingCharacter] = insertingCharacterID
  query = 'INSERT INTO episode_has_person_in_role (episode_id, person_id, role_id,character_id) VALUES ($1, $2, 1, $3)' # 1 is user role for actor
  db.query(query, [insertingEpisodeID, personID, insertingCharacterID], personInRoleInserted)

pg.connect(process.env.HEROKU_POSTGRESQL_PURPLE_URL, dbConnected)
