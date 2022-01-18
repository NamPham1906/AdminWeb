const orderService = require('../orders/ordersService');
const orderDetailService = require('../order_details/orderDetailsService');
var today = new Date();

exports.revenue=async (from ,to) =>{
    
    to= (new Date(to)).getTime()< today.getTime()?to:today;
    from = (new Date(from)).getTime() < (new Date(to)).getTime()? from:to;
    const orders = await orderService.orderTime((new Date(from)).getTime(), (new Date(to)).getTime());
    var revenue = 0;
    
     for (const order of orders) {
        revenue += await orderDetailService.totalBill(order.ORDER_ID);
     }
    
    return revenue;
};


exports.totalProducts=async (from ,to) =>{
    to= (new Date(to)).getTime()< today.getTime()?to:today;
    from = (new Date(from)).getTime() < (new Date(to)).getTime()? from:to;
    const orders = await orderService.orderTime((new Date(from)).getTime(), (new Date(to)).getTime());
    var totalProduct = 0;
    
     for (const order of orders) {
        totalProduct += await orderDetailService.totalProducts(order.ORDER_ID);
     }
    
    return totalProduct;
};

exports.totalOrders=async (from ,to) =>{
    to= (new Date(to)).getTime()< today.getTime()?to:today;
    from = (new Date(from)).getTime() < (new Date(to)).getTime()? from:to;
    const orders = await orderService.orderTime((new Date(from)).getTime(), (new Date(to)).getTime());
    
    
    return orders.length;
};


