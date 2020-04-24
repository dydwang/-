<template>
    <div id="box">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="菜品名称" prop="names">
                <el-input v-model="ruleForm.names"></el-input>
            </el-form-item>
            <el-form-item label="属于种类" prop="sortId">
                <el-select v-model="ruleForm.sortId" placeholder="请选择">
                    <el-option
                            v-for="item in sortData"
                            :key="item.ids"
                            :label="item.names"
                            :value="item.ids">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="菜品介绍" prop="text">
                <el-input v-model="ruleForm.text"></el-input>
            </el-form-item>
            <el-form-item label="菜品价格" prop="text">
                <el-input-number v-model="ruleForm.price"  :min="0.1" :max="10000" label="菜品价格"></el-input-number>
            </el-form-item>
            <el-form-item label="菜品图片" prop="image">
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
                    names: [{ required: true, message: '请输入菜品名称', trigger: 'blur' }],
                    text: [{ required: true, message: '请输入菜品介绍', trigger: 'blur' }],
                    image: [{ required: true, message: '请输入菜品图片', trigger: 'blur' }],
                    price: [{ required: true, message: '请输入菜品价格', trigger: 'blur' }],
                    sortId: [{ required: true, message: '请输入菜品种类', trigger: 'blur' }],
                },
                sortData:[]
            }
        },
        methods: {

            submitForm(){
                let that=this
                this.$ver(this.$refs.ruleForm).then(()=>{
                    if(!that.updates){
                        if(!that.ruleForm.ids)that.ruleForm.ids=Date.now()
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
                        price:0,
                        sortId:'',
                        status:'false'
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
            this.$api.getSort({},res=>{
                if(res) {
                    this.sortData=res

                }

            })
        },
        components:{

        }
    }
</script>

<style scoped lang='scss'>
    #box {

    }
</style>