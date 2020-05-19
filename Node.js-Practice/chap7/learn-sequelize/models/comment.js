module.exports = (sequelize, DataTypes) =>{
    return sequelize.define('comment',{
        commenter: {
           //
        },
        comment:{
            type: DataTypes.String(100),
            allowNull:false

        },
        created_at:{
            type: DataTypes.Date,
            allowNull:false,
            defaultValue:sequelize.literal('now()')
        },
        timestamps:false,
        userscored :true,
    });
};