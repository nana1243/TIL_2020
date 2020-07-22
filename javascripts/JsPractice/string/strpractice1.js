let fs = require('fs');
let input = fs.readFileSync('../dev/stdin').toString().split(' ');


let result = str.charCodeAt(0);
console.log(result);



let fs = require('fs');
let input = fs.readFileSync('../dev/stdin').toString().split('\n');
let str=input[1].split('');
console.log(str);
let s=0;
str.forEach(value => {
    s+=parseInt(value);
});

console.log(s);
