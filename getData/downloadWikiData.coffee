###
downloads episode wiki pages
###
http = require 'http'
fs = require 'fs'
url = require 'url'
$ = require 'jquery'
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
downloadedRows = 0;
epListWritten = () ->
    fs.readFile "data/wiki/epList.html",'utf8', (err,data) ->
        rows = $(data)
            .find ".wikitable.plainrowheaders tr"
        loadRow()
epListWritten()
getEpisodeFilename = (url) ->
     newFilename = "data/wiki/ep";
     newFilename += url.replace(/[^a-zA-Z0-9]/g,"");

getEpisodeCB = (response) ->
    str = "";
    response.on "data", (data) -> str += data
    response.on "end", ->
        newFilename = getEpisodeFilename fullURL
        fs.writeFile(newFilename, str)

        downloadedRows++
        setTimeout(loadRow(),1000)

fullURL = ""
loadRow = ->
    return -1 if downloadedRows >= rows.length
    row = rows[downloadedRows]
    rowID = $(row)
        .find('[scope="row"]')
        .attr 'id'
    if typeof rowID is "undefined"
        downloadedRows++
        loadRow()
        return
    console.log(rowID)
    if rowID.indexOf('ep') isnt -1
        href = $(row)
            .find('.summary a')
            .attr('href')
        console.log href
        fullURL = 'http://en.wikipedia.org' + href
        fs.exists(getEpisodeFilename(fullURL), (fileDled) ->
            if fileDled
                downloadedRows++
                loadRow()
            else
                http.request( url.parse(fullURL), getEpisodeCB).end()
        )

