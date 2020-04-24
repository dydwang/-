<template>
    <div id="index">
        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="ID" prop="ids"></el-table-column>
            <el-table-column label="账号" prop="username"></el-table-column>
            <el-table-column label="用户" prop="names"></el-table-column>
            <el-table-column prop="grade" label="权限">
                <template slot-scope="scope">
                    {{scope.row.grade}}
                </template>
            </el-table-column>
            <el-table-column prop="password" label="操作">
                <template slot-scope="scope">
                    <el-button type="text" @click="upUser('管理员',scope.$index,scope.row)" v-if="scope.row.grade==='普通用户'">设为管理员</el-button>
                    <el-button type="text" @click="upUser('普通用户',scope.$index,scope.row)" v-else>取消管理员</el-button>
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
        methods: {
            upUser(grades,index,row){
                let cnt={
                    grade:grades,
                    ids:row.ids
                }
                this.$api.upUser(cnt,res=>{
                    if(res){
                        this.$message.success('修改成功')
                        let c=JSON.parse(JSON.stringify(this.tableData[index]))
                        c.grade=grades
                        this.tableData.splice(index,1,c)
                    }
                })
            }
        },
        mounted() {
            this.$api.login({},res=>{
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
    #index {

    }
</style>