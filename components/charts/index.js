var express = require('express');
var router = express.Router();
const chartController = require('./chartsController');

router.get('/setting', function(req, res, next) {
  res.render('charts/setting');
});

router.post('/setting', chartController.timeReport);


module.exports = router;
