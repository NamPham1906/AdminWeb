const { raw } = require('express');
const { options } = require('..');
const {models} = require('../../models/index');

exports.allList=() =>{
    return models.admins.findAll({
        where: {
            ISDELETED: false
          },
        raw:true
    });
};


exports.findAccount=(username ="0") =>{
    return models.admins.findOne({
        where: {
            USERNAME: username,
            ISDELETED: false
          },
        raw:true
    });
}

exports.list=(page = 0, itemPerPage = 10 ) =>{
    return models.admins.findAll({
        where: {
            ISDELETED: false
          },
        offset:page*itemPerPage,
        limit: itemPerPage,
        raw:true
    });
};

exports.accountDetail=(account_id ="0") =>{
    return models.admins.findOne({
        where: {
            ADMIN_ID: account_id
          },
        raw:true
    });
}


exports.addAccount=(first_name,last_name,gender,dateofbirth,email,user_name,password) =>{
    
    const newproduct =  models.admins.create({ 
        FIRSTNAME: first_name,
        LASTNAME: last_name,
        GENDER: gender,
        DOB: dateofbirth,
        EMAIL: email,
        USERNAME: user_name,
        PASS: password,
        ISDELETED: false,
        ISLOCK: false
      });
}
