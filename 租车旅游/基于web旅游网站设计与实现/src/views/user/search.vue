<template>
    <div id="search">
        <el-input @change="changeSearch" placeholder="请输入内容" v-model="search" class="input-with-select">
            <el-select v-model="select" slot="prepend" placeholder="" style="width: 80px">
                <el-option label="景区" value="/travel"></el-option>
                <el-option label="酒店" value="/hotel"></el-option>
            </el-select>
            <el-button slot="append" icon="el-icon-search" type="primary" plain @click="changeSearch()"></el-button>
        </el-input>

    </div>
</template>

<script>
    export default {
        name: "search",
        props: [''],
        data() {
            return {
                search:'',
                select:'/travel'
            }
        },
        methods: {
            changeSearch(){
                this.$routerGo(this.select,{},(call)=>{
                    this.$center.$emit('search',this.search)
                })
            }
        },
        mounted() {
        },
        created() {
        },
        components: {},
    }
</script>

<style scoped lang='scss'>
    #search {

    }
</style>