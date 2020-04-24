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
  signUp(){
    wx.navigateTo({
      url:'../signUp/signUp'
    })
  },
  submit(){
    console.log(this.data)
    let cnt={
      $where:{
        username:this.data.username||false,
        password:this.data.password||false

      }
    }
    app.globalData.$api.get('user',cnt,res=>{
      if(res.length>0){
        app.globalData.userInfo = res[0];
        wx.setStorage({
          key: 'userInfo',
          data: JSON.stringify(res[0])
        })
        wx.switchTab({
          url:'../my/my'
        });
      }else{
        wx.showToast({
          title: '密码错误',
          icon: 'none',
          duration: 1000
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
