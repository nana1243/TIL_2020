// 입출력에 사용할 rl을 받아오는 함수
const getRl = () => {
    const readline = require('readline');
    return readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });
}
const rl = getRl();

// 주어진 입력들을 이용해서 정답을 반환하는 함수
const getAnswers = (numbers) => {
    let answer = '';
    let index = 0;
    while(index < numbers.length){
        const A = parseInt(numbers[index][0]);
        const B = parseInt(numbers[index][1]);
        index++;
        answer += (A+B) + '\n';
    }
    return answer;
};

// 입력 받아와서 알고리즘 동작하는 함수
const input = [];
const start = (rl) => {
    rl.on('line', line => {
        input.push(line.split(' '));
    }).on('close', () => {
        console.log(getAnswers(input));
        process.exit();
    });
}

// 프로그램 동작
start(rl);