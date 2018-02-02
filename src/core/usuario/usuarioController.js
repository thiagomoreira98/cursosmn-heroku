const repositorio = require('./usuarioRepository');

module.exports = {
    selecionar,
    buscar,
    inserir,
    alterar,
    deletar,
}

function selecionar(req, res) {
    repositorio.selecionar(req.query, function (err, data) {
        if (err) {
            return res.status(500).json(err);
        }

        res.status(200).json(data);
    });
}

function buscar(req, res) {
    repositorio.buscar(req.params.id, function (err, data) {
        if (err) {
            return res.status(500).json(err);
        }

        res.status(200).json(data);
    });
}

function inserir(req, res) {
    repositorio.inserir(req.body, function (err, data) {
        if (err) {
            return res.status(500).json(err);
        }

        res.status(200).json({ message: 'Inserido com Suceso.' });
    });
}

function alterar(req, res) {
    repositorio.alterar(req.params.id, req.body, function (err, data) {
        if (err) {
            return res.status(500).json(err);
        }

        res.status(200).json({ message: 'Alterado com Suceso.' });
    });
}

function deletar(req, res) {
    repositorio.deletar(req.params.id, (err, data) => {
        if (err) {
            return res.status(500).json(err);
        }

        res.status(200).json({ message: 'Removido com Suceso.' });    
    });
}