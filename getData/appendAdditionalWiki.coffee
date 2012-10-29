fs = require 'fs'
$ = require 'jquery'
path = 'data/wiki/'

folderRead = (err,files) ->
  for file in files
    readFile(file) if file.indexOf('ephttp') is 0
    break

readFile = (file) ->
  fs.readFile path + file, 'utf8', (err,data) ->
    $f = $(data)
    $infobox =  $f.find('.infobox')
    titleBoxes = $infobox.find('.navbox-title')
    title = $(titleBoxes[0]).text()
    console.log title

fs.readdir(path, folderRead)
