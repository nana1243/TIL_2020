const util = require('util');
const cryto = require('crypto');


// 지원하고 있는 서비스가 중단이 될때  
const donuseme = util.deprecate((x,y) =>{
    console.log(x+y);
},'이함수는 2020년까지만 쓰겠습니당');
donuseme(1,2);

crypto.randomBytes(64, (err,buf)=>{
    const salt = buf.toString('base64');
    console.log('salt',salt);
    crypto.pbkdf2('hennie', salt,10000,64,'sha512',(err,key) =>{
        console.log('password' , key.toString('base64')); // 여기서 password는 해당 hennie+salt까지 합쳐서 만든것이다
    });
});
