// path라는 모듈은 엄청 많이 쓰인다!

const path = require('path');

console.log(path.parse(__filename));
console.log(path.parse(__dirname));
console.log(path.normalize("C:\\usr")); // 경로를 제대로 썼는지

console.log(path.join(__dirname,'..','usr')); // 조각난 경롤를 합쳐준다 : 절대경로를 상대경로로 인식하고싶다면
console.log(path.resolve(__dirname,'..' ,'/usr')) // 절대경로로 쳐준다 :  상대경로를 절대경로로 인식하고싶다면