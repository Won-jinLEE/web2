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
// test액션
// 정의: /test에 접근시 student2 테이블의 primary값 20인 컬럼의 값을 각각 제목20과 내용20으로 업데이트하고,
// 콘솔창에 업데이트의 결과값과 "results"라는 메세지를 출력하고 브라우저에 "test.html"파일을 출력
// 1. 브라우저로 localhost서버에 /test를 요청시
// 2. 'student2'테이블의 20의 primary값의 title과 content컬럼을 각각 "제목20"과 "내용20"으로 업데이트하는 쿼리를 실행하고
// 3. 콘솔창에 쿼리의 실행값과 "results"라는 메세지를 출력하고
// 5. 브라우저에 "test.html"이라는 파일을
app.get('/test', function(req, res) {
  connection.query('UPDATE student2 SET title = "제목20", content = "내용20" WHERE NO = 20;', function (error, results, fields) {
    if (error) throw error;
    console.log(results);
    console.log("results");
    res.sendfile("test.html");
  });
});
// test2액션
// 정의: /test2에 접근시 student2 테이블의 값을 브라우저와 콘솔에 출력
// 1. 브라우저로 localhost서버에 /test2를 요청시
// 2. 'student2'테이블의 모든 값을 조회하는 쿼리를 실행해
// 3~4. 콘솔(cmd)과 브라우저에 쿼리의 실행값을 출력
app.get('/test2', function(req, res) {//1
  connection.query('SELECT * from student2', function (error, results, fields) {
    if (error) throw error;//2
    console.log(results);//3
    res.send(results);//4
  });
});

connection.query('SELECT * from student2', function (error, results, fields) {
  if (error) throw error;//2
  console.log(results);//3
  res.send(results);//4
});
