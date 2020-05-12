if(true){
    var x=3;
    console.log(x);
}
console.log(x);


// if(true){
//     const y =3;
//     console.log(y);
// }
// console.log(y);


// let과 const의 차이점

console.log("----------------start test of let----------------");

if(true){
    let l1 ="hennie";
    console.log(l1);
    l1 ="jennifer";
    console.log(l1);
}

console.log("----------------start test of const----------------");

// if(true){
//     const c1 ="hennie";
//     console.log(c1);
//     c1 ="jennifer";
//     console.log(c1);
// }

console.log("----------------start test of const jsobject----------------");

const obj1 ={1:"hennie" , 2:"jennifer" ,3:"ryan"};
console.log(obj1);

obj1[1]="hi hennie";
console.log(obj1);

console.log("----------------start test of const array----------------");

const arr1 = ["hi","hennie","henniezzang"];

console.log(arr1);
arr1[0] = "bye";
console.log(arr1[0]);
console.log("end");

