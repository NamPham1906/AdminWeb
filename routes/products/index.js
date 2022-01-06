const express = require('express');
const router = express.Router();
const multer  = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, './public/assets/images/products/')
    },
    filename: function (req, file, cb) {
      cb(null, Date.now() + path.extname(file.originalname)) 
    }
  })
const upload = multer({ storage: storage });



const storage2 = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './public/assets/images/products/')
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname)) 
  }
})
const upload2 = multer({ storage: storage2 });


const productsController = require('./productsController');

router.get('/setting',productsController.list);

router.get('/setting/detail', productsController.productDetail);

router.get('/setting/add', productsController.productAdd);

router.post('/setting/detail/delete', productsController.deleteProduct);

router.post('/setting/detail/update', upload2.single('uploaded_newfile'),productsController.updateProduct);

router.post('/setting/detail/add', upload.single('uploaded_file'), productsController.addProduct);

router.post('/setting/filter',productsController.fillterProduct);

module.exports = router;
