<template>
    <div id="art">
        <el-card style="width: 100%">
            <div slot="header" class="clearfix">
                <span>评论</span>
            </div>
            <div v-show="!tableData.length">暂无评论</div>
            <el-row v-for="(item,index) in tableData" :key="index"
                    style="border-bottom:1px solid #c0c4cc;margin-bottom: 10px ">
                <el-row style="line-height: 30px;margin-top: 5px">
                    <el-avatar :size="20" @error="true" style="float: left">
                        <user-image :user-in="{userId:item.userId,userImg:item.userImg}" width="20px" height="20px" border-radius="10px"  :src="item.userImg"></user-image>
                    </el-avatar>
                    <div style="font-size: 18px;float: left">
                        {{item.userName}}
                    </div>
                    <div style="font-size: 12px;float: right">
                        {{$Time(item.ids).getTime()}}
                    </div>
                </el-row>
                <el-row style="margin-top: 10px">
                    <el-col :span="18">
                        <span v-show="item.reply">
                            @{{item.reply}}:
                        </span>
                        {{item.text}}
                    </el-col>
                    <el-col :span="6">
                        <el-button type="text" style="float: right" @click="form.reply=item.userName">
                            回复
                        </el-button>
                    </el-col>
                </el-row>
            </el-row>
            <div>
                <el-input v-model="form.reply" v-show="form.reply" clearable>
                    <template slot="prepend">@</template>
                </el-input>
            </div>
            <el-input
                    v-model="form.text"
                    @change="prohibit"
                    maxlength="200"
                    show-word-limit
                    type="textarea"
                    :rows="10">
                <template>Http://</template>
            </el-input>
            <el-button
                    @click="submit"
                    type="primary"
                    style="float: right;width: 100px;margin-top: 10px">
                发表
            </el-button>
        </el-card>

    </div>
</template>

<script>
    export default {
        name: "comment",
        props: ['blogId'],
        data() {
            return {
                tableData:[],
                form:{
                    userId:this.$userInfo().ids,
                    reply:'',
                    text:'',
                    blogId:'',
                    ids:''
                },
                pro:true
            }
        },
        methods: {
            prohibit(){
                this.pro=this.$prohibit(this.form.text)
            },
            submit(){
                if(this.pro){
                    if(!this.form.text ||!this.$userInfo().ids){
                        this.$message.error('请输入完整或先登陆')
                    }else{
                        let form=this.$JSP(this.form)
                        form.blogId=this.blogId
                        form.ids=Date.now()
                        this.$api.addArticleComment(form,res=>{
                            if(res){
                                form.userName=this.$userInfo().names
                                form.userImg=this.$userInfo().userImg
                                this.$message.success('发表成功')
                                this.tableData.splice(0,0,JSON.parse(JSON.stringify(form)))
                                this.form.text=''
                            }
                        })

                    }
                }else{
                    this.$message.error('请勿输入屏蔽词')
                }

            }
        },
        mounted() {
        },
        created() {
            let cnt={
                $where:{
                    blogId:this.blogId
                },
            }
            this.$api.getArticleComment(cnt,res=>{
                if(res) this.tableData=res.reverse()
                res.forEach((val,id) =>{
                    this.$api.get('user',
                        {
                            $where:{
                                ids:val.userId}
                        },
                        r=>{
                            this.tableData.splice(id,1,Object.assign(this.tableData[id],
                                {userImg:r[0].userImg,user_name:r[0].names,userName:r[0].ids}
                            ))
                        })
                })
            })
        },
    }
</script>

<style scoped lang='scss'>
    #art {
        width: 100%;
        margin: 20px auto;
    }
</style>
