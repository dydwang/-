<template>
    <div id="create">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="婚礼名称" prop="name">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="婚礼地点" prop="address">
                <el-input v-model="ruleForm.address"></el-input>
            </el-form-item>
            <el-form-item label="婚礼喜车" prop="carId">
                <el-select v-model="ruleForm.carId" placeholder="请选择">
                    <el-option
                            style="margin-bottom: 10px"
                            v-for="(item,index) in $list.car"
                            :key="index"
                            :label="item"
                            :value="index">

                            <div style="float: left;">
                            <img :src="require('@/assets/img/car/'+index+'.jpg')" width="40px" height="40px">
                            </div>
                            <span style="float:right">
                            {{item}}
                            </span>
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="婚礼婚纱" prop="clothId">
                <el-select v-model="ruleForm.clothId" placeholder="请选择">
                    <el-option
                            style="margin-bottom: 10px"
                            v-for="(item,index) in 10"
                            :key="item"
                            :label="item"
                            :value="item">

                        <div style="float: left;">
                            <img :src="require('@/assets/img/clothing/'+item+'.jpg')" width="40px" height="40px">
                        </div>
                    </el-option>
                </el-select>
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
        name: "create",
        props: ['updates','ruleForm'],
        data() {
            return {
                rules: {
                    name: [{ required: true, message: '请输入婚礼名称', trigger: 'blur' }],
                    address: [{ required: true, message: '请输入婚礼举行地点', trigger: 'blur' }],
                    carId: [{ required: true, message: '请选择喜车', trigger: 'blur' }],
                    clothId: [{ required: true, message: '请选择婚纱', trigger: 'blur' }],
                },
            }
        },
        methods: {
            submitForm(){
                let that=this
                this.$ver(this.$refs.ruleForm).then(()=>{
                    if(!that.updates){
                        if(!that.ruleForm.ids)that.ruleForm.ids=Date.now()
                        that.$api.addCloth(this.ruleForm,res=>{
                            if(res){
                                that.$message.success('添加成功')
                                that.$emit('closeDia',that.ruleForm)
                            }
                        })
                    }else{
                        that.$api.upCloth(this.ruleForm,res=>{
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
        width: 440px;
    }
</style>