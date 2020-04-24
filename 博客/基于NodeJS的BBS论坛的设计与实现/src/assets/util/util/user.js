import {util} from './util.js'
function add(table,data){
    return {
        $table:table,
        $method:'add',
        $insert:data
    }
}

function up(table,data,where={ids:data.ids,id:data.id}){
    return {
        $table:table,
        $method:'up',
        $where:where,
        $set:data
    }
}
function get(table,data){
    return {
        $table:table,
        $method:'get',
        $where:data.$where,
        $link:data.$link,
        $orderBY:data.$orderBY,
        $like:data.$like,
        $or:data.$or,
    }
}

function del(table,data){
    return{
        $table:table,
        $method:'del',
        $where:data,
    }
}
let user={}
let src='users/' //当前接口文件夹

user.mysqlTable=function(data,callback) {
    util(data,src,callback)
}
user.add=function(table,data,callback) {
    util(add(table,data),src,callback)
}
user.get=function(table,data,callback) {
    util(get(table,data),src,callback)
}
user.del=function(table,data,callback) {
    util(del(table,data),src,callback)
}
user.up=function(table,data,callback) {
    util(up(table,data),src,callback)
}


let tableUser='user'
user.login=function(data,callback) {
    util(get(tableUser,data),src,callback)
}
user.addUser=function(data,callback) {
    util(add(tableUser,data),src,callback)
}
user.upUser=function(data,callback) {
    util(up(tableUser,data),src,callback)
}


let tableSort='sort'
user.addSort=function(data,callback) {
    util(add(tableSort,data),src,callback)
}
user.upSort=function(data,callback) {
    util(up(tableSort,data),src,callback)
}
user.getSort=function(data,callback) {
    util(get(tableSort,data),src,callback)
}
user.delSort=function(data,callback) {
    util(del(tableSort,data),src,callback)
}

let tableGood='goods'
user.addGoods=function(data,callback) {
    util(add(tableGood,data),src,callback)
}
user.upGoods=function(data,callback) {
    util(up(tableGood,data),src,callback)
}
user.getGoods=function(data,callback) {
    util(get(tableGood,data),src,callback)
}
user.delGoods=function(data,callback) {
    util(del(tableGood,data),src,callback)
}

let tablepay='pay'
user.addPay=function(data,callback) {
    util(add(tablepay,data),src,callback)
}
user.upPay=function(data,callback) {
    util(up(tablepay,data),src,callback)
}
user.getPay=function(data,callback) {
    util(get(tablepay,data),src,callback)
}
user.delPay=function(data,callback) {
    util(del(tablepay,data),src,callback)
}


let tableComment='comment'
user.addComment=function(data,callback) {
    util(add(tableComment,data),src,callback)
}
user.upComment=function(data,callback) {
    util(up(tableComment,data),src,callback)
}
user.getComment=function(data,callback) {
    util(get(tableComment,data),src,callback)
}
user.delComment=function(data,callback) {
    util(del(tableComment,data),src,callback)
}

let goodList='goodList'
user.addList=function(data,callback) {
    util(add(goodList,data),src,callback)
}
user.upList=function(data,callback) {
    util(up(goodList,data),src,callback)
}
user.getList=function(data,callback) {
    util(get(goodList,data),src,callback)
}
user.delList=function(data,callback) {
    util(del(goodList,data),src,callback)
}


let address='address'
user.addAddress=function(data,callback) {
    util(add(address,data),src,callback)
}
user.upAddress=function(data,callback) {
    util(up(address,data),src,callback)
}
user.getAddress=function(data,callback) {
    util(get(address,data),src,callback)
}
user.delAddress=function(data,callback) {
    util(del(address,data),src,callback)
}

let shopCar='shopCar'
user.addShopCar=function(data,callback) {
    util(add(shopCar,data),src,callback)
}
user.upShopCar=function(data,callback) {
    util(up(shopCar,data),src,callback)
}
user.getShopCar=function(data,callback) {
    util(get(shopCar,data),src,callback)
}
user.delShopCar=function(data,callback) {
    util(del(shopCar,data),src,callback)
}

let image='image'
user.addImage=function(data,callback) {
    util(add(image,data),src,callback)
}
user.getImage=function(data,callback) {
    util(get(image,data),src,callback)
}
user.delImage=function(data,callback) {
    util(del(image,data),src,callback)
}

let joinWe='joinWe'
user.addjoinWe=function(data,callback) {
    util(add(joinWe,data),src,callback)
}
user.getjoinWe=function(data,callback) {
    util(get(joinWe,data),src,callback)
}
user.deljoinWe=function(data,callback) {
    util(del(joinWe,data),src,callback)
}
user.upjoinWe=function(data,callback) {
    util(up(joinWe,data),src,callback)
}

let blog='news'
user.addBlog=function(data,callback) {
    util(add(blog,data),src,callback)
}
user.getBlog=function(data,callback) {
    util(get(blog,data),src,callback)
}
user.delBlog=function(data,callback) {
    util(del(blog,data),src,callback)
}
user.upBlog=function(data,callback) {
    util(up(blog,data),src,callback)
}


let prohibit='prohibit'
user.addProhibit=function(data,callback) {
    util(add(prohibit,data),src,callback)
}
user.getProhibit=function(data,callback) {
    util(get(prohibit,data),src,callback)
}
user.delProhibit=function(data,callback) {
    util(del(prohibit,data),src,callback)
}
user.upProhibit=function(data,callback) {
    util(up(prohibit,data),src,callback)
}


let Article='article'
user.addArticle=function(data,callback) {
    util(add(Article,data),src,callback)
}
user.getArticle=function(data,callback) {
    util(get(Article,data),src,callback)
}
user.delArticle=function(data,callback) {
    util(del(Article,data),src,callback)
}
user.upArticle=function(data,callback) {
    util(up(Article,data),src,callback)
}

let ArticleGood='article_good'
user.addArticleGood=function(data,callback) {
    util(add(ArticleGood,data),src,callback)
}
user.getArticleGood=function(data,callback) {
    util(get(ArticleGood,data),src,callback)
}
user.delArticleGood=function(data,callback) {
    util(del(ArticleGood,data),src,callback)
}
user.upArticleGood=function(data,callback) {
    util(up(ArticleGood,data),src,callback)
}

let ArticleComment='artComment'
user.addArticleComment=function(data,callback) {
    util(add(ArticleComment,data),src,callback)
}
user.getArticleComment=function(data,callback) {
    util(get(ArticleComment,data),src,callback)
}
user.delArticleComment=function(data,callback) {
    util(del(ArticleComment,data),src,callback)
}
user.upArticleComment=function(data,callback) {
    util(up(ArticleComment,data),src,callback)
}


let UserGood='userGood'
user.addUserGood=function(data,callback) {
    util(add(UserGood,data),src,callback)
}
user.getUserGood=function(data,callback) {
    util(get(UserGood,data),src,callback)
}
user.delUserGood=function(data,callback) {
    util(del(UserGood,data),src,callback)
}
user.upUserGood=function(data,callback) {
    util(up(UserGood,data),src,callback)
}

let Active='Active'
user.addActive=function(data,callback) {
    util(add(Active,data),src,callback)
}
user.getActive=function(data,callback) {
    util(get(Active,data),src,callback)
}
user.delActive=function(data,callback) {
    util(del(Active,data),src,callback)
}
user.upActive=function(data,callback) {
    util(up(Active,data),src,callback)
}

let ActiveList='ActiveList'
user.addActiveList=function(data,callback) {
    util(add(ActiveList,data),src,callback)
}
user.getActiveList=function(data,callback) {
    util(get(ActiveList,data),src,callback)
}
user.delActiveList=function(data,callback) {
    util(del(ActiveList,data),src,callback)
}
user.upActiveList=function(data,callback) {
    util(up(ActiveList,data),src,callback)
}


export default user
