<template>
    <div id="index">
        <el-table :data="tableData">
            <el-table-column
                    width="50"
                    type="index">
            </el-table-column>
            <el-table-column
                    prop="names"
                    label="名称">
            </el-table-column>


            <el-table-column
                    label="创建时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>

            <el-table-column
                    label="操作">
                <template slot-scope="scope">
                    <el-button type="text" @click="$routerGo('noticeInfo',scope.row)">查看</el-button>
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
                tableData:[]
            }
        },
        methods: {},
        mounted() {
        },
        created() {
            this.$api.getBlog({$orderBY:{col:'ids',methods:'DESC'}},res=>{
                if(res) this.tableData=res
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {

    }
</style>