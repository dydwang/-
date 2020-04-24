<template>
    <div id="index">
        <el-table :data="tableData">
        <el-table-column label="#" type="index" width="50"></el-table-column>
        <el-table-column label="ID" prop="ids"></el-table-column>
        <el-table-column label="账号" prop="username"></el-table-column>
        <el-table-column label="用户" prop="names"></el-table-column>
            <el-table-column prop="password" label="操作" width="200">
                <template slot-scope="scope">
                    <el-button type="primary" plain round @click="ruleForm=$JSP(scope.row);dialogVisible=true;index=scope.$index">修改</el-button>
                    <el-button type="warning" plain round @click="delSort(scope.$index,scope.row)">删除</el-button>
                </template>
            </el-table-column>
    </el-table>
        <el-dialog
                v-if="dialogVisible"
                :visible.sync="dialogVisible"
                width="40%">
            <userInfo @closeD="dialogVisible=false;getUser()" :userInfo="ruleForm"></userInfo>
        </el-dialog>
    </div>
</template>

<script>
    import userInfo from './myInfo'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                tableData:[],
                dialogVisible:false,
                index:0,
                ruleForm:{}
            }
        },
        methods: {
            delSort(index,row){
                let cnt={
                    $table:'user',
                    $where:{
                        ids:row.ids
                    }

                }
                this.$api.del(cnt,res=>{
                    this.$message.success('删除成功')
                    this.tableData.splice(index,1)
                })
            },
            upSort(index,row){

            },
            getUser(){
                this.$api.login({},res=>{
                    this.tableData.splice(0,this.tableData.length,...res)
                })
            }
        },
        mounted() {

        },
        created() {
            this.getUser()
        },
        components: {userInfo},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {

    }
</style>