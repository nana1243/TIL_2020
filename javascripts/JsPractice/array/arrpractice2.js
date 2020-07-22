let fs = require('fs');
let input = fs.readFileSync('../dev/stdin').toString().split('\n');

let arr = input.map(function(cur) {
    return Number(cur);
});

let max =arr[0];
let min =arr[1];

let cnt=0;
let idx=0;
arr.forEach(value => {
    if(value>max){
       max = value;
       idx = cnt;
    };
    cnt++;
});

console.log(max);
console.log(idx);