const pg = require('pg');

module.exports = function () {

    // const config = {
    //     user: process.env.POSTGRES_USER || 'postgres',
    //     host: process.env.POSTGRES_HOST ||'localhost',
    //     database: process.env.POSTGRES_DATABASE || 'cursosmn',
    //     password: process.env.POSTGRES_PASSWORD || '1234',
    //     port: process.env.POSTGRES_PORT || 5432
    // };

    const config = "postgres://hnvfbcooydhwjv:7bea90dfa873becc3b68738dab52f6474e93bf8c9b521e12c0e0a6467c7006ee@ec2-54-83-203-198.compute-1.amazonaws.com:5432/denuhc7akdjsgl ";
    
    const db = new pg.Client(config);
    
    db.connect().then(function () {
        console.log('connected on database:', config.database);
    }).catch(function (err) {
        console.log(err);
    })

    return db;
}