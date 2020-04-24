<template>
    <div id="box">
        <el-button plain round type="primary" @click="ruleForm=$JSP(form);dialogVisible=true">  + 添加运费</el-button>

        <el-dialog
                :visible.sync="dialogVisible"
                width="40%">
            <el-form label-position="left" :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px" class="demo-ruleForm">
                <el-form-item label="出发地" prop="start_city">
                    <el-select v-model="ruleForm.start_city" placeholder="请选择">
                        <el-option
                                v-for="(item,index) in $area.city_list"
                                :key="index"
                                :label="item"
                                :value="item">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="目的地" prop="end_city">
                    <el-select v-model="ruleForm.end_city" placeholder="请选择">
                        <el-option
                                v-for="(item,index) in $area.city_list"
                                :key="index"
                                :label="item"
                                :value="item">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="价格" prop="price">
                    <el-input-number v-model="ruleForm.price"
                                     :min="0.1" :max="1000" label=""></el-input-number>
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
            <el-table-column prop="ids" label="ID"></el-table-column>
            <el-table-column prop="start_city" label="出发地"></el-table-column>
            <el-table-column prop="end_city" label="目的地"></el-table-column>
            <el-table-column prop="price" label="价格"></el-table-column>
            <el-table-column  label="新增时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>
            <el-table-column width="200" prop="password" label="操作">
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

                },
                form:{
                    start_city:"",
                    end_city:"",
                    price:''
                },
                update:false,
                index:'',
                tableData:[],
                rules: {
                    start_city: [{ required: true, message: '请选择出发城市', trigger: 'blur' },],
                    end_city: [{ required: true, message: '请选择到达城市', trigger: 'blur' },],
                    price: [{ required: true, message: '请输入价格', trigger: 'blur' },],
                }
            }
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let cnt=this.$JSP(this.ruleForm)
                        cnt.ids=Date.now()
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