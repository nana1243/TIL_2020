var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  console.log("start first router");
  res.render('test');
});

//PUG, EJS (HTML 대신에 PUG를 사용하겟다?)


router.get('/posts',(req,res)=>{

});

router.get('/comments',(req,res)=>{
});


router.post('/',(req,res)=>{
  console.log("post!");
  res.send('hello hennie');
});


module.exports = router;
