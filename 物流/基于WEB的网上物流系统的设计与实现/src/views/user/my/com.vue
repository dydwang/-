<template>
    <div id="box">
        <el-card v-show="showC.length>0">
            <div slot="header" class="clearfix">
                <span>评论</span>
            </div>
            <div v-show="!tableData.length">暂无评论</div>
            <el-row v-for="(item,index) in tableData" :key="index"
                    style="border-bottom:1px solid #c0c4cc;margin-bottom: 10px "
            >
                <el-row style="line-height: 30px;margin-top: 5px">
                    <user-image :src="item.userImg" width="2rem" height="2rem" border-radius="1rem" style="float: left;"></user-image>
                    <div style="font-size: 12px;float: left">
                        {{item.userName}}  {{item.address}}  {{item.text}}
                    </div>
                    <div style="font-size: 12px;float: right">
                        {{item.good}}
                        <el-button v-show="!showC[index]" class="el-icon-star-off" type="text" @click="addC(item,index)"></el-button>
                        <el-button v-show="showC[index]" class="el-icon-star-on" type="text" @click="delC(item,index)"></el-button>
                        {{$Time(item.ids).getTime()}}
                    </div>
                </el-row>
            </el-row>
            <div>
                <el-input v-model="form.reply" v-show="form.reply">
                    <template slot="prepend">@</template>
                </el-input>
            </div>
            <el-input
                    v-model="form.text"
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
        props: ['address'],
        data() {
            return {
                tableData:[],
                form:{
                    userId:this.$userInfo().ids,
                    text:'',
                    ids:'',
                    address:'',
                    good:0,

                },
                showC:[]

            }
        },
        methods: {
            delC(item,index){
                this.$api.upComment({ids:item.ids,good:Number(item.good)-1},res=>{
                    if(res) {
                        item.good=Number(item.good)-1
                        this.$api.delcommList({
                            userId:this.$userInfo().ids,
                            commentId:item.ids
                        },r=>{
                            this.showC.splice(index,1,false)
                        })
                    }
                })
            },
            addC(item,index){
              this.$api.upComment({ids:item.ids,good:Number(item.good)+1},res=>{
                  if(res) {
                      item.good=Number(item.good)+1

                      this.$api.addcommList({
                          ids:Date.now(),
                          userId:this.$userInfo().ids,
                          commentId:item.ids
                      },r=>{
                          this.showC.splice(index,1,true)
                      })
                  }
              })
            },
            submit(){
                if(!this.form.text){
                    this.$message.success('请输入完整')
                }else{
                    this.form.address=this.address
                    this.form.ids=Date.now()
                    this.$api.addComment(this.form,res=>{
                        if(res){
                            this.$message.success('发表成功')
                            let c=this.$JSP(this.form)
                            c.userName=this.$userInfo().names
                            c.userImg=this.$userInfo().userImg
                            this.tableData.splice(0,0,c)
                        }
                    })

                }
            },
            getCommList(val,index){
                let cnt= {
                    $where: {
                        userId: this.$userInfo().ids,
                        commentId: val.ids
                    }
                }
                    this.$api.getcommList(cnt,res=>{
                        if(res.length>0){
                            this.showC.splice(index,1,true)
                        }else{
                            this.showC.splice(index,1,false)
                        }
                    })
                }
        },
        mounted() {
        },
        created() {
            let cnt={
                $orderBY: {
                    col:'good',
                    methods:'DESC'
                },
                $link:{
                    table:'user',
                    left:'userId',
                    right:'userId',
                    where:'ids as userId,names as userName,userImg'
                }
            }
            this.$api.getComment(cnt,res=>{
                if(res) {
                    this.tableData=this.$JSP(res)
                    this.showC=res
                    console.log(this.showC)
                    this.$JSP(res).map((val,index)=>{
                        this.getCommList(val,index)
                    })
                }
            })
        },
    }
</script>

<style scoped lang='scss'>
    #box {
        width: 100%;
        margin: 20px auto;
    }
</style>