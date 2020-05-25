const getRl = () => {
    const readline = require('readline');
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}
const rl = getRl();


const f =(x)=>{
    let k = (x%10)+parseInt(x/10);
    let result = (k%10)+(x%10)*10;
    return result;
}

const cycle = (n)=>{
    let answer =1;
    let new_number= f(n);
    while(n!=new_number){
        answer+=1;
        new_number=f(new_number);
    };
    return answer;
}

// 입력 받아와서 알고리즘 동작하는 함수

const start = (rl) => {
    rl.on('line', line => {
        line = parseInt(line);
        let answer= cycle(line);
        console.log(answer);
    }).on('close', () => {
        process.exit();
    });
}

// 프로그램 동작
start(rl);