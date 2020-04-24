<template>
    <div id="index">
        <el-carousel :interval="4000" type="card" height="400px">
            <el-carousel-item v-for="item in 6" :key="item">
                <img :src="require('@/assets/img/clothing/'+item+'.jpg')" width="100%" height="400px">
            </el-carousel-item>
        </el-carousel>

        <weeding></weeding>
    </div>
</template>

<script>
    import weeding from '../wedding/index'
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
        components: {
            weeding
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