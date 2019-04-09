  <template>
  	<div> 
      <el-button type="primary" @click="ChangdialogVisible = true">申请换墓</el-button>
          <el-table
      :data="table"
      border
      fit
      highlight-current-row
      style="width: 100%;margin-top: 10px">
      <el-table-column
      v-for="{ prop, label } in changForData"
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
          >删除</el-button>
          </div>

      </template>
    </el-table-column>
     </el-table>

        <el-dialog
    title="换墓管理"
    :visible.sync="ChangdialogVisible"
    width="730px"
    @close="closeDiaglog"
    top="5vh"
    append-to-body>
  		<el-form :inline="true" :model="chang" class="demo-form-inline" id="chang">
      <h3 class="title">旧墓穴信息</h3>
      <el-form-item label="旧墓价格">
      <el-input
      v-model="billTolamount"
      size="small"
     :disabled="true">
     </el-input>
       </el-form-item>
         <el-form-item label="购买时间">
      <el-input
      v-model="orderbegin"
      size="small"
     :disabled="true">
     </el-input>
       </el-form-item>
      <el-form-item label="墓主">
      <el-input
      v-model="buryanme"
      size="small"
     :disabled="true">
     </el-input>
       </el-form-item>
	  	<div> 
      <h3 class="title">新墓穴信息</h3>
      </div>
          <el-form-item label="迁墓时间">
    <el-date-picker
      v-model="chang.movetime"
      type="date"
      size="small"
      placeholder="选择日期"
      format="yyyy 年 MM 月 dd 日"
      value-format="yyyy-MM-dd"
      >
    </el-date-picker>
    </el-form-item>
       <el-form-item label="墓穴位置">
	    <el-input v-model="chang.newcname" size="small"></el-input>
	  </el-form-item>
        <el-button type="primary" icon="el-icon-plus" @click="dialogTableVisible = true"></el-button>
        <el-button type="primary" icon="el-icon-delete" @click="chang.newcname = ''"></el-button>
      <h3 class="title">联系人信息</h3>
       <el-form-item label="姓名">
    <el-input v-model="chang.buyer" size="small"></el-input>
  </el-form-item>
  <el-form-item label="联系电话">
    <el-input v-model="chang.phone" size="small"></el-input>
  </el-form-item>
  <el-form-item label="家庭住址">
    <el-input v-model="chang.adress" size="small"></el-input>
  </el-form-item>
  <el-form-item label="关系">
    <el-input v-model="chang.relation" size="small"></el-input>
  </el-form-item>
  <el-form-item label="性别">
  <el-select v-model="chang.sex" placeholder="请选择" size="small">
    <el-option
      v-for="item in sex_"
      :key="item.value"
      :label="item.name"
      :value="item.value">
    </el-option>
  </el-select>
  </el-form-item>
  <el-form-item label="购买日期">
      <el-col>
      <el-form-item prop="date1">
        <el-date-picker type="date" placeholder="选择日期" size="small" v-model="chang.ordainbegin"></el-date-picker>
      </el-form-item>
    </el-col>
  </el-form-item>
  <el-form-item label="到期日期">
      <el-col>
      <el-form-item prop="date2">
        <el-date-picker placeholder="选择时间" size="small" v-model="chang.ordainend"></el-date-picker>
      </el-form-item>
    </el-col>
  </el-form-item>
  <el-form-item label="备注">
    <el-input v-model="chang.vcdesc" size="small"></el-input>
  </el-form-item>
       <h3 class="title">配套服务</h3>
      <el-form-item :label="item.name" v-for="(item, key, index) in changdata.chargeitem" :key="key">
    <el-input v-model.number="chang.chargeitem[item.id]" size="small"></el-input>
  </el-form-item>
       <h3 class="title">付款方式</h3>
     <el-row :gutter="10" style="margin-bottom: 0px;">
    <el-col :md="14" id="changcheck">
        <el-form-item label="支付方式">
      <div class="serivce_pay" v-for="(item, key, index) in changdata.paytype" :key="index">
        <el-checkbox v-model="chang.fklx[key]" :label="item.name" @change="fklxvalChange(key)"></el-checkbox>
        <el-input v-model="chang.fklxval[key]" style="width:80px;" v-if="chang.fklx[key] == true"></el-input>
      </div>
    </el-form-item>
 </el-col>
 <el-col :md="10">
    <el-form-item label="是否开票" style="width: 100px!important;text-align: left;">
   <el-radio v-model="chang.isvoice" label="0">不开票</el-radio>
    <el-radio v-model="chang.isvoice" label="1">开票</el-radio>
    </el-form-item>  
 </el-col>
 </el-row>

	 </el-form>
   <div slot="footer" class="dialog-footer">
        <el-button @click="ChangdialogVisible = false">取消</el-button>
        <el-button type="primary" @click="ChangConfirm">确定</el-button>
          </div>
   </el-dialog>
<el-dialog title="墓穴查询" 
           :visible.sync="dialogTableVisible" 
           :modal-append-to-body="false" 
           append-to-body width="900px"
           top="3vh">
    <my-component 
        :datatable="tableData" 
        :gardens="gardenData" 
        :areas="areaData"
        :types="typeData" 
        :loading="loading"
        :styles="styleData" 
        @garden_param="garden_param"
        @tableinit="tableinit"
        @rowdata="rowdata"
        >
    </my-component>
</el-dialog>

  	</div>
  </template>
  <script>
     module.exports = {
     	props: {
        cid:null,
        changdata:[Object,Array]
     	},
     	components: {
        'my-component': httpVueLoader('../VueCom/table.vue')
        },
	   data: function() {
     this.changForData = [
      { prop: 'orderNO', label: '编号' },
      { prop: 'buyer', label: '联系人' },
      { prop: 'phone', label: '电话' },
      { prop: 'oldcname', label: '旧墓' },
      { prop: 'newcname', label: '新墓' },
      { prop: 'create_time', label: '申请日期' },
       { prop: 'moveprice', label: '费用' },
      { prop: 'orderstatus', label: '状态' },
    ];
	   return { 
          chang:{
            fklx:[],
            fklxval:[],
            isvoice:'0',
            oldsid:'',
            oldcid:'',
            newcid:'',
            oldcname:'',
            sid:'',
            changid:'',
            movetime:'',
            chargeitem:[],
            buyer:'',
            phone:'',
            relation:'',
            newcname:''
          },
         sex_:[{
                 name:'男',
                 value:'1'
              },{
                 name:'女',
                 value:'2'
              }],
          table:[],
          billTolamount:'',
          orderbegin:'',
          buryanme:'',
          selected: 1,
          ChangdialogVisible:false,
          dialogTableVisible: false,
          tamp: {},
          gardenData: [],
          tableData: [],
          areaData: [],
          typeData: [],
         styleData: [],
         formInline: '',
         loading: true,
         name: '',
         CemeteryType:'',
         couponSelected:[{
             name : '单穴',
             value : 1
        },{
             name : '双穴',
             value : 2
        },{
             name : '三穴',
             value : 3
        }],
	   }},
          created() {
            this.tableinit(),
            this.Gardeninit(),
            this.Typeinit()
            this.Styleinit()

        },
         methods: {
            tableinit: function (param) {
                axios.post("../Api/getCemeteryList_ajax", {
                    param
                }).then(response => {
                    this.tableData = response.data.data
                    this.loading = false;
                })
            },
            Gardeninit: function () {
                axios.post("../Api/getCemeteryGarden_ajax")
                        .then(response => {
                            this.gardenData = response.data
                        })
            },
            Typeinit: function () {
                axios.post("../Api/getCemeterytype_ajax")
                        .then(response => {
                            this.typeData = response.data
                        })
            },
            Styleinit: function () {
                axios.post("../Api/getCemeteryStyle_ajax")
                        .then(response => {
                            this.styleData = response.data
                        })
            },

            garden_param: function (param) {
                axios.post("../Api/getCemeteryArea_ajax", {
                    id: param,
                })
                        .then(response => {
                            this.areaData = response.data
                        })
            },
            updata_table: function (param) {
                axios.post("../Api/getCemeteryArea_ajax", {
                    id: param,
                })
                        .then(response => {
                            this.areaData = response.data
                        })
            },
           ChangConfirm:function(){
            this.chang.cid = this.cid
           axios.post("../Api/Sellchang_submit_ajax",this.chang)
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
            rowdata: function (param) {
                this.dialogTableVisible = false;
                this.tamp = param
                this.name = param.name
                this.chang.newcid = param.id
                this.chang.newcname =param.name
                let provinces = this.couponSelected.filter(function (area) {
                    return area.name == param.type_name;
                });
                this.selected = provinces[0].value

            },
            fklxvalChange:function(v){
               this.chang.fklxval[v] = ''
            },
            closeDiaglog:function(){

            }
        },
     watch:{
         changdata: function(newVal,oldVal){        
              this.billTolamount = newVal.oldsellinfo.billTolamount
              this.orderbegin = newVal.oldsellinfo.orderbegin
              this.buryanme = newVal.buryanme
              this.table = newVal.list
              this.chang.oldsid=newVal.oldsellinfo.id
              this.chang.oldcid=newVal.info.id
              this.chang.sid=newVal.sellinfo.id || 0
              this.chang.oldcname=newVal.info.name
              this.chang.changid=newVal.SellchangInfo == null ? 0 : newVal.SellchangInfo.id
              }  
         }, 
     }
  </script>
     <style>
#chang .el-form-item__label{
	width:70px!important;
}
#chang .el-form-item__content,#chang .el-date-editor{
  width:140px;
}
#changcheck .el-form-item__content{
  width:505px
}
</style>