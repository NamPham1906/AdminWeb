const { raw } = require('express');
const { NULL } = require('node-sass');
const { options } = require('..');
const {models} = require('../../models/index');

const { Op } = require("sequelize");


exports.findAccount=(username ="0") =>{
    return models.ADMINS.findOne({
        where: {
            USERNAME: username,
            ISDELETED: fase
          },
        raw:true
    });
}