<template>
    <div id="box">
        <el-button type="primary" round plain @click="dialogVisible=true;updates=false;openDia($JSP(ruleForm))">发布任务</el-button>
        <el-dialog
                :visible.sync="dialogVisible"
                width="50%">
            <createGoods ref="createNews" @closeDia="closeDia" :updates="updates"></createGoods>
        </el-dialog>
        <el-table-column
                label="创建时间">
            <template slot-scope="scope">
                {{$Time(scope.row.ids).getTime()}}
            </template>
        </el-table-column>
        <el-table :data="tableData">
            <el-table-column
                    width="50"
                    type="index">
            </el-table-column>
            <el-table-column
                    prop="names"
                    label="名称">
            </el-table-column>
            <el-table-column
                    prop="text"
                    label="介绍">
            </el-table-column>
            <el-table-column
                    prop="money"
                    label="金币">
            </el-table-column>
            <el-table-column
                    prop="status"
                    label="状态">
            </el-table-column>
            <el-table-column
                    prop="user_name"
                    label="接取人">
            </el-table-column>
            <el-table-column
                    width="180"
                    label="审核">
                <template slot-scope="scope" >
                    <div v-show="scope.row.status==='审核中'">
                        <el-button  size="mini" plain round type="primary" @click="changeStatus(scope.row,'已完成')">通过</el-button>
                        <el-button  size="mini" plain round type="success" @click="changeStatus(scope.row,'审核不通过')">不通过</el-button>
                    </div>
                </template>
            </el-table-column>


            <el-table-column
                    width="180"
                    label="操作">
                <template slot-scope="scope">
                    <div v-show="scope.row.status==='等待接取'||scope.row.status==='审核不通过'">
                    <el-button  size="mini" plain round type="warning" @click="updateBlog(scope.row,scope.$index)">修改</el-button>
                    <el-button  size="mini" plain round type="danger" @click="chagneTtstus(scope.row,scope.$index)">删除</el-button>
                    </div>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    import createGoods from './createGoods'

    export default {
        name: "index",
        props: [''],
        data() {
            return {
                dialogVisible: false,
                tableData: [],
                ruleForm: {
                    names: '',
                    image:'',
                    text: '',
                    status:'等待接取',
                    userId:'',
                    money:1
                },
                updates: false,
                index: 0,
            }
        },
        methods: {
            changeUser(row){
                this.$api.get('user',{$where:{ids:row.userId}},res=>{
                    let cnt={
                        ids:res[0].ids,
                        money:Number(res[0].money)+Number(row.money)
                    }
                        this.$api.up('user',cnt,r=>{})
                })
            },
            changeStatus(row,status){
                let cnt={
                    ids:row.ids,
                    status:status
                }
                this.$api.up('goods',cnt,res=>{
                    this.$message.success('审核')
                    if(status==='已完成'){
                        row.status=status
                        this.changeUser(row)

                    }
                })
            },
            chagneTtstus(row,index){
                this.$api.delGoods({ids:row.ids},res=>{
                    if(res){
                        this.$message.success('删除成功')
                        this.tableData.splice(index,1)
                    }
                })
            },
            openDia(row){
                setTimeout(()=>{
                    this.$refs.createNews.openDia(this.$JSP(row),this.updates)
                },0)
            },
            updateBlog(row,index){
                this.index=index
                this.ruleForm=row
                this.updates=true
                this.dialogVisible=true
                this.openDia(this.$JSP(row))
            },
            closeDia(row,index){
                if(this.updates){
                    this.tableData.splice(index,1,row)
                }else{
                    this.tableData.unshift(row)
                }
                this.dialogVisible=false
            }

        },
        mounted() {
        },
        created() {
            let cnt={
                $link:{
                    table:'user',
                    left:'userId',
                    right:'userId',
                    where:"ids as userId,names as user_name"
                }
            }
            this.$api.getGoods(cnt,res=>{
                if(res) {
                    this.tableData=res
                }
            })
        },
        components:{
            createGoods,
        },
        watch:{
        }
    }
</script>

<style scoped lang='scss'>
    #box {

    }
</style>
