const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('CLIENTS', {
    CLIENT_ID: {
      type: DataTypes.STRING(50),
      allowNull: false,
      primaryKey: true
    },
    FIRSTNAME: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    LASTNAME: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    GENDER: {
      type: DataTypes.ENUM('Female','Male'),
      allowNull: true
    },
    DOB: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    PHONE: {
      type: DataTypes.STRING(20),
      allowNull: true
    },
    IMAGE: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    EMAIL: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    PASS: {
      type: DataTypes.STRING(1000),
      allowNull: true
    },
    ISDELETED: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'CLIENTS',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "CLIENT_ID" },
        ]
      },
    ]
  });
};
