<template>
    <div id="create">
        <el-form style="width: 440px" :model="ruleForm" :rules="rules" label-position="left" ref="ruleForms" label-width="80px" class="demo-ruleForms">
            <el-form-item label="社团名" prop="teamName">{{ruleForm.teamName}}</el-form-item>
            <el-form-item label="标题" prop="title">
                <el-input v-model="ruleForm.title"></el-input>
            </el-form-item>
            <el-form-item label="描述" prop="text">
                <el-input v-model="ruleForm.text"></el-input>
            </el-form-item>
            <el-form-item label="模块" prop="module">
                <el-select v-model="ruleForm.module" placeholder="请选择">
                    <el-option
                            v-for="(item,index) in $team.module"
                            :key="index"
                            :label="item"
                            :value="index">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="附件" prop="annex">
                <up_image v-if="ruleForm.module===2" @success="success"></up_image>
                <up-video v-else-if="ruleForm.module===1" @success="success"></up-video>
                <up_file v-else @success="success"></up_file>

            </el-form-item>

            <el-button type="primary" style="width: 450px;margin-left: 50px" @click="submit">提交</el-button>
        </el-form>
    </div>
</template>

<script>
    import up_file from './upFile'
    import up_image from './up_image'
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
                    title:[{ required: true, message: '请填写标题', trigger: 'blur' }],
                    module:[{ required: true, message: '请填写模块', trigger: 'blur' }],
                    text:[{ required: true, message: '请填写描述', trigger: 'blur' }],
                },
                imageList:[]
            }
        },
        methods: {
            success(res){
                this.ruleForm.annex=res
                if(this.ruleForm.module===2){
                    this.imageList.push(res)
                }
            },
            submit(){
                let that=this
                if(this.ruleForm.module===2){
                    this.ruleForm.annex=this.imageList.toString()
                }
                this.ruleForm.ids=Date.now()
                this.$ver(this.$refs.ruleForms).then(()=>{
                    that.$api.addShow(that.ruleForm,res=>{
                        that.$emit('closeD',that.$JSP(that.ruleForm))
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
        components: {up_file,up_image},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #create {


    }
</style>
