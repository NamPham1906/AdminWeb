const chartService = require('./chartsService');


exports.timeReport = async (req,res)=> {
    const revenue = await chartService.revenue(req.query.from, req.query.to);
    const report = {
        REVENUE: revenue
      };
    res.render('charts/setting',  {report});
}