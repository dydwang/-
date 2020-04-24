<template>
    <div id="index">
        <el-button @click="downEx()" style="float: right;" type="primary" round >打印订单</el-button>
        <el-table :data="tableData">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column type="expand">
                <template slot-scope="scope">
                    <el-form label-position="left"  class="demo-table-expand">
                        <el-form-item label="用户Id：">
                            <span>{{ scope.row.userId }}</span>
                        </el-form-item>
                        <el-form-item label="用户名：">
                            <span>{{ scope.row.userName }}</span>
                        </el-form-item>

                    </el-form>
                </template>
            </el-table-column>
            <el-table-column prop="ids" label="时间">
                <template slot-scope="scope">
                    <span>{{$Time(scope.row.ids).getTime()  }}</span>
                </template>
            </el-table-column>
            <el-table-column prop="names" label="球名称"></el-table-column>
            <el-table-column prop="num" label="数量"></el-table-column>
            <el-table-column prop="fun" label="借还"></el-table-column>

            <el-table-column prop="status" label="状态"></el-table-column>

            <el-table-column prop="password" label="操作" width="180">
                <template slot-scope="scope">
                    <el-button type="primary" v-if="!scope.row.status"
                               size="small" round plain @click="onSubmit('同意',scope.row,scope.$index)">同意</el-button>
                    <el-button type="danger" v-if="!scope.row.status"
                               size="small" round plain @click="onSubmit('不同意',scope.row,scope.$index)">不同意</el-button>
                </template>
            </el-table-column>
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
                        row.status=status

                        if(status==='同意'){
                            this.$api.getSort({ids:row.ballId},r=>{
                                if(row.fun==='借球'){

                                    let c={
                                        ids:row.ballId,
                                        borrow:Number(row.num)+Number(r[0].borrow)
                                    }
                                    console.log(c)
                                    this.$api.upSort(c,re=>{

                                    })
                                }else{
                                    let c={
                                        ids:row.ballId,
                                        borrow:Number(r[0].borrow)-Number(row.num)
                                    }
                                    console.log(c)
                                    this.$api.upSort(c,re=>{

                                    })
                                }
                            })
                        }
                    }
                })
            },
        },
        mounted() {
            let cnt={
                $link:{
                    table:'user',
                    left:'userId',
                    right:'userId',
                    where:'ids as userId,names as userName'
                },
                $orderBY:{
                    col:'ids',
                    methods:'DESC'
                }
            }
            this.$api.getPay(cnt,res=>{
                if(res){
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