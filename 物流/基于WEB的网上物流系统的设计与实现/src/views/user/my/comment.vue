<template>
    <div id="comment">
        <el-card>
            <el-form :inline="true"  class="demo-form-inline">
                <el-form-item label="订单ID:">
                    {{query.ids}}
                </el-form-item>
                <el-form-item label="出发地:">
                    {{query.start_city}}
                </el-form-item>

                <el-form-item label="目的地:">
                    {{query.end_city}}
                </el-form-item>
                <el-form-item label="价格:">
                    {{query.price}}
                </el-form-item>

                <el-form-item label="详细地址:">
                    {{query.address}}
                </el-form-item>
            </el-form>
        </el-card>

        <comm v-show="query"  :address="query.start_city+'-'+query.end_city"></comm>
    </div>
</template>

<script>
    import comm from './com'
    export default {
        name: "comment",
        props: [''],
        data() {
            return {
                query:false
            }
        },
        methods: {},
        mounted() {
            this.query=this.$route.query
        },
        created() {
        },
        components: {comm},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #comment {

    }
</style>