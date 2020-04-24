<template>
    <div id="userInfo">
        <div style="height: 120px;width: 100%;margin-bottom: 20px">
            <div style="height: 5rem;width: 5rem;margin: 0 auto">
                <user-image  style="float: left;display: block"
                             :src="user.userImg" width="5rem" height="5rem" border-radius="2.5rem"></user-image>
                {{user.names}}
            </div>
            <div style="float: right">
                {{user.good}}
                <el-button v-if="showS" @click="addGood" type="text" ><van-icon size="20" name="like-o" /></el-button>
                <el-button v-else @click="deleteGood" type="text" ><van-icon color="red" size="20" name="like" /></el-button>
            </div>

        </div>

        <el-card shadow="hover" v-for="(item,index) in tableData" :key="index" style="margin-bottom: 20px">
            <div slot="header" class="clearfix" style="height: 20px">
                <user-image :user-id="item.userId" style="float: left;display: block" :src="$route.query.userImg" width="2rem" height="2rem" border-radius="1rem"></user-image>
                <div style="position: relative;top:5px;float: left">{{item.user_name}}</div>
                <div style="position: relative;top:5px;left:10px;float: left">{{$Time(item.ids).getTime()}}</div>
                <div style="position: relative;top:5px;float: right;">
                    <span>{{item.good}} 赞</span>
                    <!--<el-button  type="text" ><van-icon size="20" name="good-job-o" /></el-button>-->
                </div>
            </div>
            <div :style="{minHeight:item.videoPath?'225px':'no'}" >
                <dyd-video   v-if="item.videoPath" :src="item.videoPath"
                             style="width: 400px;height225px;float: left;margin-right: 30px;display: inline-block;"></dyd-video>
                <div :style="{minHeight:item.videoPath?'225px':'no'}"  style="width: 100%;height: 100%" @click="$routerGo('/artInfo',item)">
                    {{item.names}}
                </div>
            </div>

        </el-card>
    </div>
</template>

<script>
    export default {
        name: "userInfo",
        props: [''],
        data() {
            return {
                userId:'',
                tableData:[],
                user:{},
                showS:true
            }
        },
        methods: {
            addGood(){
                if(this.$userInfo().ids){
                    let cnt={
                        fens:this.$userInfo().ids,
                        ids:Date.now(),
                        star:this.userId
                    }
                    this.$api.addUserGood(cnt,res=>{
                        this.showS=false
                    })

                    let c={
                        ids:this.user.ids,
                        good:Number(this.user.good)+1
                    }
                    this.$api.upUser(c,res=>{
                        this.user.good= Number(this.user.good)+1
                    })

                }else{
                    this.$message.error('请先登陆')
                }
            },
            deleteGood(){
                let cnt={
                    fens:this.$userInfo().ids,
                    star:this.userId
                }
                this.$api.delUserGood(cnt,res=>{
                    this.showS=true
                })

                let c={
                    ids:this.user.ids,
                    good:Number(this.user.good)-1
                }
                this.$api.upArticle(c,res=>{
                    this.user.good= Number(this.user.good)-1
                })
            }
        },
        mounted() {
        },
        created() {
            this.userId=this.$route.query.userId
            this.$api.getArticle({$where:{userId:this.userId},$orderBY:{col:'ids',methods:'DESC'}},res=>{
                if(res) this.tableData=res
            })

            this.$api.login({$where:{ids:this.userId}},res=>{
                if(res.length>0){
                    this.user=res[0]
                }
            })

            this.$api.getUserGood({$where:{fens:this.$userInfo().ids}},res=>{
                if(res.length>0)this.showS=false
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #userInfo {
        width: 70%;
        margin-left: 15%;
    }
</style>
