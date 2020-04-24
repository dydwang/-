<template>
    <div id="chat">

            <div style="width: 700px;height: 500px;background-color: #ffffff;margin: 0 auto;overflow: auto">
                <div style="text-align: center;background-color: #00B7FF;width: 100%;height: 3rem;line-height: 3rem;font-size: 1.8rem;color: #ffffff;">交流答疑</div>
                <el-row v-for="(item,index) in tableData" :key="index" style="margin-bottom: 1rem">
                    <div v-if="item.peo===''" style="float: right">

                        <user-image style="float: left" width="1.6rem" height="1.6rem" border-radius="0.8rem" :src="$userInfo().userImg"></user-image>
                        <div style="float: left;margin-top: 0.5rem;">{{$Time(item.ids).getTime('M-D h:m:s')}}</div>
                        <div style="width: 100%;background-color: #00B7FF ">{{item.text}}</div>
                    </div>

                    <div v-else style="float: left" @click="stuId=item.stuId;courseId=item.courseId">

                        <user-image style="float: left" width="1.6rem" height="1.6rem" border-radius="0.8rem" src=""></user-image>
                        <div style="float: left;margin-top: 0.5rem;"> {{$Time(item.ids).getTime('M-D h:m:s')}}</div>
                        <div style="width: 100%;background-color: #67c23a ">{{item.text}}</div>
                    </div>
                </el-row>
            </div>
            <div style="width: 700px;margin: 0 auto">
                <el-input v-model="text">
                    <template slot="prepend">
                        <div style="width: 100px;overflow: hidden">
                            @{{stuId}}
                        </div>
                    </template>
                    <el-button slot="append" :disabled="!text||!stuId" @click="submit()" style="color: #ffffff">发表</el-button>
                </el-input>
            </div>
    </div>
</template>

<script>
    export default {
        name: "chat",
        props: [''],
        data() {
            return {
                tableData:[],
                text:'',
                stuId:'',
                courseId:''
            }
        },
        methods: {
            submit(){
                    let cnt={
                        ids:Date.now(),
                        teaId:this.$userInfo().ids,
                        stuId:this.stuId,
                        text:this.text,
                        peo:'',
                        courseId:this.courseId
                    }
                    this.$api.addChat(cnt,res=>{
                        if(res){
                            this.tableData.push(cnt)
                            this.text=''
                        }
                    })
            }
        },
        mounted() {
        },
        created() {
            let cnt={
                $where:{
                    teaId:this.$userInfo().ids,
                }
            }
            this.$api.getChat(cnt,res=>{
                this.tableData=res
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #chat {
        .el-input-group__append button.el-button, .el-input-group__append div.el-select .el-input__inner, .el-input-group__append div.el-select:hover .el-input__inner, .el-input-group__prepend button.el-button, .el-input-group__prepend div.el-select .el-input__inner, .el-input-group__prepend div.el-select:hover .el-input__inner{
            background-color: #3a8ee6;
        }

        ::-webkit-scrollbar-track { /* 定义滚动条轨道  内阴影+圆角*/
            -webkit-box-shadow: inset 0 0 6px rgba(255,255,255);
            background-color: #e4e4e4;
        }

        ::-webkit-scrollbar { /*滚动条整体样式*/
            width: 0.2rem;
            background-color: #e4e4e4;
            border-radius: 0.42rem;
        }

        ::-webkit-scrollbar-thumb { /*滚动条里面小方块*/
            border-radius: 0.25rem;
            -webkit-box-shadow: inset 0 0 1px #e4e4e4;
            background-color: #909399;
        }
    }
</style>