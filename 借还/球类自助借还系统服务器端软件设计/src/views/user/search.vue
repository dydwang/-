<template>
    <div id="search">
        <el-input  v-model="search" placeholder="请输入内容">
            <el-button @click="changeSearch" slot="append" icon="el-icon-search"></el-button>
        </el-input>
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