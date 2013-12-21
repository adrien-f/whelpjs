async = require('async')
request = require('request')

io = require('socket.io').listen(9001)
alliance_id = require('./config.json').alliance_id.toString() || '0'

if alliance_id is '0'
  console.error 'Please edit the configuration file to include your alliance ID'
  process.exit(1)

kills = io.of '/kills'

setInterval ->
    async.parallel [
        (cb) ->
            request {url: "http://api.whelp.gg/alliance/#{alliance_id}/losses", json: true}, (error, res, body) ->
                if !error and res.statusCode == 200
                    cb(undefined, body['kills'])
        (cb) ->
            request {url: "http://api.whelp.gg/alliance/#{alliance_id}", json: true}, (error, res, body) ->
                if !error and res.statusCode == 200
                    cb(undefined, body)
    ], (err, killmails) ->
        kills.emit 'update', {
          killmails: killmails[0].concat(killmails[1]['kills']),
          stats: killmails[1]['stats']
        }
, 10000

