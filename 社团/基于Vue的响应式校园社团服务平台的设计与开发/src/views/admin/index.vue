<template>
    <div id="box">
        <admin-menu menuText="企业门户后台系统"  :menuList="menuList" :asideWidth="160" >

            <div slot="menu-ele"><el-button type="danger" @click="backLogins" size="mini" style="position: fixed;right: 30px;top:20px">退出登陆</el-button></div>
            <div slot="main">
                <router-view></router-view>
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
                menuList:menuList,
            }
        },
        methods: {
            backLogins(){
                this.$userInfo('clear')
                this.$router.push('/login')
            }
        },
        mounted() {
            let grade=this.$userInfo().grade||false
            if(grade==='体育类'||grade==='文娱类'||grade==='组织类'){

            }else{
                this.$router.push('/login')
            }
        },
        created() {

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