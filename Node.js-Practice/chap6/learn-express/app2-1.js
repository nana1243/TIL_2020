const express = require('express');
const logger = require('morgan');
const cookieParser = require('cookie-parser');
const flash = require('connect-flash');
const path = require('path')
const session = {};
const indexRouter = require('./routes/index');
const  userRouter = require('./routes/users');
const app =express();
app.set('views', path.join(__dirname, 'views'));

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({extended:false}));
app.use(express.static(path.join(__dirname, 'public')));
app.use(cookieParser('secret code')); // 쿠키에 대한 비밀번호
app.use(flash()); // 일회성 메세지를 위한 미들웨어
app.use(session({
  resave:false,
  saveUninitialized:false,
  secret:'secret code',
  cookie:{
    httpOnly:true,
    secure:false
  },
}));

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



app.get('/user',(req,res)=>{
  console.log("get user !");
  res.send("hello hennie's usr");
});


module.exports = app;


