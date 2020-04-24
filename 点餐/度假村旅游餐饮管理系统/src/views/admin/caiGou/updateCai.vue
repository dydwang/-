<template>
    <div id="addPurchase">
        <el-form  :model="tableForm" :rules="rules" ref="ruleForm"  class="demo-ruleForm">
            <!--<el-form-item  label="采购单名称" prop="name" >-->
            <!--<div style="width: 220px;float: left">-->
            <!--<el-input v-model="tableForm.name"></el-input>-->
            <!--</div>-->
            <!--</el-form-item>-->
            <el-form-item  label="采购时间" prop="times" >
                <div style="width: 50%;padding-left: 94px">
                    <el-date-picker
                            v-model="tableForm.times"
                            type="date"
                            placeholder="选择日期"
                            format="yyyy 年 MM 月 dd 日"
                            value-format="timestamp">
                    </el-date-picker>
                </div>
            </el-form-item>
            <el-table
                    :data="tableForm.tableData"
                    style="width: 100%">
                <el-table-column
                        label="#"
                        type="index"
                        width="50">
                </el-table-column>
                <el-table-column prop="name" label="材料名称">
                    <template slot-scope="scope">
                        <div style="width: 85%">
                            <el-form-item  :prop="'tableData.'+scope.$index+'.name'" :rules="rules.name">
                                <el-input v-model="scope.row.name"></el-input>
                            </el-form-item>
                        </div>
                    </template>
                </el-table-column>
                <el-table-column prop="sort" label="材料种类">
                    <template slot-scope="scope">
                        <div style="width: 85%">
                            <el-form-item  :prop="'tableData.'+scope.$index+'.sort'" :rules="rules.sort">
                                <el-select v-model="scope.row.sort" placeholder="请选择">
                                    <el-option
                                            v-for="item in sortList"
                                            :key="item"
                                            :value="item">
                                    </el-option>
                                </el-select>
                            </el-form-item>
                        </div>
                    </template>
                </el-table-column>

                <el-table-column prop="num" label="数量">
                    <template slot-scope="scope">
                        <div style="width: 85%">
                            <el-form-item  :prop="'tableData.'+scope.$index+'.num'" :rules="rules.num">
                                <el-input-number v-model="scope.row.num" controls-position="right"  :min="1" :max="10000"></el-input-number>
                            </el-form-item>
                        </div>
                    </template>
                </el-table-column>

                <el-table-column prop="price" label="物料单价">
                <template slot-scope="scope">
                <div style="width: 85%">
                <el-form-item  :prop="'tableData.'+scope.$index+'.price'" :rules="rules.price">
                <el-input-number v-model="scope.row.price" controls-position="right"  :min="1" :max="10000"></el-input-number>
                </el-form-item>
                </div>
                </template>
                </el-table-column>

                <el-table-column  label="操作">
                    <template slot-scope="scope">
                        <el-button type="primary"  @click="addRow(scope.$index+1)" plain round> + </el-button>
                        <el-button v-show="tableForm.tableData.length!==1" @click="deleteRow(scope.$index)" type="warning" plain round> - </el-button>
                    </template>
                </el-table-column>
            </el-table>

            <!--<el-form-item label="活动名称" prop="name">-->
            <!--<el-input v-model="ruleForm.name"></el-input>-->
            <!--</el-form-item>-->
            <el-form-item STYLE="margin-top: 30px">
                <el-button type="primary" @click="submitForm('ruleForm')">立即修改</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    export default {
        name: "addPurchase",
        props: ['tableForm'],
        data() {
            return {
                // tableForm:{
                //     tableData:[],
                //     name:'',
                //     price:0,
                //     times:""
                // },
                sortList:['肉类','海鲜','蔬菜','水果','饮品','调味品','其他'],

                form:{
                    name:'',
                    sort:'',
                    num:0,
                    price:0,
                },
                ruleForm:{},
                rules:{
                    name: [{ required: true, message: '请输入物品名称', trigger: 'blur' }],
                    num: [{ required: true, message: '请输入采购数量', trigger: 'blur' }],
                    price: [{ required: true, message: '请输入采购价格', trigger: 'blur' }],
                    times:[{ required: true, message: '请输入采购时间', trigger: 'blur' }],
                    sort:[{ required: true, message: '请选择材料种类', trigger: 'blur' }],
                }
            }
        },
        methods: {
            addRow(index){
                this.tableForm.tableData.splice(index,0,this.$JSP(this.form))
            },
            deleteRow(index){
                this.tableForm.tableData.splice(index,1)
            },
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.addCaigou()
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            addCaigou(){
                let that=this
                let price=0
                this.tableForm.tableData.forEach(val=>{
                    price+=val.price*val.num
                })
                let cnt={
                    name:this.tableForm.name,
                    price:price,
                    times:this.tableForm.times,
                    status:'false',
                    ids:this.tableForm.ids,
                }

                that.$api.delCaiList({caiId:this.tableForm.ids},()=>{
                    that.$api.delCai({ids:this.tableForm.ids},()=>{
                        that.$api.addCai(cnt,()=>{
                            that.tableForm.tableData.forEach((val,index)=>{
                                val.ids=Date.now()+''+index
                                val.caiId=cnt.ids
                                that.$api.addCaiList(val,r=>{

                                })
                            })
                            setTimeout(()=>{
                               that.$emit('close')
                            },0)
                        })
                    })
                })


            }
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
    #addPurchase {

    }
</style>