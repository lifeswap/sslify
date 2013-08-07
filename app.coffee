express = require 'express'
debug   = require 'debug'
request = require('request').defaults jar: false

PORT = 3014

debug = debug 'sslify'

app = express()

app.get '/', (req, res, next) ->
  url = req.query.url
  return res.send 404 if not url
  debug 'URL', url
  request.get(url).pipe(res)

app.listen PORT

module.exports = app
