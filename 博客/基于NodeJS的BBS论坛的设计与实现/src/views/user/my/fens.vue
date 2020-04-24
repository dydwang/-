<template>
    <div id="fens">
        <el-table :data="myStart">
        <el-table-column
        width="50"
        type="index">
        </el-table-column>
            <el-table-column
                    label="头像">
                <template slot-scope="scope">
                    <user-image width="60px" height="60px" border-radius="30px" :src="scope.row.userImg"></user-image>
                </template>
            </el-table-column>
        <el-table-column
        prop="user_name"
        label="用户名">
        </el-table-column>

        <el-table-column
        label="关注时间">
        <template slot-scope="scope">
        {{$Time(scope.row.ids).getTime()}}
        </template>
        </el-table-column>

        <el-table-column
        label="操作">
        <template slot-scope="scope">
            <el-button  size="mini" plain round type="primary"
                        @click="$routerGo('/userInfo',{userId:scope.row.star})">
                查看
            </el-button>
        <el-button  size="mini" plain round type="danger" @click="deleteUser(scope.row,scope.$index)">取消关注</el-button>
        </template>
        </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        name: "fens",
        props: [''],
        data() {
            return {
                myStart:[]
            }
        },
        methods: {
            deleteUser(row,index){
                let cnt={
                    star:row.star,
                    fens:this.$userInfo().ids
                }
                this.$api.delUserGood(cnt,res=>{
                    this.myStart.splice(index,1)
                })
            }
        },
        mounted() {
        },
        created() {
            let cnt={
                $where:{fens:this.$userInfo().ids},
            }
            this.$api.getUserGood(cnt,res=>{
                if(res) {this.myStart=res.reverse()
                    res.forEach((val,id) =>{
                        this.$api.get('user',
                            {
                                $where:{
                                    ids:val.userId}
                            },
                            r=>{
                                this.myStart.splice(id,1,Object.assign(this.myStart[id],
                                    {userImg:r[0].userImg,user_name:r[0].names,userName:r[0].ids}
                                ))
                            })
                    })}
            })
        },
        components: {},
        watch: {},
    }
</script>

<style scoped lang='scss'>
    #fens {

    }
</style>
