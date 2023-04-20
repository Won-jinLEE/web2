var express = require('express');
var http = require('http');
var app = express();
var server = http.createServer(app).listen(80);

app.get('/radio', function(req, res) {
  res.sendfile("radio.html")
});

app.get('/ajax', function(req, res) {
  res.sendfile("ajax.html")
});

app.get('/dog', function(req, res) {
  res.sendfile("dog.html")
});

app.get('/il', function(req, res) {
  res.sendfile("jot.html")
});

app.get('/han', function(req, res) {
  res.sendfile("jo.html")
});

app.get('/jung', function(req, res) {
  res.sendfile("jjang.html")
});

app.get('/ajaxTest', function(req, res) {
  res.send("ajax response")
});

app.get('/request1', function(req, res) {
  res.send("response1")
});

app.get('/request2', function(req, res) {
  res.send("response2")
});

app.get('/request3', function(req, res) {
  res.send("response3")
});

app.get('/getFile', function(req, res) {
  res.sendfile("requestTest.html")
});

app.get('/qs', function(req, res) {
  res.sendfile("qs.html")
});

app.get('/qsSum', function(req, res) {
  let num1 = Number(req.query.sumNum1);
  let num2 = Number(req.query.sumNum2);
  let num3 = Number(req.query.sumNum3);
  let resultNum = num1 + num2 + num3;
  console.log(`라우터에서 보냄 (SumAction): ${num1}+${num2}+${num3}=${resultNum}`);
  res.send(""+resultNum)
});

app.get('/qsMultiply', function(req, res) {
  let num1 = Number(req.query.multiplyNum1);
  let num2 = Number(req.query.multiplyNum2);
  let num3 = Number(req.query.multiplyNum3);
  let resultNum = num1 * num2 * num3;
  console.log(`라우터에서 보냄 (MultiplyAction): ${num1}*${num2}*${num3}=${resultNum}`);
  res.send(""+resultNum)
});

app.get('/store', function(req, res) {
  res.sendfile("store.html")
});

app.get('/sell', function(req, res) {
  let num = Number(req.query.sellNum);
  let productTable = [{name:"item1(1000원)", price:1000},{name:"item2(5000원)", price:5000},{name:"item3(10000원)", price:10000},
  {name:"item4(30000원)", price:30000},{name:"item5(50000원)", price:50000},{name:"item6(100000원)", price:100000},{name:"item7(500000원)", price:500000}]
  let result = "";
  console.log(`낸 금액은 : ${num}원`);
  for(let i =0; i<productTable.length; i++){
    if(num<productTable[0].price){
      result="구입불가"
      break;
    }
    if(num>=productTable[i].price){
      result="구매 가능한 가장 비싼 상품은 : "+productTable[i].name;
    }
  }
  console.log(result);
  res.send(result)
});

app.get('/allsell', function(req, res) {
  let num = Number(req.query.sellNum);
    let productTable = [{name:"item1(1000원)", price:1000},{name:"item2(5000원)", price:5000},{name:"item3(10000원)", price:10000},
    {name:"item4(30000원)", price:30000},{name:"item5(50000원)", price:50000},{name:"item6(100000원)", price:100000},{name:"item7(500000원)", price:500000}]
  let result = "";
  let allPrice = 0;
  console.log(`낸 금액은 : ${num}원`);
  for(let i =0; i<productTable.length; i++){
    if(num<productTable[0].price){
      result="구입불가"
      break;
    }
    if(num>=productTable[i].price){
      allPrice = allPrice + productTable[i].price;
      if (num<allPrice) {
        break;
      }else {
        result=result+" "+productTable[i].name;
      }
    }
  }
  result = "구매 가능한 모든 상품은 ("+result+")"
  console.log(result);
  res.send(result)
});
