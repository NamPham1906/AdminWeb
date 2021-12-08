var express = require('express');
var router = express.Router();

router.get('/setting', function(req, res, next) {
  res.render('orders/setting', { title: 'Express' });
});

router.get('/setting/detail/1', function(req, res, next) {
  res.render('orders/details/1', { title: 'Express' });
});

module.exports = router;
