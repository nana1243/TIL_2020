const express = require('express');
const router = express.Router();



//get/ comment/1
// 1번사용자의 모든 댓글들을
router.get('/:id',(req,res,next)=>{
    Comment.findAll({
        // 관계가 존재하기 때문에 연결
        include:{
            model:User,
            where: {id:req.params.id},
        }
    })
        .then((comments)=>{
            console.log(comments);
            res.json(comments);

        })
        .catch((err)=>{
            console.log(err);
            next(err);
        })
});

router.post('/', function(req, res, next) {
    Comment.create({
        commenter: req.body.id,
        comment: req.body.comment,
    })
        .then((result) => {
            console.log(result);
            res.status(201).json(result);
        })
        .catch((err) => {
            console.error(err);
            next(err);
        });
});

router.patch('/:id', function(req, res, next) {
    Comment.update({ comment: req.body.comment }, { where: { id: req.params.id } })
        .then((result) => {
            res.json(result);
        })
        .catch((err) => {
            console.error(err);
            next(err);
        });
});

router.delete('/:id', function(req, res, next) {
    Comment.destroy({ where: { id: req.params.id } })
        .then((result) => {
            res.json(result);
        })
        .catch((err) => {
            console.error(err);
            next(err);
        });
});


module.exports = router;