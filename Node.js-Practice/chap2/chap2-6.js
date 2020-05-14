// nonblocking으로 
// evnetloop로 아래와 같이 실행된다

// 옛날에는 콜백지옥을 벗어나기 위해서는 변수로 빼놓긴했지만..
Users.findOne('zero', (err,user)=>{
    if(error){
        return console.error(error);
    }
    console.log(user); //find one end

    Users.update( 'zero','nero',(err,user) =>{
        console.log(updateUser);
    
        Users.remove('nero',(err,remvedUser) =>{
            console.log(remvedUser);
           });
    }); 
});
console.log("다찾앗니");

// 위의 코드를 아래와 같이 promise를 통해 해결한다

Users.findOne('zero')
    .then((user) => {
    console.log(user);
    return Users.update('zero','nero');
    })
    .then((updateUser) => {
        console.log(updateUser);
        return Users.remove('nero');
    })
    .then((removedUser) =>{
        console.log(removeUser);
    })
    .catch((err) =>{
        console.error(error);
    });
    console.log("다찾앗니?");

