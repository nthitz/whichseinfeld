// Generated by CoffeeScript 1.3.3
(function() {
  var dbPath, pg;

  pg = require('pg')["native"];

  dbPath = process.env.HEROKU_POSTGRESQL_PURPLE_URL;

  console.log(dbPath);

  pg.connect(dbPath, function(err, client) {
    console.log(err);
    console.log(client);
    return console.log('connected');
  });

}).call(this);
