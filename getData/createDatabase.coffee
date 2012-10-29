pg = require('pg').native
dbPath = process.env.HEROKU_POSTGRESQL_PURPLE_URL
console.log dbPath
pg.connect dbPath, (err, client) ->
    console.log err
    console.log client
    console.log 'connected'
    #query = client.query("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'")
    #query.on 'row', (row) ->
    #  console.log(JSON.stringify(row))

