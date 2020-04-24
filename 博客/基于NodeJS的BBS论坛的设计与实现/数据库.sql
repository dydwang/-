/*
 Navicat Premium Data Transfer

 Source Server         : seafood
 Source Server Type    : MongoDB
 Source Server Version : 40006
 Source Host           : localhost:27017
 Source Schema         : bbs

 Target Server Type    : MongoDB
 Target Server Version : 40006
 File Encoding         : 65001

 Date: 21/04/2020 16:47:12
*/


// ----------------------------
// Collection structure for artComment
// ----------------------------
db.getCollection("artComment").drop();
db.createCollection("artComment");

// ----------------------------
// Documents of artComment
// ----------------------------
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9ea209dc5d1014c022e51e"),
    userId: 1587445863304,
    reply: "",
    text: "ccc",
    blogId: 1587453884897,
    ids: 1587454473435
} ]);
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9ea20cdc5d1014c022e51f"),
    userId: 1587445863304,
    reply: "18786085146",
    text: "cccwwww",
    blogId: 1587453884897,
    ids: 1587454476208
} ]);
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9ea242dc5d1014c022e520"),
    userId: 1587445863304,
    reply: "",
    text: "wwww",
    blogId: 1587453884897,
    ids: 1587454530823
} ]);
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9ea246dc5d1014c022e521"),
    userId: 1587445863304,
    reply: "",
    text: "ccc",
    blogId: 1587453884897,
    ids: 1587454534811
} ]);
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9ea279d9391e30fc78e2ea"),
    userId: 1587445863304,
    reply: "",
    text: "ccc",
    blogId: 1587453884897,
    ids: 1587454585424
} ]);
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9ea282d9391e30fc78e2eb"),
    userId: 1587445863304,
    reply: "",
    text: "www",
    blogId: 1587453884897,
    ids: 1587454594885
} ]);
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9ea295a5bbaf2674de8457"),
    userId: 1587445863304,
    reply: "",
    text: "www",
    blogId: 1587453884897,
    ids: 1587454613887
} ]);
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9ea2fda5bbaf2674de8458"),
    userId: 1587445863304,
    reply: "",
    text: "wwww",
    blogId: 1587453884897,
    ids: 1587454717953
} ]);
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9ea544435cb7326032d2f1"),
    userId: 1587445863304,
    reply: "",
    text: "测试",
    blogId: 1587455096321,
    ids: 1587455300160
} ]);
db.getCollection("artComment").insert([ {
    _id: ObjectId("5e9eaff1b613e620acb66e99"),
    userId: 1587457912356,
    reply: "",
    text: "册俄式",
    blogId: 1587458006607,
    ids: 1587458033061
} ]);

// ----------------------------
// Collection structure for article
// ----------------------------
db.getCollection("article").drop();
db.createCollection("article");

// ----------------------------
// Documents of article
// ----------------------------
db.getCollection("article").insert([ {
    _id: ObjectId("5e9ea478b613e620acb66e94"),
    names: "测试",
    pdfPath: "",
    videoPath: "",
    content: "<p>嗡嗡嗡</p>",
    good: NumberInt("1"),
    userId: 1587445863304,
    sortId: NumberInt("0"),
    status: "屏蔽文章",
    ids: 1587455096321,
    blogId: 1587458414257
} ]);
db.getCollection("article").insert([ {
    _id: ObjectId("5e9eafd6b613e620acb66e97"),
    names: "**为凤尾二为凤尾",
    pdfPath: "c1dc7311e34b7d23c8f142f512aeacfd",
    videoPath: "afa2a5dd2a0f9b420fa6144c594b66bf",
    content: "<p>温热我认为</p>",
    good: NumberInt("1"),
    userId: 1587457912356,
    sortId: NumberInt("0"),
    status: "屏蔽文章",
    ids: 1587458006607
} ]);

// ----------------------------
// Collection structure for article_good
// ----------------------------
db.getCollection("article_good").drop();
db.createCollection("article_good");

// ----------------------------
// Documents of article_good
// ----------------------------
db.getCollection("article_good").insert([ {
    _id: ObjectId("5e9ea5d2b613e620acb66e96"),
    userId: 1587445863304,
    ids: 1587455442923,
    articleId: 1587455096321
} ]);
db.getCollection("article_good").insert([ {
    _id: ObjectId("5e9eafecb613e620acb66e98"),
    userId: 1587457912356,
    ids: 1587458028007,
    articleId: 1587458006607
} ]);

// ----------------------------
// Collection structure for comment
// ----------------------------
db.getCollection("comment").drop();
db.createCollection("comment");

// ----------------------------
// Documents of comment
// ----------------------------
db.getCollection("comment").insert([ {
    _id: ObjectId("5e9eb257a5bbaf2674de845d"),
    phone: 18786085146,
    name: "18786085146",
    text: "wwww",
    ids: 1587458647194
} ]);

// ----------------------------
// Collection structure for image
// ----------------------------
db.getCollection("image").drop();
db.createCollection("image");

// ----------------------------
// Documents of image
// ----------------------------
db.getCollection("image").insert([ {
    _id: ObjectId("5e9e915b5dcbda2c747d851a"),
    ids: 1587450203814,
    image: "e5d25544202c3b182261df357f58c9c9"
} ]);
db.getCollection("image").insert([ {
    _id: ObjectId("5e9eb265b613e620acb66e9c"),
    ids: 1587458661476,
    image: "56407a0a5707607b67d50846e398df9f"
} ]);

// ----------------------------
// Collection structure for jubao
// ----------------------------
db.getCollection("jubao").drop();
db.createCollection("jubao");

// ----------------------------
// Documents of jubao
// ----------------------------
db.getCollection("jubao").insert([ {
    _id: ObjectId("5e9eaace435cb7326032d2f5"),
    text: "册饿成",
    blogId: "1587455096321",
    names: "测试",
    status: "举报不成立",
    ids: 1587456718904
} ]);
db.getCollection("jubao").insert([ {
    _id: ObjectId("5e9eae00435cb7326032d2f6"),
    text: "嗡嗡嗡",
    blogId: "1587455096321",
    names: "测试",
    status: "屏蔽文章",
    ids: 1587457536513
} ]);
db.getCollection("jubao").insert([ {
    _id: ObjectId("5e9eb0d626bea532849540b5"),
    text: "测网速的发",
    blogId: 1587458006607,
    names: "**为凤尾二为凤尾",
    status: "举报不成立",
    ids: 1587458262834
} ]);
db.getCollection("jubao").insert([ {
    _id: ObjectId("5e9eb0e526bea532849540b6"),
    text: "哇哇哇哇",
    blogId: 1587458006607,
    names: "**为凤尾二为凤尾",
    status: "屏蔽文章",
    ids: 1587458277222
} ]);
db.getCollection("jubao").insert([ {
    _id: ObjectId("5e9eb0fd26bea532849540b7"),
    text: "哇哇哇哇",
    blogId: 1587458006607,
    names: "**为凤尾二为凤尾",
    status: "屏蔽文章",
    ids: 1587458301862
} ]);
db.getCollection("jubao").insert([ {
    _id: ObjectId("5e9eb11426bea532849540b8"),
    text: "不行",
    blogId: 1587458006607,
    names: "**为凤尾二为凤尾",
    status: "屏蔽文章",
    ids: 1587458324534
} ]);
db.getCollection("jubao").insert([ {
    _id: ObjectId("5e9eb16e26bea532849540b9"),
    text: "草草草草",
    blogId: 1587458006607,
    names: "**为凤尾二为凤尾",
    status: "屏蔽文章",
    ids: 1587458414257
} ]);
db.getCollection("jubao").insert([ {
    _id: ObjectId("5e9eb1c1a5bbaf2674de845c"),
    text: "急急急",
    blogId: 1587458006607,
    names: "**为凤尾二为凤尾",
    status: "屏蔽文章",
    ids: 1587458497264
} ]);

// ----------------------------
// Collection structure for news
// ----------------------------
db.getCollection("news").drop();
db.createCollection("news");

// ----------------------------
// Documents of news
// ----------------------------
db.getCollection("news").insert([ {
    _id: ObjectId("5e9ea19ddc5d1014c022e51d"),
    names: "ces",
    pdfPath: "3d527a26156d9671ab2ca5745d8a7778",
    videoPath: "73cd3a7cf02f8cb664810ec1156e99ce",
    content: "<p>ss</p>",
    ids: 1587454365784
} ]);
db.getCollection("news").insert([ {
    _id: ObjectId("5e9eb029435cb7326032d2f7"),
    names: "嗡嗡嗡",
    pdfPath: "050dae0e02df0169791815fa9cfe1ed4",
    videoPath: "",
    content: "<p>温热微软</p>",
    ids: 1587458089510
} ]);

// ----------------------------
// Collection structure for prohibit
// ----------------------------
db.getCollection("prohibit").drop();
db.createCollection("prohibit");

// ----------------------------
// Documents of prohibit
// ----------------------------
db.getCollection("prohibit").insert([ {
    _id: ObjectId("5e9e919f5dcbda2c747d851d"),
    names: "cc",
    ids: 1587450271451
} ]);
db.getCollection("prohibit").insert([ {
    _id: ObjectId("5e9e91a45dcbda2c747d851e"),
    names: "吹牛逼",
    ids: 1587450276506
} ]);
db.getCollection("prohibit").insert([ {
    _id: ObjectId("5e9eafb326bea532849540b4"),
    names: "cao",
    ids: 1587457971923
} ]);

// ----------------------------
// Collection structure for user
// ----------------------------
db.getCollection("user").drop();
db.createCollection("user");

// ----------------------------
// Documents of user
// ----------------------------
db.getCollection("user").insert([ {
    _id: ObjectId("5e9e80674aeaa32c88a31158"),
    username: "3010136674@",
    password: "3010136674@",
    names: "18786085146",
    userImg: "1340b9b308204332b70f385729088ec6",
    pass: "false",
    prohibit: 1587536573960,
    good: NumberInt("1"),
    phone: "18786085146",
    ids: 1587445863304
} ]);
db.getCollection("user").insert([ {
    _id: ObjectId("5e9e833a82e83c019c92e7ad"),
    username: "3010136674@",
    password: "123456",
    names: "18786085146",
    userImg: "",
    pass: "true",
    prohibit: 1588754608231,
    good: NumberInt("0"),
    phone: "18786085146",
    ids: 1587446586548
} ]);
db.getCollection("user").insert([ {
    _id: ObjectId("5e9e83b682e83c019c92e7ae"),
    username: "3010136674@..",
    password: "3010136674@",
    names: "18786085146",
    userImg: "",
    pass: "false",
    prohibit: "",
    good: NumberInt("0"),
    phone: "18786085147",
    ids: 1587446710826
} ]);
db.getCollection("user").insert([ {
    _id: ObjectId("5e9eaf7826bea532849540b3"),
    username: " 3010136674@2",
    password: " 3010136674@",
    names: " 3010136674@2",
    userImg: "a7179611f5ec82cc9a8578c3c9d8daf2",
    pass: "true",
    prohibit: 1588754523288,
    good: NumberInt("1"),
    phone: "18786085141",
    ids: 1587457912356
} ]);

// ----------------------------
// Collection structure for userGood
// ----------------------------
db.getCollection("userGood").drop();
db.createCollection("userGood");

// ----------------------------
// Documents of userGood
// ----------------------------
db.getCollection("userGood").insert([ {
    _id: ObjectId("5e9ea5bdb613e620acb66e95"),
    fens: 1587445863304,
    ids: 1587455421715,
    star: 1587445863304
} ]);
