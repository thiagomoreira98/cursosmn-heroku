module.exports = function (app) {

    app.get('/', function(req, res) {
        res.status(200).json({ message: 'Api Online', data: new Date() });
    });
}