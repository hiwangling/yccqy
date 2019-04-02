  <template>
  	<div> 
  <el-button type="primary" @click="Servicehadd">添加殡仪服务</el-button>
    <el-table
      :data="selldata"
      border
      fit
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
          <div v-if="scope.row.orderstatus ==1">
          <el-button
          size="small "
          type="primary"
          >编辑</el-button>
          <el-button
          size="small "
          >删除</el-button>
          </div>
          <el-button
          size="small" v-else
          >删除</el-button>
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
 <span style="
    position: absolute;
    top: 20px;
    right: 55px;">NO:
 <font style="color: red">{{service_show.orderNO}}</font>
</span>
    <el-form :inline="true">
  <el-form-item label="购买人">
  <el-select v-model="tempSelect" clearable placeholder="请选择" style="width:100px" @change="Servicebury" >
    <el-option
      v-for="item in service_show.linkmanlist"
      :key="item.key"
      :label="item.linkname"
      :value="item.phone">
    </el-option>
  </el-select>
  </el-form-item>
    <el-form-item label="电话">
  <el-input v-model="phone" style="width: 120px"></el-input>
    </el-form-item>
    <el-form-item label="墓主">
      <el-checkbox-group 
    v-model="bury">
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
        <el-input v-if="scope.row.status == 1" v-model="scope.row.defaultprice" style="width: 80px" @blur="CheckRow(scope.row)">
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
      <el-form-item label="支付方式" >
      <div v-for="item in fklx" :key="item.value" style="width: 170px;float: left;">
        <el-checkbox v-model="item.fklx" :label="item.text" class="pay" @change="fklxvalChange"></el-checkbox>
        <el-input v-model="item.fklxval" style="width:80px;" v-if="item.fklx == true"></el-input>
      </div>
    </el-form-item>
 </el-col>
 <el-col :md="10">
    <el-form-item label="是否开票" style="width: 100px!important;text-align: left;">
   <el-radio v-model="isvoice" label="2">不开票</el-radio>
    <el-radio v-model="isvoice" label="1">开票</el-radio>
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
        service_show:Object,
        selldata:Array
     	},
     data: function() {
    this.serviceForData = [
      { prop: 'orderNO', label: '编号' },
      { prop: 'buyer', label: '购买人' },
      { prop: 'phone', label: '手机' },
      { prop: 'deathname', label: '墓主' },
      { prop: 'orderbegin', label: '办理时间' },
      { prop: 'zj', label: '费用' },
      { prop: 'orderstatus', label: '缴费状态' }
    ];
	   return { 
      ServicedialogVisible:false,
      orientation:'',
      isvoice:'2',
      sels:[],
      chargeitem:[],
      Serviceinfo:[],
      phone:'',
      bury:[],
      tempSelect:'',
      buryer:'',
      fklx :[{
          fklx:false,
          text:'刷卡',
          fklxval:''
        },{
          fklx:false,
          text:'现金',
          fklxval:''
        },{
          fklx:false,
          text:'微信',
          fklxval:''
        },{
          fklx:false,
          text:'支付宝',
          fklxval:''
        }],
	   }
	},
     computed: {
   
     },
     methods: {
    fklxvalChange:function(val){
       this.fklx.find((item)=>{
           if(item.fklx === false){
               item.fklxval = ''
           }
       })
    },
     Servicehadd: function(){
       this.ServicedialogVisible = true;
     },
     closeDiaglog:function(){
      this.$refs.multipleTable.clearSelection();
     },
     selsChange: function (sels) {
      this.sels = sels;
      },
      tableRowClassName({row}) {
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
      Servicebury(v){
      if(!v){
        this.phone = ''
        return false
      }
      let obj = {};
      obj = this.service_show.linkmanlist.find((item)=>{
          return item.phone === v;
      });
      this.buryer = obj.linkname
      this.phone = v
      },
      //输入选中
     CheckRow:function(row){
      Number(row.chargeitem) == 0 ? 
      this.$refs.multipleTable.toggleRowSelection(row,false) : 
      this.$refs.multipleTable.toggleRowSelection(row,true);
     },

     ServiceConfirm:function(){
      this.chargeitem=[];
      this.Serviceinfo=[];
      chargeitemId = [];
      serviceinfoId = [];
      this.sels.forEach((v,k)=>{
      if(v.status == 1){
        this.chargeitem.push(v.defaultprice)
         chargeitemId.push(v.id);
      }else{
        this.Serviceinfo.push(v.price)
        serviceinfoId.push(v.id)
      }
      })
      axios.post("../Api/Buryservice_save_submit",{
          cid: this.cid,
          chargeitemId:chargeitemId,
          serviceinfoId:serviceinfoId,
          chargeitem: this.chargeitem,
          Serviceinfo: this.Serviceinfo,
          isvoice:this.isvoice,
          fklx:this.fklx,
          buyer:this.buryer,
          bury:this.bury,
          phone:this.phone,
          id:0
        })
         .then (res=> {
            this.$message({
            message: '操作成功',
             type: 'success'
               });
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
</style>