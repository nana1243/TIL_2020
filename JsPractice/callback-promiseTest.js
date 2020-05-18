// 아래와 같은 코드를 실행해보자

const sync1 = function (param) {return param*2;};
const sync2 = function (param) {return param*3;};
const sync3 = function (param) {return param*4;};

let start=1;
console.log(sync3(sync2(sync1(start))));


// 이를 콜백형태로 써보자

const c1 = function (param,callback) {callback(param*2);}
const c2= function (param,callback) {callback(param*3);}
const c3= function (param,callback) {callback(param*4);}

let start2=10;

c1(start2,result =>{
    c2(result,result=>{
        c3(result,result=>{
            console.log(result);
        })
    })
});


function async1 (param) {
    return new Promise(function(resolve, reject) {
        resolve(param*2);
    });
}
function async2 (param) {
    return new Promise(function(resolve, reject) {
        resolve(param*3);
    });
}
function async3 (param) {
    return new Promise(function(resolve, reject) {
        resolve(param*4);
    });
}

var start = 1;
async1(start)
    .then(async2)
    .then(async3)
    .then(result => {
        console.log(result);
    })
    .catch((error)=>{
        console.log("error");
    })

    
// 콜백함수 너무 어려움! ㅠㅠㅠㅠ
