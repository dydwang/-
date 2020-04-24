<template>
    <div id="box">
        <el-button plain round type="primary" @click="dialogVisible=true;ruleForm=$JSP(form)">  + 添加课程</el-button>

        <el-dialog
                :visible.sync="dialogVisible"
                width="40%">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px" class="demo-ruleForm">
                <el-form-item label="上课年纪" prop="grade">
                    <el-select v-model="ruleForm.grade" placeholder="请选择">
                        <el-option
                                v-for="item in gradeList"
                                :key="item"
                                :value="item">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="课程名称" prop="names">
                    <el-input v-model="ruleForm.names"></el-input>
                </el-form-item>
                <el-form-item label="上课地点" prop="address">
                    <el-select v-model="ruleForm.address" placeholder="请选择">
                        <el-option
                                v-for="(item,index) in addressList"
                                :key="index"
                                :value="item.names">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')" v-if="!update">立即创建</el-button>
                    <el-button type="primary" @click="updateForm('ruleForm')" v-else>立即修改</el-button>
                    <el-button @click="resetForm('ruleForm')">取消</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>

        <el-table :data="tableData">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column prop="names" label="名称"></el-table-column>
            <el-table-column prop="address" label="上课地点"></el-table-column>
            <el-table-column prop="grade" label="年纪"></el-table-column>
            <el-table-column  label="新增时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>
            <el-table-column prop="password" label="操作">
                <template slot-scope="scope">
                    <el-button type="primary" plain round @click="upSort(scope.$index,scope.row)">修改</el-button>
                    <el-button type="warning" plain round @click="delSort(scope.$index,scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    import createSort from './createSort'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                dialogVisible:false,
                ruleForm: {
                    names: '',
                    grade:'',
                    address:''
                },
                form: {
                    names: '',
                    grade:'',
                    address:''
                },
                update:false,
                index:'',
                tableData:[],
                addressList:[],
                rules: {
                    names: [{ required: true, message: '请输入分类名称', trigger: 'blur' }],
                    grade: [{ required: true, message: '请填写上课年纪', trigger: 'blur' }],
                    address: [{ required: true, message: '请填写上课地址', trigger: 'blur' }],
                },
                gradeList:[
                    '一年级上','一年级下','二年级上','二年级下','三年级上','三年级下',
                    '四年级上','四年级下','五年级上','五年级下','六年级上','六年级下',
                    '初一年级上','初一年级下','初二年级上','初二年级下','初三年级上','初三年级下',
                    '高一年级上','高一年级下','高二年级上','高二年级下','高三年级上','高三年级下',
                ]
            }
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let cnt={
                            names:this.ruleForm.names,
                            ids:Date.now(),
                            grade:this.ruleForm.grade,
                            address:this.ruleForm.address,
                        }
                        this.$api.addSort(cnt,res=>{
                            if(res){
                                this.$message.success('添加成功')
                                this.tableData.splice(0,0,cnt)
                                this.dialogVisible=false
                            }
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            updateForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let cnt=JSON.parse(JSON.stringify(this.ruleForm))
                        this.$api.upSort(cnt,res=>{
                            if(res){
                                this.$message.success('修改成功')
                                this.tableData.splice(this.index,1,cnt)
                                this.dialogVisible=false
                            }
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            upSort(index,row){
                this.ruleForm=JSON.parse(JSON.stringify(row))
                this.index=index
                this.update=true
                this.dialogVisible=true
            },
            delSort(index,row){
                let cnt=JSON.parse(JSON.stringify(row))
                this.$api.delSort(cnt,res=>{
                    if(res){
                        this.tableData.splice(index,1)
                        this.$message.success('删除成功')
                    }
                })
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
                this.dialogVisible=false
            }
        },
        mounted() {
        },
        created() {
            this.$api.getSort({},res=>{
                if(res) {
                    this.tableData=res

                }
            })
            this.$api.getAddress({},res=>{
                if(res) {
                    this.addressList=res

                }

            })
        },
        components:{
            createSort
        }
    }
</script>

<style scoped lang='scss'>
    #box {
        .demo-ruleForm{
            width: 90%;
            margin: 0 5%;
        }

    }
</style>