<template>
    <div>
        <el-button type="primary" round plain @click="dialogVisible=true;updates=false;openDia($JSP(ruleForm))">发布帖子</el-button>
        <!--<el-table :data="tableData">-->
            <!--<el-table-column-->
                    <!--width="50"-->
                    <!--type="index">-->
            <!--</el-table-column>-->
            <!--<el-table-column-->
                    <!--prop="names"-->
                    <!--label="标题">-->
            <!--</el-table-column>-->

            <!--<el-table-column-->
                    <!--prop="sortId"-->
                    <!--label="分类">-->
                <!--<template slot-scope="scope">-->
                    <!--{{$publice.sort[scope.row.sortId]}}-->
                <!--</template>-->
            <!--</el-table-column>-->


            <!--<el-table-column-->
                    <!--label="创建时间">-->
                <!--<template slot-scope="scope">-->
                    <!--{{$Time(scope.row.ids).getTime()}}-->
                <!--</template>-->
            <!--</el-table-column>-->

            <!--<el-table-column-->
                    <!--label="操作">-->
                <!--<template slot-scope="scope">-->
                    <!--<el-button  size="mini" plain round type="warning" @click="updateBlog(scope.row,scope.$index)">修改</el-button>-->
                    <!--<el-button  size="mini" plain round type="danger" @click="chagneTtstus(scope.row,scope.$index)">删除</el-button>-->
                <!--</template>-->
            <!--</el-table-column>-->
        <!--</el-table>-->

        <el-card shadow="hover" v-for="(item,index) in tableData" :key="index" style="margin-bottom: 20px">
            <div slot="header" class="clearfix" style="height: 20px">
                <user-image style="float: left;display: block" :src="$userInfo().userImg" width="2rem" height="2rem" border-radius="1rem"></user-image>
                <div style="position: relative;top:5px;float: left">{{item.user_name}}</div>
                <div style="position: relative;top:5px;left:10px;float: left">{{$Time(item.ids).getTime()}}</div>

                <el-popover
                        placement="bottom-start"
                        width="30"
                        trigger="hover">
                    <el-button style="float: right;" type="text" slot="reference" class="el-icon-more"></el-button>
                    <el-button type="text" @click="updateBlog(item,index)">编辑</el-button><br>
                    <el-button type="text" @click="chagneTtstus(item,index)">删除</el-button>
                </el-popover>
                <div style="position: relative;top:5px;float: right;margin-right: 30px">
                    <span>{{item.good}} 赞</span>
                    <!--<el-button  type="text" ><van-icon size="20" name="good-job-o" /></el-button>-->
                </div>
            </div>
            <div :style="{minHeight:item.videoPath?'225px':'no'}" >
                <dyd-video   v-if="item.videoPath" :src="item.videoPath"
                             style="width: 400px;height225px;float: left;margin-right: 30px;display: inline-block;"></dyd-video>
                <div :style="{minHeight:item.videoPath?'225px':'no'}"  style="width: 100%;height: 100%" @click="$routerGo('/artInfo',item)">
                    {{item.names}}
                </div>
            </div>

        </el-card>

        <el-dialog
                :visible.sync="dialogVisible"
                width="640px">
           <createNews ref="createNews" @closeDia="closeDia" :updates="updates" :index="index" :ruleForm="$JSP(ruleForm)"></createNews>
        </el-dialog>
    </div>
</template>

<script>
    import createNews from './create'
    export default {
        name: 'MyOrder',
        data () {
            return {
                index:'',
                tableData:[],
                dialogVisible:false,
                updates:false,
                ruleForm:{
                    names: '',
                    pdfPath:'',
                    videoPath:'',
                    content:'',
                    good:0,
                    userId:this.$userInfo().ids,
                    sortId:''
                }
            };
        },
        created() {
            this.$api.getArticle({$where:{userId:this.$userInfo().ids},$orderBY:{col:'ids',methods:'DESC'}},res=>{
                if(res) this.tableData=res
            })
        },
        methods:{
            chagneTtstus(row,index){
                this.$api.delArticle({ids:row.ids},res=>{
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
        components:{
            createNews
        }
    };
</script>

<style scoped>

</style>
