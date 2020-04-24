var express = require('express');
var router = express.Router();
let linkSql=require('../sql/linkSql')

let linkMDB=require('../sql/linkMDB')
let lmdb=new linkMDB()

/* GET users listing. */
router.post('/login', function(req, res, next) {
    lmdb.get('user',req.body,call=>{
        console.log(call)
        res.send(call)
    })
});

router.post('/createUser', function(req, res, next) {
  lmdb.add('user',req.body,call=>{
      res.send(call)
  })
});

router.post('/getUser', function(req, res, next) {
  lmdb.get('user',req.body,call=>{
    res.send(call)
  })
});
router.post('/upUser', function(req, res, next) {
  lmdb.update('user',{ids:req.body.ids},{$set:req.body},call=>{
    res.send(call)
  })
});

router.post('/createCar', function(req, res, next) {
  lmdb.add('car',req.body,call=>{
    res.send(call)
  })
});

router.post('/getCar', function(req, res, next) {
  lmdb.get('car',req.body,call=>{
    res.send(call)
  })
});
router.post('/deleteUser', function(req, res, next) {
  lmdb.del('user',req.body,call=>{
    res.send(call)
  })
});



router.post('/upCar', function(req, res, next) {
  delete req.body._id //true
  lmdb.update('car',{ids: req.body.ids},{$set:req.body},call=>{
      res.send(call)
  })
});
router.post('/deleteCar', function(req, res, next) {
  lmdb.del('car',req.body,call=>{
    res.send(call)
  })
});

router.post('/addBlog', function(req, res, next) {
  lmdb.add('blog',req.body,call=>{
    res.send(call)
  })
});

router.post('/getBlog', function(req, res, next) {
  lmdb.get('blog',req.body,call=>{
    res.send(call)
  })
});

router.post('/deleteBlog', function(req, res, next) {
  lmdb.del('blog',req.body,call=>{
    res.send(call)
  })
});

router.post('/updateBlog', function(req, res, next) {
  delete req.body._id;
  lmdb.update('blog',{ids:req.body.ids},{$set:req.body},call=>{
    res.send(call)
  })
});
router.post('/getComment', function(req, res, next) {
  lmdb.get('comment',req.body,call=>{
    res.send(call)
  })
});
router.post('/addComment', function(req, res, next) {
  lmdb.add('comment',req.body,call=>{
    res.send(call)
  })
});
router.post('/delComment', function(req, res, next) {
  lmdb.del('comment',req.body,call=>{
    res.send(call)
  })
});


router.post('/addPay', function(req, res, next) {
  lmdb.add('pay',req.body,call=>{
    res.send(call)
  })
});

router.post('/getPay', function(req, res, next) {
  lmdb.get('pay',req.body,call=>{
    res.send(call)
  })
});

router.post('/upPay', function(req, res, next) {
  lmdb.update('pay',{'ids':req.body.ids},req.body,call=>{
    res.send(call)
  })
});

router.post('/delPay', function(req, res, next) {
  lmdb.del('pay',req.body,call=>{
    res.send(call)
  })
});

router.post('/addDCar', function(req, res, next) {
  lmdb.add('dCar',req.body,call=>{
    res.send(call)
  })
});
router.post('/delDCar', function(req, res, next) {
  lmdb.del('dCar',req.body,call=>{
    res.send(call)
  })
});
router.post('/getDCar', function(req, res, next) {
  lmdb.get('dCar',req.body,call=>{
    res.send(call)
  })
});

router.post('/addPayStatus', function(req, res, next) {
  lmdb.add('PayStatus',req.body,call=>{
    res.send(call)
  })
});
router.post('/upPayStatus', function(req, res, next) {
  lmdb.update('PayStatus',{ids:req.body.ids},{$set:req.body},call=>{
    res.send(call)
  })
});
router.post('/getPayStatus', function(req, res, next) {
  lmdb.get('PayStatus',req.body,call=>{
    res.send(call)
  })
});






module.exports = router;
