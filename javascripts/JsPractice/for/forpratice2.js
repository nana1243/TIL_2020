let fs = require('fs');
let input = fs.readFileSync('/dev/stdin').toString().split(' ');

// 배열을 형성하자
let arr = [];

input.forEach(function (value) {
    arr.push(Number(value));
});

arr.sort();
console.log(arr);



