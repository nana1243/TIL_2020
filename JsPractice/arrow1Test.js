//1. arrow function

//1-1 parameter가 존재하지 않는경우

const a = ()=>{return "arrow function test1"};
console.log(a());
console.log(()=>{return "arrow function test2"}); // 이때 나온 결과는 함수 그자체를 호출하기 때문에 return 값이 나오지 않는다

// 1-2 parameter가 1개만 존재하는 경우 소가로의 생략이 가능함

const b1 =(x)=>{return x +" hi" };
console.log(b1("hennie"));

const b2=x =>{return x + "bye"};
console.log(b2("hennie! ~ "));

// 1-3 가로의 표현들

// (x1,x2,...)=>()

const c1 = (x1,x2,x3) =>(x1+x2+x3-10);
console.log(c1(10,20,30));

// (x1,x2,..)=>{}

const c2 = (y1,y2,y3) =>{ return y1+y2-y3+100};
console.log(c2(12,1,3));

()=>{
    const x = 12;
    return x*2;
};



