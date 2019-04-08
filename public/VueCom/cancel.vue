 <template>
  	<div> 
  <el-button type="primary" @click="ChangdialogVisible = true">申请退墓</el-button>
  <el-dialog
    title="退墓操作"
    :visible.sync="ChangdialogVisible"
    width="730px"
    @close="closeDiaglog"
    top="5vh"
    append-to-body>
     <el-form :inline="true" :model="cancel" class="demo-form-inline" id="cancel">
     	<h3 class="title">墓穴信息</h3>
     	<div class="ele">
     	  <el-form-item label="购买人">
            <span>{{ list.buyer }}</span>
          </el-form-item>
          <el-form-item label="电话">
            <span>{{ list.phone }}</span>
          </el-form-item>
          <el-form-item label="墓主">
            <span>{{ list.vcname }}</span>
          </el-form-item>
          <el-form-item label="购买日期">
            <span>{{ list.orderbegin }}</span>
          </el-form-item>
          <el-form-item label="单据金额">
            <span>{{ list.billTolamount }}</span>
          </el-form-item>
          <el-form-item label="经办人">
            <span>{{ list.sellname }}</span>
          </el-form-item>
     	</div>
     	<h3 class="title">退费申请</h3>
       <el-form-item label="退墓联系人">
      <el-input
      v-model="cancel.buyer"
      size="small">
     </el-input>
       </el-form-item>
       <el-form-item label="联系电话">
      <el-input
      v-model="cancel.phone"
      size="small">
     </el-input>
       </el-form-item>
       <el-form-item label="工作单位">
      <el-input
      v-model="cancel.job"
      size="small">
     </el-input>
       </el-form-item>
       <el-form-item label="家庭住址">
      <el-input
      v-model="cancel.address"
      size="small">
     </el-input>
       </el-form-item>
        <el-form-item label="购墓金额">
      <el-input
      v-model="cancel.billprice"
      size="small">
     </el-input>
       </el-form-item>
        <el-form-item label="	返还金额">
      <el-input
      v-model="cancel.returnprice"
      size="small">
     </el-input>
       </el-form-item>
        <el-form-item label="退墓手续费">
      <el-input
      v-model="cancel.returnprice"
      size="small">
     </el-input>
       </el-form-item>
  <el-form-item label="退款原因">
      <el-input
      v-model="cancel.returndesc"
      size="small">
     </el-input>
       </el-form-item>
     </el-form>
        <div slot="footer" class="dialog-footer">
        <el-button>取消</el-button>
        <el-button type="primary" @click="CancelConfirm">确定</el-button>
          </div>
</el-dialog>
  	</div> 
</template>
<script>
module.exports = {
	props: {
        cid:null,
     },
    data: function() {
        return { 
       ChangdialogVisible:false,
       cancel:{
         buyer:'',
         phone:'',
         job:'',
         address:'',
         billprice:'',
         returnprice:'',
         returndesc:''
       },
       list:{
       	  buyer : '张三',
       	  phone:'13986818455',
       	  vcname:'wu',
       	  orderbegin: '2019-03-31',
       	  billTolamount:'7980',
       	  sellname:'admin',
       }
        }
    },
    methods: {
       closeDiaglog:function(){

       },
       CancelConfirm:function(){

       }
    },
}
</script>
<style>
	#cancel .el-form-item__label{
		    width: 85px;
    color: #99a9bf;
	}
    #cancel .el-form-item__content{
    	width: 120px;
    }
 
	.ele{
		background: url(../static/module/admin/img/ele.png) 0 100% repeat-x;
		    padding-bottom: 5px;
    margin-bottom: 15px;
	}
</style>