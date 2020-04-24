<template>
    <div id="box">
        <p style="text-align: center;font-size: 24px">{{query.names}}</p>
        <div style="float: right;margin-top: -15px;margin-left: 20px">

            <div style="float: left;margin-top: 15px">{{query.good}} </div>
            <el-button v-if="showS" @click="addGood()" type="text" >
                <van-icon size="20" name="good-job-o" />
            </el-button>

            <el-button v-else @click="deleteGood()" type="text" >
                <van-icon size="20" name="good-job" />
            </el-button>
            <el-button type="text" @click="dialogVisible=true">举报</el-button>
        </div>

        <div style="float: right;font-size: 12px">{{$Time(query.ids).getTime()}}</div>
        <div style="margin-left: 15%;width: 70%;min-height: 10vh" v-html="query.content"></div>
        <dyd-video v-if="query.videoPath" :src="query.videoPath"></dyd-video>
        <dyd-pdf v-if="query.pdfPath" style="width: 70%;margin: 0 auto" :src="$nodeUrl+'getPdf?pdfPath='+query.pdfPath"></dyd-pdf>
        <artComment :blogId="query.ids"></artComment>
        <el-dialog
                title="举报"
                :visible.sync="dialogVisible"
                width="500px">
            <el-input
                    type="textarea"
                    placeholder="请输入举报内容"
                    v-model="text"
                    maxlength="50"
                    show-word-limit
                    :rows="5"
            >

            </el-input>
            <el-button type="primary" style="width: 100%;margin-top: 20px" :disabled="!text" @click="jubao()">举报</el-button>
        </el-dialog>

    </div>
</template>

<script>
    import artComment from './artComment'
    export default {
        name: "info",
        props: [''],
        data() {
            return {
                query:{},
                showS:true,
                text:'',
                dialogVisible:false
            }
        },
        methods: {
            jubao(){
                let cnt={
                    text:this.text,
                    blogId:this.query.ids,
                    names:this.query.names,
                    status:'等待审核',
                    ids:Date.now()
                }
                this.$api.add('jubao',cnt,res=>{
                    this.dialogVisible=false
                    this.text=''
                    this.$message.success('请等待管理员审核')
                })
            },
            addGood(){
                if(this.$userInfo().ids){
                    let cnt={
                        userId:this.$userInfo().ids,
                        ids:Date.now(),
                        articleId:this.query.ids
                    }
                    this.$api.addArticleGood(cnt,res=>{
                        this.showS=false
                    })

                    let c={
                        ids:this.query.ids,
                        good:Number(this.query.good)+1
                    }
                    this.$api.upArticle(c,res=>{
                        this.query.good= Number(this.query.good)+1
                    })

                }else{
                    this.$message.error('请先登陆')
                }
            },
            deleteGood(){
                let cnt={
                    userId:this.$userInfo().ids,
                    articleId:this.query.ids
                }
                this.$api.delArticleGood(cnt,res=>{
                    this.showS=true
                })

                let c={
                    ids:this.query.ids,
                    good:Number(this.query.good)-1
                }
                this.$api.upArticle(c,res=>{
                    this.query.good= Number(this.query.good)-1
                })
            }
        },
        mounted() {
        },
        created() {
            this.query = this.$route.query
            this.$api.getArticleGood({$where:{userId:this.$userInfo().ids}},res=>{
                if(res.length>0){
                    this.showS=false
                }
            })
        },
        components:{
            artComment
        }
    }
</script>

<style scoped lang='scss'>
    #box {
        width: 70%;
        margin-left: 15%;
        margin-bottom: 30px;
    }
</style>
