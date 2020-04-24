<template>
    <div id="box">
        <!--header-background="#95C7BC" aside-background="#95C7BC"  headerColor="#333" :menuType="menuType" -->
        <admin-menu   menuText="度假村旅游餐饮系统"  :menuList="menuList" :asideWidth="160" >

            <div slot="menu-ele">
                <span style="font-size: 14px">
                    {{$userInfo().grade}}
                </span>

                <el-dropdown   style="position: fixed;right: 30px;top:0;z-index: 1000">
                      <span class="el-dropdown-link" style="color: #ffffff">
                        {{$userInfo().names}}<i class="el-icon-arrow-down el-icon--right"></i>
                      </span>
                    <el-dropdown-menu slot="dropdown">

                        <el-dropdown-item >
                            <el-button type="text" @click="$routerGo('/admin_userInfo')">个人中心</el-button>
                        </el-dropdown-item>
                        <el-dropdown-item >

                            <el-button type="text" @click="backLogins">退出登陆</el-button>
                        </el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>


                <!--<el-button type="danger" @click="backLogins" size="mini" style="position: fixed;right: 30px;top:20px">退出登陆</el-button>-->
            </div>
            <div slot="main" >
                <router-view ></router-view>
            </div>
        </admin-menu>
    </div>
</template>

<script>
    import menuList from './menu.js'
    import adminMenu from './menu.vue'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                menuList:[],
                menuType:{
                    textColor:'#333',  //字体颜色
                    activeTextColor:'#ffffff', //选中字体颜色
                }
            }
        },
        methods: {
            backLogins(){
                this.$userInfo('clear')
                sessionStorage.setItem('adminInfo', '')
                this.$router.push('/admin_login')
            }
        },
        mounted() {
        },
        created() {
            let adminInfo=this.$userInfo().grade
            this.menuList=this.$JSP(menuList[adminInfo])
            this.menuList.unshift(...menuList.publicPath)
            console.log(adminInfo)
        },
        components:{
            adminMenu
        }
    }
</script>

<style scoped lang='scss'>
    #box {

    }
</style>