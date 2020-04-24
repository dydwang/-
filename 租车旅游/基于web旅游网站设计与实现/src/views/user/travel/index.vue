<template>
    <div id="index">
        <div style="text-align: center;font-size: 2.5rem;margin: 3rem 0">
            <div class="news" >热门景区</div>
            <div style="color: #909399">HOT TRAVEL</div>
        </div>
        <el-carousel height="400px">
            <el-carousel-item v-for="(item,index) in tableData.slice(0,6)" :key="index">
                <img :src="$exImg+item.image.split(',')[0]"  width="100%" style="height: 400px">
            </el-carousel-item>
        </el-carousel>
        <el-row :gutter="20">
            <el-col :span="4" v-for="(item,index) in showTable" :key="index" style="margin-bottom: 1rem">
                <div @click="$routerGo('/travel_info',item)">
                    <el-card>
                        <img style="display: block;height: 80px" :src="$exImg+item.image.split(',')[0]"   >
                        <p style="font-size: 1.5rem;text-align: center">{{item.names}}</p>
                        <div>
                            {{item.text.slice(0,10)}}
                        </div>
                        <div style="font-size: 1.5rem;color: red">
                            ￥{{item.price}}元
                        </div>
                    </el-card>
                </div>
            </el-col>
        </el-row>

        <dyd-next-page style="margin: 0 400px" :num="tableData.length" @change="changePage"></dyd-next-page>
    </div>
</template>

<script>
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                tableData:[],
                search:false,
                showTable:[]

            }
        },
        methods: {
            getGoods(){
                let cnt={}
                if(this.search){
                    cnt.$like={
                        names:`%${this.search}%`
                    }
                }
                this.$api.getGoods(cnt,res=>{
                    if(res) {
                        this.tableData=res
                        this.changePage(1,10)
                    }

                })
            },
            changePage(page,count){
                this.showTable.splice(0,this.showTable.length,...this.tableData.slice(((page-1)*count),page*count))
            }
        },
        mounted() {
        },
        created() {
            this.$center.$on('search',search=>{
                console.log(search)
                this.search=search
                this.getGoods()
            })
            this.getGoods()

        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {
        margin-bottom: 3rem;
    }
</style>