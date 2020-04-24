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
        <p style="font-size: 1.8rem;text-align: center">{{teamList[selectTeam]}}活动申请</p>
        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="活动主题" prop="activeName"></el-table-column>
            <el-table-column label="学号" prop="username"></el-table-column>
            <el-table-column label="姓名" prop="names"></el-table-column>
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
            <el-table-column label="操作" prop="names" width="180">
                <template slot-scope="scope">
                    <el-button
                            type="danger"
                            size="mini"
                            round plain
                            v-show="scope.row.status==0"
                            @click="changeStatus(scope.row,scope.$index,4)">
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
                grade:this.$userInfo().grade,
                selectTeam:0,
                tableData:[]
            }
        },
        methods: {
            changeStatus(row,index,status){
                let cnt={
                    $set:{
                        status:status,
                    },
                    $where:{
                        ids:row.ids,
                    }
                }
                this.$confirm('将会改变活动申请表状态, 是否继续?', '提示', {
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
            },
            getActive(team){
                this.$api.getActive({$where:{team:team}},res=>{
                    this.tableData.splice(0,this.tableData.length,...res)
                })
            }
        },
        mounted() {
        },
        created() {
            this.getActive(this.selectTeam)
        },
        components: {},
        watch: {
            nowTeam(news){
                this.getActive(news)
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