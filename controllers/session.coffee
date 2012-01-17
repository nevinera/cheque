exports.create = (req, res) ->
  post = req.body
  if post.email = 'nevinera@gmail.com' and post.password == 'password'
    req.session.user_id = 1
    req.flash 'notice', "Successfully logged in"
    res.redirect '/'
  else
    req.flash 'notice', "Bad email or password"
    res.redirect '/login'

exports.destroy = (req, res) ->
  delete req.session.user_id
  req.flash 'notice', "Logged out"
  res.redirect '/login'

exports.new = (req, res) ->
  res.render 'login'
    
  
