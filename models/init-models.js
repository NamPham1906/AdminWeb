var DataTypes = require("sequelize").DataTypes;
var _ADMINS = require("./ADMINS");
var _BILLS = require("./BILLS");
var _CARTS = require("./CARTS");
var _CLIENTS = require("./CLIENTS");
var _DELIVERIES = require("./DELIVERIES");
var _ORDERS = require("./ORDERS");
var _ORDERS_DETAIL = require("./ORDERS_DETAIL");
var _ORDERS_RETURN = require("./ORDERS_RETURN");
var _PRODUCTS = require("./PRODUCTS");
var _WISHLISTS = require("./WISHLISTS");

function initModels(sequelize) {
  var ADMINS = _ADMINS(sequelize, DataTypes);
  var BILLS = _BILLS(sequelize, DataTypes);
  var CARTS = _CARTS(sequelize, DataTypes);
  var CLIENTS = _CLIENTS(sequelize, DataTypes);
  var DELIVERIES = _DELIVERIES(sequelize, DataTypes);
  var ORDERS = _ORDERS(sequelize, DataTypes);
  var ORDERS_DETAIL = _ORDERS_DETAIL(sequelize, DataTypes);
  var ORDERS_RETURN = _ORDERS_RETURN(sequelize, DataTypes);
  var PRODUCTS = _PRODUCTS(sequelize, DataTypes);
  var WISHLISTS = _WISHLISTS(sequelize, DataTypes);

  CLIENTS.belongsToMany(ORDERS, { as: 'ORDER_ID_ORDERS_ORDERS_RETURNs', through: ORDERS_RETURN, foreignKey: "CLIENT_ID", otherKey: "ORDER_ID" });
  CLIENTS.belongsToMany(PRODUCTS, { as: 'PRODUCT_ID_PRODUCTs', through: CARTS, foreignKey: "CLIENT_ID", otherKey: "PRODUCT_ID" });
  CLIENTS.belongsToMany(PRODUCTS, { as: 'PRODUCT_ID_PRODUCTS_WISHLISTs', through: WISHLISTS, foreignKey: "CLIENT_ID", otherKey: "PRODUCT_ID" });
  DELIVERIES.belongsToMany(ORDERS, { as: 'ORDER_ID_ORDERs', through: BILLS, foreignKey: "DELIVERY_ID", otherKey: "ORDER_ID" });
  ORDERS.belongsToMany(CLIENTS, { as: 'CLIENT_ID_CLIENTS_ORDERS_RETURNs', through: ORDERS_RETURN, foreignKey: "ORDER_ID", otherKey: "CLIENT_ID" });
  ORDERS.belongsToMany(DELIVERIES, { as: 'DELIVERY_ID_DELIVERies', through: BILLS, foreignKey: "ORDER_ID", otherKey: "DELIVERY_ID" });
  ORDERS.belongsToMany(PRODUCTS, { as: 'PRODUCT_ID_PRODUCTS_ORDERS_DETAILs', through: ORDERS_DETAIL, foreignKey: "ORDER_ID", otherKey: "PRODUCT_ID" });
  PRODUCTS.belongsToMany(CLIENTS, { as: 'CLIENT_ID_CLIENTs', through: CARTS, foreignKey: "PRODUCT_ID", otherKey: "CLIENT_ID" });
  PRODUCTS.belongsToMany(CLIENTS, { as: 'CLIENT_ID_CLIENTS_WISHLISTs', through: WISHLISTS, foreignKey: "PRODUCT_ID", otherKey: "CLIENT_ID" });
  PRODUCTS.belongsToMany(ORDERS, { as: 'ORDER_ID_ORDERS_ORDERS_DETAILs', through: ORDERS_DETAIL, foreignKey: "PRODUCT_ID", otherKey: "ORDER_ID" });
  DELIVERIES.belongsTo(ADMINS, { as: "MANAGER_ADMIN", foreignKey: "MANAGER"});
  ADMINS.hasMany(DELIVERIES, { as: "DELIVERies", foreignKey: "MANAGER"});
  ORDERS.belongsTo(ADMINS, { as: "MANAGER_ADMIN", foreignKey: "MANAGER"});
  ADMINS.hasMany(ORDERS, { as: "ORDERs", foreignKey: "MANAGER"});
  PRODUCTS.belongsTo(ADMINS, { as: "IMPORTER_ADMIN", foreignKey: "IMPORTER"});
  ADMINS.hasMany(PRODUCTS, { as: "PRODUCTs", foreignKey: "IMPORTER"});
  CARTS.belongsTo(CLIENTS, { as: "CLIENT", foreignKey: "CLIENT_ID"});
  CLIENTS.hasMany(CARTS, { as: "CARTs", foreignKey: "CLIENT_ID"});
  DELIVERIES.belongsTo(CLIENTS, { as: "CLIENT", foreignKey: "CLIENT_ID"});
  CLIENTS.hasMany(DELIVERIES, { as: "DELIVERies", foreignKey: "CLIENT_ID"});
  ORDERS.belongsTo(CLIENTS, { as: "CLIENT", foreignKey: "CLIENT_ID"});
  CLIENTS.hasMany(ORDERS, { as: "ORDERs", foreignKey: "CLIENT_ID"});
  ORDERS_RETURN.belongsTo(CLIENTS, { as: "CLIENT", foreignKey: "CLIENT_ID"});
  CLIENTS.hasMany(ORDERS_RETURN, { as: "ORDERS_RETURNs", foreignKey: "CLIENT_ID"});
  WISHLISTS.belongsTo(CLIENTS, { as: "CLIENT", foreignKey: "CLIENT_ID"});
  CLIENTS.hasMany(WISHLISTS, { as: "WISHLISTs", foreignKey: "CLIENT_ID"});
  BILLS.belongsTo(DELIVERIES, { as: "DELIVERY", foreignKey: "DELIVERY_ID"});
  DELIVERIES.hasMany(BILLS, { as: "BILLs", foreignKey: "DELIVERY_ID"});
  BILLS.belongsTo(ORDERS, { as: "ORDER", foreignKey: "ORDER_ID"});
  ORDERS.hasMany(BILLS, { as: "BILLs", foreignKey: "ORDER_ID"});
  DELIVERIES.belongsTo(ORDERS, { as: "ORDER", foreignKey: "ORDER_ID"});
  ORDERS.hasMany(DELIVERIES, { as: "DELIVERies", foreignKey: "ORDER_ID"});
  ORDERS_DETAIL.belongsTo(ORDERS, { as: "ORDER", foreignKey: "ORDER_ID"});
  ORDERS.hasMany(ORDERS_DETAIL, { as: "ORDERS_DETAILs", foreignKey: "ORDER_ID"});
  ORDERS_RETURN.belongsTo(ORDERS, { as: "ORDER", foreignKey: "ORDER_ID"});
  ORDERS.hasMany(ORDERS_RETURN, { as: "ORDERS_RETURNs", foreignKey: "ORDER_ID"});
  CARTS.belongsTo(PRODUCTS, { as: "PRODUCT", foreignKey: "PRODUCT_ID"});
  PRODUCTS.hasMany(CARTS, { as: "CARTs", foreignKey: "PRODUCT_ID"});
  ORDERS_DETAIL.belongsTo(PRODUCTS, { as: "PRODUCT", foreignKey: "PRODUCT_ID"});
  PRODUCTS.hasMany(ORDERS_DETAIL, { as: "ORDERS_DETAILs", foreignKey: "PRODUCT_ID"});
  WISHLISTS.belongsTo(PRODUCTS, { as: "PRODUCT", foreignKey: "PRODUCT_ID"});
  PRODUCTS.hasMany(WISHLISTS, { as: "WISHLISTs", foreignKey: "PRODUCT_ID"});

  return {
    ADMINS,
    BILLS,
    CARTS,
    CLIENTS,
    DELIVERIES,
    ORDERS,
    ORDERS_DETAIL,
    ORDERS_RETURN,
    PRODUCTS,
    WISHLISTS,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
