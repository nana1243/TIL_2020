// const promise = new Promise((res,rej) =>{
//     rej('실패');
// });

// 무조건 성공 및 실패하는 promise.resolve() && promise.reject()
const successPromise = Promise.resolve('성공');
// const failPromise = Promise.reject('실패');


const plus = new Promise((resolve, reject) =>{
    const a =3;
    const b =1;
    if(a+b>2){
        resolve(a+b);
    }else{
        reject(a+b);
    }
});

// 프로미스들을 한번에 실행 가능 한 함수 Promise.all()

Promise.all([successPromise,plus])
    .then(results=>{console.log(results)})
    .catch((error)=>{});

