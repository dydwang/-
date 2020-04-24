import Vue from 'vue'
import VueRouter from 'vue-router'

import admin from '../views/admin/router'
Vue.use(VueRouter)

const routes = [
  {
    path:'/',
    redirect:'/admin_login'
  },
  ...admin,
]

const router = new VueRouter({
  routes
})

export default router
