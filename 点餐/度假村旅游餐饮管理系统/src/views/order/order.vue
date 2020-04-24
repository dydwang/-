<template>
    <div id="order">
        <home></home>
        <el-tabs style="width: 85%;float: left;margin-right: 15px" v-model="activeName" @tab-click="handleClick">
            <el-tab-pane label="全部" name="-1"></el-tab-pane>
            <el-tab-pane label="推荐" name="-2"></el-tab-pane>
            <el-tab-pane v-for="(item,index) in sortData" :key="index" :label="item.names" :name="''+index"></el-tab-pane>
        </el-tabs>
        <el-badge :value="shop.length" style="">
            <el-button size="small" @click="drawer=true">已点菜品</el-button>
        </el-badge>

        <el-row :gutter="10">
            <el-col :span="5" v-for="(item,index) in tableData" :key="index">
                <el-card shadow="hover" style="height: 250px;overflow: hidden">
                    <div slot="header" class="clearfix">
                        <time class="time">{{ item.names }}</time>
                    </div>
                    <user-image :src="item.image" width="100%" height="140px"></user-image>
                    <div class="bottom clearfix">
                        <div style="margin-bottom: 5px">描述：{{item.text}}</div>
                        <span style="font-size: 1.6rem;color:red;font-weight: 600">￥{{item.price}}元</span>
                        <el-button @click="shop.unshift(item)" type="primary" plain class="button">+</el-button>
                    </div>
                </el-card>
            </el-col>
        </el-row>

        <el-drawer
                style="overflow: hidden"
                :visible.sync="drawer"
                :with-header="false"
                direction="rtl">
            <el-row :gutter="10" style="overflow: auto;height: 90vh;width: 100%;margin-bottom: 60px">
                <el-col :span="24" v-for="(item,index) in shopArray" :key="index">
                    <el-card shadow="hover" style="height:150px;overflow: hidden">
                        <div slot="header" class="clearfix">
                            <time class="time">{{ item.names }}</time>
                        </div>
                        <user-image :src="item.image" width="50px" height="50px"></user-image>
                        <div class="bottom clearfix">
                            <div style="float: right">x{{item.num}}</div>
                            <div style="margin-bottom: 5px">描述：{{item.text}}</div>
                            <span style="font-size: 1.6rem;color:red;font-weight: 600">￥{{item.price}}元</span>
                            <el-button @click="item.num+=1;changeObj(true,$JSP(item))" type="primary" plain class="button">+</el-button>
                            <el-button @click="item.num-=1;changeObj(false,$JSP(item))" type="primary" plain class="button">-</el-button>
                        </div>
                    </el-card>
                </el-col>
            </el-row>
            <van-submit-bar
                    style="width:30%;right: 0;left: 70%"
                    :price="price*100"
                    button-text="提交订单"
                    @submit="onSubmit">
            </van-submit-bar>
        </el-drawer>
    </div>
</template>

<script>
    import home from './home'
    export default {
        name: "order",
        props: [''],
        data() {
            return {
                drawer: false,
                activeName:'-1',
                sortData:[],
                tableData:[],
                shop:this.$shop(),
                shopObj:{},
                shopArray:[],
                price:0
            }
        },
        computed:{
          shopList(){
              return JSON.stringify(this.shop)
          }
        },
        methods: {
            onSubmit(){
                let that=this
                let cnt={
                    payId:this.$Time(Date.now()).getTime('YMDhms'),
                    userId:this.$userInfo().ids,
                    price:this.price,
                    ids:Date.now()
                }
                new Promise((rs)=>{
                    that.$api.addPay(cnt,res=>{
                        if(res){
                            for(let i in that.shopObj){
                                let c={
                                    payId:cnt.payId,
                                    goodId:that.shopObj[i].ids,
                                    num:that.shopObj[i].num,
                                    status:'false',
                                    ids:cnt.ids
                                }
                                that.$api.addPayList(c,res=>{

                                })
                            }
                            rs(true)
                            this.$message.success('提交成功')
                        }
                    })
                }).then(()=>{
                    that.shop=[]
                    that.drawer=false
                })
            },
            changeObj(status,item){
                let num=item.num
                delete item.num;
                if(status){
                    this.shop.push(item)
                }else{
                    for(let i=0;i<this.shop.length;i++){
                        if(this.shop[this.shop.length-1-i].ids===item.ids){
                            this.shop.splice(this.shop.length-1-i,1)
                            break;
                        }
                    }
                }

            },
            getShopObj(){
                this.shopObj={}
                let that=this
                this.shop.forEach(val=>{
                    if(!this.shopObj[val.ids]){
                        let news=that.$JSP(val)
                        news.num=1
                        that.shopObj[val.ids]=news
                    }else{
                        that.shopObj[val.ids].num+=1
                    }
                })
                this.shopArray=[]
                for(let i in this.shopObj){
                    this.shopArray.push(this.shopObj[i])
                }
                console.log(this.shopObj)
                this.getPrices()
            },
            handleClick(){

            },
            getGoods(){
                let cnt={}
                if(this.activeName!=='-1'&&this.activeName!=='-2'){
                    cnt.sortId=this.sortData[Number(this.activeName)].ids
                }else if(this.activeName==='-2'){
                    cnt.status='true'
                }
                this.$api.getGoods({$where:cnt},res=>{
                    if(res) {
                        this.tableData.splice(0,this.tableData.length,...res)
                    }
                })
            },
            getPrices(){
                let p=0
                for(let i in this.shopObj){
                    p+=this.shopObj[i].price*this.shopObj[i].num
                }
                this.price=p
            }
        },
        mounted() {
            this.getShopObj()
        },
        created() {
            this.$api.getSort({},res=>{
                if(res) {
                    this.sortData=res
                }
            })
            this.getGoods()
        },
        components: {home},
        watch: {
            activeName(){
                this.getGoods()
            },
            shopList(){
                this.$shop(this.shop)
                this.getShopObj()

            }
        },
    }
</script>

<style scoped lang='scss'>
    #order {

    }
</style>
<style lang="scss">
    #order {
    .time {
        font-size: 13px;
        color: #4b4747;
    }

    .bottom {
        margin-top: 13px;
        line-height: 12px;
    }

    .button {
        padding:5px 10px;
        float: right;
        margin-top: -5px;
    }

    .image {
        width: 100%;
        display: block;
    }

    .clearfix:before,
    .clearfix:after {
        display: table;
        content: "";
    }

    .clearfix:after {
        clear: both
    }
    .el-card__body{
        padding: 5px;
    }
    .el-card__header{
        padding:5px;
        border: 0;
    }
    }

</style>