function util(data,path,call){
  wx.request({
    url: path, //上线的话必须是https，没有appId的本地请求貌似不受影响
    method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
    header: {
      'Content-Type': "application/json;charset=UTF-8",
    }, // 设置请求的 header
    data: data,
    success: function (res) {
      call(res.data)
    },
    fail: function (err) {
      call(false)
      console.log(err)
    }
  })
}


export default util;
