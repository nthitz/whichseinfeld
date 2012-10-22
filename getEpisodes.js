var http = require('http');
var url = require('url');
var $ = require('jquery');
var fs = require('fs');
var xml2js = require ('xml2js');

var episodeListURL = "http://en.wikipedia.org/wiki/List_of_Seinfeld_episodes";
var urlParts = url.parse(episodeListURL);
var episodeListsLoaded = 0;
var episodeListsToLoad = 9;
var episodeListURLBase = "http://rdf.freebase.com/rdf/en.seinfeld_season_";
var cb = function(response) {
    var str = '';
    response.on('data', function(c) {
        str += c;
    });
    response.on('end', function() {
        var episodeNum = episodeListsLoaded + 1;
        fs.writeFile('data/season'+episodeNum+'.rdf',str);

        episodeListsLoaded++;
        if(episodeListsLoaded < episodeListsToLoad) {
           loadEpisodeList();
        } else {
            parseEpisodeList();
        }
    });
}

function loadEpisodeList() {
    var episodeNum = episodeListsLoaded + 1;
    var urlParts = url.parse(episodeListURLBase+ episodeNum);
    http.request(urlParts, cb).end()
}
//loadEpisodeList();
var episodeListsParsed = 0;
parseEpisodeList()
function parseEpisodeList() {
    var episodeNum = episodeListsParsed + 1;
    var episodeList = fs.readFile('data/season'+ episodeNum+'.rdf', function(err,data) {
        if(err) throw err;
        var parser = new xml2js.Parser();
        parser.parseString(data, function(err, result) {
            console.log(result['rdf:RDF']['fb:common.topic'][0]['fb:tv.tv_series_season.episodes'] );
        })

        episodeListsParsed ++;
        if(episodeListsParsed < episodeListsToLoad) {
            parseEpisodeList();
        }
    });
    
}
