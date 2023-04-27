var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app).listen(80);

app.get('/store', function(req, res) {
  res.sendfile("store.html")
});

app.get('/getCarPrice', function(req, res) {
  let car = req.query.car;
  let color = req.query.color;
  let carPrice = 0;
  let colorPrice = 0;
  let carTable = [
    {name:"현대", price:2100},
    {name:"기아", price:1300},
    {name:"쌍용", price:1500},
    {name:"벤츠", price:3500},
    {name:"bmw", price:3200},
  ]
  let colorTable = [
    {name:"빨강", price:100},
    {name:"파랑", price:120},
    {name:"초록", price:200},
    {name:"노랑", price:130},
    {name:"검정", price:80},
  ]
  for (let i = 0; i < carTable.length; i++) {
    if(car==carTable[i].name){
      carPrice = carTable[i].price;
      break;
    }
  }
  for (let i = 0; i < colorTable.length; i++) {
    if(color==colorTable[i].name){
      colorPrice = colorTable[i].price;
      break;
    }
  }
  let resultPrice = carPrice+colorPrice
  let result = `고르신 차종은 ${car}이고, 도색은 ${color}색이며, 차종의 가격은 ${carPrice}만원, 도색의 가격은 ${colorPrice}만원, 총 합산 금액은 ${resultPrice}만원 입니다.`
  res.send(result)
});
