<template>
    <div id="index">
        <p style="font-size: 1.8rem;text-align: center">{{$team.list[$userInfo().team]}}场地预约表</p>
        <div style="margin-bottom: 3rem">
            <el-button  type="text" class="el-icon-bottom" style="float: right;margin-right: 10%" >
                <a :href="$nodeUrl+'getImg?imagePath='+annex.resource" target="_Blank"
                   :download="annex.names">点击下载附件</a>
            </el-button>

            <el-button v-if="grade===10||grade===0||grade===1"
                       type="primary" round plain
                       @click="ruleForm=$JSP(form);updates=false;dialogVisible=true">
                申请场地
            </el-button>
        </div>

        <el-dialog
                title="添加活动表"
                :visible.sync="dialogVisible"
                width="600px">
            <createS ref="createNews" @closeD="closeD" :updates="updates"  :ruleForm="ruleForm" ></createS>
        </el-dialog>

        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="描述" prop="text"></el-table-column>
            <el-table-column label="地点" prop="buildName"></el-table-column>
            <el-table-column label="学号" prop="username"></el-table-column>

            <el-table-column label="起始时间" prop="names">
                <template slot-scope="scope">
                    {{$Time(scope.row.startTime).getTime('Y-M-D h:m')}}<br>
                    {{$Time(scope.row.endTime).getTime('Y-M-D h:m')}}
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
                    names:this.$userInfo().names,//申请用户姓名
                    username:this.$userInfo().username,//申请用户学号

                    buildName:'',//地点名称
                    buildId:'',//地点Id
                    text:'',//申请理由
                    startTime:'',
                    endTime:'',
                    annex:'',
                    status:0,
                },
                tableData:[]
            }
        },
        methods: {
            closeD(cnt){
                if(this.updates){
                    this.tableData.splice(this.index,1,cnt)
                }else{
                    this.tableData.push(cnt)
                }
                this.dialogVisible=false
            },
            changeStatus(row,index,status){
                let cnt={
                    $set:{
                        status:status,
                    },
                    $where:{
                        ids:row.ids,
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
                this.$api.upActive(cnt,res=>{
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
            this.$api.getAnnex({$where:{ids:1}},res=>{
                this.annex=res[0]
            })

            this.$api.getBuild({$where:{team:this.$userInfo().team}},res=>{
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