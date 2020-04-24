<template>
    <div id="box">
        <el-button plain round type="primary" @click="dialogVisible=true;ruleForm=$JSP(form)">  + 添加擅长课程</el-button>

        <el-dialog
                :visible.sync="dialogVisible"
                width="40%">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px" class="demo-ruleForm">
                <el-form-item label="选择课程" prop="grade">
                    <el-select v-model="ruleForm.course" placeholder="请选择">
                        <el-option
                                v-for="item in course"
                                :key="item.ids"
                                :value="item.names+','+item.grade+','+item.ids+','+item.address">
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
            <el-table-column prop="course" label="课程"></el-table-column>
            <el-table-column prop="grade" label="年纪"></el-table-column>
            <el-table-column prop="address" label="地点"></el-table-column>
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
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                dialogVisible:false,
                ruleForm: {
                    course:''
                },
                form: {
                    course:''
                },
                course:[],
                update:false,
                index:'',
                tableData:[],
                addressList:[],
                rules: {
                    course: [{ required: true, message: '请输入课程', trigger: 'blur' }],
                },
            }
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let cnt={
                            course:this.ruleForm.course.split(',')[0],
                            grade:this.ruleForm.course.split(',')[1],
                            courseId:this.ruleForm.course.split(',')[2],
                            ids:Date.now(),
                            address:this.ruleForm.course.split(',')[3],
                            userId:this.$userInfo().ids,
                        }
                        this.$api.addTeaCou(cnt,res=>{
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
                        let cnt={
                            course:this.ruleForm.course.split(',')[0],
                            grade:this.ruleForm.course.split(',')[1],
                            courseId:this.ruleForm.course.split(',')[2],
                            address:this.ruleForm.course.split(',')[3],
                            ids:Date.now(),
                            userId:this.$userInfo().ids,
                        }
                        this.$api.upTeaCou(cnt,res=>{
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
                this.$api.delTeaCou(cnt,res=>{
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
            this.$api.getTeaCou({userId:this.$userInfo().ids},res=>{
                if(res) {
                    this.tableData=res

                }
            })
            this.$api.getSort({},res=>{
                if(res) {
                    this.course=res

                }
            })
            this.$api.getAddress({},res=>{
                if(res) {
                    this.addressList=res

                }

            })
        },
        components:{
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