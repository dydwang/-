<template>
    <div id="index">
        <el-carousel height="500px"  type="card" :interval="2000">
            <el-carousel-item v-for="(item,index) in tableData" :key="index">
                <img :src="$exImg+item.image"  width="100%" style="height: 500px">
            </el-carousel-item>
        </el-carousel>
        <articles></articles>
    </div>
</template>

<script>
    import  articles from './article'
    export default {
        name: "index",
        props: [''],
        data() {
            return {
                tableData:[],
                news:'wswwss'
            }
        },
        methods: {
        },
        mounted() {
            this.$api.getImage({},res=>{
                if(res) this.tableData=res;
            })
        },
        created() {
        },
        components: {articles
        },
        watch: {},
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