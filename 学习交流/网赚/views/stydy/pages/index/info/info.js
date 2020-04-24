// pages/index/info/info.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    options:{},
    text:'',
    comment:[]
  },
  addSuccess(){
    getApp().globalData.$api.up('goods',
        {ids:this.data.options.ids,status:'审核中'},
        res=>{
          wx.showToast({
            title: '提交成功',
            icon: 'none',
            duration: 1000
          })
          wx.navigateBack({})
        })
  },
  addTask(){
    if(!getApp().globalData.userInfo){
      wx.showToast({
        title: '请先登陆',
        icon: 'none',
        duration: 1000
      })
      wx.navigateTo({
        url:'../../login/login'
      })
    }else{

      getApp().globalData.$api.up('goods',
          {userId:getApp().globalData.userInfo.ids,status:'已接取',ids:this.data.options.ids},
          res=>{
            wx.showToast({
              title: '接取成功',
              icon: 'none',
              duration: 1000
            })
            wx.navigateTo({
              url:'../../my/my'
            })
          })
    }

  },
  bindChangeName(e){
    this.setData({
      text:e.detail.value
    })
  },
  getTime(time){
    let that={};
    let type='Y-M-D h:m:s';
    that.date=new Date(parseInt(time));
    that.Y=that.date.getFullYear();
    that.M=that.date.getMonth()+1;
    that.D=that.date.getDate();
    that.h=that.date.getHours();
    that.m=that.date.getMinutes();
    that.s=that.date.getSeconds();
    that.w=that.date.getDay();
    that.timeType={
      'Y': that.Y,
      'M': that.M,
      'D': that.D,
      'h': that.h,
      'm': that.m,
      's': that.s,
      'w': that.w,
    }
    const array=type.split('');
    let times='';
    array.forEach((val,index,arr)=>{
      times+=that.timeType[val]===undefined?val:that.timeType[val]
    })
    return times;
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    options.times=this.getTime(options.ids)
    console.log(options)
    this.setData({
      options:options
    })
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
