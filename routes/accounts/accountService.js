const { raw } = require('express');
const { options } = require('..');
const {models} = require('../../models/index');

exports.allList=() =>{
    return models.ADMINS.findAll({
        where: {
            ISDELETED: false
          },
        raw:true
    });
};


exports.findAccount=(username ="0") =>{
    return models.ADMINS.findOne({
        where: {
            USERNAME: username,
            ISDELETED: false
          },
        raw:true
    });
}

exports.list=(page = 0, itemPerPage = 10 ) =>{
    return models.ADMINS.findAll({
        where: {
            ISDELETED: false
          },
        offset:page*itemPerPage,
        limit: itemPerPage,
        raw:true
    });
};

exports.accountDetail=(account_id ="0") =>{
    return models.ADMINS.findOne({
        where: {
            ADMIN_ID: account_id
          },
        raw:true
    });
}


exports.addAccount=(newid,first_name,last_name,gender,dateofbirth,email,user_name,password) =>{
    
    const newproduct =  models.ADMINS.create({ 
        ADMIN_ID: newid,
        FIRSTNAME: first_name,
        LASTNAME: last_name,
        GENDER: gender,
        DOB: dateofbirth,
        EMAIL: email,
        USERNAME: user_name,
        PASS: password,
        ISDELETED: false
      });
}

exports.maxAccountID=() => {
    return models.ADMINS.max("ADMIN_ID");
}
