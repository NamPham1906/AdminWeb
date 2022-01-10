const express = require('express');
const router = express.Router();
const ordersController = require('./ordersController');


router.get('/setting',ordersController.list);

router.get('/setting/detail', ordersController.orderDetail);

router.get('/setting/detail/1', function(req, res, next) {
  res.render('orders/details/1', { title: 'Express' });
});

module.exports = router;
