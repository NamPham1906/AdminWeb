const loginService = require('./loginService');
const accountService = require('../accounts/accountService');

exports.login = async (req,res)=> {
    res.render('login/login');
}