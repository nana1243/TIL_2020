// 데이터를 주고 받는 방법 중 가장 쉬운 방법은 쿠키이다!


const http = require('http');
const fs = require('fs');
const url = require('url');
const qs = require('querystring');


// 쿠키 파싱할때 쓰는 함수 
const parseCookies = (cookie = '') =>
  cookie
    .split(';')
    .map(v => v.split('='))
    .reduce((acc, [k, v]) => {
      acc[k.trim()] = decodeURIComponent(v);
      return acc;
    }, {});

// cookie의 접근은  req.headers.cookie;
http.createServer((req, res) => {
    const cookies = parseCookies(req.headers.cookie);
    if (req.url.startsWith('/login')) {
      const { query } = url.parse(req.url);
      const { name } = qs.parse(query);
      const expires = new Date(); 
      expires.setMinutes(expires.getMinutes() + 5);
       // 쿠키의 유효시간 
      res.writeHead(302, {
        Location: '/',
        'Set-Cookie': `name=${encodeURIComponent(name)}; Expires=${expires.toGMTString()}; HttpOnly; Path=/`,
      });
      res.end();
    } else if (cookies.name) {
      res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
      res.end("<h1>" + `${cookies.name}` +"님 안녕하세요</h1>");
    } else {
      fs.readFile('./chap4-3.html', (err, data) => {
        if (err) {
          throw err;
        }
        res.end(data);
      });
    }
  })
    .listen(8080, () => {
      console.log('8080번 포트에서 서버 대기중입니다!');
    });