<template>
    <div id="index">
        <el-carousel height="500px"  type="card" :interval="2000">

            <el-carousel-item v-for="(item,index) in tableData" :key="index">
                <img :src="$exImg+item.image"  width="100%" style="height: 500px">
            </el-carousel-item>
        </el-carousel>


        <div style="text-align: center;font-size: 2.5rem;margin: 3rem 0">
            <div class="news" @click="$routerGo('news')">热门课程</div>
            <div style="color: #909399">HOT COURSE</div>
        </div>

        <el-row :gutter="20" style="width: 100%;padding: 20px 60px" v-show="shows">
            <el-col :span="4" v-for="(item,index) in courseData">
                <el-card>
                    <div slot="header" class="clearfix">
                        <span>{{item.course}}</span>
                        <el-button v-show="show(item.ids)" @click="addHot(item,index)" style="float: right; padding: 3px 0" class="el-icon-star-off" type="text"></el-button>
                        <el-button v-show="!show(item.ids)" @click="delHot(item,index)" style="float: right; padding: 3px 0;color: red" class="el-icon-star-on" type="text"></el-button>
                    </div>
                    <div style=";font-size: 1rem">

                       教师： {{item.tea}}
                    </div>
                    <div style=";font-size: 1rem">
                        年纪：{{item.grade}}
                    </div>
                    <div style=";font-size: 1rem">
                        地点：{{item.address}}
                    </div>
                </el-card>
            </el-col>
        </el-row>
    </div>
</template>

<script>

    export default {
        name: "index",
        props: [''],
        data() {
            return {
                tableData:[],
                news:'wswwss',
                courseData:[],
                hotList:[],
                shows:true
            }
        },
        computed:{
          hotLength(){
              return this.hotList.length
          }
        },
        methods: {
            show(ids){
                return !this.hotList.some(val=>{
                    return val.courseId===ids
                })
            },
            delHot(item,index){
                let cnt={
                    courseId:item.ids,
                    userId:this.$userInfo().ids
                }
                this.$api.delHot(cnt,res=>{
                    let i=this.hotList.findIndex(val=>{
                        return val.courseId===item.ids
                    })
                    this.hotList.splice(i,1)
                })
            },
            addHot(item,index){
                if(this.$userInfo().ids){
                    let cnt={
                        ids:Date.now(),
                        userId:this.$userInfo().ids,
                        courseId:item.ids,
                        teaId:item.userId
                    }
                    this.$api.addHot(cnt,res=>{
                        if(res){
                            this.hotList.push(cnt)
                        }
                    })
                }else{
                    this.$message.error('请先登陆')
                }
            },
            getCourse(search){
                let c={
                    $link:{
                        table:'user',
                        left:'userId',
                        right:'userId',
                        where:'ids as userId,names as tea'
                    },
                    $where:{},
                }
                if(search.grade){
                    c.$where={}
                    c.$where.grade=search.grade;
                }
                if(search.names){
                    c.$like={}
                    c.$like.course=`%${search.names}%`
                }
                this.$api.getTeaCou(c,res=>{
                    if(res) {
                        this.courseData=res
                    }
                })
            }
        },
        mounted() {
            this.$api.getImage({},res=>{
                if(res) this.tableData=res;
            })
        },
        created() {
            this.getCourse({})
            this.$center.$on('changeSearch',cnt=>{
                this.getCourse(cnt)
            })
            this.$api.getHot({userId:this.$userInfo().ids||123},res=>{
                this.hotList=res
            })

        },
        components: {
        },
        watch: {
            hotLength(){
                this.shows=false
                this.shows=true
            }
        },
    }
</script>

<style scoped lang='scss'>
    #index {
        .el-carousel__item--card.is-active{
            width: 68%;
           position: absolute;
            left: -10%;
        }
    }
</style>