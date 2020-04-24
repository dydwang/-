<template>
    <div id="index">
        <div style="width: 300px;float: left;padding: 1rem">
            <el-card style="background-color: #f9f9f9" v-if="$userInfo().ids">
                <div style="width: 120px;height: 120px;margin: 0 auto">
                    <user-image width="120px" height="120px" border-radius="60px" :src="$userInfo().userImg"></user-image>
                </div>
                <p style="text-align: center;font-size: 1.8rem"> {{$userInfo().names}}</p>
            </el-card>
            <el-card style="background-color: #f9f9f9" v-else>
                <div @click="$routerGo('/Login')">
                    <div style="width: 120px;height: 120px;margin: 0 auto">
                        <user-image width="120px" height="120px" border-radius="60px" src=""></user-image>
                    </div>
                    <p style="text-align: center;font-size: 1.8rem"> 登录/注册</p>
                </div>
            </el-card>
            <el-menu
                    default-active="0"
                    class="el-menu-vertical-demo"
            >

                <el-menu-item index="0" @click="$routerGo('/myInfo')">
                    <i class="el-icon-video-camera"></i>
                    <span slot="title">我的信息</span>
                </el-menu-item>
                <el-menu-item v-show="$userInfo().ids"  v-for="(it,id) in getMenuList()" :key="id" :index="id+''+id" @click="$routerGo(it.path)">
                    <i :class="it.icon"></i>
                    <span slot="title">{{it.name}}</span>
                </el-menu-item>
                <el-menu-item index="1" @click="adminLogin">
                    <i class="el-icon-s-tools"></i>
                    <span slot="title">管理员登陆</span>
                </el-menu-item>
                <el-menu-item v-show="$userInfo().ids" index="2" @click="$userInfo('clear')">
                    <i class="el-icon-delete-solid"></i>
                    <span slot="title">退出登录</span>
                </el-menu-item>
            </el-menu>
        </div>
        <div style="padding: 1rem;width: auto;overflow: hidden">
            <div style="width: 100%;">
                <router-view></router-view>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                menuList:[],
                stuList:[
                    {name:'我的课程',path:'/stu-course',icon:'el-icon-video-camera'},
                    {name:'我的作业',path:'/stu-work',icon:'el-icon-video-camera'},
                    {name:'我的测试',path:'/stu-test',icon:'el-icon-video-camera'},
                ],
                teaList:[
                    {name:'课程管理',path:'/tea-course',icon:'el-icon-video-camera'},
                    {name:'作业管理',path:'/tea-work',icon:'el-icon-video-camera'},
                    {name:'测试管理',path:'/tea-test',icon:'el-icon-video-camera'},
                    {name:'交流答疑',path:'/tea_chat',icon:'el-icon-video-camera'},
                ]
            }
        },
        methods: {
            getMenuList(){
                if(this.$userInfo().grade==='教师'){
                    return this.teaList
                }else{
                    return this.stuList
                }

            },
            adminLogin(){
                let admins=this.$router.resolve({
                    path:'/admin_login',
                })

                window.open(admins.href, '_blank')
            }
        },
        computed:{
          user(){
              return JSON.stringify(this.$userInfo().ids)
          }
        },
        mounted() {
        },
        created() {
        },
        components: {},
        watch: {
            user(){
                if(!this.$userInfo().ids){
                    this.$routerGo('/login')
                }
            },
            $route(){
                if(this.$route.fullPath!=='/signUp'){
                    if(!this.$userInfo().ids){
                        this.$routerGo('/login')
                    }
                }

            }
        },
    }
</script>

<style scoped lang='scss'>
    #index {
        margin-bottom: 20px;
    }
</style>