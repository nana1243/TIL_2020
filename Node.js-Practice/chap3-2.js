

console.log(global);

const message = require('./tesetglobalA.js');

global.message ='안녕하세요';
console.log(message);