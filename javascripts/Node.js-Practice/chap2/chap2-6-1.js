// 동기의 예

const fs = require('fs');

console.log("-----------before read data------------"); // 실행순서1
const data = fs.readFileSync('hennie.txt', {encoding: 'utf8'});
console.log(data);
console.log("-----------after read data-----------");



// 비동기예시

const fs2 = require('fs');
console.log("check1");

fs2.readFile('hennie.txt', {encoding: 'utf8'}, function(err, data){
    console.log("check3"); // 실행순서 3
    console.log(data); // 실행순서 4
    console.log("check5");
  });
  console.log("check2")