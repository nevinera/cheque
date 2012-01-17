express = require 'express'
router  = require './routes'
hamlc   = require 'haml-coffee'

app = express.createServer()
app.register '.hamlc', hamlc

# Configuration
app.configure ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'hamlc')
  app.use(express.bodyParser())
  app.use(express.methodOverride())
  app.use(express.static(__dirname + '/public'))
  app.use(express.cookieParser());
  app.use(express.session
    secret: "cthonian dynamics in the nth degree"
  )
  app.use(app.router);
  
app.dynamicHelpers
  session: (req, res) ->
    return req.session
  flash: (req, res) ->
    return req.flash
  signed_in: (req, res) ->
    req.session.user_id != undefined

app.configure 'development', ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack:      true
  )

app.configure 'production', ->
  app.use express.errorHandler()

# build routes (see routes.js)
router(app)

app.listen(3000)
console.log(
  "Express server listening on port %d in %s mode",
  app.address().port,
  app.settings.env
)
