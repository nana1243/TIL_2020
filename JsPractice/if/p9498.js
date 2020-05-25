

const readline = require('readline');
const rl = readline.createInterface({
    input:process.stdin,
    output:process.stdout
});



const solve = (x)=>{
    let ans="";
    if(90<=x<=100){
        ans="A";
    }
    else if(80<=x<90) {
        ans = "B";
    }else if(70<=x<80){
        ans = "C";
    }else if(60<=x<70){
        ans="D";
    }else{
        ans="F";
    }
    return ans;
};


let ans =0;

rl.on('line',function (line) {
    line = parseInt(line);
    let ans = solve(line);
    console.log(ans);
}).on('close',function () {
    process.exit();

})