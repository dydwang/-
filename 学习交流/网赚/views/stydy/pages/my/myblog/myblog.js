// pages/my/myblog/myblog.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    tableData:[]
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
    toInfo(e){
      console.log(e)
        let item=this.data.tableData[e.currentTarget.dataset.index]
        let query
        function formData(data){

            for(let i in item){
                query+=i + '=' +item[i]+'&'
            }
            return query.substr(0,query.length-1)

        }
        wx.navigateTo({
            url: '../../index/info/info?'+formData(item)
        });

    },
  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
      this.getGoods()
  },
  getGoods(){
    let cnt={
      $where:{
        userId:getApp().globalData.userInfo.ids
      }
    }

    getApp().globalData.$api.get('goods',cnt,res=>{
        this.setData({
          tableData:res
        })
    })
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
