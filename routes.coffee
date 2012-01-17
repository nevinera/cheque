tests   = require './controllers/test'
ui      = require './controllers/ui'
session = require './controllers/session'


checkAuth = (req, res, next) ->
  if !req.session.user_id
    req.flash 'notice', 'You need to log in before viewing that page.'
    res.redirect '/login'
  else
    next()

module.exports = (app) ->
  app.get  '/',                   checkAuth, ui.root
  app.get  '/tests.json',         checkAuth, tests.index_json

  app.get  '/login',              session.new
  app.post '/sessions/create',    session.create
  app.post '/sessions/destroy',   session.destroy

