<template>
    <div id="index">
        <el-button plain round type="primary" @click="dialogVisible=true;ruleForm=form;update=false">  + 添加</el-button>

        <el-dialog
                :visible.sync="dialogVisible"
                width="40%">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="120px" class="demo-ruleForm">
                <div style="width: 180px"></div>
                <el-form-item label="姓名" prop="image">
                    <div style="width: 180px">
                        <el-input v-model="ruleForm.names"></el-input>
                    </div>

                </el-form-item>
                <el-form-item label="职称/权限" prop="grade">
                    <div style="width: 180px">
                        <el-select v-model="ruleForm.grade" placeholder="请选择">
                            <el-option
                                    v-for="item in grade"
                                    :key="item"
                                    :value="item">
                            </el-option>
                        </el-select>
                    </div>

                </el-form-item>
                <el-form-item label="入职时间" prop="startTime">
                    <div style="width: 180px">
                        <el-date-picker
                                v-model="ruleForm.startTime"
                                type="date"
                                placeholder="选择日期"
                                format="yyyy 年 MM 月 dd 日"
                                value-format="timestamp">
                        </el-date-picker>
                    </div>

                </el-form-item>
                <el-form-item v-show="update" label="离职时间" prop="startTime">
                    <div style="width: 180px">
                        <el-date-picker
                                v-model="ruleForm.endTime"
                                type="date"
                                placeholder="选择日期"
                                format="yyyy 年 MM 月 dd 日"
                                value-format="timestamp">
                        </el-date-picker>
                    </div>

                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')" v-if="!update">立即创建</el-button>
                    <el-button type="primary" @click="updateForm('ruleForm')" v-else>立即修改</el-button>
                    <el-button @click="resetForm('ruleForm')">取消</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>

        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="ID/工号" prop="ids"></el-table-column>
            <el-table-column label="姓名" prop="names"></el-table-column>
            <el-table-column label="密码" prop="password"></el-table-column>
            <el-table-column label="职位" prop="grade"></el-table-column>
            <el-table-column label="入职时间" prop="startTime">
                <template slot-scope="scope">
                    {{$Time(scope.row.startTime).getTime('Y-M-D')}}
                </template>
            </el-table-column>
            <el-table-column label="离职时间" prop="endTime">
                <template slot-scope="scope">
                    {{scope.row.endTime?$Time(scope.row.endTime).getTime('Y-M-D'):'-'}}
                </template>
            </el-table-column>
            <el-table-column label="操作人" prop="operation"></el-table-column>
            <el-table-column label="操作" width="200">
                <template slot-scope="scope">
                    <el-button size="mini" type="primary" plain round @click="upSort(scope.$index,scope.row)">修改</el-button>
                    <el-button size="mini" type="warning" plain round @click="delSort(scope.$index,scope.row)">删除</el-button>
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
                grade:[
                    '人事', '采购员', '点餐员', '厨师',
                ],
                dialogVisible:false,
                ruleForm: {
                    names: '',
                    grade:'',
                    startTime:'',
                    endTime:''
                },
                form:{
                    names: '',
                    grade:'',
                    startTime:'',
                    endTime:''
                },
                update:false,
                index:'',
                tableData:[],
                rules: {
                    names: [{ required: true, message: '请输入分类名称', trigger: 'blur' },],
                    grade: [{ required: true, message: '请选择权限', trigger: 'blur' },],
                    startTime: [{ required: true, message: '请选择入职时间', trigger: 'blur' },]
                }
            }
        },
        methods: {
            success(path){
                this.ruleForm.image=path
            },
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let date=Date.now()
                        let cnt={
                            names:this.ruleForm.names,
                            ids:date,
                            username:date,
                            grade:this.ruleForm.grade,
                            startTime:this.ruleForm.startTime,
                            password:'YG_1234',
                            operation:this.$userInfo().names
                        }
                        this.$api.addUser(cnt,res=>{
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
                        this.$api.upUser(cnt,res=>{
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
                let cnt={ids:row.ids}
                this.$api.delUser(cnt,res=>{
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

            this.$api.login({},res=>{
                if(res) {
                    this.tableData=res

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