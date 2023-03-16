//
var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app).listen(80);
//
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '0000',
  database : 'web',
  port : '3306'
});
//
connection.connect();
//
app.get('/test', function(req, res) {
  console.log("hello world!");
  res.send("hello hello")
});
//
app.get('/asdf', function(req, res) {
  console.log("asdfasdf");
  res.send("asfdasdf")
});
//
app.get('/animal', function(req, res) {
  res.sendfile("animal.html")
});
//
app.get('/animal1', function(req, res) {
  res.sendfile("Gold.jpg")
});
//
