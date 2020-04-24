<template>
    <div id="index">
        <div style="text-align: center;font-size: 2.5rem;margin: 3rem 0">
            <div class="news" >精彩婚礼</div>
            <div style="color: #909399">wedding recommendation</div>
        </div>

        <el-row :gutter="20">
            <el-col :span="8" v-for="(item,index) in tableData">
                <el-card style="margin-bottom: 10px" shadow="hover">
                    <div style="text-align: center;font-size: 1.8rem">
                        {{item.name}}
                    </div>
                    <div style="width: 100%;height: 190px">
                        <img :src="require('@/assets/img/car/'+item.carId+'.jpg')" width="50%" height="180px">
                        <img :src="require('@/assets/img/clothing/'+item.clothId+'.jpg')" width="50%" height="180px">
                    </div>
                    <user-image :src="item.userImg" width="30px" height="30px" border-radius="15px" style="float: left"></user-image>
                    <div style="font-size: 1.5rem;margin-top: 10px">{{item.user_name}}  {{item.address}}</div>

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
                tableData:[]
            }
        },
        methods: {},
        mounted() {
        },
        created() {
            let cnt={
                $link:{
                    table:'user',
                    left:'userId',
                    right:'userId',
                    where:'ids as userId,names as user_name,userImg'
                }
            }
            this.$api.getCloth(cnt,res=>{
                this.tableData=res
            })

        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {
        overflow: hidden;
    }
</style>