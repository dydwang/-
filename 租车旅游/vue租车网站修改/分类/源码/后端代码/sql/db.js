const mysql = require('mysql');
const  link_mysql={
        host: 'localhost',  // 新建数据库连接时的 主机名或ID地址 内容
        user: 'root',
        password: 'root', // root 密码
        database: 'test', // 数据库名
        port: '3306'
}
let pool=mysql.createPool({
    host: link_mysql.host,
    user: link_mysql.user,
    password: link_mysql.password,
    database: link_mysql.database,
    port: link_mysql.port,
    multipleStatements: true    // 多语句查询
});
module.exports= pool