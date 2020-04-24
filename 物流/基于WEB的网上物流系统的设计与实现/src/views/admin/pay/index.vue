<template>
    <div id="index">
        <el-button @click="downEx()" style="float: right;" type="primary" round >打印订单</el-button>
        <el-table :data="tableData">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column prop="ids" label="ID"></el-table-column>
            <el-table-column prop="userId" label="用户ID"></el-table-column>
            <el-table-column prop="start_city" label="出发地"></el-table-column>
            <el-table-column prop="end_city" label="目的地"></el-table-column>
            <el-table-column prop="price" label="价格"></el-table-column>
            <el-table-column prop="address" label="详细地址"></el-table-column>
            <el-table-column prop="status" label="状态"></el-table-column>
            <el-table-column width="200" prop="password" label="操作">
                <template slot-scope="scope">
                    <el-button v-show="scope.row.status==='已到达'" size="mini"
                               type="primary" plain round @click="delSort(scope.$index,scope.row)">删除</el-button>


                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    import downExcel from './export'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                tableData:[],
                headL:['待发货','待收货','已收获','已取消订单'],
            }
        },
        methods: {
            delSort(index,row){
                let cnt=JSON.parse(JSON.stringify(row))
                this.$api.delPay(cnt,res=>{
                    if(res){
                        this.tableData.splice(index,1)
                        this.$message.success('删除成功')
                    }
                })
            },
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
        },
        mounted() {
            this.$api.getPay({},  res => {
                if (res) {
                    this.tableData=res
                }
            })
        },
        created() {
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {

    }
</style>