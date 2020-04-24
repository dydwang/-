<template>
    <div id="work">
        <el-dialog
                :visible.sync="dialogVisible"
                width="30%">
            <p style="color:red;text-align: center">只可提交一次</p>
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="作业附件" prop="file">
                    <up-file @success="success"></up-file>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')" >立即创建</el-button>
                    <el-button @click="resetForm('ruleForm')">取消</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>
        <el-table v-loading="loading" v-if="tableData.length>0" :data="tableData">
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
            <el-table-column prop="names" label="作业"></el-table-column>
            <el-table-column prop="address" label="附件">
                <template slot-scope="scope">
                    <a :href="$exImg+scope.row.file" target="_Blank"
                       :download="scope.row.file">查看附件</a>
                </template>
            </el-table-column>

            <el-table-column prop="address" label="我的答案">
                <template slot-scope="scope">
                    <a v-show="myWorkList[scope.row.ids]" :href="$exImg+myWorkList[scope.row.ids]" target="_Blank"
                       :download="scope.row.myfile">查看</a>
                    <div v-show="!myWorkList[scope.row.ids]">还未提交</div>
                </template>
            </el-table-column>

            <el-table-column prop="password" label="操作">
                <template slot-scope="scope">
                    <el-button type="text" v-show="!myWorkList[scope.row.ids]"   @click="dialogVisible=true;testId=scope.row.ids">提交</el-button>
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
                tableData:[],
                myWorkList:{},
                dialogVisible:false,
                testId:'',
                ruleForm: {
                    myFile:'',
                    testId:'',
                    userId:this.$userInfo().ids
                },

                rules: {
                    names: [{ required: true, message: '请输入作业名称', trigger: 'blur' }],
                    myFile: [{ required: true, message: '请选择附件', trigger: 'blur' }],
                },
                loading:true
            }
        },
        methods: {
            success(path){
                this.ruleForm.myFile=path
            },
            getOrder(){
                this.tableData.sort((a,b)=>{
                    return b.ids-a.ids
                })
            },
            getMycourse(){
                let that=this
                let c={
                    $where:{userId:this.$userInfo().ids},
                }
                this.$api.getHot(c,res=>{
                    res.forEach(val=>{
                        that.getWork(val.courseId)
                    })
                    setTimeout(()=>{
                        this.getOrder()
                        this.loading=false
                    },500)
                })
            },
            getMyWork(workId){
                let that=this
                let cnt={
                    $where:{
                        testId:workId,
                        userId:this.$userInfo().ids
                    }
                }
                this.$api.getTestList(cnt,res=>{
                    if(res.length>0){
                        that.myWorkList[workId]=res[0].myFile
                        console.log(this.myWorkList)
                    }
                })
            },
            getWork(workId){
                let that=this
                let cnt={
                    $link:{
                        table:'teacou',
                        left:'courseId',
                        right:'courseId_c',
                        where:'ids as courseId_c,course,grade'
                    },
                    $where:{courseId:workId},
                }

                this.$api.getTest(cnt,res=>{
                    if(res.length){
                        this.tableData.push(...res)
                        res.forEach(val=>{
                            that.getMyWork(val.ids)
                        })

                    }
                })


            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
                this.dialogVisible=false
            },
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.ruleForm.ids=Date.now()
                        this.ruleForm.testId=this.testId
                        this.$api.addTestList(this.ruleForm,res=>{
                            if(res){
                                this.resetForm('ruleForm')
                                this.$router.go(0)
                            }
                        })
                    } else {
                        this.$message.error('请填写完整')
                        return false;
                    }
                });
            },
        },
        mounted() {

        },
        created() {
            this.tableData=[]
            this.getMycourse()
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #work {

    }
</style>