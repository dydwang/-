import home from './home/index'
import index from './index'
import my from './my/index'
import myInfo from './my/myInfo'

const Login  = ()=>import('./login/Login')
const signUp  = ()=>import('./login/signUp')


import forget from './login/forget'
import news from './news/news'
import newsInfo from './news/newsInfo'

import publishBlog from './my/publishBlog/index'
import joinWe from './home/joinWe'
import artInfo from './home/artInfo'

import userInfo from './userInfo/userInfo'

import fens from './my/fens'


 let router=[
     {
         path:'/index',
         name:'index',
         component:index,
         children:[
             {
                 path:'/my',
                 name:'my',
                 component:my,
                 children:[
                     {
                         path:'/forget',
                         name:'forget',
                         component:forget,
                     },
                     {
                         path:'/myFens',
                         name:'fens',
                         component:fens,
                     },

                     {
                         path:'/publishBlog',
                         name:'publishBlog',
                         component:publishBlog
                     },
                     {
                         path:'/myInfo',
                         name:'myInfo',
                         component:myInfo
                     },
                     {
                         path:'/Login',
                         name:'Login',
                         component:Login
                     },
                     {
                         path:'/signUp',
                         name:'signUp',
                         component:signUp
                     },
                 ]
             },
             {
                 path:'/userInfo',
                 name:'userInfo',
                 component:userInfo,
             },
             {
                 path:'/artInfo',
                 name:'artInfo',
                 component:artInfo,
             },
             {
                 path:'/newsInfo',
                 name:'newsInfo',
                 component:newsInfo
             },
             {
                 path:'/news',
                 name:'news',
                 component:news
             },
             {
                 path:'/home',
                 name:'home',
                 component:home
             },
             {
                 path:'/joinWe',
                 name:'joinWe',
                 component:joinWe
             },
         ]
     },

]
export default router
