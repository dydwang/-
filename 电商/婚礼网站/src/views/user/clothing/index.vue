<template>
    <div id="index">
        <el-carousel :interval="4000" type="card" height="400px">
            <el-carousel-item v-for="item in 6" :key="item">
                <img :src="require('@/assets/img/clothing/'+item+'.jpg')" width="100%" height="400px">
            </el-carousel-item>
        </el-carousel>
        <div style="text-align: center;font-size: 2.5rem;margin: 3rem 0">
            <div class="news" >精选婚纱</div>
            <div style="color: #909399">Selected wedding dress</div>
        </div>
        <el-row :gutter="20">
            <el-col :span="6" v-for="item in 10">
                <el-card style="margin-bottom: 10px" shadow="hover">
                    <img :src="require('@/assets/img/clothing/'+item+'.jpg')" width="100%" height="180px">
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