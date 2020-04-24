import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
function json(data){
    return JSON.parse(data)
}

let store= new Vuex.Store({
    state: {
        collect:json(sessionStorage.getItem('collect'))||json(localStorage.getItem('collect'))||{}
    },
    mutations: {
        setCollect (state, options) {
            let userId=Vue.prototype.$userInfo().ids
            let myCollect=state.collect[userId]
            myCollect.splice(0,myCollect.length,...options)
            localStorage.setItem('collect', JSON.stringify(state.collect))
        }
    }
})
function collect(options=null){
    if(!options) return store.state.collect
    else {
        store.commit('setCollect',options)
    }
}
export default collect