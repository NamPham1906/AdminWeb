const accountService = require('./accountService');

// GET FORM
exports.list = async (req,res)=> {
    const accounts = await accountService.list(!isNaN(req.query.page) && req.query.page > 0? req.query.page - 1:0);
    res.render('accounts/setting', { accounts,page:req.query.page, accounts });
}

exports.accountDetail = async (req,res)=> {
    const account = await accountService.accountDetail(req.query.account_id);
    var isLockable = true;
    if (res.locals.user.account_id==req.query.account_id){
        isLockable = false;
    }
    res.render('accounts/details',  {account, isLockable} );
}

exports.accountAdd = async (req,res)=> {
    res.render('accounts/add');
}


// POST FORM 
exports.addAccount = async (req,res)=> {
    await accountService.addAccount(
        req.file.filename,
        req.body.username,
        req.body.firstname,
        req.body.lastname,
        req.body.email,
        req.body.gender,
        req.body.dateofbirth,
        req.body.password)
    res.redirect('/account/setting');  
}

exports.deleteAccount = async (req,res)=> {
    await accountService.deleteAccount(req.body.account_id);
    res.redirect('/account/setting');
}

exports.updateAccount = async (req,res)=> {
    if (req.file){
        await accountService.updateAccount(req.body.account_id,
            req.file.filename,
            req.body.username,
            req.body.firstname,
            req.body.lastname,
            req.body.email,
            req.body.gender,
            req.body.dateofbirth,
            req.body.password)
        res.redirect('/account/setting');
    }else{
        await accountService.updateAccountWithoutImage(req.body.account_id,
            req.body.username,
            req.body.firstname,
            req.body.lastname,
            req.body.email,
            req.body.gender,
            req.body.dateofbirth,
            req.body.password)
        res.redirect('/account/setting');
    }
   
}

