<template>
    <div id="index">
        <div style="padding: 1rem" :style="{float:screenWidth>660?'left':'',width:screenWidth>660?'300px':'95%'}">
            <el-card style="background-color: #f9f9f9" v-if="$userInfo().username">
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
                    v-show="$userInfo().username"
                    style="width: 100%"

                    default-active="0"
                    class="el-menu-vertical-demo">
                <el-menu-item index="0" @click="$routerGo('/myInfo')">
                    <i class="el-icon-menu"></i>
                    <span slot="title">我的信息</span>
                </el-menu-item>

                <el-menu-item
                        v-show="Number($userInfo().status)===2"
                        v-for="(it,id) in Number($userInfo().grade)!==2?[...stuList,...adminList]:stuList" :key="id" :index="id+''+id" @click="$routerGo(it.path)">
                    <i :class="it.icon"></i>
                    <span slot="title">{{it.name}}</span>
                </el-menu-item>
                <el-menu-item index="2" @click="$userInfo('clear');$routerGo('/my')">
                    <i class="el-icon-delete-solid"></i>
                    <span slot="title">退出登录</span>
                </el-menu-item>
            </el-menu>
        </div>
        <div style="padding:1rem 0;width: auto;overflow: hidden;min-width: 300px">
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
                screenWidth:1000,
                stuList:[
                    {name:'公告信息',path:'/notice',icon:'el-icon-video-camera'},
                    {name:'社团成员',path:'/per',icon:'el-icon-video-camera'},
                    {name:'社团展示',path:'/team',icon:'el-icon-video-camera'},
                ],
                adminList:[
                    {name:'活动申请',path:'/active',icon:'el-icon-video-camera'},
                    {name:'场地预约',path:'/field',icon:'el-icon-video-camera'},
                ],
                status:0
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
            const that = this
            window.onresize = () => {
                return (() => {
                    that.screenWidth= document.body.clientWidth||document.body.offsetWidth
                })()
            }

            if(Number(this.$userInfo().status)!==2){
                this.$message.success('您现在的状态是'+this.$team.status[this.$userInfo().status]+',部分功能无法使用')
            }
        },
        created() {
        },
        computed:{
          userGrade(){
              this.status=Number(this.$userInfo().status)
              return this.$JSP(this.$userInfo)
          }
        },
        components: {},
        watch: {userGrade(){
                this.status=Number(this.$userInfo().status)
            }},
    }
</script>

<style scoped lang='scss'>
    #index {
        width: 100%;
        min-height: 70vh;
        //min-width: 485px;
        margin-bottom: 20px;
    }
</style>