<template>
    <div id="boxss">
        <div style="max-width: 400px;margin: 0 auto;background-color: #f9f9f9;padding: 20px ">
            <div style="text-align: center;font-size: 1.6rem">个人信息</div>
            <!--<div v-if="userInfo.grade!==10" style="width: 122px;height: 122px;margin: 0 auto">-->
                <!--<up-img :auto-upload="true" :src="$userInfo().userImg" @success="success"></up-img>-->
            <!--</div>-->

            <el-form  :model="userInfo" :rules="rules" ref="ruleForm" label-width="60px" class="demo-ruleForm">
                <el-form-item label="社团" prop="team">
                    <div v-if="userInfo.grade===10">
                        <el-select v-model="userInfo.team" placeholder="请选择">
                            <el-option
                                    v-for="(item,index) in $team.list"
                                    :key="index"
                                    :label="item"
                                    :value="index">
                            </el-option>
                        </el-select>
                    </div>
                    <div v-else>
                        {{$team.list[userInfo.team]}}
                    </div>
                </el-form-item>
                <el-form-item label="学号" prop="">
                    {{userInfo.username}}
                </el-form-item>
                <el-form-item label="姓名" prop="">
                    {{userInfo.names}}
                </el-form-item>
                <el-form-item label="职称" prop="">
                    {{userInfo.grade===10?'默认社团社长':$team.grade[userInfo.grade]}}
                </el-form-item>
                <el-form-item label="状态" prop="">
                    {{$team.status[userInfo.status]}}
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input v-model="userInfo.password"></el-input>
                </el-form-item>
            </el-form>
            <el-button type="danger" v-if="userInfo.grade!==10" style="width: 100%;margin-top: 30px;margin-bottom: 50px"  @click="update" plain round>修改</el-button>
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
                let c={
                    $set:{
                        password:cnt.password
                    },
                    $where:{
                        username:cnt.username
                    }
                }
                this.$api.upPer(c,res=>{
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
            },
            teams(){
                return this.userInfo.team
            }
        },
        watch:{
            teams(news){
                this.$userInfo({team:news})
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
