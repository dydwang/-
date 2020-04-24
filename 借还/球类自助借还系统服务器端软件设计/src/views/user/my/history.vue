<template>
    <div id="history">
        <el-table :data="tableData">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column prop="ids" label="时间">
                <template slot-scope="scope">
                    <span>{{$Time(scope.row.ids).getTime()  }}</span>
                </template>
            </el-table-column>
            <el-table-column prop="names" label="球名称"></el-table-column>
            <el-table-column prop="num" label="数量"></el-table-column>
            <el-table-column prop="fun" label="借还"></el-table-column>

        </el-table>
    </div>
</template>

<script>
    export default {
        name: "history",
        props: [''],
        data() {
            return {
                tableData:[]
            }
        },
        methods: {

        },
        mounted() {
        },
        created() {
            let cnt={
                $table:"history",
                $where:{
                    userId:this.$userInfo().ids
                }
            }
            this.$api.get(cnt,res=>{
                this.tableData=res
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #history {

    }
</style>