
import index from './index'
import login from './login'

import blog from './blog'
import joinWe from './joinWe'
import comment from './comment'
import user from './user/index'

import image from './image'
import jubao from './jubao'

import prohibit from './prohibit/index'

import news from './publishBlog/index'
let routes=[
    {
        path:'/admin_index',
        name:'index',
        component:index,
        children:[
            {
                path:'/admin_jubao',
                name:'jubao',
                component:jubao,
            },
            {
                path:'/admin_comment',
                name:'comment',
                component:comment,
            },
            {
                path:'/admin_blog',
                name:'blog',
                component:blog,
            },
            {
                path:'/admin_joinWe',
                name:'joinWe',
                component:joinWe,
            },
            {
                path:'/admin_news',
                name:'news',
                component:news,
            },

            {
                path:'/admin_prohibit',
                name:'prohibit',
                component:prohibit,
            },
            {
                path:'/admin_image',
                name:'image',
                component:image,
            },

            {
                path:'/admin_user',
                name:'user',
                component:user,
            },
        ]
    },
    {
        path:'/admin_login',
        name:'login',
        component:login,
    },
]

let ROUTES=routes

export default ROUTES
