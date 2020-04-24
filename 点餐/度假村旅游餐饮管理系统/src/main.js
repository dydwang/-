import Vue from 'vue'
import router from './router'
import store from './store'
Vue.config.productionTip = false
import ElementUI from 'element-ui';
import './element-variables.scss'
Vue.use(ElementUI);
import Vant from 'vant';
import 'vant/lib/index.css';
Vue.use(Vant);
import dyd_util from './assets/util/index'
Vue.use(dyd_util)
router.addRoutes(new Vue().__proto__.$dydRouter)
import App from './App.vue'

Vue.prototype.$grade=[
  '人事', '采购员', '点餐员', '厨师', '系统管理员',
]
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
