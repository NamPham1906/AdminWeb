var createError = require('http-errors');
var express = require('express');
const bodyParser = require("body-parser");
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require("express-session");

var indexRouter = require('./routes/index');
var loginRouter = require('./routes/auth/index');
var usersRouter = require('./routes/user/index');
var accountsRouter = require('./routes/accounts/index');
var shopsRouter = require('./routes/shops/index');
var productsRouter = require('./routes/products/index');
var ordersRouter = require('./routes/orders/index');
var chartsRouter = require('./routes/charts/index');
const passport = require('./routes/auth/passport');
var flash = require('connect-flash');

var app = express();



// view engine  setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');


//Here we are configuring express to use body-parser as middle-ware.
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({secret:process.env.SESSION_SECRET}));
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

app.use('/logout', loginRouter);
app.use('/login', loginRouter);

app.use(function(req,res,next){
  res.locals.user = req.user;
  console.log(req.user);
  next();
});


app.use(function(req, res, next){
	if(req.user){
		next();
	}else{
		res.redirect('/login');
	}
})

app.use('/', indexRouter);
app.use('/user', usersRouter);
app.use('/account', accountsRouter);
app.use('/shop', shopsRouter);
app.use('/product', productsRouter);
app.use('/order', ordersRouter);
app.use('/chart', chartsRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
