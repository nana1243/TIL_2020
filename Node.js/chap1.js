function first(){
    second();
    console.log("first function");

};
function second(){
    third(); 
    console.log("second function");

};

function third(){
    console.log("third function");

};

first();



function run(){
    console.log("3초후 실행");

}

console.log('start');
setTimeout(run,3000);
console.log('end');
//start -> end ->

