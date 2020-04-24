<template>
    <div id="wait">
        <el-table :data="payList">
            <el-table-column type="index" width="50"></el-table-column>
            <el-table-column prop="names" label="物品"></el-table-column>
            <el-table-column prop="price" label="单价"></el-table-column>
            <el-table-column prop="num" label="数量"></el-table-column>
            <el-table-column prop="password" label="下单时间">
                <template slot-scope="scope" v-show="show">
                    {{$Time(scope.row.ids).getTime()}}
                </template>
            </el-table-column>
            <el-table-column prop="password" label="操作">
                <template slot-scope="scope" v-show="show">
                    <el-button type="primary" plain round @click="changes(scope.row,scope.$index)">已做</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "wait",
        props: [''],
        data() {
            return {
                payList:[],
                cookList:[]
            }
        },
        methods: {
            changes(row,index){
                let cnt={
                    $where:{
                        payId:row.payId,goodId:row.goodId,
                    },
                    $set:{
                        status:'true'
                    }
                }
                this.$api.upPayList(cnt,res=>{
                    this.payList.splice(index,1)
                    this.$message.success('成功')
                })
            }
        },
        mounted() {
        },
        created() {
            let c={
                $link:{
                    table:'goods',
                    left:'goodId',
                    right:'ids',
                    where:'*'
                },
                $where:{
                   status:'false'
                },

            }
            this.$api.getCookSort({$where:{userId:this.$userInfo().ids}},res=>{
                this.cookList=res

                this.$api.getPayList(c,r=>{
                    this.payList=r.filter((value,index)=>{
                        return res.some(val=>{
                            return val.sortId===value.sortId
                        })
                    })
                })
            })
            function kong(id) {
                let k=''
                for(let i=0;i<id;i++){
                    k+=' '
                }
                return k
            }
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #wait {

    }
</style>