const orderService = require('../orders/ordersService');

exports.list = async (req,res)=> {
    const orders = await orderService.list(!isNaN(req.query.page) && req.query.page > 0? req.query.page - 1:0);
    res.render('orders/setting', ({ orders,page:req.query.page}));
}

exports.orderDetail = async (req,res)=> {
    const order = await orderService.orderDetail(req.query.order_id);

    res.render('orders/details',  {order} );
}
