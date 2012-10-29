fs = require 'fs'
pg = require 'pg'
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
  sql = 'UPDATE episode SET imdbrating='+rating+' WHERE title LIKE \''+episodeDBName(name)+'%\''
  db.query sql, (err, result) ->
    if result.rowCount is 0
      console.log sql
    linesParsed += 1
    parseLine()
episodeDBName = (name) ->
  name = name.replace("'","''")
  name = name.replace(/^\s+|\s+$/g, "")
  name = name.replace('Highlights of a Hundred','The Highlights of 100')
  name = name.replace(/: (Part [12])/," ($1)")
  name = name.replace("The Cafe","The Café")
  name = name.replace("The Chronicle","The Clip Show (Part 1)")
  name = name.replace("The Fix Up", "The Fix-Up")
  name = name.replace("The Friars Club", "The Friar''s Club")
  name = name.replace("The Mom and Pop Store", "The Mom & Pop Store")
  name = name.replace("The Stakeout", "The Stake Out")
  name = name.replace("The Strongbox", "The Strong Box")
  return name
allLinesRead = ->
  console.log 'done'
fs.readFile('data/imdb/seinfeldRatings','utf8', ratingsLoaded)
