const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('ORDERS_RETURN', {
    ORDER_ID: {
      type: DataTypes.CHAR(5),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'ORDERS',
        key: 'ORDER_ID'
      }
    },
    CLIENT_ID: {
      type: DataTypes.CHAR(5),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'CLIENTS',
        key: 'CLIENT_ID'
      }
    },
    REASON: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    ISDELETED: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'ORDERS_RETURN',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "ORDER_ID" },
          { name: "CLIENT_ID" },
        ]
      },
      {
        name: "fk_or_cl",
        using: "BTREE",
        fields: [
          { name: "CLIENT_ID" },
        ]
      },
    ]
  });
};
