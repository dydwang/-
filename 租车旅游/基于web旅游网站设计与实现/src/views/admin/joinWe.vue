<template>
    <div id="joinWe">
        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="ID" prop="ids"></el-table-column>
            <el-table-column label="用户" prop="userId"></el-table-column>
            <el-table-column label="问题" prop="text"></el-table-column>
            <el-table-column label="回复" prop="admin"></el-table-column>

            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button type="danger" size="mini" round plain @click="reply(scope.row,scope.index)">回复</el-button>
                    <el-button type="danger" size="mini" round plain @click="deleteImg(scope.row,scope.$index,'false')">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "joinWe",
        props: [''],
        data() {
            return {
                tableData:[]
            }
        },
        methods: {
            deleteImg(row,index,status){
                this.$api.delComment({ids:row.ids},res=>{
                    if(res) this.$message.success('删除成功')
                    this.tableData.splice(index,1)
                })
            },
            reply(row,index){
                this.$prompt('请回复内容', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    inputPattern: '',
                }).then(({ value }) => {
                    if(value){
                        let cnt={
                            ids:row.ids,
                            admin:value,
                        }
                        this.$api.upComment(cnt,res=>{
                            this.$message({
                                type: 'success',
                                message: '回复成功'
                            });
                            row.admin=value
                        })
                    }else{
                        this.$message({
                            type: 'info',
                            message: '请输入内容'
                        });
                    }


                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '取消输入'
                    });
                });
            }

        },
        mounted() {

            let cnt={
                $link:{
                    table:'user',
                    left:'userId',
                    right:'userId',
                    where:'names as user_name,ids as userId,userImg'
                }
            }
            this.$api.getComment(cnt,res=>{
                this.tableData=res
            })
        },
        created() {
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #joinWe {

    }
</style>