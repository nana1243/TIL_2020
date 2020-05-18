var createError = require('http-errors');
var express = require('express'); // express의 package를 불러오겟당
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express(); // app이라는 객체를 만든다 -> 이행위를 통해 http.createServer(app)을 쓸 수 있게한다

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug'); // 엔진을 set해주다(여기서 pug: html을 대체해주는 기능)

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter); // 라우터를 생성해준다
app.use('/users', usersRouter); // user라우터를 생성해준다

// catch 404 and forward to error handler

app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app; // 앱객체를 모듈로 만들어서 export한다는 의미인다
