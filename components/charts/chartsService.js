const orderService = require('../orders/ordersService');
const orderDetailService = require('../order_details/orderDetailsService');
var today = new Date();
var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
var dateTime = date+' '+time;


exports.revenue=async (from ,to) =>{
    
    const orders = await orderService.orderTime((new Date(from)).getTime(), to> today?to:today);
    var revenue = 0;
    
     for (const order of orders) {
        revenue += await orderDetailService.totalBill(order.ORDER_ID);
     }
    
    return revenue;
};


exports.totalProducts=async (from ,to) =>{
    
    const orders = await orderService.orderTime((new Date(from)).getTime(), to);
    var revenue = 0;
    
     for (const order of orders) {
        revenue += await orderDetailService.totalProducts(order.ORDER_ID);
     }
    
    return revenue;
};

exports.totalOrders=async (from ,to) =>{
    
    const orders = await orderService.orderTime((new Date(from)).getTime(), to);
    
    
    return orders.length;
};


