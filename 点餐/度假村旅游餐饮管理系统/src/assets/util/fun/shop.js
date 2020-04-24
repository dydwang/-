import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
function json(data){
    return JSON.parse(data)
}

let store= new Vuex.Store({
    state: {
        shop:json(sessionStorage.getItem('shop_car'))||json(localStorage.getItem('shop_car'))||[]
    },
    mutations: {
        setShop (state, options) {
            if(options==='clear'){
                state.shop.splice(0,state.shop.length)
            }
            else {
                state.shop.splice(0,state.shop.length,...options)
            }
            sessionStorage.setItem('shop_car', JSON.stringify(state.shop))
        }
    }
})
function shop(options=null){
    if(!options) return store.state.shop
    else {
        store.commit('setShop',options)
    }
}
export default shop