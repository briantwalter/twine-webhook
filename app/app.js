//
// app.js  	Twine webhook app
// version	0.0.1 
// author	Brian Walter @briantwalter
// description	Catch a basic HTTP POST from twine.cc
//		and re-post JSON to dashing.io dashboard
//

// variables
var config = require('./config.js');
var express = require('express');
var rest = require('node-rest-client').Client;

// functions

// main
var app = express();
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(app.router);
app.use(express.logger('dev'));
app.use(express.static(__dirname + '/public'));
app.use(express.errorHandler());

// redirect to error page if GET
app.get('/', function(req, res) {
  res.redirect('err.html');
})

// do real work if it's a POST
app.post('/', function(req, res) {
})

// start the http server on CF or locally
app.listen(process.env.VCAP_APP_PORT || config.app.port);
