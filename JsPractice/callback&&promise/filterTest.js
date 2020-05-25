let isBigEnough =(value)=>{return value>10};

// array.filter(filter할 조건 함수)
let filtered1 = [12, 5, 8, 130, 44].filter(isBigEnough);
let filtered2 = [12, 5, 8, 130, 44].filter((element) => {
 return element>10;
});

console.log(filtered1);
console.log(filtered2);

let users = [
    { id: 11, name: 'hennie', age: 29, group: 'me' },
    { id: 47, name: 'hyoni', age: 32, group: 'fam' },
    { id: 85, name: 'shimji', age: 28, group: 'bf' },
    { id: 97, name: 'moodari', age: 29, group: 'bf' }
  ];

  users.forEach(element => {
    console.log(element);
  });

console.log("start filter");

  // 간단한 검색
let res = users.filter(it => it.group.includes('bf'));
console.log(res.length); //2개가 나온다




for(let i=0;i<=res.length;i++){
 res.forEach(
    (element)=>{
      console.log(element);
    });
};
console.log("end");
