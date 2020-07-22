// object에서의 비구조화할당
const candyMachine = {
    status : {
        name : 'node',
        count : 5
    },
    hennie : {
        name :"hennie is the love",
        id : 20123215,
        useremail:"hennie92@naver.com"
    }
    ,
    getCandy(){
        this.status.count --;
        return this.status.count;
    }
}

// const status = candyMachine.status;
// const get= candyMachine.getCandy();
// console.log(status);
// console.log(get);


// 비구조화 할당

const {status, hennie,getCandy} = candyMachine;
// console.log(status);
// console.log(hennie);
// console.log(getCandy);

// // but 함수에서는 문제가 생긴다
// // 아래와 같이 해결해준다!
console.log(getCandy.call(candyMachine));


// 또한 배열에서도 이와 같은 기능이 가능하다!


const array = ['node.js',{}, 10,true];
// const node = array[0];
// const obj = array[1];
// const bool =array[array.length-1];

const [node, obj, ,bool] =array;
console.log(node);
