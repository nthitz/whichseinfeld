fs = require 'fs'
pg = require 'pg'
ratings = null
ratingsFileRead = (err,data) ->
  ratings = data
  pg.connect(process.env.HEROKU_POSTGRESQL_PURPLE_URL, dbConnected)
db = null
lines = []
dbConnected = (err, client) ->
  db = client
  
  lines = ratings.split("\n")
  readLine()

linesRead = 0
seinfeldLines = ""
readLine = () ->
  line = lines[linesRead]
  if typeof line is 'undefined'
    allLinesRead()
    return
  if line.indexOf('"Seinfeld"') isnt -1 or line.indexOf("Seinfeld Chronicle") isnt -1
    add = line + "\n"
    if line.indexOf('The Chronicle') isnt -1
      add = line.replace('The Chronicle','The Clip Show (Part 1)')+"\n"
      add += line.replace('The Chronicle','The Clip Show (Part 2)')+"\n"
    seinfeldLines += add
  linesRead++
  setTimeout(readLine, 1)

allLinesRead = ->
  fs.writeFile('data/imdb/seinfeldRatings', seinfeldLines, 'utf8', ->
    console.log('done')
    process.exit()
  )

fs.readFile 'data/imdb/ratings.list', 'utf8', ratingsFileRead
