<template>
    <div id="info" v-if="query.image">
        <p style="text-align: center;font-size: 3rem">{{query.names}}</p>
        <el-row :gutter="70" style="height:400px">
            <el-col :span="10">
                <el-carousel height="400px">
                    <el-carousel-item v-for="(item,index) in query.image.split(',')" :key="index">
                        <img :src="$exImg+item"  width="100%" style="height: 400px">
                    </el-carousel-item>
                </el-carousel>
            </el-col>
            <el-col :span="14" style="height:400px">
                <div style="font-size: 1.5rem">
                    描述：{{query.text}}
                </div>

                <div style="font-size: 1.5rem;margin-top: 2rem">
                    日期：<el-date-picker
                        v-model="time"
                        type="date"
                        placeholder="选择使用日期"
                        format="yyyy 年 MM 月 dd 日"
                        value-format="timestamp">
                    </el-date-picker>
                </div>

                <div style="font-size: 1.5rem;margin-top: 2rem">
                    数量：<el-input-number step-strictly :step="1" v-model="num"  :min="1" label="描述文字"></el-input-number>
                </div>

                <div style="font-size: 2rem;color: red;margin-top: 2rem">
                    价格：￥{{query.price}}元/张
                </div>

                <div style="position: absolute;bottom: 0;">
                    <div style="color: red;font-size: 3rem;margin-top: 0;float: left;margin-right: 2rem">￥{{price}}元</div>

                    <el-button  type="danger" @click="dialogVisible=true">提交订单</el-button>
                </div>
            </el-col>
        </el-row>

        <el-dialog
                title="点击图片支付"
                :visible.sync="dialogVisible"
                width="340px">
            <div>
                <img src="@/assets/pay.jpg" width="300px" @click="submit()">
            </div>

        </el-dialog>
    </div>
</template>

<script>
    export default {
        name: "info",
        props: [''],
        data() {
            return {
                query:{},
                num:1,
                time:'',
                dialogVisible:false
            }
        },
        methods: {
            submit(){
                if(!this.time||!this.$userInfo().ids){
                    this.$message.error('请选择使用日期或先登陆')
                    this.dialogVisible=false
                }else{
                    let cnt={
                        ids:Date.now(),
                        userId:this.$userInfo().ids,
                        name:this.query.names+'景点门票',
                        num:this.num,
                        price:this.query.price,
                        time:this.time

                    }
                    this.$api.addPay(cnt,res=>{
                        this.$message.success('支付成功')
                        this.$routerGo('./paySuccess')
                    })
                }
            }
        },
        computed:{
          price(){
              return this.num*this.query.price
          }
        },
        mounted() {
            this.query=this.$route.query
        },
        created() {
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #info {
        padding:0 10rem 3rem 10rem;
    }
</style>