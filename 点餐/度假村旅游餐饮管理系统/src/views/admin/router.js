
import index from './index'
import login from './login'

import user from './admin/user/index'
import goods from './admin/goods/index'
import pay from './admin/pay/index'
import sort from './admin/sort/index'
import number from './admin/number'
import image from './image'
import userInfo  from './userInfo'

//采购
import bill from './caiGou/bill'
import purchase from './caiGou/purchase'
import addPurchase from './caiGou/addPurchase'

//厨师
import cook_sort from './cook/sort'
import cook_wait from './cook/wait'
import cook_success from './cook/success'


//点餐
import home from '../order/home'
import order from '../order/order'

let routes=[
    {
        path:'/admin_index',
        name:'index',
        component:index,
        children:[
            {
                path:'/order_home',
                name:'home',
                component:home,
            },
            {
                path:'/order_order',
                name:'order',
                component:order,
            },

            {
                path:'/cook_sort',
                name:'cook_sort',
                component:cook_sort,
            },
            {
                path:'/cook_wait',
                name:'cook_wait',
                component:cook_wait,
            },
            {
                path:'/cook_success',
                name:'cook_success',
                component:cook_success,
            },


            {
                path:'/caiGou_bill',
                name:'bill',
                component:bill,
            },
            {
                path:'/caiGou_purchase',
                name:'purchase',
                component:purchase,
            },
            {
                path:'/caiGou_addPurchase',
                name:'addPurchase',
                component:addPurchase,
            },

            {
                path:'/admin_userInfo',
                name:'admin_userInfo',
                component:userInfo,
            },
            {
                path:'/admin_number',
                name:'number',
                component:number,
            },
            {
                path:'/admin_goods',
                name:'goods',
                component:goods,
            },
            {
                path:'/admin_image',
                name:'image',
                component:image,
            },
            {
                path:'/admin_pay',
                name:'pay',
                component:pay,
            },{
                path:'/admin_sort',
                name:'sort',
                component:sort,
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
