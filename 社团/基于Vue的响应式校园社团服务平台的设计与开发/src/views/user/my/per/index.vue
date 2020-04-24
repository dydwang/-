<template>
    <div id="index">
        <p style="font-size: 1.8rem;text-align: center">{{$team.list[$userInfo().team]}}成员表</p>
        <div style="margin-bottom: 3rem">
            <el-button  type="text" class="el-icon-bottom" style="float: right;margin-right: 10%" >
                <a :href="$nodeUrl+'getImg?imagePath='+annex.resource" target="_Blank"
                   :download="annex.names">点击下载附件</a>
            </el-button>

            <el-button v-if="grade===10||grade===0||grade===1"
                       type="primary" round plain
                       @click="ruleForm=$JSP(form);updates=false;dialogVisible=true">
                添加社团人员
            </el-button>
        </div>

        <el-dialog
                title="添加社团成员表"
                :visible.sync="dialogVisible"
                width="600px">
            <createS ref="createNews" @closeD="closeD" :updates="updates"  :ruleForm="ruleForm" ></createS>
        </el-dialog>

        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="学号" prop="username"></el-table-column>
            <el-table-column label="姓名" prop="names"></el-table-column>
            <el-table-column label="职称" prop="names">
                <template slot-scope="scope">
                    {{$team.grade[scope.row.grade]}}
                </template>
            </el-table-column>
            <el-table-column label="状态" prop="names">
                <template slot-scope="scope">
                    {{$team.status[scope.row.status]}}
                </template>
            </el-table-column>
            <el-table-column label="附件" prop="names">
                <template slot-scope="scope">
                    <a :href="$nodeUrl+'getImg?imagePath='+scope.row.annex" target="_Blank"
                       :download="scope.row.annex">查看附件</a>
                </template>
            </el-table-column>

            <el-table-column v-if="grade===10||grade===0||grade===1" label="操作" >
                <template slot-scope="scope">
                    <el-button
                            type="danger"
                            size="mini"
                            round plain
                            v-show="scope.row.status==='2'&&scope.row.grade==='2'"
                            @click="changeStatus(scope.row,scope.$index,3)">
                        已离社
                    </el-button>
                    <el-button
                            type="warning"
                            size="mini"
                            round plain
                            v-show="(scope.row.status==='2'&&(scope.row.grade==='0'||scope.row.grade==='1'))&&
                            (grade===10||grade<scope.row.grade)||scope.row.username===$userInfo().username"
                            @click="changeStatus(scope.row,scope.$index,3)">
                        已换届
                    </el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    import createS from './create'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                grade:Number(this.$userInfo().grade),
                annex:{},
                dialogVisible:false,
                updates:false,
                ruleForm:{

                },
                form:{
                    teamName:this.$team.list[this.$userInfo().team],
                    team:this.$userInfo().team,
                    names:'',
                    username:'',
                    grade:2,
                    annex:'',
                    status:0,
                    password:''
                },
                tableData:[]
            }
        },
        methods: {
            closeD(cnt){
                if(this.updates){
                    this.tableData.splice(this.index,1,cnt)
                }else{
                    this.tableData.unshift(cnt)
                }
                this.dialogVisible=false
            },
            changeStatus(row,index,status){
                let cnt={
                    $set:{
                        status:status,
                    },
                    $where:{
                        username:row.username,
                    }
                }
                this.$confirm('将会改变成员状态, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.updatestu(cnt,row)

                }).catch(() => {
                    this.$message({type: 'info', message: '已取消修改'});
                });
            },
            updatestu(cnt,row){
                this.$api.upPer(cnt,res=>{
                    if(res){
                        this.$message({type: 'success', message: '修改成功!'});
                        row.status=cnt.$set.status
                    }
                })
            }
        },
        mounted() {
        },
        created() {
            this.$api.getAnnex({$where:{ids:3}},res=>{
                this.annex=res[0]
            })

            this.$api.getPer({$where:{team:this.$userInfo().team},$orderBY:{col:'grade'}},res=>{
                this.tableData=res
            })
        },
        components: {createS},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {
        a{ text-decoration:none}
    }
</style>

<style  lang='scss'>
    #index {
        .el-button+.el-button{
            margin-right: 1rem !important;
            margin-left: 0  !important;
        }

    }
</style>