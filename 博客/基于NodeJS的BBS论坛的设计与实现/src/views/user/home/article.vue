<template>
    <div id="article" ref="container">

            <div style="width: 520px;margin: 0 auto">
                <el-tabs tab-position="top" v-model="active">
                    <el-tab-pane  label="全部"></el-tab-pane>
                    <el-tab-pane v-for="(item,index) in $publice.sort" :key="index+''"  :label="item"></el-tab-pane>
                </el-tabs>
            </div>
        <div style="width: 70%;margin-left: 15%">
            <el-card shadow="hover" v-for="(item,index) in tableData" :key="index" style="margin-bottom: 20px">
                <div slot="header" class="clearfix" style="height: 20px">
                    <user-image :user-in="{userId:item.userId,userImg:item.userImg}" style="float: left;display: block" :src="item.userImg" width="2rem" height="2rem" border-radius="1rem"></user-image>
                    <div style="position: relative;top:5px;float: left">{{item.user_name}}</div>
                    <div style="position: relative;top:5px;left:10px;float: left">{{$Time(item.ids).getTime()}}</div>
                    <div style="position: relative;top:5px;float: right;">
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
        </div>


    </div>
</template>

<script>
    export default {
        name: "article",
        props: [''],
        data() {
            return {
                active:'0',
                tableData:[],
                names:'',
                container:null
            }
        },
        methods: {
            getArticle(){
                let cnt={
                    $where:
                        {
                            status:'通过',
                            sortId:this.active-1,
                            names:{$regex:`${this.names}`}
                    },
                }
                if(!this.names) delete cnt.$where.names;
                if(!this.active||this.active==0) delete cnt.$where.sortId;

                this.$api.getArticle(cnt,res=>{
                    if(res) this.tableData.splice(0,this.tableData.length,...res.reverse())

                    res.forEach((val,id) =>{
                        this.$api.get('user',
                            {
                                $where:{
                                    ids:val.userId}
                                },
                            r=>{
                                this.tableData.splice(id,1,Object.assign(this.tableData[id],{userImg:r[0].userImg,user_name:r[0].names}))
                        })
                    })
                })
            }
        },
        mounted() {
            this.container = this.$refs.container;
        },
        created() {
            this.$center.$on('changeName',data=>{
                this.names=data
                this.getArticle()
            })
            this.getArticle()
        },
        components: {},
        watch: {
            active(news){

                this.getArticle()
            }
        },
    }
</script>

<style scoped lang='scss'>
    #articles {
            min-height: 500px;
        .el-card__header{
            padding: 3px 20px !important;
        }
    }
</style>

<style  lang='scss'>
    #articles {
        .el-card__header{
            padding: 3px 20px !important;
        }
    }
</style>
