var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/add', function(req, res, next) {
  res.render('shops/add', { title: 'Express' });
});

router.get('/setting', function(req, res, next) {
  res.render('shops/setting', { title: 'Express' });
});

module.exports = router;
