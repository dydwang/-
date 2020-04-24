import Vue from 'vue'
import router from './router'
import store from './store'
Vue.config.productionTip = false
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);
import dyd_util from './assets/util/index'
Vue.use(dyd_util)
router.addRoutes(new Vue().__proto__.$dydRouter)
import App from './App.vue'
import team from '@/assets/team'
Vue.prototype.$team=team


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
