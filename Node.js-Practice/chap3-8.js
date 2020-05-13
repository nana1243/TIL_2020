
// querystring module
const url = require('url');
const querystring = require('querystring');


const parsedUrl = url.parse('https://www.google.com/search?q=www.naver.com&oq=ww&aqs=chrome.2.69i60j69i57j35i39l2j69i60l2.1389j0j4&sourceid=chrome&ie=UTF-8');
const query = querystring.parse(parsedUrl.query);
console.log('query : ',query);