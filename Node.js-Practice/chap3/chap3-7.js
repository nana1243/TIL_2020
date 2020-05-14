// url module

const url = require('url');

//1. 아래와 방식(w search 영역을 다룰때 편함)
const URL = url.URL;
const myURL = new URL('https://movie.naver.com/movie/bi/mi/basic.nhn?code=32686');


//2. 첫번째 옛날방식
const paredUrl1 = url.parse('https://dololak.tistory.com/95');
const paredUrl2 = url.parse('https://movie.naver.com/movie/bi/mi/basic.nhn?code=152691');


console.log('My url : ',myURL);
console.log('url format : ',url.format(myURL));


console.log('parse url1 : ' , paredUrl1);
console.log('parse url2 : ' , paredUrl2);