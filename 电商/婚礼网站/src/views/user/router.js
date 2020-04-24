import home from './home/index'
import joinWe from './home/joinWe'
import index from './index'
import my from './my/index'
import myInfo from './my/myInfo'
import my_wedding from './my/wedding/index'
const Login  = ()=>import('./login/Login')
const signUp  = ()=>import('./login/signUp')

import car from './car/index'
import clothing from './clothing/index'
import wedding from './wedding/index'
import video from './video/index'
import newsInfo from './video/newsInfo'
import publishVideo from './my/publishBlog/index'
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
                         path:'/my_wedding',
                         name:'my_wedding',
                         component:my_wedding
                     },
                     {
                         path:'/publishVideo',
                         name:'publishVideo',
                         component:publishVideo
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
                     {
                         path:'/joinWe',
                         name:'joinWe',
                         component:joinWe
                     },
                 ]
             },
             {
                 path:'/car',
                 name:'喜车',
                 component:car
             },
             {
                 path:'/video',
                 name:'影视',
                 component:video
             },
             {
                 path:'/newsInfo',
                 name:'影视详情',
                 component:newsInfo
             },
             {
                 path:'/clothing',
                 name:'服装',
                 component:clothing
             },
             {
                 path:'/wedding',
                 name:'推荐婚礼',
                 component:wedding
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