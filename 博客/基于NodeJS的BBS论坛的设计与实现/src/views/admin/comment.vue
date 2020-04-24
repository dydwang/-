<template>
    <div id="comment">
        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="评论时间" prop="ids">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>
            <el-table-column label="帖子" prop="blogId"></el-table-column>
            <el-table-column label="用户ID" prop="userId"></el-table-column>
            <el-table-column label="账号" prop="userName"></el-table-column>
            <el-table-column label="评论" prop="text"></el-table-column>
            <el-table-column label="操作" prop="user_name">
                <template slot-scope="scope">
                    <el-button round type="warning" size="mini" plain @click="deleteB(scope.row,scope.$index)">删除</el-button>
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
            deleteB(row,index){
                this.$api.delArticleComment({ids:row.ids},res=>{
                    this.tableData.splice(index,1)
                    this.$message.success('删除成功')
                })
            }
        },
        mounted() {
        },
        created() {
            let cnt={

            }
            this.$api.getArticleComment(cnt,res=>{
                if(res) this.tableData=res.reverse()
                res.forEach((val,id) =>{
                    this.$api.get('user',
                        {
                            $where:{
                                ids:val.userId}
                        },
                        r=>{
                            this.tableData.splice(id,1,Object.assign(this.tableData[id],
                                {userImg:r[0].userImg,user_name:r[0].names,userName:r[0].ids}
                                ))
                        })
                })
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
