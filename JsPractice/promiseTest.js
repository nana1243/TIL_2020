const plus = new Promise((resolve,reject)=>{
    const a =1;
    const b =2;
    if(a+b>2){
        resolve(a+b);
    }else{
        reject(a+b);
    }
});

plus.then((success) =>{
    console.log(success);
})
.catch((fail)=>{
    console.error(err);
})

