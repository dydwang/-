<template>
    <div id="index">
        <el-carousel :interval="4000" type="card" height="400px">
            <el-carousel-item v-for="item in 6" :key="item">
                <img :src="require('@/assets/img/car/'+item+'.jpg')" width="100%" height="400px">
            </el-carousel-item>
        </el-carousel>
        <div style="text-align: center;font-size: 2.5rem;margin: 3rem 0">
            <div class="news" >热门婚车</div>
            <div style="color: #909399">Hot Wedding car</div>
        </div>
        <el-row :gutter="20">
            <el-col :span="6" v-for="(item,index) in $list.car">
                <el-card style="margin-bottom: 10px" shadow="hover">
                    <img :src="require('@/assets/img/car/'+index+'.jpg')" width="100%" height="180px">
                    {{item}}
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

            }
        },
        methods: {},
        mounted() {
        },
        created() {
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {
        width: 100%;
        overflow: hidden;
    }
</style>