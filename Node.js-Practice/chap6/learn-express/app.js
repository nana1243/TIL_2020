const express = require('express');
const logger = require('morgan');
const cookieParser = require('cookie-parser');
const flash = require('connect-flash');
const path = require('path')
const session = {};
const indexRouter = require('./routes/index');
const  userRouter = require('./routes/users');
const app =express();

/// set start
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({extended:false}));
app.use(express.static(path.join(__dirname, 'public')));
app.use(cookieParser('secret code')); // 쿠키에 대한 비밀번호
app.use(flash()); // 일회성 메세지를 위한 미들웨어



app.use('/',indexRouter);
app.use('/user',userRouter);
app.use( (req,res,next)=>{
  res.status(404).send("NOT FOUND PAGE");
})

app.use((req,res,next)=>{
  console.log("first middleware");
  next();
});

app.use((req,res,next)=>{
  console.log("second middleware");
  next();
});


// 라우터 생성
app.get('/',(req,res)=>{
  console.log("get!");
  res.send('hello hennie');
});





module.exports = app;


