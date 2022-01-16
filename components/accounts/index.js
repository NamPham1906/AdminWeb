var express = require('express');
var router = express.Router();
const accountController = require('./accountController');


router.get('/detail', accountController.accountDetail);

router.get('/setting', accountController.list);

router.get('/setting/detail', accountController.accountDetail);


router.get('/setting/add', accountController.accountAdd);

router.post('/setting/detail/add', accountController.addAccount);




module.exports = router;
