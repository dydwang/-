<template>
    <div id="index">
        <el-select v-model="selectTeam" placeholder="请选择">
            <el-option
                    v-for="(item,index) in teamList"
                    :key="index"
                    :label="item"
                    :value="index">
            </el-option>
        </el-select>
        <p style="font-size: 1.8rem;text-align: center">{{teamList[selectTeam]}}成员表</p>
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

            <el-table-column  label="操作" >
                <template slot-scope="scope">
                    <el-button
                            type="danger"
                            size="mini"
                            round plain
                            v-show="scope.row.status==0"
                            @click="changeStatus(scope.row,scope.$index,2)">
                        通过
                    </el-button>
                    <el-button
                            type="warning"
                            size="mini"
                            round plain
                            v-show="scope.row.status==0"
                            @click="changeStatus(scope.row,scope.$index,1)">
                        未通过
                    </el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "index",
        props: [''],
        computed:{
            teamList(){
                return this.$team[this.grade]
            },
            nowTeam(){
                let that=this
                let index=this.$team.list.findIndex(val=>{
                    return val===that.$team[that.grade][that.selectTeam]
                })   //在team.list 里的下标
                return index
            }
        },
        data() {
            return {
                selectTeam:0,
                grade:this.$userInfo().grade,
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
            },
            getPer(team){
                this.$api.getPer({$where:{team:team},$orderBY:{col:'grade'}},res=>{
                    this.tableData=res
                })
            }
        },
        mounted() {
        },
        created() {
            this.$api.getAnnex({ids:3},res=>{
                this.annex=res[0]
            })

            this.getPer(this.selectTeam)


        },
        components: {},
        watch: {
            nowTeam(news){
                this.getPer(news)
            }
        },
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