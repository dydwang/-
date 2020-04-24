<template>
    <div id="index">
        <div style="width: 300px;float: left;padding: 1rem">
            <el-card style="background-color: #f9f9f9" v-if="$userInfo().ids">
                <div style="width: 120px;height: 120px;margin: 0 auto">
                    <user-image width="120px" height="120px" border-radius="60px" :src="$userInfo().userImg"></user-image>
                </div>
                <p style="text-align: center;font-size: 1.8rem"> {{$userInfo().names}}</p>
                <el-row>
                    <el-col :span="12">
                        关注 {{myStart}}
                    </el-col>
                    <el-col :span="12">
                        粉丝 {{myFens}}
                    </el-col>
                </el-row>
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
                <el-menu-item v-show="$userInfo().ids"
                              v-for="(it,id) in menuList" :key="id" :index="id+''+id"
                              @click="$routerGo(it.path)">
                    <i :class="it.icon"></i>
                    <span slot="title">{{it.name}}</span>
                </el-menu-item>
                <el-menu-item v-show="$userInfo().ids" index="2" @click="$userInfo('clear');$routerGo('/Login')">
                    <i class="el-icon-delete-solid"></i>
                    <span slot="title">退出登录</span>
                </el-menu-item>
                <el-menu-item index="1" @click="adminLogin">
                    <i class="el-icon-s-tools"></i>
                    <span slot="title">管理员登陆</span>
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
                menuList:[
                    {name:'我的信息',path:'/myInfo',icon:'el-icon-menu'},
                    {name:'我的帖子',path:'/publishBlog',icon:'el-icon-menu'},
                    {name:'我的关注',path:'/myFens',icon:'el-icon-menu'},
                ],
                myStart:0,
                myFens:0
            }
        },
        methods: {
            adminLogin(){
                let admins=this.$router.resolve({
                    path:'/admin_login',
                })

                window.open(admins.href, '_blank')
            }
        },
        mounted() {
        },
        created() {
            this.$api.getUserGood({$where:{star:this.$userInfo().ids}},res=>{
                this.myFens=res.length
            })

            this.$api.getUserGood({$where:{fens:this.$userInfo().ids}},res=>{
                this.myStart=res.length
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {
        margin-bottom: 20px;
    }
</style>
