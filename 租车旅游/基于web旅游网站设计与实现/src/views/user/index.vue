<template>
    <div id="index">
        <el-container>
            <el-header height="80px" >
                <div style="width: 148px;height: 80px;float: left">
                    <img src="@/assets/logo.png" width="128px" height="72px" style="margin-top: 3px;">
                </div>
                <div style="width: 12rem;height: 80px;float: left;line-height: 80px;font-weight: 600;color: #303133;font-size: 1.8rem">
                    web旅游网站
                </div>
                <div style="float: left;margin-top: 20px">
                    <search ></search>
                </div>

                <div style="float: right;font-size: 1.2rem;margin-right:2rem">
                    <el-tabs v-model="activeName" @tab-click="handleClickRouter" style="margin-top: 26px">
                        <el-tab-pane label="首页" name="/home"></el-tab-pane>
                        <el-tab-pane label="景区" name="/travel"></el-tab-pane>
                        <el-tab-pane label="酒店" name="/hotel"></el-tab-pane>
                        <el-tab-pane label="公告" name="/news"></el-tab-pane>
                        <el-tab-pane label="个人" name="/my"></el-tab-pane>
                    </el-tabs>
                </div>
            </el-header>
            <el-main>
                <router-view style="min-height: 70vh;overflow: hidden"></router-view>
            </el-main>
            <el-footer height="16rem" >
                <div style="margin: 0 auto;" id="we">
                    <el-row style="border-bottom: 1px solid #606266;padding-bottom: 2rem;margin-bottom: 1rem">
                        <el-col :span="24">
                            <div  class="footHead">
                                联系方式
                            </div>
                            <div style="margin: 0 auto;width: 400px;height: 20px">
                                <li class="lis">Q  Q: 2249038320</li>
                                <li class="lis">邮箱: 2249038320@qq.com</li>
                            </div>
                        </el-col>
                    </el-row>

                    <div style="text-align: center">基于VUE+Element门户网站</div>
                </div>
            </el-footer>
        </el-container>
    </div>
</template>

<script>
    import search from './search'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                activeName:'',
                heights:[800,1600,2400]

            }
        },
        methods: {
            handleClick(){
                this.$routerGo('/home','',call=>{
                    let clickDom=this.heights[this.activeName]/46
                    setTimeout(()=>{
                        let c=0
                        let setI= setInterval(()=>{
                            c+=clickDom
                            document.documentElement.scrollTop =c
                        },4)

                        setTimeout(()=>{
                            window.clearInterval(setI)
                        },200)
                    },0)
                })
            },
            handleClickRouter(){
                this.$routerGo(this.activeName)
            }
        },
        mounted() {
        },
        created() {
        },
        components: {search},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {
        min-width: 90rem;
        .el-header{

        }
        .el-footer{
            padding: 4rem 10rem;
            background-color: #2a2a2a;
            color:#979797;
            .footHead{
                text-align: center;
                margin-bottom: 1rem;
            }
            .lis{
                margin-bottom: 0.3rem;
                margin-right: 10px;
                float: left;
                &:hover{
                    color: #ffffff;

                }
            }
        }
        .el-tabs__item{
            font-size: 1.5rem !important;

        }
        .el-main{
            padding: 0;
            background-color: #ffffff;
        }
    }
</style>
<style  lang='scss'>
    #index {

        .el-tabs__item{
            font-size: 1.5rem !important;

        }
    }
</style>