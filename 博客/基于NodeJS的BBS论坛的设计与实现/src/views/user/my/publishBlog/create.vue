<template>
    <div id="box" v-if="ruleForms">
        <p style="text-align: center">发布帖子</p>
        <el-card class="box-card">
            <el-form :model="ruleForms" :rules="rules" ref="ruleForms" label-width="60px" class="demo-ruleForms">
                <el-form-item label="标题" prop="names">
                    <el-input @change="ruleForms.names=$prohibit(ruleForms.names)"  v-model="ruleForms.names"></el-input>
                </el-form-item>

                <el-form-item label="话题" prop="sortId">
                    <el-select v-model="ruleForms.sortId" placeholder="请选择">
                        <el-option
                                v-for="(item,index) in $publice.sort"
                                :key="index"
                                :label="item"
                                :value="index">
                        </el-option>
                    </el-select>
                </el-form-item>

                <el-form-item label="文章" prop="content">
                    <quill-editor
                            v-model="ruleForms.content"
                            ref="myQuillEditor"
                            :options="editorOption"
                            @blur="onEditorBlur($event)" @focus="onEditorFocus($event)"
                            @change="ruleForms.content=$prohibit(ruleForms.content)">
                    </quill-editor>
                </el-form-item>

                <el-form-item label="PDF" >
                    <upPdf ref="upPdf" @success="success" @changePdf="changePdf"></upPdf>
                </el-form-item>

                <el-form-item label="视频">
                    <upVideo ref="upVideo" @success="successVideo" @changeVideo="changeVideo"></upVideo>
                </el-form-item>
            </el-form>
            <el-button type="primary" style="width: 450px;margin-left: 50px" @click="submit">发布</el-button>
        </el-card>

    </div>
</template>

<script>
    import Vue from 'vue'
    import VueQuillEditor from 'vue-quill-editor'
    import 'quill/dist/quill.core.css'
    import 'quill/dist/quill.snow.css'
    import 'quill/dist/quill.bubble.css'
    Vue.use(VueQuillEditor)
    import upPdf from './upPdf'
    import upVideo from './upVideo'
    export default {
        name: "Login",
        props: ['index','updates','ruleForm'],
        data() {
            let ver=this.$prohibit.prototype.ver
            return {
                editorOption:{},
                pdfFile:'',
                ruleForms:false,
                tableData:[],
                rules: {
                    names: [
                        { required: true, message: '请填写标题', trigger: 'blur' },
                        { validator:ver , trigger: 'blur' }],
                    content:[
                        { validator:ver , trigger: 'blur' }],
                    sortId: [
                        { required: true, message: '请选择属于话题', trigger: 'blur' },]
                },
                videoFile:''
            }
        },
        methods: {
            changePdf(file,pdfNowPath){
                this.pdfFile=file
            },
            success(path){
                this.ruleForms.pdfPath=path
            },
            successVideo(path){
                this.ruleForms.videoPath=path
            },
            changeVideo(file){
                this.videoFile=file
            },
            openDia(form,updates){
                this.ruleForms=form
                if(updates){
                    for(let i in form){
                        this.ruleForms[i]=form[i]
                    }
                    this.ruleForms.names=form.names
                    console.log(this.ruleForms)
                }else{
                    this.ruleForms={
                        names: '',
                        pdfPath:'',
                        videoPath:'',
                        content:'',
                        good:0,
                        userId:this.$userInfo().ids,
                        sortId:'',
                        status:'通过'
                    }
                }
            },
            submit(){
                console.log(this.$userInfo().prohibit)
                if(this.$userInfo().prohibit>Date.now()){
                    this.$message.error('您已被封号，解禁时间为'+this.$Time(this.$userInfo().prohibit).getTime())
                }else{
                    let that=this
                    this.$refs.ruleForms.validate((valid) => {
                        if (valid&&this.$prohibit(this.ruleForms.content)) {
                            if(!that.ruleForms.ids)this.ruleForms.ids=Date.now();
                            console.log(this.updates)
                            if(!that.updates){
                                that.$api.addArticle(this.ruleForms,res=>{
                                    if(res){
                                        that.$message.success('发布成功')
                                        that.$emit('closeDia',this.ruleForms)
                                    }
                                })
                            }else{
                                that.$api.upArticle(this.ruleForms,res=>{
                                    if(res){
                                        that.$emit('closeDia',this.ruleForms,this.index)
                                    }
                                })
                            }

                        } else {
                            console.log('error submit!!');
                            return false;
                        }
                    });
                }

            },
            onEditorReady(editor) { // 准备编辑器
            },
            onEditorBlur(){}, // 失去焦点事件
            onEditorFocus(){}, // 获得焦点事件
            onEditorChange(){

            }, // 内容改变事件
            saveHtml:function(event){
                alert(this.content);
            }
        },
        mounted() {
        },
        created() {

        },
        components:{
            upPdf,upVideo
        }
    }
</script>

<style scoped lang='scss'>
    #box {
        width: 600px;
        margin: 50px auto;
    }
</style>
