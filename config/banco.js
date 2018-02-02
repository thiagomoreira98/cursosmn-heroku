const pg = require('pg');

module.exports = function () {

    const config = {
        user: process.env.POSTGRES_USER || 'postgres',
        host: process.env.POSTGRES_HOST ||'localhost',
        database: process.env.POSTGRES_DATABASE || 'cursosmn',
        password: process.env.POSTGRES_PASSWORD || '1234',
        port: process.env.POSTGRES_PORT || 5432
    };

    const db = new pg.Client(config);
    
    db.connect().then(function () {
        console.log('connected on database:', config.database);
    }).catch(function (err) {
        console.log(err);
    })

    return db;
}