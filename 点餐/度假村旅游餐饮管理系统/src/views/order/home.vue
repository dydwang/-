<template>
    <div id="home">
        <el-carousel :interval="4000"  height="320px">
            <el-carousel-item v-for="(item,index) in tableData" :key="index">
                <user-image width="100%" height="300px" :src="item.image"></user-image>
            </el-carousel-item>
        </el-carousel>
    </div>
</template>

<script>
    export default {
        name: "home",
        props: [''],
        data() {
            return {
                tableData:[]
            }
        },
        methods: {},
        mounted() {
            this.$api.getImage({},res=>{
                if(res) this.tableData=res;
            })
        },
        created() {

        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #home {

    }
</style>