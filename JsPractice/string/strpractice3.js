let fs = require('fs');
let input = fs.readFileSync('../dev/stdin').toString().toUpperCase().split('');
let s=new Set(input);

let obj={}
let m=0;
s.forEach(value => {
    let cnt=0;
    for(let i=0;i<input.length;i++){
        if(value===input[i]){
          cnt+=1;
        }
        obj[value]=cnt;
        m=Math.max(m,cnt);
    }
});

// 뒤에 배열중에 최댓값 2개인거 구분하는 거 이어서 하기