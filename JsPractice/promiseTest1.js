
// Promise는 비동기 작업의 최종 완료 또는 실패를 나타내는 객체입니다.

// 새로운 promise를 만든다

const plus = new Promise((resolve, reject)=>{
    const a =1;
    const b = 2;
    if(a+b>2){
        resolve(a+b);
    }else{
        reject(a+b);
    }
});


// 성공한다면 success가 찍히고, 아니라면 fail이 뜬다

plus
    .then((success) =>{
        console.log("action success");
    })
    .catch((fail) =>{
        console.log("action fail");
    })