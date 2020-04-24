<template>
    <div id="sort">
        <el-table :data="tableData">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column prop="names" label="名称"></el-table-column>
            <el-table-column prop="ids" label="ID"></el-table-column>
            <el-table-column  label="新增时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>
            <el-table-column prop="password" label="操作">
                <template slot-scope="scope" v-show="show">
                    <el-button v-if="!showSort(scope.row)" type="primary" plain round @click="addCookSort(scope.row,scope.$index)">选择</el-button>
                    <el-button v-if="showSort(scope.row)" type="warning" plain round @click="delCookSort(scope.row,scope.$index)">取消</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "sort",
        props: [''],
        data() {
            return {
                tableData:[],
                cookList:[],
                show:true
            }
        },
        methods: {
            showSort(row){
                return this.cookList.some(val=>{
                    return row.ids===val.sortId
                })
            },
            addCookSort(row,index){
                let cnt={
                    ids:Date.now(),
                    userId:this.$userInfo().ids,
                    sortId:row.ids
                }
                this.$api.addCookSort(cnt,res=>{
                    this.cookList.push(cnt)
                })
            },
            delCookSort(row){
                let cnt={
                    userId:this.$userInfo().ids,
                    sortId:row.ids
                }
                let that=this
                this.$api.delCookSort(cnt,res=>{
                    this.cookList.forEach((val,ind)=>{
                        if(val.sortId===cnt.sortId){
                            that.cookList.splice(ind,1)
                            that.show=false
                            that.show=true
                        }
                    })
                })
            },
        },
        mounted() {
        },
        created() {
            this.$api.getSort({},res=>{
                if(res) {
                    this.tableData=res
                }
            })
            this.$api.getCookSort({$where:{userId:this.$userInfo().ids}},res=>{
                this.cookList=res
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #sort {

    }
</style>