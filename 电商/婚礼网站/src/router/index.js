import Vue from 'vue'
import VueRouter from 'vue-router'

import user from '../views/user/router'

Vue.use(VueRouter)

const routes = [
  {
    path:'/',
    redirect:'/home'
  },
  ...user,

]

const router = new VueRouter({
  routes
})

export default router
