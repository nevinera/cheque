var tests = require('./controllers/test');
var ui = require('./controllers/ui');

module.exports = function(app) {
  app.get('/', ui.root);
  app.get('/tests.json', tests.index_json);
};

