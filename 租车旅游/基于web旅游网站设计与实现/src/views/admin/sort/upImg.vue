<template>
    <div id="up_image">
        <el-upload
                :action="$nodeUrl+'upFile'"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview"
                :file-list ="[]"
                :limit="5"
                :on-success="success"
                :on-remove="handleRemove">
            <i class="el-icon-plus"></i>
        </el-upload>
    </div>
</template>

<script>
    export default {
        name: "up_image",
        props: ['src'],
        data() {
            return {}
        },
        methods: {
            handleRemove(file, fileList) {
            },
            handlePictureCardPreview(file) {
                this.dialogImageUrl = file.url;
                this.dialogVisible = true;

            },
            success(path,file){
                console.log(path)
                this.$emit('success',path)
            }
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
    #up_image {

    }
</style>