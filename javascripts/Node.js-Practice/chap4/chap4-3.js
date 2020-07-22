// 데이터를 주고 받는 방법 중 가장 쉬운 방법은 쿠키이다!


const http = require('http');
const fs = require('fs');

// cookie의 접근은  req.headers.cookie;

const server = http.createServer((req,res) =>{
    console.log(parseCookies(req.headers.cookie));
    res.writeHead(200,{"set-Cookie" : "mycookie=test"}); // 200은 성공한 요청을 의미한다
    console.log('server start');
    fs.readFile('./chap4-2.html' ,(err,data)=>{
        if(err){
            throw err
        }
        res.end(data);
    });
}).listen(8080);
server.on('listening' ,()=>{
    console.log('8080 포트에서 서버가 대기중입니당!');
})



// 쿠키를 문자열을 객체로 바꿀 수 있게 해주는 함수이다 

const parseCookies =(cookie ='') =>
   cookie.split(';')
   .map( v=>v.split('='))
   .map(([k,...vs]) => [k, vs.join('=')] )
   .reduce((acc, [k,v])=>{
       acc[k.trim()] = decodeURIComponent(v);
       return acc;
   }, {});