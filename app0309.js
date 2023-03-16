//
var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app).listen(80);
//데이터 베이스 서버(localhost의 root라는 유저네임과 0000패스워드를 가진 web이라는 데이터 베이스에 3306포트를 이용해)에 연결하는 구문
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '0000',
  database : 'web',
  port : '3306'
});
// 서버(Maria DB)에 연결시에
connection.connect();
// test 액션
// 정의: /test 접근시 로컬서버내의 Student 테이블 5번 값 쿼리를 출력해오는 함
// 1. 서버(localhost)에 '/test'를 요청(req)하면
// 2. 'Student'테이블의 NO.5라는 값을 불러온다라는 쿼리를 실행해서
// 3. 'test'페이지에 출력(res)한다.
app.get('/test', function (req, res) {
  connection.query('SELECT * FROM student WHERE NO = 5;', function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
});

// 'Student'테이블의 NO.1이라는 값을 가진 데이터의 이름을 '홍길동'으로 업데이트(변경)하는 쿼리를 실행한다.
connection.query('Update student SET name = "홍길동" WHERE No = 1;', function (error, results, fields) {
  if (error) throw error;
});
// update 액션
// 정의: /update 접근시 학생의 이름을 변경하는 함수
// 1. /update를 요청시
// 2. 'Student'테이블의 NO.3이라는 값을 업데이트(변경)한다는 쿼리를 실행해서
// 3. 'update'페이지에 업데이트한 결과를 출력(res)한다.(데이터베이스 갱신시 값이 바뀜)
app.get('/update', function (req, res) {
  connection.query('Update student SET name = "임꺽정" WHERE No = 3;', function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
});
//  test2 액션
// 정의: /test2 접근시 콘솔창에 "hello world!" 메세지를 출력해주는 함수
app.get('/test2', function(req, res) {
  console.log("hello world!");
});
// frog 액션
// 정의: /frog 접근시 콘솔창에 "MEME!" 메세지를 출력해주고, 'pepe.jpg'라는 파일을 출력해주는 함수
// 1. /frog를 요청시
// 2. 콘솔창에 "MEME!"라는 메세지를 출력해주고
// 3. frog페이지에 "pepe.jpg"라는 파일을 불러와 출력(res)해준다.
app.get('/frog', function(req, res) {
  console.log("MEME!");
  res.sendfile("pepe.jpg");
});
