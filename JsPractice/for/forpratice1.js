const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


const star= (x)=>{
    let result="";
        for(let j=1;j<=x;j++){
            result+="*";
            console.log(result);
        };

    for(let j=x-1;j<=1;j--){
        result="*";
        console.log(result);
    };



};


rl.on('line', function(line){
    const num =parseFloat(line);
    star(num);
}).on('close',function () {
    process.exit();
});