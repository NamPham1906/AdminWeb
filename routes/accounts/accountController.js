const accountService = require('./accountService');

exports.list = async (req,res)=> {
    const accounts = await accountService.list(!isNaN(req.query.page) && req.query.page > 0? req.query.page - 1:0);
    res.render('accounts/setting', { accounts,page:req.query.page, accounts });
}

exports.accountDetail = async (req,res)=> {
    const account = await accountService.accountDetail(req.query.account_id);
    res.render('accounts/details',  {account} );
}

exports.accountAdd = async (req,res)=> {
    res.render('accounts/add');
}


exports.addAccount = async (req,res)=> {
    const id = await accountService.maxAccountID();
    var newid =  id.toString().substring(1, 5);
    var numid = Number(newid.toString());
    numid = numid + 1;
    newid = "A00" + numid.toString();
    await accountService.addAccount(   newid,
                                       req.body.first_name,
                                       req.body.last_name,
                                       req.body.gender,
                                       req.body.dateofbirth,
                                       req.body.email,
                                       req.body.user_name,
                                       req.body.password)
    res.redirect('/account/setting');

    
}
