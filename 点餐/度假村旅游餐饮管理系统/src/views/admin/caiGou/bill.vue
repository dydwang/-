<template>
    <div>
        <el-date-picker
                v-model="time"
                type="month"
                format="yyyy 年 MM 月"
                value-format="timestamp"
                placeholder="选择月">
        </el-date-picker>
        <div id="main" style="width: 95%;height: 400px;"></div>

        <el-table :data="tableData" style="margin: 100px 0">
            <el-table-column type="index" label="#"></el-table-column>

            <el-table-column prop="ids" label="采购单号"></el-table-column>
            <el-table-column prop="price" label="采购总价格/元">

            </el-table-column>
            <el-table-column prop="times" label="生成采购订单时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.ids).getTime('Y-M-D')}}
                </template>
            </el-table-column>
            <el-table-column prop="times" label="采购时间">
                <template slot-scope="scope">
                    {{$Time(scope.row.times).getTime('Y-M-D')}}
                </template>
            </el-table-column>
        </el-table>
    </div>

</template>
<script>
    import echarts from 'echarts'
    export default {
        name: '',
        data() {
            return {
                charts: '',
                opinionData: ["0", "0", "0", "0", "0",'0'],//y值
                time:0,
                xAxisData:[],  //底部,
                weekList:[{
                    value:0,//时间戳
                    label:''//月号
                }],
                week:['日','一','二','三','四','五','六'],
                tableData:[]
            }
        },
        methods: {
            drawLine(id) {
                let that=this
                this.charts = echarts.init(document.getElementById(id))
                this.charts.setOption({
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['月度报表']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },

                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        },
                        trigger: 'axis'
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: that.xAxisData  //底部

                    },
                    yAxis: {
                        name:'/元',
                        type: 'value'
                    },

                    series: [{
                        name: '月度报表',
                        type: 'line',
                        stack: '总量',
                        data: this.opinionData
                    }]
                })
            },
            getWeekList(){
                //清除折线图
                this.weekList.splice(0,this.weekList.length,{
                    value:0,//时间戳
                    label:''//月号
                })
                this.xAxisData.splice(0,this.xAxisData.length)

                this.weekList[0].value=this.time
                this.weekList[0].label=this.$Time(this.time).getTime('Y-M-D')
                let timeWeek=parseInt(this.$Time(this.time).getTime('w'))//当前1号时间是星期几

                let Y=this.$Time(this.time).getTime('Y')//年
                let M=this.$Time(this.time).getTime('M')//月
                //下个月时间戳 //下个月一号0点
                if(M==='12'||M===12){Y++;M=1}else{M++}
                let nextMon=Date.parse(Y+'-'+M)

                let last={  //本月最后一天
                    value:nextMon,
                    label:this.$Time(nextMon-24*60*60*1000).getTime('M-D') //本月最后一天
                }

                if(timeWeek>1){
                    let t=this.time+((8-timeWeek)*24*60*60*1000)
                    this.weekList.push({})
                    this.weekList[1].value=t
                    this.weekList[1].label=this.$Time(t).getTime('M-D')
                }else if(timeWeek===0){
                    let t=this.time+24*60*60*1000
                    this.weekList.push({})
                    this.weekList[1].value=t
                    this.weekList[1].label=this.$Time(t).getTime('M-D')
                }
                let weekTimes=7*24*60*60*1000
                let that=this
                for(let i=0;i<6;i++){
                    let values=this.weekList[this.weekList.length-1].value+weekTimes
                    if(values<nextMon){
                        that.weekList.push({
                            value:values,
                            label:that.$Time(values).getTime('M-D')
                        })
                    }else{
                        break;
                    }
                }


                let weekListLen=this.weekList.length
                this.weekList.forEach((val,index)=>{
                    that.xAxisData.push(val.label+` 第${index+1}周`)
                })

                setTimeout(()=>{
                    that.weekList.push(last)
                    that.getOp()
                })
            },//获取底部样式
            getOp(){
                let that=this
                that.getCaiss()
                //this.opinionData.splice(0,this.opinionData.length)
                new Promise((rs)=>{
                    for(let i=0;i<that.weekList.length-1;i++){
                        that.getCai(that.weekList[i].value,that.weekList[i+1].value,i)
                    }
                    setTimeout(()=>{
                        rs(true)
                    },150)

                }).then(()=>{
                        that.$nextTick(function() {
                            console.log(that.opinionData)
                            that.drawLine('main')
                        })
                })
            },
            getCai(min,max,index){
                let cnt={
                    $where:{
                        status:'true',
                        'times>':min,
                        'times<':max
                    },

                }
                let that=this
                new Promise(rs=>{
                    that.$api.getCai(cnt,res=>{
                        if(res){
                            that.opinionData[index]=0
                            rs(res)
                        }
                    })
                }).then(res=>{
                    for(let i=0;i<res.length;i++){
                        that.opinionData[index]+=res[i].price
                    }
                })
            },
            getList(res){
                let that=this
                res.forEach(val=>{
                    that.$api.getCaiList({$where:{caiId:val.ids}},r=>{
                        that.tableList[val.ids]=r
                    })
                })
                console.log(that.tableList)
            },
            getCaiss(){
                let cnt={
                    $where:{
                        status:'true',
                        'times>':this.weekList[0].value,
                        'times<':this.weekList[this.weekList.length-1].value
                    },
                }
                this.$api.getCai(cnt,res=>{
                    this.tableData.splice(0,this.tableData.length,...res)
                    this.getList(res)
                })
            }
        },
        //调用
        mounted() {

        },
        created(){
            this.time=Date.parse(this.$Time(Date.now()).getTime('Y-M'))//该月第一天时间戳
            this.getWeekList()
        },
        watch:{
            time(){
                this.getWeekList()
            }
        }
    }
</script>
<style scoped>
    * {
        margin: 0;
        padding: 0;
        list-style: none;
    }
</style>
