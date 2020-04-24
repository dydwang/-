<template>
    <div id="search">
        <div style="width: 240px;float: left">
            <el-input @change="changeSearch" v-model="search" placeholder="请输入内容"></el-input>
        </div>
        <div style="width: 120px;float: left">
            <el-select v-model="grade" placeholder="上课年纪">
                <el-option
                        v-for="item in gradeList"
                        :key="item"
                        :value="item">
                </el-option>
            </el-select>
        </div>

    </div>
</template>

<script>
    export default {
        name: "search",
        props: [''],
        data() {
            return {
                search:'',
                gradeList:[
                    '一年级上','一年级下','二年级上','二年级下','三年级上','三年级下',
                    '四年级上','四年级下','五年级上','五年级下','六年级上','六年级下',
                    '初一年级上','初一年级下','初二年级上','初二年级下','初三年级上','初三年级下',
                    '高一年级上','高一年级下','高二年级上','高二年级下','高三年级上','高三年级下',
                ],
                grade:''
            }
        },
        methods: {
            changeSearch(){
                let cnt={
                    names:this.search,
                    grade:this.grade
                }
                this.$routerGo('/home', {},()=>{
                        this.$center.$emit('changeSearch',cnt)
                })
            }
        },
        mounted() {
        },
        created() {
        },
        components: {},
        watch: {
            grade(news){
                this.changeSearch()
            }
        },
    }
</script>

<style scoped lang='scss'>
    #search {
        width: 360px;
    }
</style>