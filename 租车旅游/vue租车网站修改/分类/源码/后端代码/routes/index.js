var express = require('express');
var router = express.Router();
var fs = require('fs');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/mysql', function(req, res, next) {
    res.render('mysql');

});

router.get('/getFiles', function(req, res, next) {
  fs.readdir('sql/table', function (err, files) {
    if (err) {
      return console.log('目录不存在')
    }
    let createTable=files.map((val,index)=>{
      return {
        tableName:val,
        create:require('../sql/table/'+val)
      }
    })
    res.send(createTable);
  })
});

router.get('/operation', function(req, res, next) {
  let linkSql=require('../sql/linkSql')
  let sql=req.query.sql
  linkSql(sql,r=>{
    res.json(r)
  })
});
router.post('/upImg', function(req, res, next) {
  if (req.file) {
    //console.log(req.file)
    fs.stat(`./public/uploads/${req.file.filename}`, (err, stats) => {
      if(stats.size===req.file.size){
        console.log(req.file.filename)
        res.send(req.file.filename)
      }else{
        //删除文件  923a2db205cc06fefb7b8c3ff944edde
      }
    })
  }
});

router.get('/getImg', function(req, res, next) {
  console.log(req.query.imagePath)
  let path="./public/uploads/"+req.query.imagePath
  var content = fs.readFileSync(path,"binary");
  res.writeHead(200, "Ok");
  res.write(content,"binary"); //格式必须为 binary，否则会出错
  res.end();
});


router.post('/upPdf', function(req, res, next) {
  if (req.file) {
    //console.log(req.file)
    fs.stat(`./public/uploads/${req.file.filename}`, (err, stats) => {
      if(stats.size===req.file.size){
        console.log(req.file.filename)
        res.send(req.file.filename)
      }else{
        //删除文件  923a2db205cc06fefb7b8c3ff944edde
      }
    })
  }
});

router.get('/getPdf', function(req, res, next) {
  console.log(req.query.pdfPath)
  let path="./public/uploads/"+req.query.pdfPath
  var content = fs.readFileSync(path,"binary");
  res.writeHead(200, "Ok");
  res.write(content,"binary"); //格式必须为 binary，否则会出错
  res.end();
});

module.exports = router;
