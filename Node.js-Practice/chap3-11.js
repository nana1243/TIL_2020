console.log("filesystem access");

// 파일 읽기

const fs = require('fs');
// fs.readFile('./test.txt' , (err,data)=>{
//     if(err){
//         throw err;
//     }
//     console.log(data.toString());
    
// });


// fs.writeFile('./writeTest.txt','write anything hennie~',(err)=>{
//     if(err){
//         throw err;
//     }
//     console.log("start read writeTest.txt");
//     fs.readFile('./writeTest.txt',(err,data)=>{
//         if(err){
//             throw err;
//         }
//         console.log(data.toString());
//     })
// })

// 위 과정은 비동기 방식이다
// but 이과정을 동기로 실행하고 싶다면?

console.log("start");
fs.readFile('./test.txt' , (err,data)=>{
  
    if(err){
        throw err;
    }
    console.log(data.toString());  
});
console.log("second");
fs.readFile('./test.txt' , (err,data)=>{
    
    if(err){
        throw err;
    }
    console.log(data.toString());  
});
console.log("end");
fs.readFile('./test.txt' , (err,data)=>{
    
    if(err){
        throw err;
    }
    console.log(data.toString());  
});