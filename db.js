const Pool = require('pg').Pool;

const pool = new Pool({
    user: "ucmgffbmfio5ip",
    host: "cf9gid2f6uallg.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com",
    database: "d6afqe0he79duk",
    password: "p06ae7e8f0bef01090bc57879c423c10da1d5fa5c9f6851090eebb39ec9e6f9aa",
    port: 5432,
    ssl: { sslmode: 'require', rejectUnauthorized: false }
})

module.exports = pool