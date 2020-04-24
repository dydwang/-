/*
 Navicat Premium Data Transfer

 Source Server         : seafood
 Source Server Type    : MongoDB
 Source Server Version : 40006
 Source Host           : localhost:27017
 Source Schema         : test

 Target Server Type    : MongoDB
 Target Server Version : 40006
 File Encoding         : 65001

 Date: 06/04/2020 19:19:25
*/


// ----------------------------
// Collection structure for PayStatus
// ----------------------------
db.getCollection("PayStatus").drop();
db.createCollection("PayStatus");

// ----------------------------
// Documents of PayStatus
// ----------------------------
db.getCollection("PayStatus").insert([ {
    _id: ObjectId("5e64efb946832127d457c6cc"),
    userId: 1583670264897,
    payId: 1583670536214,
    carId: "1583654225356",
    image: "8b6b19a916e6582a60e879cd602de9b0,f26991ffc0b01060e9cab4b7ce5d088e",
    ids: 1583673273777,
    status: "通过"
} ]);
db.getCollection("PayStatus").insert([ {
    _id: ObjectId("5e64ffb60eaaaf431ccb3ef9"),
    userId: "",
    payId: 1583677249109,
    carId: "1583654114533",
    image: "e57122ffac558cc6ba30c9b4b22decb0,d5ef0bef1e70988ea95551e836deb8e1,04cb1d838e1839ff9d1b2fb74895238b",
    ids: 1583677366834,
    status: "通过"
} ]);
db.getCollection("PayStatus").insert([ {
    _id: ObjectId("5e6a0913fa27e66e48b7a016"),
    userId: "",
    payId: 1584007409838,
    carId: "1583654114533",
    image: "a87c7c3d0f0c9dce9617941b09b3a301,bc6b2be18536e6c7655118fec9b73bd2",
    ids: 1584007443337,
    status: "通过"
} ]);

// ----------------------------
// Collection structure for blog
// ----------------------------
db.getCollection("blog").drop();
db.createCollection("blog");

// ----------------------------
// Documents of blog
// ----------------------------
db.getCollection("blog").insert([ {
    _id: ObjectId("5e6a0967cfaa366e5cc31c9f"),
    names: "cccvv",
    pdfFile: {
        status: "success",
        name: "个人博客网站的设计与实现_20200214163552.pdf",
        size: NumberInt("85345"),
        percentage: NumberInt("100"),
        uid: 1584007526475,
        raw: {
            uid: 1584007526475
        },
        response: "89d8f10962b3ed79ec78446a806bc2b6"
    },
    pdfPath: "89d8f10962b3ed79ec78446a806bc2b6",
    ids: 1584007527605
} ]);
db.getCollection("blog").insert([ {
    _id: ObjectId("5e8af94f00fed25c381358e0"),
    names: "vv",
    pdfFile: {
        status: "success",
        name: "个人博客网站的设计与实现_20200214163552.pdf",
        size: NumberInt("85345"),
        percentage: NumberInt("100"),
        uid: 1586166093710,
        raw: {
            uid: 1586166093710
        },
        response: "ea24381f839dfbbb129eab5028869238"
    },
    pdfPath: "ea24381f839dfbbb129eab5028869238",
    ids: 1586166095556
} ]);

// ----------------------------
// Collection structure for car
// ----------------------------
db.getCollection("car").drop();
db.createCollection("car");

// ----------------------------
// Documents of car
// ----------------------------
db.getCollection("car").insert([ {
    _id: ObjectId("5e64a4b569604741ac6ba3f4"),
    names: "奔驰",
    goods: "公共cccc",
    address: "阿坝",
    status: "已租",
    prices: 111.1,
    images: "6754a128a4e6fbd423650c09d432cba5,3a2fd7f1f60fd2c2449c0439b98bfdf6,eb2417c179226e7b3cc61b4f806b1cca,ad5795c1a0f0de75a1b45b4b6b61b649",
    carNum: "123456",
    ids: "1583653860179"
} ]);
db.getCollection("car").insert([ {
    _id: ObjectId("5e64a50369604741ac6ba3f5"),
    names: "好车",
    goods: "水水水水",
    address: "阿坝",
    status: "空闲",
    prices: NumberInt("511"),
    images: "44af9e22be06a4ec9b14bb2925d54c89,e7367a2f52496d28f2015a9fcd802e6d,13d3e125315b365ac794ef67520ba925,ff23aa68db67d93a7ce46b60a0444ff4",
    carNum: "456789",
    ids: "1583654114533"
} ]);
db.getCollection("car").insert([ {
    _id: ObjectId("5e64a52f69604741ac6ba3f6"),
    names: "宝马",
    goods: "好车",
    address: "阿坝",
    status: "已租",
    prices: NumberInt("120"),
    images: "6d41f8c8748926222968a5b60f37a66a,fb5b79902fdc6d0e6acb967c7e3bbfb1,a35bce17a910814afe51d10649c770ab,50f67de2609cdc59d4badea286762754",
    carNum: "4561245",
    ids: "1583654154336"
} ]);
db.getCollection("car").insert([ {
    _id: ObjectId("5e64a57869604741ac6ba3f7"),
    names: "贵阳车辆",
    goods: "123456",
    address: "贵阳",
    status: "已租",
    prices: NumberInt("1213"),
    images: "0ac444243bd558b6e8f5edf1f34ef8bd,046ea233b8dd1efddca58fd22fe74d2b,a1c2294b6578dabfd22c34dc31962c7c,3e4f7b9047b8800996747579aaded9c6",
    carNum: "sdfsd",
    ids: "1583654225356"
} ]);
db.getCollection("car").insert([ {
    _id: ObjectId("5e64a5ab69604741ac6ba3f8"),
    names: "阿贝车辆",
    goods: "123456",
    address: "阿坝",
    status: "空闲",
    prices: NumberInt("7891"),
    images: "01178a28e628a0b2d0817399d79f95c7,d16d9a1bdbbbeb5ec56c82a1c2f77621,248e464ae4fe13e363ccebe2352a50a3,2d454edd48c4b931600a901a9a955f7b",
    carNum: "sdfdsf",
    ids: "1583654275594"
} ]);
db.getCollection("car").insert([ {
    _id: ObjectId("5e64ff90b44bf8535070745d"),
    names: "新城",
    goods: "1234889",
    address: "阿克苏",
    status: "空闲",
    prices: NumberInt("1111"),
    images: "34aef605924e26f620a6a6fda6cbfb43,1527f05da4b94e9e1085a6f2d3a0928f,36a3c0d3b595a5c0d2932625e2d0c257,a16d981e0202b53bb99c5e926243ec19",
    carNum: "12345879",
    ids: "1583677294414"
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
    _id: ObjectId("5e8af90200fed25c381358de"),
    username: "wwwwww123",
    reply: "",
    text: "ceee",
    blogId: "5e64ff90b44bf8535070745d",
    ids: 1586166018787
} ]);
db.getCollection("comment").insert([ {
    _id: ObjectId("5e8af90a00fed25c381358df"),
    blogId: "5e64ff90b44bf8535070745d",
    reply: "",
    text: "wwww",
    username: "管理员",
    ids: 1586166026821
} ]);

// ----------------------------
// Collection structure for dCar
// ----------------------------
db.getCollection("dCar").drop();
db.createCollection("dCar");

// ----------------------------
// Documents of dCar
// ----------------------------
db.getCollection("dCar").insert([ {
    _id: ObjectId("5e44287b1c310626f8a90242"),
    name: "wc",
    phone: "12345678921",
    car: "大客车",
    address: "广州",
    old: "18"
} ]);
db.getCollection("dCar").insert([ {
    _id: ObjectId("5e44f22a91e1561a9c514f1a"),
    name: "王诚",
    phone: "12345687",
    car: "课程",
    address: "贵阳",
    old: "20"
} ]);

// ----------------------------
// Collection structure for pay
// ----------------------------
db.getCollection("pay").drop();
db.createCollection("pay");

// ----------------------------
// Documents of pay
// ----------------------------
db.getCollection("pay").insert([ {
    _id: ObjectId("5e5930b5a5418f43e8dea44f"),
    num: NumberInt("1"),
    names: "宝马",
    prices: NumberInt("200"),
    carId: "1581576259953",
    userId: "",
    payId: 1582903477440
} ]);
db.getCollection("pay").insert([ {
    _id: ObjectId("5e64b442d5452f4d947a9fbc"),
    num: NumberInt("1"),
    names: "奔驰",
    prices: 111.1,
    carId: "1583653860179",
    userId: 1582902712984,
    payId: 1583658050842
} ]);
db.getCollection("pay").insert([ {
    _id: ObjectId("5e64e5089ecf932d64c20664"),
    num: NumberInt("1"),
    names: "贵阳车辆",
    prices: NumberInt("1213"),
    carId: "1583654225356",
    userId: 1583670264897,
    payId: 1583670536214
} ]);
db.getCollection("pay").insert([ {
    _id: ObjectId("5e64ff4100c29631acf031a3"),
    num: NumberInt("1"),
    names: "贵阳车辆",
    prices: NumberInt("1213"),
    carId: "1583654225356",
    userId: "",
    payId: 1583677249108
} ]);
db.getCollection("pay").insert([ {
    _id: ObjectId("5e64ff4100c29631acf031a4"),
    num: NumberInt("3"),
    names: "好车",
    prices: NumberInt("1533"),
    carId: "1583654114533",
    userId: "",
    payId: 1583677249109
} ]);
db.getCollection("pay").insert([ {
    _id: ObjectId("5e6a08f1ab01f966f022cbcd"),
    num: NumberInt("1"),
    names: "好车",
    prices: NumberInt("511"),
    carId: "1583654114533",
    userId: "",
    payId: 1584007409838
} ]);
db.getCollection("pay").insert([ {
    _id: ObjectId("5e77700012a9eb6d20d25ff9"),
    num: NumberInt("1"),
    names: "贵阳车辆",
    prices: NumberInt("1213"),
    carId: "1583654225356",
    userId: 1584885597812,
    payId: 1584885760250
} ]);
db.getCollection("pay").insert([ {
    _id: ObjectId("5e777250b4f5e216e47e2f4b"),
    num: NumberInt("1"),
    names: "宝马",
    prices: NumberInt("120"),
    carId: "1583654154336",
    userId: 1584885597812,
    payId: 1584886352112
} ]);
db.getCollection("pay").insert([ {
    _id: ObjectId("5e777296b4f5e216e47e2f4c"),
    num: NumberInt("1"),
    names: "宝马",
    prices: NumberInt("120"),
    carId: "1583654154336",
    userId: 1584885597812,
    payId: 1584886422558
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
    _id: ObjectId("5e64e3f89ecf932d64c20663"),
    username: "asd",
    password: "asd",
    names: "asd",
    peoName: "wc",
    peoId: "110110110110110",
    ids: 1583670264897,
    userImg: "63c2a16b5eeadc65c42a048c83d6d676"
} ]);
db.getCollection("user").insert([ {
    _id: ObjectId("5e64fef800c29631acf031a2"),
    username: "zxczxc",
    password: "zxczxc",
    names: "zzz",
    peoName: "ww",
    peoId: "11011101110110",
    ids: 1583677176473,
    userImg: "4ddea5ad1ee423f55e1808921fba7e4f"
} ]);
db.getCollection("user").insert([ {
    _id: ObjectId("5e776c9cb4f5e216e47e2f4a"),
    username: "sdf",
    password: "sdf",
    names: "sdf",
    peoName: "",
    peoId: "",
    ids: 1584884892323
} ]);
db.getCollection("user").insert([ {
    _id: ObjectId("5e776f5d12a9eb6d20d25ff8"),
    username: "wwwwww1",
    password: "wwwwww",
    names: "wwwwww",
    peoName: "sdfsd",
    peoId: "sdfdsfsd",
    ids: 1584885597812
} ]);
db.getCollection("user").insert([ {
    _id: ObjectId("5e8ad52957dfb53d1c9902e2"),
    username: "wwwwww123",
    password: "wwwwww",
    names: "wwwwwwwww",
    peoName: "wwwwww",
    peoId: "522425199908022458",
    phone: "18786085146",
    userImg: "",
    ids: 1586156841925
} ]);

// ----------------------------
// Collection structure for users
// ----------------------------
db.getCollection("users").drop();
db.createCollection("users");
db.getCollection("users").createIndex({
    phoneNumber: NumberInt("1")
}, {
    name: "phoneNumber_1",
    background: true,
    unique: true
});

// ----------------------------
// Documents of users
// ----------------------------
