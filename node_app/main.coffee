async = require('async')
request = require('request')

io = require('socket.io').listen(9001)
kills = io.of '/kills'

setInterval ->
    async.parallel [
        (cb) ->
            request {url: 'http://api.whelp.gg/alliance/99002172/losses', json: true}, (error, res, body) ->
                if !error and res.statusCode == 200
                    cb(undefined, body['kills'])
        (cb) ->
            request {url: 'http://api.whelp.gg/alliance/99002172', json: true}, (error, res, body) ->
                if !error and res.statusCode == 200
                    cb(undefined, body)
    ], (err, killmails) ->
        kills.emit 'update', {
          killmails: killmails[0].concat(killmails[1]['kills']),
          stats: killmails[1]['stats']
        }
, 10000

