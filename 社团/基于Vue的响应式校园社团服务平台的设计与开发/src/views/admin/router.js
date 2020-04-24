
import index from './index'
import login from './login'
import user from './user/index'
import image from './image'
import news from './publishBlog/index'

import annex from './annex/index'
import active from './active/index'
import field from './field/index'
import per from './per/index'
import team from './team/index'
let routes=[
    {
        path:'/admin_index',
        name:'index',
        component:index,
        children:[
            {
                path:'/admin_annex',
                name:'annex',
                component:annex,
            },
            {
                path:'/admin_active',
                name:'active',
                component:active,
            },

            {
                path:'/admin_field',
                name:'field',
                component:field,
            },
            {
                path:'/admin_per',
                name:'per',
                component:per,
            },

            {
                path:'/admin_team',
                name:'team',
                component:team,
            },


            {
                path:'/admin_news',
                name:'news',
                component:news,
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
