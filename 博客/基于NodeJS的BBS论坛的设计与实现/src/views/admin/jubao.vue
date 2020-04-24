<template>
    <div id="jubao">
        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="举报时间" prop="ids">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>
            <el-table-column label="文章" prop="names"></el-table-column>
            <el-table-column label="问题" prop="text"></el-table-column>
            <el-table-column label="状态" prop="status"></el-table-column>

            <el-table-column label="操作" width="400">
                <template slot-scope="scope">
                    <el-button type="primary" v-show="scope.row.status==='等待审核'" round plain @click="upJu(scope.row,scope.$index,'举报不成立')">举报不成立</el-button>
                    <el-button type="warning" v-show="scope.row.status==='等待审核'" round plain @click="upJu(scope.row,scope.$index,'屏蔽文章')">屏蔽文章</el-button>

                    <el-button type="danger" round plain @click="deleteImg(scope.row,scope.$index,'false')">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "jubao",
        props: [''],
        data() {
            return {
                tableData:[]
            }
        },
        methods: {
            deleteImg(row,index,status){
                this.$api.del('jubao',{ids:row.ids},res=>{
                    if(res) this.$message.success('删除成功')
                    this.tableData.splice(index,1)
                })
            },
            upJu(row,index,status){
                this.$api.up('jubao',{ids:row.ids,status:status},res=>{
                    if(res) this.$message.success('修改成功')
                    row.status=status
                    if(status==='屏蔽文章'){
                        this.$api.up('article',{ids:row.blogId,status:status},r=>{

                        })
                    }
                })

            }
        },
        mounted() {
        },
        created() {
            this.$api.get('jubao',{},res=>{
                if(res)this.tableData=res.reverse()
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #jubao {

    }
</style>
