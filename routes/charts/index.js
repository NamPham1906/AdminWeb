var express = require('express');
var router = express.Router();


router.get('/setting', function(req, res, next) {
  res.render('charts/setting', { title: 'Express' });
});

module.exports = router;
