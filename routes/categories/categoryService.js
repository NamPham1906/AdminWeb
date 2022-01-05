const { raw } = require('express');
const { options } = require('..');
const {models} = require('../../models/index');

exports.allList=() =>{
    return models.categories.findAll({
        where: {
            ISDELETED: false
          },
        raw:true
    });
};