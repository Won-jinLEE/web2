var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app).listen(80);

app.get('/test', function(req, res) {
  res.send("hello html")
});

app.get('/table', function(req, res) {
  res.sendfile("test4.html")
});

app.get('/testfile', function(req, res) {
  res.sendfile("test2.html")
});

app.get('/testfile2', function(req, res) {
  res.sendfile("test3.html")
});

app.get('/css', function(req, res) {
  res.sendfile("test5.html")
});

app.get('/javascript', function(req, res) {
  console.log("server console");
  res.sendfile("javascript.html")
});
