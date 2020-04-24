<template>
    <div id="comment">
        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="ID" prop="ids"></el-table-column>
            <el-table-column label="用户" prop="userName"></el-table-column>
            <el-table-column label="地址" prop="address"></el-table-column>
            <el-table-column label="评论" prop="text"></el-table-column>
            <el-table-column label="赞数" prop="good"></el-table-column>
            <el-table-column label="操作" prop="good">
                <template slot-scope="scope">
                    <el-button type="primary" size="small" plain @click="delC(scope.row,scope.$index)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "comment",
        props: [''],
        data() {
            return {
                tableData:[]
            }
        },
        methods: {
            delC(row,index){
                this.$api.delComment({ids:row.ids},res=>{
                    this.tableData.splice(index,1)
                })
            }
        },
        mounted() {
        },
        created() {
            let cnt={
                $orderBY: {
                    col:'good',
                    methods:'asc'
                },
                $link:{
                    table:'user',
                    left:'userId',
                    right:'userId',
                    where:'ids as userId,names as userName,userImg'
                }
            }
            this.$api.getComment(cnt,res=>{
                if(res) {
                    this.tableData=this.$JSP(res)
                }
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #comment {

    }
</style>