<template>
    <div id="pay">
        <el-table :data="showTable">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="ID" prop="ids"></el-table-column>
            <el-table-column label="名称" prop="name"></el-table-column>
            <el-table-column label="数量(张或天)" prop="num"></el-table-column>
            <el-table-column label="价格/元" prop="price">
                <template slot-scope="scope">{{scope.row.price*scope.row.num}}</template>
            </el-table-column>
            <el-table-column label="使用日期/开始日期" prop="price">
                <template slot-scope="scope">{{$Time(scope.row.time).getTime()}}</template>
            </el-table-column>
        </el-table>

        <dyd-next-page :num="tableData.length" @change="changePage"></dyd-next-page>
    </div>
</template>

<script>
    export default {
        name: "pay",
        props: [''],
        data() {
            return {
                tableData:[],
                showTable:[]
            }
        },
        methods: {
            changePage(page,count){
                this.showTable.splice(0,this.showTable.length,...this.tableData.slice(((page-1)*count),page*count))
            }
        },
        mounted() {
        },
        created() {
            this.$api.getPay({$where:{userId:this.$userInfo().ids}},res=>{
                this.tableData=res
                this.changePage(1,10)
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #pay {

    }
</style>