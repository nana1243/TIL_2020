let fs = require('fs');
let input = fs.readFileSync('/dev/stdin').toString().split(' ');

let resultArr = [];
let result = '';

for (let i = 97; i <= 122; i++) {
    let alphabet = String.fromCharCode(i);

    for (let j = 0; j < input.length; j++) {
        resultArr.push(input[j].indexOf(alphabet));
    }
}

result = resultArr.join(' ');
console.log(result);