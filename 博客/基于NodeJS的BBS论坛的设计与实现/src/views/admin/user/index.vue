<template>
    <div id="index">
        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="ID" prop="ids"></el-table-column>
            <el-table-column label="账号" prop="username"></el-table-column>
            <el-table-column label="用户" prop="names"></el-table-column>
            <el-table-column label="密码" prop="password"></el-table-column>
            <el-table-column label="操作" prop="names">
                <template slot-scope="scope">
                    <el-popover
                            placement="top-start"
                            width="200"
                            trigger="hover">
                        <el-button type="primary" size="mini" round plain @click="changePro(scope.row,scope.$index,1)">1天</el-button>
                        <el-button type="primary" size="mini" round plain @click="changePro(scope.row,scope.$index,3)">3天</el-button>
                        <el-button type="primary" size="mini" round plain @click="changePro(scope.row,scope.$index,15)">15天</el-button>
                        <el-button slot="reference" v-show="!scope.row.prohibit||Date.now()>scope.row.prohibit" round type="warning" size="mini" plain>
                            禁言
                        </el-button>
                    </el-popover>

                    <el-button v-show="!(!scope.row.prohibit||Date.now()>scope.row.prohibit)" type="primary" size="mini" round plain @click="changePro(scope.row,scope.$index,'')">解除禁言</el-button>
                    <el-button v-show="scope.row.pass==='true'" round type="warning" size="mini" plain @click="changePass(scope.row,scope.$index,'false')">封号</el-button>
                    <el-button v-show="scope.row.pass==='false'" round type="warning" size="mini" plain @click="changePass(scope.row,scope.$index,'true')">解封</el-button>
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

            changePro(row,index,prohibit){
                let cnt={
                    ids:row.ids,
                    prohibit:prohibit?prohibit*24*60*60*1000+Date.now():''
                }
                this.$api.upUser(cnt,res=>{
                    row.prohibit=cnt.prohibit
                })
            },
            changePass(row,index,pass){
                let cnt={
                    ids:row.ids,
                    pass:pass
                }
                this.$api.upUser(cnt,res=>{
                    row.pass=pass
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
        .el-button+.el-button{
            margin: 0;
        }
        .el-button--mini, .el-button--mini.is-round{
            margin-right: 8px;
        }
    }
</style>
