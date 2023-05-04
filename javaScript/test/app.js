var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app).listen(80);

app.get('/test1', function(req, res) {
  res.sendfile("test1.html")
});

app.get('/test2', function(req, res) {
  res.sendfile("test2.html")
});

app.get('/test3', function(req, res) {
  res.sendfile("test3.html")
});

app.get('/test4', function(req, res) {
  res.sendfile("test4.html")
});

app.get('/bmi', function(req, res) {
  let tall = Number(req.query.tall)/100;
  let weight = Number(req.query.weight);
  let bmi = (weight/(Math.pow(tall, 2))).toFixed(2);
  if (bmi<20) {
    let result = `판정결과 저체중, 신체질량지수(BMI)는 ${bmi}입니다.`
    res.send(result)
  }else if (bmi>=20&&bmi<25) {
    let result = `판정결과 정상, 신체질량지수(BMI)는 ${bmi}입니다.`
    res.send(result)
  }else if (bmi>=25&&bmi<30) {
    let result = `판정결과 과체중, 신체질량지수(BMI)는 ${bmi}입니다.`
    res.send(result)
  }else {
    let result = `판정결과 비만, 신체질량지수(BMI)는 ${bmi}입니다.`
    res.send(result)
  }
});

let arr = [];
app.get('/rank', function(req, res) {
  let kor = Number(req.query.kor)*2;
  let eng = Number(req.query.eng)*3;
  let math = Number(req.query.math)*5;
  let sumValue = kor+eng+math;
  arr.push(sumValue);
  arr.sort(function(a, b) {
  return b - a;
  });
  for(let i=0; i<arr.length; i++){
    if(sumValue==arr[i]){
      let result = `석차 : ${i+1}등`
      res.send(result)
      break
    }
  }
  console.log(`가중치 적용 국 : ${kor}, 영 : ${eng}, 수 : ${math}, 합 : ${sumValue}`);
  console.log(`정렬된 배열 ${arr}`);
});
