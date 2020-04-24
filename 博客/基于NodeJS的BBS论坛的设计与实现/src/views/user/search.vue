<template>
    <div id="search">
        <el-input @change="changeSearch" v-model="search" placeholder="搜索帖子"></el-input>
    </div>
</template>

<script>
    export default {
        name: "search",
        props: [''],
        data() {
            return {
                search:''
            }
        },
        methods: {
            changeSearch(){
                this.$routerGo('/home',{},(call)=>{
                    this.$center.$emit('changeName',this.search)
                })
            }
        },
        mounted() {
        },
        created() {
        },
        components: {},
        watch: {
            search(news){

            }
        },
    }
</script>

<style scoped lang='scss'>
    #search {

    }
</style>