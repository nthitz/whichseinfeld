fs = require 'fs'
pg = require 'pg'
nameSafe = require './FixName.js'
ratings = null
ratingsLoaded = (err, data) ->
  ratings = data.split("\n")
  pg.connect(process.env.HEROKU_POSTGRESQL_PURPLE_URL, dbConnected)
db = null
dbConnected = (err, client) ->
  db = client
  parseLine()

linesParsed = 0
parseLine = ->
  line = ratings[linesParsed]
  if typeof line is 'undefined'
    allLinesRead()
    return
  if line.indexOf('{') is -1 and line.indexOf('Pilot') is -1
    linesParsed += 1
    parseLine()
    return
  name = line.match /\{[^}]+/
  if name is null
    name = "The Seinfeld Chronicles"
    rating = line.match(/([0-9]\.[0-9])\s+The/)
  else
    name = name[0].substr(1)
    parenPos = name.indexOf('(')
    name = name.substr(0, parenPos)
    rating = line.match(/([0-9]\.[0-9])\s+"/)
  #epID = name.substr(parenPos)
  #season = parseInt(epID.substr(2,3))
  #lastParen = epID.indexOf(')')
  #seasonNumber = parseInt(epID.substr(4,lastParen))
  rating = parseFloat(rating[1])
  title = episodeDBName(name)
  if title is null
    linesParsed++
    parseLine()
    return
  sql = 'UPDATE episode SET imdbrating='+rating+' WHERE title LIKE \''+title+'%\''
  db.query sql, (err, result) ->
    if result.rowCount is 0
      console.log sql
    linesParsed += 1
    parseLine()
episodeDBName = (name) ->
  name = nameSafe.FixName(name)
  if name is null
    return null
  name = name.replace("'","''")
  
  return name
allLinesRead = ->
  console.log 'done'
  process.exit()
fs.readFile('data/imdb/seinfeldRatings','utf8', ratingsLoaded)
