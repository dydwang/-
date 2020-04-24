<template>
    <div id="work_info">
        <el-table v-loading="loading" v-if="tableData.length>0" :data="tableData">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column  label="上传时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>
            <el-table-column prop="user_name" label="学生"></el-table-column>

            <el-table-column prop="address" label="答案">
                <template slot-scope="scope">
                    <a :href="$exImg+scope.row.myFile" target="_Blank"
                       :download="scope.row.myFile">查看</a>

                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "work_info",
        props: [''],
        data() {
            return {
                workId:'',
                testId:'',
                tableData:[],
                myWorkList:{},
                loading:false
            }
        },
        methods: {
            getWorkList(){
                let cnt={
                    $where:{
                        workId:this.workId
                    },
                    $link:{
                        table:'user',
                        left:'userId',
                        right:'userId',
                        where:'ids as userId,names as user_name'
                    }
                }
                this.$api.getWorkList(cnt,res=>{
                    this.tableData=res
                })
            },
            getTestList(){
                let cnt={
                    $where:{
                        testId:this.testId
                    }
                }
                this.$api.getTestList(cnt,res=>{
                    this.tableData=res
                })
            }
        },
        mounted() {
           this.workId=this.$route.query.workId
            this.testId=this.$route.query.testId
            if(this.workId){
                this.getWorkList()
            }else{
                this.getTestList()
            }
        },
        created() {
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #work_info {

    }
</style>