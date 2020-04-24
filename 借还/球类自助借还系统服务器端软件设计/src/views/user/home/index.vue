<template>
    <div id="index">
        <el-carousel height="500px"  type="card" :interval="2000">
            <el-carousel-item v-for="(item,index) in tableData" :key="index">
                <img :src="$exImg+item.image"  width="100%" style="height: 500px">
            </el-carousel-item>
        </el-carousel>

        <el-row :gutter="10" style="width: 90%;margin: 0 5%">
            <el-col :span="6" v-for="(item,index) in sortData">
                <el-card>
                    <div slot="header" class="clearfix">
                        <span>{{item.names}}</span>
                        <el-button @click="ruleForm=$JSP(item);num=Number($JSP(item).num-$JSP(item).borrow);dialogVisible=true" style="float: right; padding: 3px 0" type="text">借球</el-button>
                    </div>
                    <user-image :src="item.image" width="100%" height="180px"></user-image>
                    <el-row>
                        <el-col :span="6">
                            库存：{{item.num}}
                        </el-col>
                        <el-col :span="6">
                            已借：{{item.borrow}}
                        </el-col>
                        <el-col :span="6">
                            可借：{{item.num-item.borrow}}
                        </el-col>
                    </el-row>
                </el-card>
            </el-col>
        </el-row>

        <el-dialog
                v-if="dialogVisible"
                :visible.sync="dialogVisible"
                width="40%">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px" class="demo-ruleForm">
                <el-form-item label="球类名称" >
                    {{ruleForm.names}}
                </el-form-item>
                <el-form-item label="库存数量" >
                    {{num}}
                </el-form-item>
                <el-form-item label="借球数量" prop="num">
                    <el-input-number v-model="ruleForm.num"
                                     :min="1" :max="num" :step="1"  label="库存数量">

                    </el-input-number>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')" v-if="!update">立即借球</el-button>
                    <el-button @click="resetForm('ruleForm')">取消</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>
    </div>
</template>

<script>

    export default {
        name: "index",
        props: [''],
        data() {
            return {
                tableData:[],
                sortData:[],
                search:'',
                dialogVisible:false,
                ruleForm:{},
                rules: {
                    num: [{ required: true, message: '请输入借球数量', trigger: 'blur' },],
                },
                num:0
            }
        },
        methods: {
            submitForm(formName) {
                if(this.$userInfo().ids){
                    this.$refs[formName].validate((valid) => {
                        if (valid) {
                            let cnt={
                                $where:this.$JSP(this.ruleForm),
                                $table:'pay'
                            }
                            cnt.$where.ballId=cnt.$where.ids
                            cnt.$where.ids=Date.now()
                            cnt.$where.userId=this.$userInfo().ids
                            cnt.$where.status=''
                            cnt.$where.fun='借球'
                            this.$api.add(cnt,res=>{
                                if(res){
                                    this.$message.success('添加成功')
                                    this.dialogVisible=false

                                    let cnt_copy=this.$JSP(cnt)
                                    cnt_copy.$table='history'
                                    this.$api.add(cnt_copy,r=>{

                                    })

                                }
                            })
                        } else {
                            console.log('error submit!!');
                            return false;
                        }
                    });
                }else{
                    this.$message.error('请先登陆')
                }

            },
            getSort(){
                let cnt={
                    $like:{
                        names:`%${this.search}%`
                    }
                }
                if(!this.search){
                   delete cnt.$like
                }
                this.$api.getSort(cnt,res=>{
                    if(res) {
                        this.sortData=res
                    }
                })
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
                this.dialogVisible=false
            }
        },
        mounted() {
            if(!this.search){
                this.getSort()
            }
        },
        created() {
            this.$api.getImage({},res=>{
                if(res) this.tableData=res;
            })

            this.$center.$on('changeName',search=>{
                this.search=search

                this.getSort()
            })
        },
        components: {
        },
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #index {
        .el-carousel__item--card.is-active{
            width: 68%;
           position: absolute;
            left: -10%;
        }
    }
</style>