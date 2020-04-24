import home from './home/index'
import joinWe from './home/joinWe'
import index from './index'
import my from './my/index'
import myInfo from './my/myInfo'
const Login  = ()=>import('./login/Login')
const signUp  = ()=>import('./login/signUp')
import news from './news/news'
import newsInfo from './news/newsInfo'

import teaCourse from './my/tea/course'
import tea_test from './my/tea/test'
import tea_work from './my/tea/work'
import tea_workInfo from './my/tea/work_info'
import tea_chat from './my/tea/chat'

import stuCourse from './my/stu/course'
import stu_test from './my/stu/test'
import stu_work from './my/stu/work'
import stu_chat from './my/stu/chat'
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
                         path:'/stu_chat',
                         name:'stu_chat',
                         component:stu_chat
                     },
                     {
                         path:'/stu-test',
                         name:'stu_test',
                         component:stu_test
                     },
                     {
                         path:'/stu-work',
                         name:'stu_work',
                         component:stu_work
                     },

                     {
                         path:'/tea_chat',
                         name:'tea_chat',
                         component:tea_chat
                     },
                     {
                         path:'/tea_workInfo',
                         name:'tea_workInfo',
                         component:tea_workInfo
                     },
                     {
                         path:'/tea-test',
                         name:'tea_test',
                         component:tea_test
                     },
                     {
                         path:'/tea-work',
                         name:'tea_work',
                         component:tea_work
                     },
                     {
                         path:'/tea-course',
                         name:'teaCourse',
                         component:teaCourse
                     },
                     {
                         path:'/stu-course',
                         name:'course',
                         component:stuCourse
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