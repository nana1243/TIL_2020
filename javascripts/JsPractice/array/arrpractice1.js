let fs = require('fs');
let input = fs.readFileSync('../dev/stdin').toString().split('\n');

let count = Number(input[0]);
let numbers = input[1].split(' ');

let arr = numbers.map(function(cur) {
    return Number(cur);
});

// 이때 , max과 min은 10^7이상이면 rangeerror
const ans1= Math.min.apply(null,arr)
const ans2 =Math.max.apply(null,arr);

console.log(ans1,ans2);
// console.log(ans2);

// 또다른방법
// let maxnum = arr[0];
// let minnum = arr[0];
//
// arr.forEach(function (value) {
//     if(maxnum<value){
//         maxnum = value;
//     }
//     if(minnum>value){
//         minnum = value;
//     }
//
// });
//
// console.log(maxnum);
// console.log(minnum);