<template>
    <div id="purchase">
        <el-table :data="tableData">
            <el-table-column type="index" label="#"></el-table-column>
            <el-table-column type="expand" label="详情">
                <template slot-scope="scope">
                    <el-table :data="tableList[scope.row.ids]">
                        <el-table-column type="index" label="#"></el-table-column>
                        <el-table-column prop="name" label="物料名称"></el-table-column>
                        <el-table-column prop="sort" label="物料分类"></el-table-column>
                        <el-table-column prop="num" label="物料数量"></el-table-column>
                        <el-table-column prop="price" label="物料单价/元"></el-table-column>

                    </el-table>
                </template>
            </el-table-column>
            <el-table-column prop="ids" label="采购单号"></el-table-column>
            <el-table-column prop="price" label="采购总价格/元">

            </el-table-column>
            <el-table-column prop="times" label="生成采购订单时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime('Y-M-D')}}
                </template>
            </el-table-column>
            <el-table-column prop="times" label="采购时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.times).getTime('Y-M-D')}}
                </template>
            </el-table-column>
            <el-table-column prop="times" label="状态">
                <template slot-scope="scope">
                    {{scope.row.status==='false'?'未确认':'已确认'}}
                </template>
            </el-table-column>
            <el-table-column  label="操作">
                <template slot-scope="scope">
                    <el-button v-show="scope.row.status==='false'"
                               @click="changeStatus(scope.row)"
                               round plain size="mini" type="primary">确认</el-button>
                    <el-button v-show="scope.row.status==='false'"
                               @click="updates(scope.row);"
                               round plain size="mini" type="warning">修改</el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog
                title="提示"
                :visible.sync="dialogVisible"
                width="70%"
                >
            <updateCai @close="closeDia" :tableForm="tableForm"></updateCai>
        </el-dialog>

    </div>
</template>

<script>
    import updateCai from './updateCai'
    export default {
        name: "purchase",
        props: [''],
        data() {
            return {
                tableData:[],
                tableList:{},
                dialogVisible:false,
                form:{},
                tableForm:{
                    tableData:[
                    ],
                    name:'',
                    price:0,
                    times:""
                },
            }
        },
        methods: {
            updates(row){
                let form={}
                form.name=row.name
                form.ids=row.ids
                form.price=row.price
                form.times=row.times
                form.tableData=this.tableList[row.ids]
                this.tableForm=this.$JSP(form)
                this.dialogVisible=true;
            },
            closeDia(){
                this.getCai()
                this.dialogVisible=false
            },
            getList(res){
                let that=this
                res.forEach(val=>{
                    that.$api.getCaiList({$where:{caiId:val.ids}},r=>{
                        that.tableList[val.ids]=r
                    })
                })
                console.log(that.tableList)
            },
            changeStatus(row){
                this.$api.upCai({ids:row.ids,status:'true'},res=>{
                    row.status='true'
                })
            },
            getCai(){
                this.$api.getCai({$orderBY: {col:'ids',methods:'desc'}},res=>{
                    this.tableData.splice(0,this.tableData.length,...res)
                    this.getList(res)
                })
            }
        },
        mounted() {

        },
        created() {
           this.getCai()
        },
        components: {
            updateCai
        },
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #purchase {

    }
</style>