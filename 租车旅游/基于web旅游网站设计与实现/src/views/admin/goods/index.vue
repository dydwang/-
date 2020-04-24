<template>
    <div id="box">
        <el-button type="primary" round plain @click="dialogVisible=true;updates=false;openDia($JSP(ruleForm))">添加景区</el-button>
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
                    prop="names"
                    label="名称">
            </el-table-column>
            <el-table-column
                    prop="text"
                    label="介绍">
            </el-table-column>
            <el-table-column
                    prop="price"
                    label="价格/张">
            </el-table-column>


            <el-table-column
                    label="创建时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>

            <el-table-column
                    label="操作">
                <template slot-scope="scope">
                    <el-button  size="mini" plain round type="warning" @click="updateBlog(scope.row,scope.$index)">修改</el-button>
                    <el-button  size="mini" plain round type="danger" @click="chagneTtstus(scope.row,scope.$index)">删除</el-button>

                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    import createGoods from './createGoods'
    import up_img from './upImg'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                dialogVisible: false,
                tableData: [],
                ruleForm: {
                    names: '',
                    text: '',
                    image:[],
                    price:0,
                },
                updates: false,
                index: 0,
            }
        },
        methods: {
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
            this.$api.getGoods({},res=>{
                if(res) {
                    this.tableData=res
                }

            })

        },
        components:{
            createGoods,up_img
        },
        watch:{
        }
    }
</script>

<style scoped lang='scss'>
    #box {

    }
</style>