  
module.exports = (sequelize, DataTypes) => {

    //define(nomeModel, colunas, config)
    const Comentario = sequelize.define(
        'Comentario', {
            texto: DataTypes.STRING,
            posts_id: DataTypes.INTEGER,
            usuarios_id: DataTypes.INTEGER
        }, {
            tableName: "comentarios",
            timestamps: false
        }
    );

    return Comentario;
};