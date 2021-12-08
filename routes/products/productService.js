const { raw } = require('express');
const { NULL } = require('node-sass');
const { options } = require('..');
const {models} = require('../../models/index');

const { Op } = require("sequelize");

exports.listFillter=(page = 0, itemPerPage = 10, product_name = null,product_type = null,sold = null,quantity = null,cost = null,importer = null,importdate = null) =>{
    return models.PRODUCTS.findAll({
        where: {
            [Op.and]:[
            {PRODUCT_NAME: product_name},
            {PRODUCT_TYPE: product_type},
            {SOLD: sold},
            {QUANTITY: quantity},
            {PRICE: cost}
            
            ],
            [Op.and]:[
            {ISDELETED: false}
            ]
          },
        offset:page*itemPerPage,
        limit: itemPerPage,
        raw:true
    });
};

exports.list=(page = 0, itemPerPage = 10 ) =>{
    return models.PRODUCTS.findAll({
        where: {
            ISDELETED: false
          },
        offset:page*itemPerPage,
        limit: itemPerPage,
        raw:true
    });
};

exports.productDetail=(product_id ="0") =>{
    return models.PRODUCTS.findOne({
        where: {
            PRODUCT_ID: product_id
          },
        raw:true
    });
}

exports.deleteProduct=(product_id ="0") =>{
    models.PRODUCTS.update({ 
        ISDELETED: true
     }, {
        where: {
            PRODUCT_ID: product_id
        }
      });
}

exports.updateProduct=(product_id ="0", product_name,product_type,sold,quantity,description,cost,importer,importdate) =>{
    models.PRODUCTS.update({ 
        PRODUCT_NAME: product_name,
        PRODUCT_TYPE: product_type,
        SOLD: sold,
        QUANTITY: quantity,
        DETAIL: description,
        PRICE: cost,
        IMPORTER: importer,
        IMPORTDATE: importdate
     }, {
        where: {
            PRODUCT_ID: product_id
        }
      });
}

exports.addProduct=(newid, product_name,product_type,sold,quantity,description,cost,importer,importdate) =>{
    
    const newproduct =  models.PRODUCTS.create({ 
        PRODUCT_ID: newid,
        PRODUCT_NAME: product_name,
        PRODUCT_TYPE: product_type,
        SOLD: sold,
        QUANTITY: quantity,
        DETAIL: description,
        PRICE: cost,
        IMPORTER: importer,
        IMPORTDATE: importdate,
        ISDELETED: false
      });
}

exports.maxProductID=() => {
    return models.PRODUCTS.max("PRODUCT_ID");
}