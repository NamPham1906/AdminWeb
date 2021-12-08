const productService = require('./productService');
const accountService = require('../accounts/accountService');

exports.list = async (req,res)=> {
    const products = await productService.list(!isNaN(req.query.page) && req.query.page > 0? req.query.page - 1:0);
    const accounts = await accountService.allList();
    res.render('products/setting', { products,page:req.query.page, accounts });
}

exports.productDetail = async (req,res)=> {
    const product = await productService.productDetail(req.query.product_id);
    const accounts = await accountService.allList();
    res.render('products/details',  {product, accounts} );
}

exports.productAdd = async (req,res)=> {
    const accounts = await accountService.allList();
    res.render('products/add',  {accounts} );
}

exports.deleteProduct = async (req,res)=> {
    await productService.deleteProduct(req.body.product_id)
    res.redirect('/product/setting');
}

exports.updateProduct = async (req,res)=> {
    await productService.updateProduct(req.body.product_id,
                                       req.body.product_name,
                                       req.body.product_type,
                                       req.body.sold,
                                       req.body.quantity,
                                       req.body.description,
                                       req.body.cost,
                                       req.body.importer,
                                       req.body.importdate)
    res.redirect('/product/setting');
}


exports.addProduct = async (req,res)=> {
    const id = await productService.maxProductID();
    var newid =  id.toString().substring(1, 5);
    var numid = Number(newid.toString());
    numid = numid + 1;
    newid = "P00" + numid.toString();
    await productService.addProduct(   newid,
                                       req.body.product_name,
                                       req.body.product_type,
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
                                       req.body.product_type,
                                       req.body.sold,
                                       req.body.quantity,
                                       req.body.cost
        )
    const accounts = await accountService.allList();
    res.render('products/setting', { products,page:req.query.page, accounts });
}