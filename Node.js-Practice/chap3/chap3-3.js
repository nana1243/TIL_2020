console.time("time check");
console.log("hi");
console.error("error message");
console.timeEnd("time check");


// 객체 전용 로그?



const objtest ={
    name:{
        last: "choi",
        first: "heuieun",
        english:{
            name1: "choi",
            name2: "cathy",
            name3: "hennie"
        }
    }
}

console.dir(objtest,{depth=2}); // 해당부분에서 에러가 난다 왜 그렇지?


// 함수 호출 trace해준다

function t(){
    console.trace();
}

// 함수 a는 b를 호출한다
function a(){
    b();
    console.log("a");
};

// b는 trace()의 기능을 한단
function b(){
    t();
    console.log("b");
}


a();