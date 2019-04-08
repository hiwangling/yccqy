  <template>
    <div> 
  <el-button type="primary" @click="ServicedialogVisible = true">添加殡仪服务</el-button>
    <el-table
      :data="service_show_table"
      border
      fit
      v-loading="loading"
      highlight-current-row
      style="width: 100%;margin-top: 10px">
      <el-table-column
      v-for="{ prop, label } in serviceForData"
      :key="prop"
      :prop="prop"
      :label="label">
      </el-table-column>
      <el-table-column label="操作" width="250" align="center">
      <template slot-scope="scope">
        <el-button
          size="small"
          type="danger"
          class="ft"
          >结算/打印</el-button>
          <div >
          <el-button
          size="small "
          type="primary"
          @click="serviceEdit(scope.row)"
          >编辑</el-button>
          <el-button
          size="small "
          @click="serviceDelete(scope.row)"
          >删除</el-button>
          </div>

      </template>
    </el-table-column>
     </el-table>

    <el-dialog
    title="殡葬服务"
    :visible.sync="ServicedialogVisible"
    width="660px"
    @close="closeDiaglog"
    top="5vh"
    append-to-body>
 <span class="order">NO:
 <font style="color: red" v-text="service.orderNO"></font>
</span>
    <el-form :inline="true">
  <el-form-item label="购买人">
  <el-select v-model="service.buyer" clearable placeholder="请选择" style="width:100px" @change="Servicebury" >
    <el-option
      v-for="item in service_show.linkmanlist"
      :key="item.key"
      :label="item.linkname"
      :value="item.linkname">
    </el-option>
  </el-select>
  </el-form-item>
    <el-form-item label="电话">
  <el-input v-model="service.phone" style="width: 120px"></el-input>
    </el-form-item>
    <el-form-item label="墓主">
      <el-checkbox-group 
    v-model="service.bury">
    <el-checkbox v-for="item in service_show.bury" :label="item.vcname" :key="item.key">{{item.vcname}}</el-checkbox>
  </el-checkbox-group>
    </el-form-item> 
</el-form>
    <el-table
    :data="service_show.chargeitem"
    style="width: 100%"
    ref="multipleTable"
    @selection-change="selsChange"
    :span-method="arraySpanMethod"
    :row-class-name="tableRowClassName">
    <el-table-column
      type="selection"
      width="60">
    </el-table-column>
    <el-table-column
      fixed
      prop="name"
      label="服务项目">
    </el-table-column>
       <el-table-column
      fixed
      prop="defaultprice"
      label="单价"
      class-name="tableClassTd">
    </el-table-column>
    <el-table-column
      prop="defaultprice"
      class-name="tableClassTd"
      label="实收">
     <template scope="scope">
        <el-input v-if="scope.row.status == 1" v-model="scope.row.defaultprice" style="width: 80px" @blur="CheckRow(scope.row,false)">
        </el-input>
      </template>
    </el-table-column>
  </el-table>

   <el-table
    :data="sels"
    style="width: 100%;margin-top: 10px;"
    :summary-method="getSummaries"
    show-summary>
    <el-table-column
      prop="name"
      class-name="tableColor_title"
      label="已选项目" >
    </el-table-column>
    <el-table-column
      prop="defaultprice"
      class-name="tableColor"
      >
    </el-table-column>
     </el-table>
<el-form :inline="true" style="margin-top: 10px;">
  <el-row :gutter="10" style="margin-bottom: 0px;">
 <el-col :md="14">
        <el-form-item label="支付方式">
      <div class="serivce_pay" v-for="(item, key, index) in service_show.paytype" :key="index">
        <el-checkbox v-model="service.fklx[key]" :label="item.name" @change="fklxvalChange(key)"></el-checkbox>
        <el-input v-model="service.fklxval[key]" style="width:80px;" v-if="service.fklx[key] == true"></el-input>
      </div>
    </el-form-item>
 </el-col>
 <el-col :md="10">
    <el-form-item label="是否开票" style="width: 100px!important;text-align: left;">
   <el-radio v-model="service.isvoice" label="0">不开票</el-radio>
    <el-radio v-model="service.isvoice" label="1">开票</el-radio>
    </el-form-item>  
 </el-col>
 </el-row>
</el-form>
    <div slot="footer" class="dialog-footer">
        <el-button @click="ServicedialogVisible = false">取消</el-button>
        <el-button type="primary" @click="ServiceConfirm">确定</el-button>
          </div>
</el-dialog>
    </div>
    </template> 
<script>
     module.exports = {
      props: {
        cid:null,
        loading: {
          type: Boolean,
          default:true
        },
        service_show:Object,
        service_show_table:Array
      },
    data: function() {
    this.serviceForData = [
      { prop: 'orderNO', label: '编号' },
      { prop: 'buyer', label: '购买人' },
      { prop: 'phone', label: '手机' },
      { prop: 'buryname', label: '墓主' },
      { prop: 'orderbegin', label: '办理时间' },
      { prop: 'zj', label: '费用' },
      { prop: 'orderstatus', label: '缴费状态' }
    ];
     return { 
      ServicedialogVisible:false,
      sels:[],
      service:{
      isvoice:'0',
      cid:this.cid,
      id:0,
      chargeitem:[],
      Serviceinfo:[],
      fklx:[],
      fklxval:[],
      bury:[],
      buyer:'',
      phone:'',
      orderNO:''
      }
     }
  },
     methods: {
      serviceEdit:function(v){
        axios.post("../Api/Buryservice_ajax_show",{cid: this.service.cid,id:v.id}).then(res=>{
               this.ServicedialogVisible = true
               this.service_show.chargeitem = res.data.chargeitem
               this.service.buyer = v.buyer
               this.service.bury = v.buryname.split(',')
               this.service.phone = v.phone
               this.service.id = v.id
               this.service.orderNO = v.orderNO
               this.service.isvoice = res.data.isvoice.toString()
                //付款赋值
               for (let n in res.data.paytype) {
                this.service.fklx[n] = res.data.paytype[n].ischeck == 1 ? true : false
                this.service.fklxval[n] = res.data.paytype[n].value
                }
                //多选赋值
               this.$nextTick(()=> 
               res.data.chargeitem.forEach((n,k)=>{
               if(Number(n.defaultprice) != 0 && n.defaultprice != undefined){
                this.$refs.multipleTable.toggleRowSelection(this.service_show.chargeitem.find((item) =>item.id === n.id),true)      
                  }
                 })
                )     
                      
     })
      },
    //取消为空
     fklxvalChange:function(v){
      this.service.fklxval[v] = ''
     },
     serviceDelete:function(row){
    const index = this.service_show_table.indexOf(row)
     this.$confirm("您确认删除吗？", "提示", {}).then(() => {
      axios.post("../Api/Buryservice_delete_ajax",{
      id: row.id
      })
      .then(res => {
          if(res.data.code == 0){
             this.$message({
                 message: '删除成功',
                 type: 'success'
              });
             this.service_show_table.splice(index, 1)
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
      //选择赋值
      Servicebury(v){
      if(!v){
        this.service.phone = ''
        return false
      }
      let obj = {};
      obj = this.service_show.linkmanlist.find((item)=>{
          return item.linkname === v;
      });
      this.service.buyer = obj.linkname
      this.service.phone = obj.phone
      },
      //输入选中
     CheckRow:function(row,para){
      if(para){
      this.$refs.multipleTable.toggleRowSelection(row,true);
      }else{ 
      Number(row.chargeitem) == 0 ? 
      this.$refs.multipleTable.toggleRowSelection(row,false) : 
      this.$refs.multipleTable.toggleRowSelection(row,true);
      }
     },
     //服务提交
     ServiceConfirm:function(){
      this.sels.forEach((v,k)=>{
        //区分服务、归类
        v.status == 1 ? 
        this.service.chargeitem[v.id] = v.defaultprice : 
        this.service.Serviceinfo[v.id] = v.price
      })
      axios.post("../Api/Buryservice_save_submit",this.service)
         .then (res=> {
          if(res.data.code == 0){
            this.ServicedialogVisible = false;
            this.$message({
            message: '操作成功',
             type: 'success'
               });
          }else{
            this.$message.error('操作失败');
          }
             
           })
     },
     //计算统计
     getSummaries(param) {
        const { columns, data } = param;
        const sums = [];
        columns.forEach((column, index) => {
          if (index === 0) {
            sums[index] = '总价';
            return;
          }
          const values = data.map(item => Number(item[column.property]));
          if (!values.every(value => isNaN(value))) {
            sums[index] = values.reduce((prev, curr) => {
              const value = Number(curr);
              if (!isNaN(value)) {
                return prev + curr;
              } else {
                return prev;
              }
            }, 0);
            sums[index] += ' 元';
          } else {
            sums[index] = 'N/A';
          }
        });
        return sums;
      },
      selsChange: function (sels) {
      this.sels = sels;
      },
      tableRowClassName({row,rowIndex}) {
        if (row.title) {
          return 'Cent';
        }
      },
      //服务项目样式
     arraySpanMethod({ row, column, rowIndex, columnIndex }) {
         if (row.title) {
          return [1, 4]
        }
         if (!row.price) {
          if (columnIndex === 2) {
           return [1, 1]
          }
        }
      },
         //关闭清空
     closeDiaglog:function(){
      this.$refs.multipleTable.clearSelection();
      this.service.fklx=[]
      this.service.fklxval=[]
      this.service.chargeitem=[]
      this.service.Serviceinfo=[]
      this.service.bury = []
      this.service.buyer = ''
      this.service.phone = ''
      this.service.orderNO = ''
      this.service.id = 0
      this.service.isvoice = '0'
      this.service_show.chargeitem.find((item) =>item.defaultprice = 0)
     },
   }

  }
</script>
<style>
.el-table .tableClassTd{
  text-align: center;
}
  .el-table .Cent {
    background: #f0f9eb;
  }
  .el-table .tableColor_title{
    background: #dddddd24;
    font-size: 15px;
  }
  .el-table .tableColor
  {
    background: #dddddd24;
    text-align: center;
        font-size: 15px;
  }
  .Cent td{
    text-align: center;
    font-size: 16px;
  }
 .Cent td:nth-child(1){
  display:none
 }
  .el-table__footer-wrapper .is-leaf .cell{
       color: red;
    font-weight: 800;
    font-size: 16px;
  }
  .order{
    position: absolute;
    top: 20px;
    right: 55px;
  }
  .el-checkbox{
    margin-right: 10px;
  }
  .serivce_pay{
    float: left;margin-right:5px;width: 165px;
  }
</style>