const orderService = require('./ordersService');
const orderDetailService = require('../order_details/orderDetailsService');
const accountService = require('../accounts/accountService');
const deliveryService = require('../deliveries/deliveriesService');

exports.list = async (req,res)=> {
    const orders = await orderService.list(!isNaN(req.query.page) && req.query.page > 0? req.query.page - 1:0);
    res.render('orders/setting', ({ orders,page:req.query.page}));
}

exports.orderDetail = async (req,res)=> {
    const order = await orderService.orderDetail(req.query.order_id);
    const orderDetails = await orderDetailService.listFillter(req.query.order_id);
    const accounts = await accountService.allList();
    res.render('orders/details',  {order, orderDetails, accounts} );
}

exports.deleteOrder = async (req,res)=> {
    await orderDetailService.deleteOrderDetail(req.body.order_id);
    await deliveryService.deleteDelivery(req.body.order_id);
    await orderService.deleteOrder(req.body.order_id);
    res.redirect('/order/setting');
}