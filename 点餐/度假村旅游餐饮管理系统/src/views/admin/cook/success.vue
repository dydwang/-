<template>
    <div id="wait">
        <el-date-picker
                v-model="time"
                type="date"
                value-format="timestamp"
                placeholder="选择日期">
        </el-date-picker>
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
                cookList:[],
                time:Date.parse(this.$Time(Date.now()).getTime('Y-M-D')),
                input:''
            }
        },
        methods: {
            getPayList(){
                let c={
                    $link:{
                        table:'goods',
                        left:'goodId',
                        right:'ids',
                        where:'*'
                    },
                    $where:{
                        status:'true',
                        'ids>':this.time ,
                        'ids<':this.time+24*60*60*1000
                    },
                    // $like:{
                    //
                    // }
                }
                // if(this.input){
                //     c.$like.names=`%${this.input}%`
                // }
                    this.$api.getPayList(c,r=>{
                        this.payList=r
                        //     .filter((value,index)=>{
                        //         return this.cookList.some(val=>{
                        //             return val.sortId===value.sortId
                        //         })
                        // })
                    })
                function kong(id) {
                    let k=''
                    for(let i=0;i<id;i++){
                        k+=' '
                    }
                    return k
                }
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
                    status:'true'
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
        watch: {
            time(news){
                this.getPayList()
            },
            input(news){
                this.getPayList()
            }
        },
    }
</script>

<style scoped lang='scss'>
    #wait {

    }
</style>