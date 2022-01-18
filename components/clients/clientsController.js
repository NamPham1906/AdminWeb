const clientService = require('./clientsService');

// GET FORM
exports.list = async (req,res)=> {
    const clients = await clientService.list(!isNaN(req.query.page) && req.query.page > 0? req.query.page - 1:0);
    res.render('clients/setting', { clients,page:req.query.page, clients });
}

exports.clientDetail = async (req,res)=> {
    const client = await clientService.clientDetail(req.query.client_id);
    var isLockable = true;
    res.render('clients/details',  {client, isLockable} );
}

exports.clientAdd = async (req,res)=> {
    res.render('clients/add');
}


// POST FORM 
exports.addClient = async (req,res)=> {
    await clientService.addClient(
        req.file.filename,
        req.body.firstname,
        req.body.lastname,
        req.body.gender,
        req.body.dateofbirth,
        req.body.phone,
        req.body.email,
        req.body.password)
    res.redirect('/client/setting');  
}

exports.deleteClient = async (req,res)=> {
    await clientService.deleteClient(req.body.client_id);
    res.redirect('/client/setting');
}

exports.updateClient = async (req,res)=> {
    if (req.file){
        await clientService.updateClient(req.body.client_id,
            req.file.filename,
            req.body.firstname,
            req.body.lastname,
            req.body.gender,
            req.body.dateofbirth,
            req.body.phone,
            req.body.email,
            req.body.password)
        res.redirect('/client/setting');
    }else{
        await clientService.updateClientWithoutImage(req.body.client_id,
            req.body.firstname,
            req.body.lastname,
            req.body.gender,
            req.body.dateofbirth,
            req.body.phone,
            req.body.email,
            req.body.password)
        res.redirect('/client/setting');
    }
   
}

exports.lockClient = async (req,res)=> {
     await clientService.lockClient(req.body.client_id);
        res.redirect('/client/setting');
}

exports.unlockClient = async (req,res)=> {
    await clientService.unlockCLient(req.body.client_id);
       res.redirect('/client/setting');
}


