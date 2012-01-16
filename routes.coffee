tests = require './controllers/test'
ui    = require './controllers/ui'

module.exports = (app) ->
  app.get '/', ui.root
  app.get '/tests.json', tests.index_json

