<template>
    <div id="box">
        <el-button type="primary" round plain @click="dialogVisible=true;updates=false;openDia($JSP(ruleForm))">发布菜品</el-button>
        <el-dialog
                :visible.sync="dialogVisible"
                width="50%">
            <createGoods ref="createNews" @closeDia="closeDia" :updates="updates"></createGoods>
        </el-dialog>

        <el-table :data="tableData">
            <el-table-column
                    width="50"
                    type="index">
            </el-table-column>
            <el-table-column
                    prop="ids"
                    label="ids">
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
                    prop="price"
                    label="价格">
            </el-table-column>
            <el-table-column
                    prop="sortId"
                    label="种类">
                <template slot-scope="scope">
                    {{getSorts(scope.row.sortId)}}
                </template>
            </el-table-column>

            <el-table-column
                    width="250"
                    label="操作">
                <template slot-scope="scope">
                    <el-button  size="mini" plain round type="warning" @click="updateBlog(scope.row,scope.$index)">修改</el-button>
                    <el-button  size="mini" plain round type="danger" @click="chagneTtstus(scope.row,scope.$index)">删除</el-button>
                    <el-button v-show="scope.row.status==='false'"  size="mini" plain round type="warning" @click="changeS(scope.row,scope.$index,'true')">推荐</el-button>
                    <el-button v-show="scope.row.status!=='false'"  size="mini" plain round type="warning" @click="changeS(scope.row,scope.$index,'false')">不推荐</el-button>
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
                    price:0,
                    sortId:'',
                    status:'false'
                },
                updates: false,
                index: 0,
                sortData:[]
            }
        },
        methods: {
            changeS(row,index,status){
              let cnt={
                  ids:row.ids,
                  status:status
              }
              this.$api.upGoods(cnt,res=>{
                  row.status=status
              })
            },
            getSorts(sortId){
                return this.sortData.filter(val=>{
                    return sortId===val.ids
                })[0].names
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
            this.$api.getSort({},res=>{
                if(res) {
                    this.sortData=res
                }
            })
            this.$api.getGoods({},res=>{
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