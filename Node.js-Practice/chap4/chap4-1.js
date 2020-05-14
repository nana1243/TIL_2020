const http = require('http');


http.createServer((req,res)=>{
    console.log('server start');
    res.write('<h1> hi hennie~ </h1>');
    res.write('<h2> lovely hennie </h2>');
    res.end('<h1> end! </h1>');

// listen의 역할은 : 서버가 죽지않고 계속 실행되게 해주는 역할
}).listen(8080, () =>{
    console.log('8080 포트에서 서버 대기중입니다');
})