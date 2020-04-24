<template>
    <div id="index">
        <div style="margin-bottom: 0">
            <el-button v-if="grade===10||grade===0||grade===1"
                       type="primary" round plain
                       @click="ruleForm=$JSP(form);updates=false;dialogVisible=true">
                发布
            </el-button>
        </div>
        <el-dialog
                title="发布动态"
                :visible.sync="dialogVisible"
                width="600px">
            <creates ref="createNews" @closeD="closeD" :updates="updates"  :ruleForm="ruleForm" ></creates>
        </el-dialog>

        <div style="width: 180px;margin: 0 auto">
            <el-tabs v-model="moduleIndex"  style="margin-top: 26px">
                <el-tab-pane v-for="(item,index) in $team.module" :label="item" :name="''+index"></el-tab-pane>
            </el-tabs>
        </div>

        <el-table :data="tableData">
            <el-table-column label="#" type="index" width="50"></el-table-column>
            <el-table-column label="标题" prop="title"></el-table-column>
            <el-table-column label="描述" prop="text"></el-table-column>
            <el-table-column label="社团" prop="teamName"></el-table-column>
            <el-table-column label="学号" prop="username"></el-table-column>
            <el-table-column label="姓名" prop="names"></el-table-column>

            <el-table-column label="附件" prop="names">
                <template slot-scope="scope">
                    <a v-if="moduleIndex==='0'" :href="$nodeUrl+'getImg?imagePath='+scope.row.annex" target="_Blank"
                       :download="scope.row.annex">查看附件</a>
                    <div v-else-if="moduleIndex==='1'">
                        <el-button type="text" @click="dialogVideo=true;videoPath=scope.row.annex">
                            查看视频
                        </el-button>

                    </div>
                    <div v-else>
                        <el-button type="text" @click="dialogImage=true;imagePath=scope.row.annex.split(',')">
                            查看图片
                        </el-button>
                    </div>
                </template>
            </el-table-column>
        </el-table>
        <div id="dia">
            <el-dialog

                    v-if="dialogVideo"
                    :show-close="false"
                    :visible.sync="dialogVideo"
                    width="60%">
                <dyd-video :src="videoPath"></dyd-video>
            </el-dialog>

            <el-dialog
                    v-if="dialogImage"
                    :show-close="false"
                    :visible.sync="dialogImage"
                    width="60%">
                <user-image
                        style="width: 100%;float: left;margin-bottom: 10px"
                        height="300px"
                        width="100%"
                        v-for="(item,index) in imagePath" :key="index" :src="item">

                </user-image>
            </el-dialog>
        </div>

    </div>
</template>

<script>
    import creates from './create'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                imagePath:[],
                dialogImage:false,
                videoPath:null,
                dialogVideo:false,
                grade:Number(this.$userInfo().grade),
                moduleIndex:'0',
                dialogVisible:false,
                updates:false,
                ruleForm:{

                },
                form:{
                    teamName:this.$team.list[this.$userInfo().team],
                    team:this.$userInfo().team,
                    names:this.$userInfo().names,//申请用户姓名
                    username:this.$userInfo().username,//申请用户学号

                    title:'',
                    annex:'',
                    module:0,
                    text:'',
                },
                tableData:[]
            }
        },
        methods: {
            closeD(cnt){
                // if(this.updates){
                //     this.tableData.splice(this.index,1,cnt)
                // }else{
                //     this.tableData.unshift(cnt)
                // }
                this.dialogVisible=false
            },

            getShow(module){
                this.$api.getShow({$where:{module:module}},res=>{
                    this.tableData.splice(0,this.tableData.length,...res)
                })
            }

        },
        mounted() {
        },
        created() {
            this.getShow(this.moduleIndex)
        },
        components: {creates},
        watch: {
            moduleIndex(news){
                this.getShow(news)
            }
        },
    }
</script>

<style scoped lang='scss'>
    #index {
        #dia{
            .el-dialog__header{
                padding: 0 !important;
            }
        }
    }
</style>
<style  lang='scss'>
    #index {
        #dia{
            .el-dialog__header{
                padding: 0 !important;
            }
            .el-dialog__body{
                padding: 0 !important;
            }
        }
    }
</style>