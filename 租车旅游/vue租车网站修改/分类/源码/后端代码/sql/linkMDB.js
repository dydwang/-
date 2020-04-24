var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

function link(callback){
    MongoClient.connect(url, { useNewUrlParser: true }, function(err, db) {
        if (err) throw err;
        const dbo = db.db("test");
        callback(dbo,db)
    });
}

class LinkMdb{
    constructor(){

    }
    get(table,data,call){
        link((dbo,db)=>{
            dbo.collection(table).find(data).toArray(function(err, result) {
                if (err) {call(false); throw err;}
                console.log("文档获取成功");
                db.close();
                call(result)
            });
        })
    }

    add(table,data,call){
        link((dbo,db)=>{
            dbo.collection(table).insertOne(data, function(err, res) {
                if (err) {call(false); throw err;}
                console.log("文档插入成功");
                db.close();
                call(true)
            });
        })
    }

    del(table,data,call){
        link((dbo,db)=>{
            dbo.collection(table).deleteOne(data, function(err, obj) {
                if (err) {call(false); throw err;}
                console.log("文档删除成功");
                db.close();
                call(true)
            });
        })
    }

    update(table,where,data,call){
        link((dbo,db)=>{
            dbo.collection(table).updateMany(where, data, function(err, res) {
                if (err){call(false); throw err;}
                console.log(where);console.log(data);

                console.log(res.result.nModified + " 条文档被更新");
                db.close();
                call(true)
            });
        })
    }

    lookup(){

    }
}

module.exports=LinkMdb

