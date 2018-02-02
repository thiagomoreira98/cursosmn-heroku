const pg = require('pg');

module.exports = function () {

    // const config = {
    //     user: process.env.POSTGRES_USER || 'postgres',
    //     host: process.env.POSTGRES_HOST ||'localhost',
    //     database: process.env.POSTGRES_DATABASE || 'cursosmn',
    //     password: process.env.POSTGRES_PASSWORD || '1234',
    //     port: process.env.POSTGRES_PORT || 5432
    // };

    const config = "postgres://yzhkvehddmpcoa:756a8e937fef6f3fa2b575fa7b2b46aa84ae3d867ff0b4b93dba33ea1b95725d@ec2-54-83-203-198.compute-1.amazonaws.com:5432/dddngcj5q0hlo2";
    
    const db = new pg.Client(config);
    
    db.connect().then(function () {
        console.log('connected on database:', config.database);
    }).catch(function (err) {
        console.log(err);
    })

    return db;
}