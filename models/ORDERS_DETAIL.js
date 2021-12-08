const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('ORDERS_DETAIL', {
    ORDER_ID: {
      type: DataTypes.CHAR(5),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'ORDERS',
        key: 'ORDER_ID'
      }
    },
    PRODUCT_ID: {
      type: DataTypes.CHAR(5),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'PRODUCTS',
        key: 'PRODUCT_ID'
      }
    },
    QUANTITY: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    PRICE: {
      type: DataTypes.FLOAT,
      allowNull: true
    },
    ISDELETED: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'ORDERS_DETAIL',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "ORDER_ID" },
          { name: "PRODUCT_ID" },
        ]
      },
      {
        name: "fk_od_p",
        using: "BTREE",
        fields: [
          { name: "PRODUCT_ID" },
        ]
      },
    ]
  });
};
