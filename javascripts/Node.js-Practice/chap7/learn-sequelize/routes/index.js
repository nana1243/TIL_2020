var express = require('express');
var router = express.Router();

var {User} = require('../models');
/* GET home page. */

// sequelize 를 할 수 있게
router.get('/', function(req, res, next) {
  User.findAll()
      .then((users)=>{
        res.render('sequelize', { title: 'practice - sequelize',users:users });
      })
      .catch((err)=>{
        console.log(err);
        next(err);
      })

});

module.exports = router;
