// hash (단방향)
const crypto = require('crypto');
const msg= crypto.createHash('sha512').update('hennie').digest('base64'); 
console.log(msg); 
// 그러나 복호화할 수 없다 
// 왜? -> 복호화할 이유가 없기 때문에
// 그래서 비밀번호를 저장할 필요가 없다! 

crypto.randomBytes(64, (err,buf)=>{
    const salt = buf.toString('base64');
    console.log('salt',salt);
    crypto.pbkdf2('hennie', salt,10000,64,'sha512',(err,key) =>{
        console.log('password' , key.toString('base64')); // 여기서 password는 해당 hennie+salt까지 합쳐서 만든것이다
    });
});


// callback을 promise 형태로 바꿔져야한다 근데 어떻게 변환시키는가?
// 바꾸고 싶다고 해서 바꿀 수 있는게 아니다


const randomBytesPromise = util.promisify(crypto.randomBytes);

randomBytesPromise(64)
    .then((buf)=>{
     const salt = buf.toString('base64');
     return pbkdf2Promise('hennie',salt,651394,64,'sha512');
    })
    .then((key) =>{
        console.log('password' , key.toString('base64'));
    })
    .catch((err) => {
        console.error(err);
    });


