const controller = require('../../core/usuario/usuarioController');

module.exports = function (app) {

    app.get('/usuario', controller.selecionar);
    app.post('/usuario', controller.inserir);
    app.get('/usuario/:id', controller.buscar);
    app.put('/usuario/:id', controller.alterar);
    app.delete('/usuario/:id', controller.deletar);
}