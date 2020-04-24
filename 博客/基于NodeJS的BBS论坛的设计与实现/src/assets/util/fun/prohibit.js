import {api} from '../util/util'
import Vue from 'vue'
//let getProhibit=api.getProhibit

 (async function () {  //获取关键词数组
    let cnt={}
        api.getProhibit(cnt, async res => {
            if (res) {
                let p = []
                await res.map(val => {
                    p.push(val.names)
                })
                window.prohibitList = p
            }
    })
})()
 function prohibit(text) {
    let arr = window.prohibitList;
    let res =  (text.html||text).replace(new RegExp(arr.join('|'), 'img'), '*');
    // let have=res.split('').some(val=>{
    //     return val==='*'
    // })
    // if(have){
    //     Vue.prototype.$message.error('请勿输入敏感词')
    // }
     return res
}

prohibit.prototype.ver=(rule, value, callback)=>{  //屏蔽关键词的表单验证
    if (!prohibit(value)) {
        callback(new Error('请勿输入敏感词'));
    } else {
        callback();
    }
}
export default prohibit
