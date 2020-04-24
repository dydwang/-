<template>
    <div id="blog">
        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="ID" prop="ids"></el-table-column>
            <el-table-column label="帖子" prop="names"></el-table-column>
            <el-table-column label="话题" prop="user_name">
                <template slot-scope="scope">
                    {{$publice.sort[scope.row.sortId]}}
                </template>
            </el-table-column>
            <el-table-column label="账号" prop="user_name"></el-table-column>
            <el-table-column label="用户" prop="names"></el-table-column>
            <el-table-column label="状态" prop="status"></el-table-column>
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
        name: "blog",
        props: [''],
        data() {
            return {
                tableData:[]
            }
        },
        methods: {
            deleteB(row,index){
                this.$api.delArticle({ids:row.ids},res=>{
                    if(res){
                        this.$message.success('删除成功')
                        this.tableData.splice(index,1)
                    }
                })
            }
        },
        mounted() {
        },
        created() {
                let cnt={

                }
                this.$api.getArticle(cnt,res=>{
                    if(res) {this.tableData=res.reverse()
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
                    })}
                })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #blog {

    }
</style>
