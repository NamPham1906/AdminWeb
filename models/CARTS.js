const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('CARTS', {
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
    QUANTITY: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    ISDELETED: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'CARTS',
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
        name: "fk_c_pd",
        using: "BTREE",
        fields: [
          { name: "PRODUCT_ID" },
        ]
      },
    ]
  });
};
