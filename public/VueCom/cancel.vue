 <template>
  	<div> 
  <el-button type="primary" @click="CancelApply" >申请退墓</el-button>
    <el-table
      :data="ctable.list"
      border
      fit
      highlight-current-row
      style="width: 100%;margin-top: 10px">
      <el-table-column
      v-for="{ prop, label } in cancelForData"
      :key="prop"
      :prop="prop"
      :label="label">
      </el-table-column>
      <el-table-column label="操作" width="150" align="center">
      <template slot-scope="scope">
        <el-button
          size="small"
          type="danger"
          @click="CancelCheck(scope.row)"
          >查看</el-button>
          <el-button
          size="small "
          >删除</el-button>
      </template>
    </el-table-column>
     </el-table>

 <el-dialog
    title="查看退墓处理结果"
    :visible.sync="CanceldialogVisible"
    width="730px"
    top="5vh"
    append-to-body>
<el-form :inline="true" :model="cancel" class="demo-form-inline" id="cancel">
        <h3 class="title">墓穴信息</h3>
      <div>
        <el-form-item label="购买人">
            <span>{{ list.buyer }}</span>
          </el-form-item>
          <el-form-item label="电话">
            <span>{{ list.phone }}</span>
          </el-form-item>
          <el-form-item label="墓主">
            <span v-for="item in list.bury">{{ item }},</span>
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
            <h3 class="title" style="font-size:16px">购墓收费明细</h3>
      <div class="ele">
        <el-form-item :label="item.selltitle" v-for="item in Financeinfo">
            <span>{{ item.realprice }}</span>
          </el-form-item>
        </div>
           <h3 class="title">退费申请</h3>
              <div >
        <el-form-item label="申请人">
            <span>{{ cancellist.buyer }}</span>
          </el-form-item>
          <el-form-item label="联系电话">
            <span>{{ cancellist.phone }}</span>
          </el-form-item>
          <el-form-item label="购墓金额">
              <span>{{ cancellist.billprice }}</span>
          </el-form-item>
          <el-form-item label="退还金额">
            <span>{{ cancellist.billprice - cancellist.readprice}}</span>
          </el-form-item>
          <el-form-item label="手续费">
            <span>{{ cancellist.readprice }}</span>
          </el-form-item>
          <el-form-item label="申请日期">
            <span>{{ cancellist.create_time }}</span>
          </el-form-item>
          <el-form-item label="申请原因">
            <span>{{ cancellist.returndesc }}</span>
          </el-form-item>
          <el-form-item label="处理状态">
            <span style="color:red">{{ cancellist.isok == 0 ? '处理中' : '处理完成' }}</span>
          </el-form-item>
           </div>
          <el-form-item label="审批意见" >
          </el-form-item>
           <el-input
            type="textarea"
            :rows="2"
            :disabled="cancellist.isok ==2 ? true : false"
            placeholder="请输入内容"
            v-model="cancellist.vcnote"
            class="canceltextarea"
            >
          </el-input>
      
</el-form>
        <div slot="footer" class="dialog-footer">
        <el-button @click="CanceldialogVisible = false">关闭</el-button>
          </div>
 </el-dialog>

  <el-dialog
    title="退墓操作"
    :visible.sync="ChangdialogVisible"
    width="730px"
    @close="CloseDiaglog"
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
            <span v-for="item in list.bury">{{ item }},</span>
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
      <h3 class="title" style="font-size:16px">购墓收费明细</h3>
      <div class="ele">
        <el-form-item :label="item.selltitle" v-for="item in cancel_show.Financeinfo">
            <span>{{ item.realprice }}</span>
          </el-form-item>
        </div>
     	<h3 class="title">退费申请</h3>
      <el-form-item label="退墓联系人">
  <el-select v-model="cancel.manager" placeholder="请选择" size="small">
    <el-option
      v-for="item in cancel_show.member"
      :key="item.id"
      :label="item.nickname"
      :value="item.id">
    </el-option>
  </el-select>
      </el-form-item>
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
      v-model="cancel.chargeitem[id_]"
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
        cancel_show:[Object,Array],
        ctable:[Object,Array]
     },
    data: function() {
    this.cancelForData = [
      { prop: 'orderNO', label: '编号' },
      { prop: 'buyer', label: '退墓人' },
      { prop: 'phone', label: '电话' },
      { prop: 'create_time', label: '申请日期' },
      { prop: 'isok', label: '状态' },
      { prop: 'nickname', label: '审批人' },
      { prop: 'billprice', label: '购墓金额' },
      { prop: 'readprice', label: '实收金额' },
      { prop: 'orderstatus', label: '缴费状态' },
    ];
        return { 
       ChangdialogVisible:false,
       CanceldialogVisible:false,
       id_:'',
       Financeinfo:[],
       table:[],
       cancel:{
       	 cid:'',
       	 sid:'',
         manager:'',
         buyer:'',
         phone:'',
         job:'',
         address:'',
         billprice:'',
         returnprice:'',
         chargeitem:[],
         returndesc:''
       },
       cancellist:{},
       list:{
       	  buyer : '',
       	  phone:'',
       	  bury:[],
       	  orderbegin: '',
       	  billTolamount:'',
       	  sellname:'',
       }
        }
    },
    methods: {
       CancelApply:function(){
        if(this.cancel_show && this.cancel_show.code == 1){
          this.$message.error(this.cancel_show.msg);
          return false
        }
         this.ChangdialogVisible = true
      },
       CloseDiaglog:function(){

       },
       CancelCheckConfirm:function(type){
            axios.post("../Api/canacel_cl_ajax",{
               id: this.cancellist.id,
               type: type,
               vcnote:this.cancellist.vcnote
            })
            .then(res=>{
            })
       },
       CancelCheck:function(row){
        axios.post("../Api/show_cancell_cl_ajax",{id : row.id})
        .then(res=>{
               if(res.data.code == 0){
                  this.cancellist = res.data.cancellist
                   for (let n in this.list) {
                   this.list[n] = res.data.sellinfo[n]
                   }
                  res.data.sellinfo.bury.forEach((v,k)=>{
                  this.list.bury.push(v.vcname)
                  })
                  this.Financeinfo = res.data.Financeinfo
                  this.CanceldialogVisible = true
               }
        })
     

       },
       CancelConfirm:function(){
        this.cancel.cid = this.cid
       axios.post("../Api/Cancel_submit_ajax",this.cancel)
           .then (res=> {
            if(res.data.code == 0){
              this.ChangdialogVisible = false;
              this.$message({
               message:res.data.msg,
               type: 'success'
                 });
            }else{
              this.$message.error(res.data.msg);
            }
               
             })
       }
    },
     watch:{
         cancel_show: function(newVal,oldVal){   
          if(newVal.code != 1){
               this.cancel.sid = newVal.sellinfo.id
               this.id_ = newVal.returnprice.id
               this.cancel.chargeitem[newVal.returnprice.id] = newVal.returnprice.defaultprice
               this.cancel.returnprice = newVal.cancel_retrun || 0
               this.cancel.billprice = newVal.sellinfo.billTolamount
               for (let n in this.list) {
                this.list[n] = newVal.sellinfo[n]
               }
                this.list.bury = []
                newVal.sellinfo.bury.forEach((v,k)=>{
                this.list.bury.push(v.vcname)
               })
        }else{
              // for (let n in this.list) {
              //    this.list[n] = ''
              // }
              for (let n in this.cancel) {
                 this.cancel[n] = ''
              }
              this.chargeitem = []
              // this.list.bury = []
           }
         }
      }    
}
</script>
<style>
	#cancel .el-form-item__label{
	width: 85px;
    color: #99a9bf;
	}
    #cancel .el-form-item__content{
    	width: 130px;
    }
.canceltextarea{
  height: 100px;
    width: 96%;
    margin-left: 2%;
}
.canceltextarea textarea{
  height:100px
}
	.ele{
    background: url(../static/module/admin/img/ele.png) 0 100% repeat-x;
	padding-bottom: 5px;
    margin-bottom: 15px;
	}
</style>