const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('DELIVERIES', {
    DELIVERY_ID: {
      type: DataTypes.CHAR(5),
      allowNull: false,
      primaryKey: true
    },
    ORDER_ID: {
      type: DataTypes.CHAR(5),
      allowNull: true,
      references: {
        model: 'ORDERS',
        key: 'ORDER_ID'
      }
    },
    CLIENT_ID: {
      type: DataTypes.CHAR(5),
      allowNull: true,
      references: {
        model: 'CLIENTS',
        key: 'CLIENT_ID'
      }
    },
    DELIVERY_DAY: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    DELIVERY_STATUS: {
      type: DataTypes.ENUM('FAILED','SUCCEED'),
      allowNull: true
    },
    MANAGER: {
      type: DataTypes.CHAR(5),
      allowNull: true,
      references: {
        model: 'ADMINS',
        key: 'ADMIN_ID'
      }
    },
    ISDELETED: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'DELIVERIES',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "DELIVERY_ID" },
        ]
      },
      {
        name: "fk_d_o",
        using: "BTREE",
        fields: [
          { name: "ORDER_ID" },
        ]
      },
      {
        name: "fk_d_cl",
        using: "BTREE",
        fields: [
          { name: "CLIENT_ID" },
        ]
      },
      {
        name: "fk_d_a",
        using: "BTREE",
        fields: [
          { name: "MANAGER" },
        ]
      },
    ]
  });
};
