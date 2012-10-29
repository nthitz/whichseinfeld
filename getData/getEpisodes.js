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
var episodeListsParsed = 0;
var episodeFiles = [];

var cb = function(response) {
    var str = '';
    response.on('data', function(c) {
        str += c;
    });
    response.on('end', function() {
        var episodeNum = episodeListsLoaded + 1;
        fs.writeFile('../data/freebase/season'+episodeNum+'.rdf',str);

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
parseEpisodeList()
function parseEpisodeList() {
    var episodeNum = episodeListsParsed + 1;
    var episodeList = fs.readFile('../data/freebase/season'+ episodeNum+'.rdf', function(err,data) {
        if(err) throw err;
        var parser = new xml2js.Parser();
        parser.parseString(data, function(err, result) {
            var epList;
            if(typeof result['rdf:RDF']['fb:common.topic'] != 'undefined') {
                epList = (result['rdf:RDF']['fb:common.topic'][0]['fb:tv.tv_series_season.episodes'] );   
            } else {
                epList = (result['rdf:RDF']['fb:tv.tv_series_season'][0]['fb:tv.tv_series_season.episodes']);
            }
            if(typeof epList == 'undefined') { return; }
            for(var i = 0; i < epList.length; i++) {
                episodeFiles.push(epList[i]);
            }
        })

        episodeListsParsed ++;
        if(episodeListsParsed < episodeListsToLoad) {
            parseEpisodeList();
        } else {
            downloadEpisodeLists();
        }
    });
}
var episodesDownloaded = 0;
var episodesToDownload = -1;
function downloadEpisodeLists() {
    if(episodesToDownload == -1) {
        episodesToDownload = episodeFiles.length;
    }
    if(episodesDownloaded < episodesToDownload) {
        downloadEpisodeFile();
    }
}
function episodeCB(response) {
     var str = '';
    response.on('data', function(c) {
        str += c;
    });
    response.on('end', function()  {
        if(str.indexOf("redirecting to:") !== -1) {
            var redirect = str.substr(15);
            console.log('redirecting '+redirect);
            http.request(url.parse(redirect),episodeCB).end();
            return;
        }
        var filename = '../data/freebase/episode'+convertURLToFilename(episodeFiles[episodesDownloaded])+'.rdf';
        fs.writeFile(filename,str);
        
        episodesDownloaded++;
        downloadEpisodeLists();
    });
    response.on('error',function(e) {
        console.log('err');
        console.log(e);
    });
}
function convertURLToFilename(url) {
    var newURL = url['$']['rdf:resource'];
    var t = newURL.replace(/[^a-zA-Z0-9_]/,'_');
    while(true) {
        t = newURL.replace(/[^a-zA-Z0-9_]/,'_');
        if(t != newURL) {
            newURL = t;
        } else {
            break;
        }
    }

    return newURL;
}
function downloadEpisodeFile() {
    console.log('downloading num ' + episodesDownloaded);
    var episodeFilename = episodeFiles[episodesDownloaded];
    episodeFilename = episodeFilename['$']['rdf:resource'];
    console.log(episodeFilename);
    http.request(url.parse(episodeFilename), episodeCB).end();
}

