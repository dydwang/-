//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    motto: 'Hello World',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo')
  },
    Login:function(){
        wx.navigateTo({
            url:'../login/login'
        })
    },
    signOut() {
        this.setData({
            userInfo: false,
        })
        app.globalData.userInfo = false
        wx.removeStorage({
            key: 'userInfo',
        })
    },
  myins:function(){
      if(!getApp().globalData.userInfo){
          wx.showToast({
              title: '请先登陆',
              icon: 'none',
              duration: 1000
          })
      }else{
          wx.navigateTo({
              url:'./myins/myins'
          })
      }
  },
    addBlog:function(){
        if(!getApp().globalData.userInfo){
            wx.showToast({
                title: '请先登陆',
                icon: 'none',
                duration: 1000
            })
        }else{
            wx.navigateTo({
                url:'./addBlog/addBlog'
            })
        }

    },
    myBlog:function(){
        if(!getApp().globalData.userInfo){
            wx.showToast({
                title: '请先登陆',
                icon: 'none',
                duration: 1000
            })
        }else{
            wx.navigateTo({
                url:'./myblog/myblog'
            })
        }

    },
  //事件处理函数
  bindViewTap: function () {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
    onShow(){
        this.setData({
            userInfo: app.globalData.userInfo||wx.getStorageSync('userInfo'),
            hasUserInfo: true
        })
        console.log(app.globalData.userInfo)
        console.log(wx.getStorageSync('userInfo'))
    },
  onLoad: function () {
      this.setData({
          userInfo: app.globalData.userInfo||wx.getStorageSync('userInfo'),
          hasUserInfo: true
      })


  },
  getUserInfo: function (e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  }
})
