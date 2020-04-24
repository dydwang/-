<template>
    <div id="index">
        <el-container>
            <el-header height="80px" >
                <div style="width: 148px;height: 80px;float: left">
                    <img src="@/assets/logo.png" width="128px" height="72px" style="margin-top: 3px;">
                </div>
                <div style="width: 11rem;height: 80px;float: left;line-height: 80px;font-weight: 600;color: #303133;font-size: 1.8rem">
                    BBS论坛
                </div>
                <div style="float: left;margin-top: 20px">
                    <search ></search>
                </div>

                <div style="float: right;font-size: 1.2rem;margin-right:2rem">
                    <el-tabs v-model="activeName" @tab-click="handleClickRouter" style="margin-top: 26px">
                        <el-tab-pane label="网站首页" name="/home"></el-tab-pane>
                        <el-tab-pane label="新闻资讯" name="/news"></el-tab-pane>
                        <el-tab-pane label="个人中心" name="/my"></el-tab-pane>
                    </el-tabs>
                </div>
            </el-header>
            <el-main>
                <rightBox></rightBox>
                <router-view style="min-height: 60vh;overflow: hidden"></router-view>
            </el-main>
            <el-footer height="16rem" >
                <div style="margin: 0 auto;" id="we">
                    <el-row style="border-bottom: 1px solid #606266;padding-bottom: 2rem;margin-bottom: 1rem">
                        <el-col :span="24">
                            <div  class="footHead">
                                联系方式
                            </div>
                            <div style="margin: 0 auto;width: 360px;height: 20px">
                                <li class="lis">Q  Q: 1984205085</li>
                                <li class="lis">地址: 四川大学锦城学院</li>
                            </div>
                        </el-col>
                    </el-row>

                    <div style="text-align: center">基于NodeJS的BBS论坛的设计与实现</div>
                </div>
            </el-footer>
        </el-container>
    </div>
</template>

<script>
    import search from './search'
    import rightBox from './rightBox'
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
            this.$message({
                title: '警告',
                message: '注明使用本系统要文明使用，不可有言语辱骂，影响他人的行为言论等，否则将会收到惩罚',
                type: 'warning',

            });
        },
        components: {search,rightBox},
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
            background-color: #f8fbff;
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
