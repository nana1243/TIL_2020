var express = require('express');
var router = express.Router();
var {User} = require('../models');

/* GET users listing. */

router.get('/', function(req, res, next) {
  User.findAll()
      .then((users)=>{
        // 해당을 json으로
        res.json(users);

      })
      .catch((err)=>{
        console.log(err);
        next(err);
      })

});

// form안의 name들이 post요청이가서 정보들이 미들웨어 해석을 통해 body안에 데이터 들어있따
router.post('/',(req,res,next)=>{
  User.create({
    name : req.body.name,
    age:req.body.age,
    married:req.body.married,
  })
      .then((result)=>{
        consoel.log(result);
        res.status(201).json(result);

      })
      .catch((err)=>{
        console.log(err);
        next(err);
      })


});

module.exports = router;
