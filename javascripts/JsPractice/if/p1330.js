const readline = require('readline');


const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let num=[]

rl.on('line',function (line) {
    num = line.split(" ").map((el)=>parseInt(el));
})
    .on('close',function () {
        if(num[0]>num[1]){
            console.log(">");
        }else if(num[0]<num[1]){
            console.log("<")
        }else{
            console.log("==");
        }
        process.exit();
    })