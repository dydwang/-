<template>
    <div id="number">
        <el-date-picker
                v-model="time"
                type="date"
                value-format="timestamp"
                placeholder="选择日期">
        </el-date-picker>

        <div id="main" style="width: 95%;height: 400px;"></div>
    </div>
</template>

<script>
    import echarts from 'echarts'
    export default {
        name: "number",
        props: [''],
        data() {
            return {
                time:Date.parse(this.$Time(Date.now()).getTime('Y-M-D')),
                opinionData: ["0", "0", "0", "0", "0",'0',"0", "0", "0", "0", "0",'0','0'],//y值
                xAxisData:['8','9','10','11','12','13','14','15','16','17','18','19','20'],  //底部,
                tableData:[],
            }
        },
        methods: {
            getMoney(){
                let that=this
                this.opinionData=[0, 0, 0,0, 0, 0,0, 0, 0,0, 0, 0,0 ],//y值

                this.tableData.forEach((val,index)=>{
                    let hou=Number(that.$Time(val.ids).getTime('h'))
                    console.log(hou)
                    if(hou>7&&hou<21){
                        that.opinionData[hou-8]+=Number(val.price)
                    }
                })

                setTimeout(()=>{
                    console.log(that.opinionData)
                    that.$nextTick(function() {
                        that.drawLine('main')
                    })
                },150)


            },
            getPay(){
                let cnt={
                    $link:{
                        table:'user',
                        left:'userId',
                        right:'userId',
                        where:'ids as userId,names as userName'
                    },
                    $where:{
                        'ids>':this.time ,
                        'ids<':this.time+24*60*60*1000
                    }
                }
                this.$api.getPay(cnt,res=>{
                    if(res){
                        this.tableData.splice(0,this.tableData.length,...res)
                        this.getMoney()
                    }
                })
            },
            drawLine(id) {
                let that=this
                this.charts = echarts.init(document.getElementById(id))
                this.charts.setOption({
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['日销量']
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
                        name: '日销量',
                        type: 'line',
                        stack: '总量',
                        data: this.opinionData
                    }]
                })
            },
        },
        mounted() {

        },
        created() {
            this.getPay()
        },
        components: {},
        watch: {
            time(){
                this.getPay()
            }
        },
    }
</script>

<style scoped lang='scss'>
    #number {

    }
</style>