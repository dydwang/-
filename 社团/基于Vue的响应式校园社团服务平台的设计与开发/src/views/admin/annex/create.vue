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
            <div class="el-upload__tip" slot="tip">请上传文件</div>
        </el-upload>
    </div>
</template>

<script>
    export default {
        name: "create",
        props: ['updates','index','names'],
        data() {
            return {}
        },
        methods: {
            success(res, file, fileList){
                let cnt={
                    ids:this.index,
                    resource:res,
                    names:this.names
                }
                if(this.updates){
                    this.$api.upAnnex(cnt,res=>{
                        this.closeD(cnt)
                    })
                }else{
                    this.$api.addAnnex(cnt,res=>{
                        this.closeD(cnt)
                    })
                }
            },
            closeD(cnt){
                this.$emit('closeD',cnt)
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
    #create {

    }
</style>