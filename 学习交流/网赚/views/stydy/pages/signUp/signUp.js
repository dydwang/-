// pages/login/login.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    username:'',
    password:'',
    names:''
  },
  bindChangenames(e){
    this.setData({
      names:e.detail.value
    })
  },
  bindChangeName:function(e){
    console.log(e.detail.value)
    this.setData({
      username:e.detail.value
    })
  },
  bindChangePass:function(e){
    this.setData({
      password:e.detail.value
    })
  },
  login(){
    wx.navigateTo({
      url:'../login/login'
    })
  },
  submit(){
    console.log(this.data)
    let cnt={
        username:this.data.username||false,
        password:this.data.password||false,
      names:this.data.names||'游客',
      ids:Date.now(),
        money:0,
    }
    app.globalData.$api.get('user',{$where:{username:cnt.username}},r=>{
        if(r.length>0){
          wx.showToast({
            title: '此账号已注册',
            icon: 'none',
            duration: 1000
          })
        }else{
          app.globalData.$api.add('user',cnt,res=>{
            if(res){
              wx.showToast({
                title: '注册成功',
                icon: 'none',
                duration: 1000
              })
              wx.navigateTo({
                url:'../login/login'
              })
            }
          })
        }
  })

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})
