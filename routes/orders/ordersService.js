const { raw } = require('express');
const { NULL } = require('node-sass');
const { options } = require('..');
const {models} = require('../../models/index');
const { v1: uuidv1 } = require('uuid');
const { Op } = require("sequelize");

//, {model: models.orders_return ,as: "orders_returns"}

exports.list=(page = 0, itemPerPage = 10 ) =>{
    return models.orders.findAll({
        include: [{model: models.clients , as: "CLIENT",attributes: ['LASTNAME']},{model: models.deliveries , as: "deliveries",attributes: ['DELIVERY_STATUS']}],
        where: {
            ISDELETED: false
          },
        offset:page*itemPerPage,
        limit: itemPerPage,
        raw:true,
        nest : true
    });
};

exports.orderDetail=(order_id ="0") =>{
    return models.orders.findOne({
        include: [{model: models.orders_detail ,as: "orders_details", 
        include: [{model: models.products ,as: "PRODUCT"}]
    }, {model: models.clients , as: "CLIENT",attributes: ['LASTNAME']}, {model: models.admins , as: "MANAGER_admin",attributes: ['LASTNAME']}, {model: models.orders_return ,as: "orders_returns"}   ],
        where: {
        ORDER_ID: order_id
          },
        raw:true,
        nest : true
    });
}

