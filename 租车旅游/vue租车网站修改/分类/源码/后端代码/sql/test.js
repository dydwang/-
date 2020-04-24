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

    update(table,call){
        link((dbo,db)=>{
            let where={
                $set: {
                    names: '宝马',
                    goods: '宝马',
                    address: '宝马',
                    status: '空闲',
                    prices: 200,
                    images: '423481d92bea7dbf0bee847bac2b9fca,c7eec8a62c028e7c537c692a3d139384,57d8311174b77c835e9d0269182f7b9c,21eb4f98a07d017457bfd132263ed411',
                    ids: '1581575754237'

                }
            }
            dbo.collection(table).updateMany( {ids: '1581575754237'}, where, function(err, res) {
                if (err){call(false); throw err;}
                console.log(where);
                console.log(res.result.nModified + " 条文档被更新");
                db.close();
                call(true)
            });
        })
    }
}

new LinkMdb().update('car',call=>{
    console.log(call)
})

module.exports=LinkMdb

