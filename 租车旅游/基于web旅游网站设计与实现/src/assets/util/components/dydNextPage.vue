<template>
    <div id="dydNextPage">
        <el-button @click="lastPage" :disabled="this.page<2">上一页</el-button>
        {{page}}
        <el-button @click="nextPage" :disabled="!showNext">下一页</el-button>
    </div>
</template>

<script>
    export default {
        name: "dydNextPage",
        props: ['num'],
        data() {
            return {
                page:1,
                count:10,
            }
        },
        computed:{
          maxPage(){
              let p=parseInt(this.num/this.count)
              return this.num%this.count===0?p:p+1
          },
            showNext(){
              return this.page<this.maxPage
            }
        },

        methods: {
            lastPage(){
                this.page--
            },
            nextPage(){
                if(this.page<this.maxPage){
                    this.page++
                }
            }
        },
        mounted() {
        },
        created() {
        },
        components: {},
        watch: {
            page(){
                this.$emit('change',this.page,this.count)
            }
        },
    }
</script>

<style scoped lang='scss'>
    #dydNextPage {

    }
</style>