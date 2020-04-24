<template>
    <div id="create">
        <el-form style="width: 440px" :model="ruleForm" :rules="rules" label-position="left" ref="ruleForms" label-width="100px" class="demo-ruleForms">
            <el-form-item label="社团名" prop="teamName">
                {{ruleForm.teamName}}
            </el-form-item>
            <el-form-item label="名字" prop="names">
                {{ruleForm.names}}
            </el-form-item>
            <el-form-item label="学号" prop="username">
                {{ruleForm.username}}
            </el-form-item>
            <el-form-item label="活动时间" prop="endTime">

                <el-date-picker
                        v-model="selectTime"
                        type="datetimerange"
                        range-separator="至"
                        start-placeholder="开始日期"
                        end-placeholder="结束日期">
                </el-date-picker>
            </el-form-item>
            <el-form-item label="活动主题" prop="activeName">
                <el-input
                        type="textarea"
                        placeholder="请输入内容"
                        v-model="ruleForm.activeName"
                        :autosize="{ minRows: 4, maxRows: 4}"
                        maxlength="30"
                        show-word-limit>

                </el-input>
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
        computed:{
        },
        data() {
            return {
                grade:Number(this.$userInfo().grade),
                rules:{
                    teamName: [{ required: true, message: '请填写社团名', trigger: 'blur' }],
                    names: [{ required: true, message: '请填写学生姓名', trigger: 'blur' }],
                    username: [{ required: true, message: '请填写学号', trigger: 'blur' }],
                    endTime: [{ required: true, message: '请选择完整活动时间', trigger: 'blur' }],
                    annex: [{ required: true, message: '请填写附件', trigger: 'blur' }],
                    activeName:[{ required: true, message: '请填活动主题', trigger: 'blur' }],
                },
                selectTime:''
            }
        },
        methods: {
            success(res){
                this.ruleForm.annex=res
            },
            submit(){
                let that=this
                this.ruleForm.ids=Date.now()
                this.$ver(this.$refs.ruleForms).then(()=>{
                    that.$api.addActive(that.ruleForm,res=>{
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
        watch: {
            selectTime(news){
                console.log(Date.parse(news[0]))
                this.ruleForm.startTime=Date.parse(news[0])
                this.ruleForm.endTime=Date.parse(news[1])
            }
        },
    }
</script>

<style scoped lang='scss'>
    #create {


    }
</style>
