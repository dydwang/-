<template>
    <div id="create">
        <el-upload
                class="upload-demo"
                drag
                :limit="1"
                :action="$nodeUrl+'upFile'"
                :on-success="success"
                :multiple="false">
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        </el-upload>
    </div>
</template>

<script>
    export default {
        name: "create",
        props: [],
        data() {
            return {}
        },
        methods: {
            success(res, file, fileList){
                this.$emit('success',res)
            },
        },
        mounted() {
        },
        created() {
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #create {

    }
</style>