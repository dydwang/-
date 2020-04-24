var express = require('express');
var router = express.Router();

let lmsq = require('../sql/fun/index')

/* GET users listing. */
router.post('/', function(req, res, next) {
    lmsq[req.body.$method](req.body).then(r=>{
      res.send(r)
    })
});

module.exports = router;
