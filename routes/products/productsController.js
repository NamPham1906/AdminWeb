const productService = require('./productService');
const accountService = require('../accounts/accountService');
const categoryService = require('../categories/categoryService');

exports.list = async (req,res)=> {
    const products = await productService.list(!isNaN(req.query.page) && req.query.page > 0? req.query.page - 1:0);
    res.render('products/setting', ({ products,page:req.query.page}));
}

exports.productDetail = async (req,res)=> {
    const product = await productService.productDetail(req.query.product_id);
    const accounts = await accountService.allList();
    const categories = await categoryService.allList();
    res.render('products/details',  {product, categories, accounts} );
}

// get add product form 
exports.productAdd = async (req,res)=> {
    const accounts = await accountService.allList();
    const categories = await categoryService.allList();
    res.render('products/add', {categories, accounts});
}

exports.deleteProduct = async (req,res)=> {
    await productService.deleteProduct(req.body.product_id)
    res.redirect('/product/setting');
}

exports.updateProduct = async (req,res)=> {
    await productService.updateProduct(req.body.product_id,
                                       req.body.product_name,
                                       req.file.filename,
                                       req.body.category,
                                       req.body.sold,
                                       req.body.quantity,
                                       req.body.description,
                                       req.body.cost,
                                       req.body.importer,
                                       req.body.importdate)
    res.redirect('/product/setting');
}

// add product to database 
exports.addProduct = async (req,res)=> {
    await productService.addProduct(
                                       req.body.product_name,
                                       req.file.filename,
                                       req.body.category,
                                       req.body.sold,
                                       req.body.quantity,
                                       req.body.description,
                                       req.body.cost,
                                       req.body.importer,
                                       req.body.importdate)
    res.redirect('/product/setting');
}

exports.fillterProduct = async (req,res)=> {
    const products = await productService.listFillter(
        !isNaN(req.query.page) && req.query.page > 0? req.query.page - 1:0, 10,
                                       req.body.product_name,
                                       req.body.category,
                                       req.body.sold,
                                       req.body.quantity,
                                       req.body.cost
        )
    const accounts = await accountService.allList();
    res.render('products/setting', { products,page:req.query.page, accounts });
}