const {Usuario, Post, Comentario, sequelize} = require('./models');

const _findAll = (model) => {
    model.findAll()
    .then((resultado) => {
        _resultado = resultado.map(user => user.toJSON());
        console.table(_resultado);
    });

};

const _findOne = (model, parametro) => {
    model.findOne({
        where: {
            nome: parametro
        }
    }).then((resultado) => {
        console.table(resultado.dataValues);
    }).catch((error) => {
        console.log("Error: Nome não encontrado.");
    });
};

const _findByPk = (model, id) => {
    model.findByPk(id)
    .then((resultado) => {
        console.table(resultado.dataValues);
    }).catch((error) => {
        console.log("Error: Id não encontrado.");
    });
};

const consultaBanco = async (model, consulta, parametro) => {
    await consulta(model, parametro);
};

consultaBanco(Usuario, _findAll);
consultaBanco(Usuario, _findOne, 'Sergio Siqueira'); //OK
consultaBanco(Usuario, _findOne, 'Sergio');  //Error: not found
consultaBanco(Usuario, _findByPk, 1);  //OK
consultaBanco(Usuario, _findByPk, 35);  //Error: not found

consultaBanco(Post, _findAll);