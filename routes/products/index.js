var express = require('express');
var router = express.Router();

const productsController = require('./productsController');

router.get('/setting',productsController.list);

router.get('/setting/detail', productsController.productDetail);

router.get('/setting/add', productsController.productAdd);

router.post('/setting/detail/delete', productsController.deleteProduct);

router.post('/setting/detail/update', productsController.updateProduct);

router.post('/setting/detail/add', productsController.addProduct);

router.post('/setting/filter',productsController.fillterProduct);

module.exports = router;
