var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app).listen(80);

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '0000',
  database : 'web',
  port : '3306'
});

connection.connect();

app.get('/test', function(req, res) {
  res.sendfile("test.html")
});

app.get('/test2', function(req, res) {
  res.sendfile("test2.html")
});

app.get('/octopus', function(req, res) {
  res.sendfile("octopus.html")
});

app.get('/win', function(req, res) {
  res.sendfile("win.html")
});

app.get('/defeat', function(req, res) {
  res.sendfile("defeat.html")
});

app.get('/javascript', function(req, res) {
  res.sendfile("javascript.html")
});


app.get('/table', function(req, res) {
  res.sendfile("table.html")
});
