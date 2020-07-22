let s = new Set();

const d = (n) =>{
    let sum = n;
    n=n.toString();
    for(let i=0;i<n.length;i++){
        console.log(n[i]);
        sum+=Number(n[i]);
    };
    if(sum>100){
        return s
    }else{
        s.add(sum);
        return d(sum);
    }
};
for(let i=1;i<=100;i++){
    if(i in s){
        continue;
    }else{
        d(i);
    }
};
allset = new Set();
for(let i=1;i<=100;i++){
    allset.add(i);
};

// 차집합 구현
Set.prototype.difference = function(setB) {
    let difference = new Set(this);
    for (let elem of setB) {
        difference.delete(elem);
    }
    return difference;
}
let difference = allset.difference(s);
console.log(difference);