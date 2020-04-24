<template>
    <div id="comment">


        <div style="width: 60%;margin-left: 15%;height: 76vh;overflow: auto">
            <div v-for="(item,index) in tableData" :key="index">
                <el-row>
                    <user-image width="1.8rem" height="1.8rem" border-radius="0.9rem" :src="item.userImg" style="float: left"></user-image>
                    <div style="margin-top: 8px;float: left;margin-left: 0.5rem">{{item.user_name}}</div>
                    <div style="margin-top: 8px;float: right;margin-right: 15px">
                        {{$Time(item.ids).getTime()}}
                    </div>
                </el-row>
                <div style="float: bottom;margin: 5px 0 0 2.3rem">
                    问题：{{item.text}}
                </div>
                <div v-if="item.admin" style="margin: 5px 0 0 2.3rem">
                    管理员回复：{{item.admin}}
                </div>
                <el-divider></el-divider>
            </div>
        </div>
        <el-input placeholder="请输入内容" v-model="search"   style="width: 50%;margin-left: 20%">
            <el-button @click="submit" slot="append" type="primary" plain > 发表 </el-button>
        </el-input>
    </div>
</template>

<script>
    export default {
        name: "comment",
        props: [''],
        data() {
            return {
                search:'',
                tableData:[]
            }
        },
        methods: {
            submit(){
                if(this.search){
                    let cnt={
                        ids:Date.now(),
                        userId:this.$userInfo().ids,
                        text:this.search,
                        admin:""
                    }
                    this.$api.addComment(cnt,res=>{
                        this.tableData.unshift(cnt)
                        this.$message.success('发表成功')
                    })
                }else{
                    this.$message.error('输入内容')
                }
            }
        },
        mounted() {
        },
        created() {
            let cnt={
                $link:{
                    table:'user',
                    left:'userId',
                    right:'userId',
                    where:'names as user_name,ids as userId,userImg'
                }
            }
            this.$api.getComment(cnt,res=>{
                this.tableData=res
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #comment {
        width: 100%;
        height: 80vh;
        ::-webkit-scrollbar-track { /* 定义滚动条轨道  内阴影+圆角*/
            -webkit-box-shadow: inset 0 0 6px rgba(255,255,255);
            background-color: #e4e4e4;
        }

        ::-webkit-scrollbar { /*滚动条整体样式*/
            width: 0.1rem;
            background-color: #eee;
            border-radius: 0.42rem;
        }

        ::-webkit-scrollbar-thumb { /*滚动条里面小方块*/
            border-radius: 0.25rem;
            -webkit-box-shadow: inset 0 0 1px #e4e4e4;
            background-color: #909399;
        }
    }
</style>