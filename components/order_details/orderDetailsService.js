const { raw } = require('express');
const { options } = require('..');
const {models} = require('../../models/index');
const { Op } = require("sequelize");

exports.listFillter=(order_id ="0") =>{
    return models.orders_detail.findAll({
        include: [{model: models.products , as: "PRODUCT",include: [ {model: models.categories, as: "CATEGORY_CATEGORY"}]}],
        where: {
            ORDER_ID: order_id,
            ISDELETED: false
          },
        raw:true,
        nest : true
    });
};

exports.totalBill=(order_id ="0") =>{
    return models.orders_detail.sum("PRODUCTPRICE",{
        where: {
            ORDER_ID: order_id,
            ISDELETED: false
          },
        raw:true,
        nest : true
    });
};

exports.totalProducts=(order_id ="0") =>{
    return models.orders_detail.sum("QUANTITY",{
        where: {
            ORDER_ID: order_id,
            ISDELETED: false
          },
        raw:true,
        nest : true
    });
};


exports.deleteOrderDetail=(order_id ="0") =>{
    models.orders_detail.update({ 
        ISDELETED: true
     }, {
        where: {
            ORDER_ID: order_id
        }
      });
}
