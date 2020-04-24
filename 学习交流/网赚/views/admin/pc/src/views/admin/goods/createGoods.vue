<template>
    <div id="box">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="任务标题" prop="names">
                <el-input v-model="ruleForm.names"></el-input>
            </el-form-item>
            <el-form-item label="任务要求" prop="text">
                <el-input v-model="ruleForm.text"  type="textarea"
                          placeholder="请输入内容"
                          maxlength="300"
                          :row="5"
                          show-word-limit></el-input>
            </el-form-item>

            <el-form-item label="任务金币" prop="money">
                <el-input-number v-model="ruleForm.money"  :min="1"  label="描述文字"></el-input-number>
            </el-form-item>
            <el-form-item label="任务图片" prop="image">
                <up-img :auto-upload="true" :src="ruleForm.image" @success="success"></up-img>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')" >立即创建</el-button>
                <el-button @click="$emit('closeDia','')">取消</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    export default {
        name: "createGoods",
        props: ['updates'],
        data() {
            return {
                ruleForm:{},
                rules: {
                    names: [{ required: true, message: '请输入任务标题', trigger: 'blur' }],
                    text: [{ required: true, message: '请输入任务要求', trigger: 'blur' }],
                    image: [{ required: true, message: '请输入任务图片', trigger: 'blur' }],
                },
            }
        },
        methods: {
            submitForm(){
                let that=this
                this.$ver(this.$refs.ruleForm).then(()=>{
                    if(!that.updates){
                        if(!that.ruleForm.ids)that.ruleForm.ids=Date.now();
                        that.ruleForm.status='等待接取'
                        that.$api.addGoods(this.ruleForm,res=>{
                            if(res){
                                that.$message.success('添加成功')
                                that.$emit('closeDia',that.ruleForm)
                            }
                        })
                    }else{
                        that.$api.upGoods(this.ruleForm,res=>{
                            if(res){
                                that.$message.success('修改成功')
                                that.$emit('closeDia',that.ruleForm)
                            }
                        })
                    }

                }).catch(()=>{
                    that.$message.error('请输入完整')
                })
            },
            openDia(form,updates){
                if(updates){
                    this.ruleForm=form
                }else{
                    this.ruleForm={
                        names: '',
                        image:'',
                        text: '',
                    }
                }
                console.log(this.ruleForm)
            },
            success(path){
                this.ruleForm.image=path
            }
        },
        mounted() {
        },
        created() {
        },
        components:{

        }
    }
</script>

<style scoped lang='scss'>
    #box {

    }
</style>
