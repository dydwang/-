<template>
    <div id="work">
        <el-button round plain type="primary" @click="dialogVisible=true">发布作业</el-button>
        <el-dialog
                :visible.sync="dialogVisible"
                width="30%">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="课程" prop="courseId">
                    <el-select v-model="ruleForm.courseId" placeholder="请选择">
                        <el-option
                                v-for="(item,index) in courseList"
                                :key="index"
                                :label="item.course+item.grade"
                                :value="item.ids">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="作业名称" prop="names">
                    <el-input v-model="ruleForm.names"></el-input>
                </el-form-item>
                <el-form-item label="作业附件" prop="file">
                    <up-file @success="success"></up-file>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')" >立即创建</el-button>
                    <el-button @click="resetForm('ruleForm')">取消</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>

        <el-table :data="tableData">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column  label="发布时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>
            <el-table-column prop="courseId" label="课程">
                <template slot-scope="scope">
                    {{scope.row.course+'-'+scope.row.grade}}
                </template>
            </el-table-column>
            <el-table-column prop="address" label="附件">
                <template slot-scope="scope">
                    <a :href="$exImg+scope.row.file" target="_Blank"
                       :download="scope.row.file">查看附件</a>
                </template>
            </el-table-column>

            <el-table-column prop="password" label="操作">
                <template slot-scope="scope">
                    <el-button type="text"   @click="$routerGo('/tea_workInfo',{workId:scope.row.ids})">查看提交情况</el-button>
                    <el-button type="text"   @click="delSort(scope.$index,scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "work",
        props: [''],
        data() {
            return {
                dialogVisible:false,
                ruleForm: {
                    names: '',
                    file:'',
                    courseId:'',
                    userId:this.$userInfo().ids
                },

                rules: {
                    names: [{ required: true, message: '请输入作业名称', trigger: 'blur' }],
                    file: [{ required: true, message: '请选择附件', trigger: 'blur' }],
                    courseId:[{ required: true, message: '请选择课程', trigger: 'blur' }],
                },
                courseList:[],
                tableData:[]
            }
        },
        methods: {
            success(path){
                this.ruleForm.file=path
            },
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.ruleForm.ids=Date.now()
                        this.$api.addWork(this.ruleForm,res=>{
                            if(res){
                                this.resetForm('ruleForm')
                                this.getWork()
                            }
                        })
                    } else {
                        this.$message.error('请填写完整')
                        return false;
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
                this.dialogVisible=false
            },
            delSort(index,row){
                this.$api.delWork({ids:row.ids},res=>{
                    this.tableData.splice(index,1)
            })
            },
            getWork(){
                let cnt= {
                    $where:{userId:this.$userInfo().ids},
                    $link:{
                        table:'teacou',
                        left:'courseId',
                        right:'l_courseId',
                        where:'ids as l_courseId,course,grade'
                    },
                    $orderBY: {
                        col:'ids',
                        methods:'desc'
                    }
                }


                this.$api.getWork(cnt,res=>{
                    this.tableData.splice(0,this.tableData.length,...res)
                })
            }
        },
        mounted() {
        },
        created() {
            this.$api.getTeaCou({$where:{userId:this.$userInfo().ids}},res=>{
                if(res) {
                    this.courseList=res

                }
            })
            this.getWork()
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #work {

    }
</style>