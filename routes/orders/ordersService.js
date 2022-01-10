const { raw } = require('express');
const { NULL } = require('node-sass');
const { options } = require('..');
const {models} = require('../../models/index');
const { v1: uuidv1 } = require('uuid');
const { Op } = require("sequelize");


exports.list=(page = 0, itemPerPage = 10 ) =>{
    return models.orders.findAll({
        include: [ {model: models.orders_return ,as: "orders_returns"}  ],
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
        include: [ {model: models.orders_return ,as: "orders_returns"}  ],
        where: {
        ORDER_ID: order_id
          },
        raw:true
    });
}

