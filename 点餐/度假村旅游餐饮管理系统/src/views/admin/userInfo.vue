<template>
    <div id="boxss">
        <div style="width: 400px;margin: 0 auto;height: 400px;background-color: #f9f9f9;padding: 20px ">
            <div style="text-align: center;font-size: 1.6rem">修改个人信息</div>
            <el-form  label-position="left" :model="userInfo" :rules="rules" ref="ruleForm" label-width="120px" class="demo-ruleForm">
                <el-form-item label="工号" prop="username">
                    {{userInfo.username}}
                </el-form-item>
                <el-form-item label="姓名" prop="names">
                    {{userInfo.names}}
                </el-form-item>
                <el-form-item label="职务/权限" prop="names">
                    {{userInfo.grade}}
                </el-form-item>
                <el-form-item label="入职时间" prop="names">
                    {{userInfo.startTime?$Time(userInfo.startTime).getTime():'-'}}
                </el-form-item>

                <el-form-item label="离职时间" prop="names">
                    {{userInfo.endTime?$Time(userInfo.endTime).getTime():'-'}}
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input v-if="userInfo.grade!=='系统管理员'" v-model="userInfo.password"></el-input>
                    <span v-else>{{userInfo.password}}</span>
                </el-form-item>
            </el-form>
            <el-button v-if="userInfo.grade!=='系统管理员'" type="danger" style="width: 100%;margin-top: 30px;margin-bottom: 50px"  @click="update" plain round>修改</el-button>
        </div>
    </div>
</template>

<script>
    export default {
        name: "myInfo",
        props: [''],
        data() {
            return {
                userInfo:this.$JSP(this.$userInfo()),
                rules: {
                    names: [
                        { required: true, message: '请填写昵称', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, message: '请填写密码', trigger: 'blur' }
                    ]
                },
                userImg:'',
                imageUrl:this.$userInfo().userImg?this.$nodeUrl+'file/getImg?imagePath='+this.$userInfo().userImg:''

            }
        },
        methods: {
            update(){
                this.$ver(this.$refs.ruleForm).then(r=>{
                    this.upUser(this.userInfo)
                }).catch(f=>{
                    this.$message.error('请填写完整')
                })
            },
            upUser(cnt){
                delete cnt.phone;
                this.$api.upUser(cnt,res=>{
                    if(res) {
                        this.$message.success('修改成功')

                        this.$userInfo(this.userInfo)
                        console.log(this.userInfo)
                    }
                })
            },
            success(path){
                this.userInfo.userImg=path
                delete this.userInfo.phone;
                this.upUser(this.userInfo)
            }
        },
        mounted() {
        },
        created() {
        },
        computed:{
            userIn(){
                this.userInfo=this.$JSP(this.$userInfo())
                return this.$JSP(this.$userInfo())
            }
        }
    }
</script>

<style scoped lang='scss'>
    #boxss {
        .el-tabs--left .el-tabs__header.is-left{
            width: 100%;
        }

    }
</style>
