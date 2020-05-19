module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('user',{
        name : {
            type: DataTypes.String,
            allowNull: false,
            unique: true,
        },
        age :{
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull:false

        },
        married:{
            type: DataTypes.Boolean,
            allowNull:true,
        },
        comment:{
            type: DataTypes.String,
            allowNull:true
        },
        created_at:{
            type: DataTypes.Date,
            allowNull :false,
            defaultValue : sequelize.literal('now()'),

        },
        timestamps:false,
        underscored :true,
    });
};

