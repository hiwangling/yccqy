<template>	
<div> 
  <my-server v-if="status == status_ " :getmember="getmember" :cid="cid" @colorstatus="colorstatus" @outclose="outClose"></my-server>
   <el-table
      :data="schedulelist"
      border
      fit
      highlight-current-row
      style="width: 100%" v-else>
        <el-table-column
        prop="garden_name"
        label=" 墓穴信息">
      </el-table-column>
      <el-table-column
        prop="buyer"
        label="预定人">
      </el-table-column>
      <el-table-column
        prop="phone"
        label="联系电话">
      </el-table-column>
      <el-table-column
        prop="ordainprice"
        label="定金">
      </el-table-column>
      <el-table-column
        prop="ordaintype"
        label="预定方式">
      </el-table-column>
      <el-table-column
        prop="ordainbegin"
        label="预定日期">
      </el-table-column>
      <el-table-column
        prop="ordainend"
        label="到期日期">
      </el-table-column>
      <el-table-column
        prop="ts"
        label="过期天数">
         <template slot-scope="scope">
                <span v-html='scope.row.ts'></span>
         </template>
      </el-table-column>
      <el-table-column
        prop="orderstatus"
        label="状态">
      </el-table-column>
      <el-table-column
        prop="sellname"
        label="业务员">
      </el-table-column>
        <el-table-column label="操作" width="150" align="center">
      <template slot-scope="scope">
          <el-button
          size="small "
          type="danger"
          @click="handleSever(scope.$index, scope.row)"
          >编辑</el-button>
          <el-button
          size="small" @click="handleSeverDelete(scope.$index, scope.row)"
          >删除</el-button>
      </template>
    </el-table-column>
      </el-table> 
      <el-dialog
  title="墓穴预定"
  :visible.sync="dialogSever"
  width="60%"
  top="5vh"
  append-to-body>
        <my-server :reserve="Creatobj"  :cid="cid" :getmember="getmember" @closedialog="closedialog"  @update_server='update_server'></my-server>
     </el-dialog>
</div>
</template>	
<script>
module.exports = {
	props: {
    status:null,
    cid:null,
    getmember:Array,
    schedulelist:Array
	},
  components: {
    'my-server': httpVueLoader('../VueCom/components/server.vue'),
    },
  data: function() {
   return { 
     status_:1,
     dialogSever:false,
     Creatobj:[],
   }
 },
 
 methods:{
 handleSeverDelete(index,row){
   this.$confirm("确认取消预订吗？", "提示", {}).then(() => {
   this.schedulelist.splice(index, 1);
   axios.post("../Api/Schedule_delete_ajax",{id:row.id})
     .then (res=> {
        this.$message({
        message: '删除成功',
         type: 'success'
   });
 this.$emit('color_pop',{cid:this.cid,color:1})
   })
}).catch(() => {
  this.$message({message: '已取消'});
 })
 },
 colorstatus(val){
 this.$emit('color_pop',{cid:val,color:2})
 },
 handleSever(index,row){
   let obj = {
    'cid' :  this.cid
   } 
   this.Creatobj = {
    ...row,
    ...obj
   }
   this.dialogSever = true
 },
 update_server(val){
         for (const v of this.schedulelist) {
              if (v.id === val.id) {
                const index = this.schedulelist.indexOf(v)
                this.schedulelist.splice(index, 1, val)
                break
              }
        }
 },
 closedialog(val){
  this.dialogSever = val
 },
 outClose(val){
  this.$emit('closedialog',val)
 }
 }
}
</script>
 