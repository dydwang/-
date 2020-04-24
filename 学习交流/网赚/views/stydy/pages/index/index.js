//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    motto: 'Hello World',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    array:['美食出行','兼职求职','物品交换','电脑维护','跑腿任务'],
    names:'',
    sorts:'',
    tableData:[],
    imageList:[],
    prices:false,
    news:true,
  },
  toInfo(e){
    let item=this.data.tableData[e.currentTarget.dataset.index]
    let query
    function formData(data){

      for(let i in item){
        query+=i + '=' +item[i]+'&'
      }
      return query.substr(0,query.length-1)

    }
    wx.navigateTo({
       url: './info/info?'+formData(item)
     });

  },

  bindChangeName(e){

    let cnt={
      $where:{
        status:'等待接取'
      },
      $like:{
        names:`%${e.detail.value}%`
      }
    }

    getApp().globalData.$api.get('goods',cnt,res=>{
      this.setData({
        tableData:res
      })
    })
  },
  bindChangeSort(e){
    console.log(this.data[e.detail.value])
    this.setData({
      sorts:this.data.array[e.detail.value]
    })
    this.getBlog()
  },
  news(){
    this.setData({
      news:!this.data.news
    })
    let cnt={
      $where:{
        status:'等待接取'
      },
      $orderBY:{
        col:'ids',
        methods:'desc'
      }
    }

    getApp().globalData.$api.get('goods',cnt,res=>{
      this.setData({
        tableData:res
      })
    })
  },
  prices(){
    this.setData({
      prices:!this.data.prices
    })
    let cnt={
      $where:{
        status:'等待接取'
      },
      $orderBY:{
        col:'money',
        methods:'desc'
      }
    }

    getApp().globalData.$api.get('goods',cnt,res=>{
      this.setData({
        tableData:res
      })
    })
  },
  getBlog(){
    let cnt={
      $where:{
        status:'等待接取'
      }
    }

    getApp().globalData.$api.get('goods',cnt,res=>{
      this.setData({
        tableData:res
      })
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
  onShow: function () {
    wx.navigateTo({
      url:'../my/my'
    })
    this.getBlog()
    this.getImg()
  },
  getImg(){
    getApp().globalData.$api.get('image',{},res=>{
      this.setData({
        imageList:res
      })
    })
  },
  //事件处理函数

  onLoad: function () {
   // wx.setNavigationBarTitle({ title: '任务' })
    wx.navigateTo({
      url:'../my/my'
    })
    //this.getBlog()
  },
  getUserInfo: function(e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  }
})
