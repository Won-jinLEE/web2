var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app).listen(80);

// var mysql      = require('mysql');
// var connection = mysql.createConnection({
//   host     : 'localhost',
//   user     : 'root',
//   password : '0000',
//   database : 'web',
//   port : '3306'
// });

// connection.connect();

app.get('/login', function(req, res) {
  res.sendfile("login.html")
});

app.get('/inner', function(req, res) {
  res.sendfile("inner.html")
});

app.get('/nine', function(req, res) {
  res.sendfile("nine.html")
});

app.get('/arr', function(req, res) {
  res.sendfile("arr.html")
});
