fs = require 'fs'
pg = require 'pg'
db = null
reader = require('buffered-reader')

actorLines = []
text = ''
pgConnected = (err,client) ->
  db = client
  savePerson = false
  counter = 0
  #new lazy(fs.createReadStream('data/imdb/actors.list'))
  console.log process.argv
  if process.argv.length < 3 or (process.argv[2] isnt 'actors' & process.argv[2] isnt 'actresses')
    console.log 'please specify actors or actresses'
    process.exit()
  new reader.DataReader('data/imdb/' + process.argv[2]+'.list', {encoding: 'utf8'})
    .on 'end', ->
      console.log 'end'
      if savePerson
        recordPerson()
      console.log 'about to write text'
      console.log text
      fs.writeFile 'data/imdb/seinfeld'+process.argv[2]+'.list', text,'utf8',() ->
        console.log 'file written'
        process.exit()
    .on 'line', (line) ->
      if typeof line is 'undefined'
        return
      counter += 1
      if counter % 10000 is 0
        console.log counter + ' of 13256039'
      l = line.toString()
      if l.charAt(0) isnt '\t'
        if savePerson
          recordPerson()
        actorLines = []
        savePerson = false
      actorLines.push(l)
      if l.indexOf('"Seinfeld"') isnt -1 or l.indexOf('The Seinfeld Chronicles') isnt -1
        savePerson = true
      
    .read()
recordPerson = () ->
  for idx of actorLines
    line = actorLines[idx]
    if idx is '0' or line.indexOf('"Seinfeld"') isnt -1  or line.indexOf('The Seinfeld Chronicles') isnt -1
      text += line + "\n"
pg.connect(process.env.HEROKU_POSTGRESQL_PURPLE_URL,pgConnected)


