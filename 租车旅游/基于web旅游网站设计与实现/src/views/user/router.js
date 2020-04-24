import home from './home/index'

import index from './index'
import my from './my/index'
import myInfo from './my/myInfo'
import myPay from './my/pay'
import myComment from './my/comment'


const Login  = ()=>import('./login/Login')
const signUp  = ()=>import('./login/signUp')
import news from './news/news'
import newsInfo from './news/newsInfo'

import travel from './travel/index'
import travel_info from './travel/info'
import hotel from './hotel/index'

import paySuccess from './paySuccess'
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
                         path:'/myInfo',
                         name:'myInfo',
                         component:myInfo
                     },

                     {
                         path:'/myPay',
                         name:'myPay',
                         component:myPay
                     },
                     {
                         path:'/myComment',
                         name:'myComment',
                         component:myComment
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
                 path:'/paySuccess',
                 name:'paySuccess',
                 component:paySuccess
             },
             {
                 path:'/travel_info',
                 name:'travel_info',
                 component:travel_info
             },
             {
                 path:'/newsInfo',
                 name:'newsInfo',
                 component:newsInfo
             },
             {
                 path:'/travel',
                 name:'travel',
                 component:travel
             },
             {
                 path:'/hotel',
                 name:'hotel',
                 component:hotel
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
         ]
     },

]
export default router