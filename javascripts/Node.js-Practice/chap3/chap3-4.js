// setTimeout()

const timeout = setTimeout(()=> {
        console.log('1.5초후 실행')
    }, 1500);

const interval = setInterval(()=>{
    console.log("1초마다 실행")
},1000);


const timeout2 = setTimeout(()=> {
    console.log('4초후 실행 되지 않습니다')
}, 4000);


// 4초 후에 아래와 같은 것이 해제된다
setTimeout(()=>{
    clearTimeout(timeout);
   clearInterval(interval);
},4000);


setImmediate(()=>console.log('즉시실행'));