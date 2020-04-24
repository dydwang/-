<template>
    <div id="box">
        <el-button plain round type="primary" @click="ruleForm=$JSP(form);dialogVisible=true">  + 我要寄货</el-button>
        <el-dialog
                :visible.sync="dialogVisible"
                width="40%">

            <el-form label-position="left" :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px" class="demo-ruleForm">
                <el-form-item label="出发地" prop="start_city">
                    <el-select @change="changeStartCity" v-model="ruleForm.start_city" placeholder="请选择">
                        <el-option
                                v-for="(item,index) in startList"
                                :key="index"
                                :label="index"
                                :value="index">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="目的地" prop="end_city">
                    <el-select  @change="changeEndCity" v-model="ruleForm.end_city" placeholder="请选择">
                        <el-option
                                v-for="(item,index) in endList"
                                :key="index"
                                :label="item.end_city"
                                :value="item.end_city">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="价格" prop="price">
                    {{ruleForm.price}}
                </el-form-item>
                <el-form-item label="详细地址" prop="address">
                    <el-input v-model="ruleForm.address" placeholder="请输入详细目的地（街区）"></el-input>
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
            <el-table-column prop="address" label="详细地址"></el-table-column>
            <el-table-column prop="status" label="状态"></el-table-column>
            <el-table-column width="200" prop="password" label="操作">
                <template slot-scope="scope">
                    <el-button v-show="scope.row.status==='配送中'" size="mini" type="primary" plain round @click="upSort(scope.$index,scope.row)">已到达</el-button>

                    <el-button v-show="scope.row.status==='已到达'" size="mini"
                               type="primary" plain round @click="$routerGo('/myComment',scope.row)">评论</el-button>

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
                    price:'',
                    address:'',
                    userId:this.$userInfo().ids,
                    status:'配送中'
                },
                endList:[],
                startList:{},
                update:false,
                index:'',
                tableData:[],
                rules: {
                    start_city: [{ required: true, message: '请选择出发城市', trigger: 'blur' },],
                    end_city: [{ required: true, message: '请选择到达城市', trigger: 'blur' },],
                    price: [{ required: true, message: '请输入价格', trigger: 'blur' },],
                    address:[{ required: true, message: '请输入详细地址', trigger: 'blur' },],
                }
            }
        },
        methods: {
            changeStartCity(val){
                this.endList.splice(0,this.endList.length,...this.startList[val])
                console.log(this.endList)
            },
            changeEndCity(address){
                this.ruleForm.price=this.endList.filter(val=>{
                    return address=val.end_city
                })[0].price
            },
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let cnt=this.$JSP(this.ruleForm)
                        cnt.ids=Date.now()
                        this.$api.addPay(cnt,res=>{
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
                        this.$api.upPay(cnt,res=>{
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
                //this.ruleForm=JSON.parse(JSON.stringify(row))
                // this.index=index
                // this.update=true
                // this.dialogVisible=true

                let cnt={
                    ids:row.ids,
                    status:'已到达',
                }
                this.$api.upPay(cnt,res=>{
                    if(res){
                        row.status='已到达'
                    }
                })
            },
            delSort(index,row){
                let cnt=JSON.parse(JSON.stringify(row))
                this.$api.delPay(cnt,res=>{
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
        async created() {
            await this.$api.getPay({$where:{userId:this.$userInfo().ids}},  res => {
                if (res) {
                    this.tableData=res
                }
            })
            await this.$api.getSort({}, async res => {
                if (res) {
                    await res.map(val => {
                        this.startList[val.start_city] = this.startList[val.start_city] || []
                        this.startList[val.start_city].push(val)
                    })
                    console.log(this.tableData)
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