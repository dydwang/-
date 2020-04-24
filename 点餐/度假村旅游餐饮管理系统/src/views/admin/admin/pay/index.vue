<template>
    <div id="index">
        <el-date-picker
                v-model="time"
                type="date"
                value-format="timestamp"
                placeholder="选择日期">
        </el-date-picker>
        <!--<el-button @click="downEx()" style="float: right;" type="primary" round >打印订单</el-button>-->
        <el-table :data="tableData">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column type="expand">
                <template slot-scope="scope">
                    <el-table :data="payList[scope.row.payId]">
                        <el-table-column type="index" width="50"></el-table-column>
                        <el-table-column prop="names" label="物品"></el-table-column>
                        <el-table-column prop="price" label="单价"></el-table-column>
                        <el-table-column prop="num" label="数量"></el-table-column>
                    </el-table>
                </template>
            </el-table-column>
            <el-table-column prop="payId" label="单号"></el-table-column>
            <el-table-column prop="price" label="价格"></el-table-column>
            <el-table-column prop="userId" label="点餐员Id"></el-table-column>
            <el-table-column prop="userName" label="点餐员"></el-table-column>
        </el-table>
    </div>
</template>

<script>
   // import downExcel from './export'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                tableData:[],
                headL:['待发货','待收货','已收获','已取消订单'],
                payList:{},
                time:Date.parse(this.$Time(Date.now()).getTime('Y-M-D')),
            }
        },
        methods: {
            downEx(){
                console.log(123546)
                let name=this.$Time(Date.now()).getTime('Y-M-D')+'订单表'
                console.log(name)
                downExcel(this.tableData,name)
            },
            onSubmit(status,row,index){
                console.log(row)

                this.$api.upPay({ids:row.ids,status:status},res=>{
                    if(res){
                        this.$toast('修改成功')
                        row.status=status
                    }
                })
                if(status==='1'){
                    this.$api.getList({ids:row.listId},res=>{
                        if(res){
                            this.$api.upList({ids:row.listId,num:res[0].num-row.num},r=>{

                            })
                        }
                    })
                }
            },
            getPay(){
                let cnt={
                    $link:{
                        table:'user',
                        left:'userId',
                        right:'userId',
                        where:'ids as userId,names as userName'
                    },
                    $where:{
                        'ids>':this.time ,
                        'ids<':this.time+24*60*60*1000
                    }
                }
                let that=this
                this.$api.getPay(cnt,res=>{
                    if(res){
                        this.tableData=res
                        res.forEach(val=>{
                            let c={
                                $link:{
                                    table:'goods',
                                    left:'goodId',
                                    right:'ids',
                                    where:'*'
                                },
                                $where:{
                                    payId:val.payId
                                }
                            }
                            that.$api.getPayList(c,r=>{
                                that.payList[val.payId]=r
                            })
                        })
                    }
                })
            }
        },
        mounted() {
            let cnt={
                $link:{
                    table:'user',
                    left:'userId',
                    right:'userId',
                    where:'ids as userId,names as userName'
                },
                $where:{
                    'ids>':this.time ,
                    'ids<':this.time+24*60*60*1000
                }
            }
            let that=this
            this.$api.getPay(cnt,res=>{
                if(res){
                    this.tableData=res
                    res.forEach(val=>{
                        let c={
                            $link:{
                                table:'goods',
                                left:'goodId',
                                right:'ids',
                                where:'*'
                            },
                            $where:{
                                payId:val.payId
                            }
                        }
                        that.$api.getPayList(c,r=>{
                            that.payList[val.payId]=r
                        })
                    })
                }
            })
        },
        created() {
        },
        components: {},
        watch: {
            time(){
                this.getPay()
            }
        },
    }
</script>

<style scoped lang='scss'>
    #index {

    }
</style>