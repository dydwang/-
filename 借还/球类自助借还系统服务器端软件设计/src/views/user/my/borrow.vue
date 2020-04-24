<template>
    <div id="borrow">
        <el-table :data="tableData">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column prop="ids" label="时间">
                <template slot-scope="scope">
                    <span>{{$Time(scope.row.ids).getTime()  }}</span>
                </template>
            </el-table-column>
            <el-table-column prop="names" label="球名称"></el-table-column>
            <el-table-column prop="num" label="数量"></el-table-column>
            <el-table-column prop="password" label="操作" width="180">
                <template slot-scope="scope">
                    <el-button type="primary" v-if="scope.row.status"
                               size="small" round plain @click="onSubmit('',scope.row,scope.$index)">还球</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "borrow",
        props: [''],
        data() {
            return {
                tableData:[]
            }
        },
        methods: {
            onSubmit(status,row,index){
                console.log(row)

                this.$api.upPay({ids:row.ids,status:status,fun:'还球'},res=>{
                    if(res){
                        row.status=status
                        this.$message.success('提交成功')
                        this.tableData.splice(index,1)

                        let cnt_copy={
                            $where:this.$JSP(row)
                        }
                        cnt_copy.$where.fun='还球'
                        cnt_copy.$table='history'
                        this.$api.add(cnt_copy,r=>{

                        })
                    }
                })
            },
        },
        mounted() {
        },
        created() {
            let cnt={
                $where:{
                    userId:this.$userInfo().ids,
                    fun:'借球',
                    status:'同意'
                },
                $orderBY:{
                    col:'ids',
                    methods:'DESC'
                }

            }
            this.$api.getPay(cnt,res=>{
                this.tableData=res
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #borrow {

    }
</style>