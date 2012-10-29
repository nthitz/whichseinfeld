http = require 'http'
fs = require 'fs'
url = require 'url'
filename = 'data/epList.json'
episodeList = []
fs.readFile(filename ,'utf8', (err,d) ->
    list = JSON.parse(d)
    episodeList = list.result
    loadEpisode()
)
loadEpisode = ->
    episode = episodeList[episodesLoaded]
    rdf = "http://rdf.freebase.com/rdf#{episode.id}"
    console.log (url.parse rdf)
    http.request (url.parse rdf), (response) ->
        str = ""
        response.on "data", (data) ->
            str += data
            console.log data
        response.on "end", ->
            fs.writeFile "data/freebase/ep"+episodesLoaded+".xml", str
            episodesLoaded++
            loadEpisode()
        return
    .end()
episodesLoaded = 0
episodesToLoad = episodeList.length
