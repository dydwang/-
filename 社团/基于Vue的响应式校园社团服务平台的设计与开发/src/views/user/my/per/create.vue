<template>
    <div id="create">
        <el-form style="width: 440px" :model="ruleForm" :rules="rules" label-position="left" ref="ruleForms" label-width="80px" class="demo-ruleForms">
            <el-form-item label="社团名" prop="teamName">
                {{ruleForm.teamName}}
            </el-form-item>
            <el-form-item label="名字" prop="names">
                <el-input v-model="ruleForm.names"></el-input>
            </el-form-item>
            <el-form-item label="学号" prop="username">
                <el-input v-model="ruleForm.username"></el-input>
            </el-form-item>
            <el-form-item label="职位" prop="grade">
                <el-select v-model="ruleForm.grade" placeholder="请选择">
                    <el-option
                            v-for="(item,index) in $team.grade"
                            :key="index"
                            :label="item"
                            :disabled="grade===10?false:grade>(index-1)"
                            :value="index">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="附件" prop="annex">
                <up-file @success="success"></up-file>
            </el-form-item>

            <el-button type="primary" style="width: 450px;margin-left: 50px" @click="submit">提交</el-button>
        </el-form>
    </div>
</template>

<script>
    export default {
        name: "create",
        props: ['updates','ruleForm'],
        data() {
            return {
                grade:Number(this.$userInfo().grade),
                rules:{
                    teamName: [{ required: true, message: '请填写社团名', trigger: 'blur' }],
                    names: [{ required: true, message: '请填写学生姓名', trigger: 'blur' }],
                    username: [{ required: true, message: '请填写学号', trigger: 'blur' }],
                    grade: [{ required: true, message: '请填写级别', trigger: 'blur' }],
                    annex: [{ required: true, message: '请填写附件', trigger: 'blur' }],
                }
            }
        },
        methods: {
            success(res){
                this.ruleForm.annex=res
            },
            submit(){
                let that=this
                this.ruleForm.password=this.ruleForm.username
                this.ruleForm.grade===2?this.ruleForm.status=2:''
                this.$ver(this.$refs.ruleForms).then(()=>{
                    that.$api.addPer(that.ruleForm,res=>{
                        if(res){
                            this.$message.success('提交成功请等待审核')
                            that.$emit('closeD',that.$JSP(that.ruleForm))
                        }else{
                            this.$message.error('此学号已加入过社团')
                        }
                    })

                }).catch(()=>{
                    that.$message.error('请填写完整')
                })
            }
        },
        mounted() {
        },
        created() {
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #create {


    }
</style>
