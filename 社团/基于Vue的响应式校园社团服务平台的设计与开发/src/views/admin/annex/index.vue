<template>
    <div id="index">
        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="附录名称" prop="names"></el-table-column>
            <el-table-column label="文件资源" prop="resource"></el-table-column>
            <el-table-column label="操作" prop="resource">
                <template slot-scope="scope">
                    <el-button size="mini" v-if="scope.row.resource" round plain @click="index=scope.row.ids;names=scope.row.names;updates=true;dialogVisible=true">编辑</el-button>
                    <el-button size="mini" v-if="!scope.row.resource" round plain @click="index=scope.row.ids;names=scope.row.names;updates=false;dialogVisible=true">上传</el-button>
                    <el-button size="mini"
                               v-if="scope.row.resource" type="primary"
                               round plain @click="">
                        <a :href="$nodeUrl+'getImg?imagePath='+scope.row.resource" target="_Blank"
                           :download="scope.row.names">点击下载</a>
                    </el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog
                :visible.sync="dialogVisible"
                width="400px">
            <createAn ref="createNews" @closeD="closeD" :updates="updates" :names="names" :index="index" ></createAn>
        </el-dialog>
    </div>
</template>

<script>
    import createAn from './create'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                dialogVisible:false,
                updates:false,
                names:'',
                index:0,
                tableData:[
                    {
                        ids:1,
                        names:'场地预约表',
                        resource:'',
                    },
                    {
                        ids:2,
                        names:'活动申请表',
                        resource:'',
                    },
                    {
                        ids:3,
                        names:'人事调动表',
                        resource:'',
                    },
                ]
            }
        },
        methods: {
            closeD(cnt){
                this.tableData.splice(this.index,1,cnt)
                this.dialogVisible=false
            }
        },
        mounted() {
        },
        created() {
            let that=this
            this.$api.getAnnex({},res=>{
                res.forEach((val)=>{
                    that.tableData.splice(val.ids-1,1,val)
                    //    that.tableData[val.ids-1].resource=val.resource
                })
            })
        },
        components: {
            createAn
        },
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {

    }
</style>