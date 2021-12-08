const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('WISHLISTS', {
    CLIENT_ID: {
      type: DataTypes.CHAR(5),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'CLIENTS',
        key: 'CLIENT_ID'
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
    ISDELETED: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'WISHLISTS',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "CLIENT_ID" },
          { name: "PRODUCT_ID" },
        ]
      },
      {
        name: "fk_w_pd",
        using: "BTREE",
        fields: [
          { name: "PRODUCT_ID" },
        ]
      },
    ]
  });
};
