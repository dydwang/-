<template>
    <div id="box">
        <el-card class="box-card">
            <p style="text-align: center">注册</p>
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px" class="demo-ruleForm">
                <el-form-item label="昵称" prop="names">
                    <el-input v-model="ruleForm.names"></el-input>
                </el-form-item>
                <el-form-item label="手机" prop="phone">
                    <el-input v-model="ruleForm.phone"></el-input>
                </el-form-item>
                <el-form-item label="账号" prop="username">
                    <el-input v-model="ruleForm.username"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input type="password" v-model="ruleForm.password"></el-input>
                </el-form-item>
                <el-form-item label="验证码">
                    <veri ref="veri" :fresh="flag" @makedCode="getMakedCode"></veri>
                    <el-input v-model="ruleForm.veri"></el-input>
                </el-form-item>
            </el-form>
            <div style="width: 100%;margin: 0 auto 30px auto;">
                <el-button type="primary" style="width: 100%;" @click="login">注册</el-button>
            </div>

        </el-card>

    </div>
</template>

<script>
    import veri from './verification'
    export default {
        name: "Login",
        props: [''],
        data() {
            let phone = (rule, value, callback) => {

                let c=value+''
                if(c.length!==11){
                    callback(new Error('手机号为11位'));
                }else{
                    if(isNaN(Number(value))){
                        callback(new Error('手机号为数字'));
                    }else{
                        callback()
                    }
                }
            };
            return {
                flag:true,
                ruleForm: {
                    username: '',
                    password:'',
                    names:'',
                    veri:'',
                    userImg:'',
                    pass:'true',
                    prohibit:'',
                    good:0,
                    phone:''
                },
                rules: {
                    username: [
                        { required: true, message: '请填写账号', trigger: 'blur' },
                        { min: 6, max: 16, message: '长度在 6 到 16 个字符', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, message: '请填写密码', trigger: 'blur' },
                        { min: 6, max: 16, message: '长度在 6 到 16 个字符', trigger: 'blur' }
                    ],
                    names:[
                        { required: true, message: '请填写昵称', trigger: 'blur' }
                    ],
                    phone:[
                        { required: true, message: '请填写手机号', trigger: 'blur' },
                        { validator: phone, trigger: 'blur' }
                    ],
                },
                code:''
            }
        },
        methods: {
            login(){
                let that=this
                if(this.ruleForm.veri!==this.code){
                    this.$message.error('验证码错误')
                    this.$refs.veri.makeCode('1234567890', 4);
                }else{
                    this.$refs.ruleForm.validate((valid) => {
                        if (valid) {
                            delete this.ruleForm.veri;
                            that.$api.login({$where:{$or:[
                                        {username:this.ruleForm.username},
                                        {phone:this.ruleForm.phone},
                                    ]}}, resss => {
                                if(resss.length>0){
                                    this.$message.error('账号或手机已注册')
                                }else{
                                    this.ruleForm.ids=Date.now()
                                    that.$api.addUser(this.ruleForm,res=>{
                                        if(res){
                                            that.$routerGo('/Login')
                                        }else{
                                            that.$message.error('已有此账号')
                                        }
                                    })
                                }
                            })

                        } else {
                            console.log('error submit!!');
                            return false;
                        }
                    });
                }

            },
            getMakedCode(code){
                console.log(code)
                this.code=code
            },
            //更换验证码
            refreshCode() {
                this.flag = !this.flag;
            },
        },
        mounted() {
            this.$refs.veri.makeCode('1234567890', 4);
        },
        created() {

        },
        components:{
            veri
        }
    }
</script>

<style scoped lang='scss'>
    #box {
        width: 400px;
        height: 500px;
        margin: 0 auto;
    }
</style>
