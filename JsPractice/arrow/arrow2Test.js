// 함수의 호출

const a1 = function(x) {return x*x;};
console.log(a1(20));

const pow = x =>x*x;
console.log(pow(12));

const arr1 =[1,3,4,6,7];
const pow1 = arr1.map(function (x) {
    return x*x;
});
console.log(pow1);
const pow2 =arr1.map(x=>x*2);
console.log(pow2);


// arraow function에서의 this
// setTimeout(function, time)

const Person = () =>{
    this.age = 29;
    console.log(this.age);
    const ageprint = setInterval(()=>{
        this.age++;
        console.log(this.age);
        if(this.age ==35){
            console.log("stop");
            clearInterval(ageprint);
        }
    },1000);
}

Person();



// javascripts 너무 어려우무ㅜㅜㅜㅜㅜㅜㅜ