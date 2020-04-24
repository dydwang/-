<template>
    <div id="index">
        <el-button type="primary" round plain @click="dialogVisible=true;updates=false;ruleForm=$JSP(form)">发布</el-button>
        <el-dialog
                :visible.sync="dialogVisible"
                width="500px">
            <create ref="createNews" @closeDia="closeDia" :updates="updates"  :ruleForm="ruleForm"></create>
        </el-dialog>

        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="ID" prop="ids"></el-table-column>
            <el-table-column label="婚礼名称" prop="name"></el-table-column>
            <el-table-column label="喜车" prop="names">
                <template slot-scope="scope">
                    <img :src="require('@/assets/img/car/'+scope.row.carId+'.jpg')" width="80px" height="80px"><br>
                    {{$list.car[scope.row.carId]}}
                </template>
            </el-table-column>
            <el-table-column label="婚纱" prop="names">
                <template slot-scope="scope">
                    <img :src="require('@/assets/img/clothing/'+scope.row.clothId+'.jpg')" width="80px" height="80px">
                </template>
            </el-table-column>
            <el-table-column label="操作" prop="names">
                <template slot-scope="scope">
                    <el-button type="primary" round plain @click="dialogVisible=true;updates=true;ruleForm=$JSP(scope.row)">
                        修改
                    </el-button>

                    <el-button type="primary" round plain @click="deleteW(scope.row,scope.$index)">
                        删除
                    </el-button>

                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    import create from './create'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                dialogVisible:false,
                form:{
                    name:'',//婚礼名称
                    address:'',//地址
                    carId:'',//喜车
                    clothId:'',//婚纱,
                    userId:this.$userInfo().ids

                },
                ruleForm:{},
                updates:false,
                tableData:[]
            }
        },
        methods: {
            closeDia(row){
                if(row){
                    if(this.updates){
                        this.tableData.splice(index,1,row)
                    }else{
                        this.tableData.unshift(row)
                    }
                }
                this.dialogVisible=false
            },
            deleteW(row,index){
                this.$api.delCloth({ids:row.ids},res=>{
                    this.tableData.splice(index,1)
                    this.$message.success('删除成功')
                })
            }

        },
        mounted() {
        },
        created() {
            this.$api.getCloth({$where:{userId:this.$userInfo().ids}},res=>{
                this.tableData=res
            })

        },
        components: {create},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {

    }
</style>