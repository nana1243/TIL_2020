const http = require('http');
const fs = require('fs');
// 실무에서는 이렇게 하지 않는다 // 
// 그렇기 때문에 html 만들어서 그 파일을 통째로 보내는 방법을 쓴다 //
http.createServer((req,res)=>{
    fs.readFile('./chap4-2.html',(err,data) =>{
        if(err){
            throw error;
        }
        res.end(data);
    });
   
// listen의 역할은 : 서버가 죽지않고 계속 실행되게 해주는 역할
}).listen(8080, () =>{
    console.log('8080 포트에서 서버 대기중입니다');
});

