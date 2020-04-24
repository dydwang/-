<template>
    <div id="course">
        <el-row :gutter="20" style="width: 100%;padding: 20px 60px" v-show="shows">
            <el-col :span="4" v-for="(item,index) in courseData" v-show="!show(item.ids)">
                <el-card>
                    <div slot="header" class="clearfix">
                        <span>{{item.course}}</span>
                        <el-button  @click="delHot(item,index)" style="float: right; padding: 3px 0;color: red" class="el-icon-star-on" type="text"></el-button>
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
                    <el-button type="text" @click="$routerGo('stu_chat',item)">交流答疑</el-button>
                </el-card>
            </el-col>
        </el-row>
    </div>
</template>

<script>
    export default {
        name: "course",
        props: [''],
        data() {
            return {
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
        },
        mounted() {
        },
        created() {
            let c={
                $link:{
                    table:'user',
                    left:'userId',
                    right:'userId',
                    where:'ids as userId,names as tea'
                },
                $where:{},
            }
            this.$api.getTeaCou(c,res=>{
                if(res) {
                    this.courseData=res
                }
            })

            this.$api.getHot({userId:this.$userInfo().ids||123},res=>{
                this.hotList=res
            })
        },
        components: {},
        watch: {
            hotLength(){
                this.shows=false
                this.shows=true
            }
        },
    }
</script>

<style scoped lang='scss'>
    #course {

    }
</style>