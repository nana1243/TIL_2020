#!usr/bin/env node

const fs = require('fs');
const path = require('path');

let rl ;
let type= process.argv[2];
let name = process.argv[3];
let directory = process.argv[4] || '.';


const htmlTemplate=`<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Templates</title>
</head>
<body>
<h1> make cli in node.js</h1>
</body>
</html>`;

const routerTemplate = `
const express= require('express')';
router.get('/', function(req, res, next) {
try{
  res.send('ok');
  }catch(error){
  console.log(error);
  next(error);
  }
});
module.exports = router;
`
const mkdirp = () =>{
    const dirname = path.relative('.', path.normalize(dir)).split(path.sep).filter(p=>!!p) ;// 상대경로 알려주는
    dirname.forEach((d,idx)=>{
        const pathBuilder = dirname.slice(0,idx+1).join(path.sep);
        if(!exist(pathBuilder)){
            fs.mkdirSync(pathBuilder);
        }
    });
};

const exist = ()=>{
    try {
        fs.accessSync(dir,fs.constants.F_OK | fs.constants.R_OK |fs.constants.W_OKC);
        return true;
    }catch (e) {
        console.log(e);
        return false;
    }

}

const  makeTemplate= ()=>{
    mkdirp(directory);
    if(type ==='html'){
        const pathToFile= path.join(directory, `{$name}.html`);
        if(exist(pathToFile)){
        console.log('이미 파일이 존재합니다');
    }else{
        fs.writevSync(pathToFile,htmlTemplate );
        console.log(pathToFile,'생성완료');
    }
    }else if(type ==='express-router'){
        const pathToFile= path.join(directory, `{$name}.js`);
        if(exist(pathToFile)){
            const pathToFile= path.join(directory, `{$name}.js`);
            console.log('이미 파일이 존재합니다');
        }else{
            fs.writevSync(pathToFile,routerTemplate );
            console.log(pathToFile,'생성완료');
        }
    }else{
        console.error('둘중 하나 입력하세요');
    }
};
const program =()=>{
    if(!type || !name){
        console.log("사용방법 : cli html | express-router 피일명[생성경로]");
    }else{
        makeTemplates();
    }

}
program();