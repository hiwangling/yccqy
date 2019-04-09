  <template>
  	<div> 
   <el-button type="primary" v-if="mtable.list !== undefined && mtable.list.length == 0" @click="MoveApply">申请迁墓</el-button>
    <el-table
      :data="mtable.list"
      border
      fit
      highlight-current-row
      style="width: 100%;margin-top: 10px">
      <el-table-column
      v-for="{ prop, label } in moveForData"
      :key="prop"
      :prop="prop"
      :label="label">
      </el-table-column>
      <el-table-column label="操作" width="150" align="center">
      <template slot-scope="scope">
        <el-button
          size="small"
          type="danger"
          @click="MoveCheck(scope.row)"
          >编辑</el-button>
          <el-button
          size="small "
          @click="MoveDelete(scope.row)"
          >删除</el-button>
      </template>
    </el-table-column>
     </el-table>
             <el-dialog
    title="迁墓管理"
    :visible.sync="MovedialogVisible"
    width="730px"
    top="5vh"
    append-to-body>
  	<el-form :inline="true" :model="move" class="demo-form-inline" id="move">
        <h3 class="title">墓穴信息</h3>
        <div style="margin-bottom: 10px;"> 
    <el-tag size="medium" type="danger" style="font-size:16px;">生态园/花坛葬三区/生态园花坛葬三区3-2</el-tag>
    </div>
      <el-form-item label="迁墓人">
      <el-input
      v-model="move.buyer"
      size="small">
     </el-input>
       </el-form-item>
 <el-form-item label="电话">
      <el-input
      v-model="move.phone"
      size="small">
     </el-input>
       </el-form-item>
        <el-form-item label="迁墓日期">
    <el-date-picker
      v-model="move.movedate"
      type="date"
      size="small"
      placeholder="选择日期"
      value-format="yyyy-MM-dd"
      >
    </el-date-picker>
       </el-form-item>
     <el-form-item label="迁墓说明" >
            <el-input
            type="textarea"
            :rows="2"
            placeholder="请输入内容"
            v-model="move.vcdesc"
            style="width: 557px;"
            >
          </el-input>
      </el-form-item>
    </el-form>
         <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="MoveConfirm">提交</el-button>
        <el-button @click="MovedialogVisible = false">关闭</el-button>
          </div>
  	</div> 
</template>
  <script>
   module.exports = {
    props: {
     cid:null,
     mtable:[Object,Array]
	},
   data: function() {
   	 this.moveForData = [
      { prop: 'c_canme', label: '编号' },
      { prop: 'buyer', label: '迁墓人' },
      { prop: 'phone', label: '电话' },
      { prop: 'movestatus', label: '状态' },
      { prop: 'movedate', label: '迁墓日期' },
      { prop: 'expiredate', label: '到期日期' }
      ];
   return { 
     MovedialogVisible:false,
     move:{
     	buyer:'',
     	phone:'',
     	movedate:'',
     	vcdesc:'',
     	cid:'',
     	id:0
     }
   }
},
methods:{
 MoveApply(){
  this.MovedialogVisible = true
 },
 MoveCheck(row){
  for (let n in row) {
   this.move[n] = row[n]
   }
  this.MovedialogVisible = true
 },
 MoveDelete(row){
 const index = this.mtable.list.indexOf(row)
     this.$confirm("您确认删除吗？", "提示", {}).then(() => {
      axios.post("../Api/Move_delete_ajax",{
      id: row.id
      })
      .then(res => {
          if(res.data.code == 0){
             this.$message({
                 message: '删除成功',
                 type: 'success'
              });
             this.mtable.list.splice(index, 1)
          }else{
             this.$message({
                 message: '删除失败',
                 type: 'warning'
              });
          }
      })  
    })
      .catch(() => {
      this.$message({message: '已取消'});
     })
 },
 MoveConfirm(){
   this.move.cid = this.cid
  axios.post("../Api/Move_submit_ajax",this.move)
  .then(res=>{
  if(res.data.code == 0){
  axios.post("../Api/movelist_ajax",{cid: this.cid})
    .then (res=> {
  this.mtable = res.data
     })
  this.$message({
       message:'操作成功',
       type: 'success'
   });
 this.MovedialogVisible = false
  }
    })
 }
}
}
</script>
<style>
	#move .el-form-item__label{
	width: 70px;
    color: #99a9bf;
	}
    #move .el-form-item__content{
    	width: 130px;
    }
    #move .el-date-editor.el-input, .el-date-editor.el-input__inner{
    	width: 130px;
    }
</style>