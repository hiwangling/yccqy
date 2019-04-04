  <template>
  	<div>
    <el-button type="primary" @click="MonumenPayDialogVisible = true">缴费</el-button>
    <el-button type="primary" @click="MonumenDialogVisible = true">刻碑</el-button>
    <el-dialog
    title="刻碑服务"
    :visible.sync="MonumenDialogVisible"
    width="80%"
    top="5vh"
    append-to-body>
    <my-drag></my-drag>
     </el-dialog>
   <el-table
      :data="monumen_table"
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
          <div >
          <el-button
          size="small "
          type="primary"
          @click="MonumenEdit(scope.row)"
          >编辑</el-button>
          <el-button
          size="small "
          >删除</el-button>
          </div>
      </template>
    </el-table-column>
     </el-table> 

      <el-dialog
    title="碑文缴费"
    :visible.sync="MonumenPayDialogVisible"
    width="80%"
    top="5vh"
    append-to-body>
      <h3 class="title">墓穴信息</h3>
    <el-tag size="medium" type="danger" style="font-size:16px;margin-bottom: 10px;">生态园/花坛葬三区/生态园花坛葬三区3-2/山西黑/单穴  /南</el-tag>

<el-form :inline="true" :model="monumen" id="monumen" class="demo-form-inline">
<div class="monumen_line">
  <div style="display:block"> 
    <el-form-item label="购买人">
  <el-select v-model="monumen.buyer" clearable placeholder="请选择" style="width:100px" @change="Monumenbury" >
    <el-option
      v-for="(item, index) in monumen_show.linkmanlist"
      :key="index"
      :label="item.linkname"
      :value="item.linkname">
    </el-option>
  </el-select> 
      </el-form-item>
      <el-form-item label="电话">
  <el-input v-model="monumen.phone" style="width: 120px"></el-input>
    </el-form-item>
    <el-form-item label="墓主" v-if="monumen_show.bury != ''">
      <el-checkbox-group 
    v-model="monumen.bury">
    <el-checkbox v-for="(item,index) in monumen_show.bury" :label="item.vcname" :key="index">{{item.vcname}}</el-checkbox>
  </el-checkbox-group>
    </el-form-item> 
</div>
  <el-form-item label="墓碑类型">
  <el-select v-model="monumen.monumenstyle" clearable placeholder="请选择" style="width:100px" >
    <el-option
      v-for="(value, key, index) in monumen_show.monumenstyle"
      :key="index"
      :label="value"
      :value="key">
    </el-option>
  </el-select> 
  </el-form-item>

 <el-form-item label="碑文类型">
  <el-select v-model="monumen.monumenttype" clearable placeholder="请选择" style="width:120px" >
    <el-option
      v-for="(value, key, index) in monumen_show.monumentype"
      :key="index"
      :label="value"
      :value="key">
    </el-option>
  </el-select> 
  </el-form-item>

 <el-form-item label="立碑时间">
    <el-date-picker
      v-model="monumen.monumendate"
      type="date"
      value-format="yyyy-MM-dd"
      style="width: 140px"
      placeholder="立碑时间">
    </el-date-picker> 
  </el-form-item>
</div>
     <h3 class="title">配套服务</h3>
     <el-form-item v-for="(item, index) in monumen_show.chargeitem" :label="item.name" >
    <el-input v-model="monumen.chargeitem[item.id]" style="width: 120px" @blur="ChangeCount"></el-input>
    </el-form-item>

    <h3 class="title">特殊服务</h3>

    <el-form-item label="支付方式" >
      <div v-for="(item, key, index) in monumen_show.paytype" :key="index" style="float: left;margin-right:5px;">
        <el-checkbox v-model="monumen.fklx[key]" :label="item.name" class="pay" @change="fklxvalChange(key)"></el-checkbox>
        <el-input v-model="monumen.fklxval[key]" style="width:80px;" v-if="monumen.fklx[key] == true"></el-input>
      </div>
    </el-form-item>
  <el-form-item label="是否开票" style="display: block;">
   <el-radio v-model="monumen.isvoice" label="0">不开票</el-radio>
    <el-radio v-model="monumen.isvoice" label="1">开票</el-radio>
    </el-form-item>  
</el-form>
<div>
  <span class="font18">总金额：</span>
  <span class="font18" style="color: red;">{{count}} 元</span>
</div>
    <div slot="footer" class="dialog-footer">
        <el-button @click="MonumenPayDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="MonumenConfirm">确定</el-button>
          </div>
    </el-dialog>

  	</div>
  	</template>
  	<script>
module.exports = {
components: {
'my-drag': httpVueLoader('../VueCom/components/drag.vue')
        },
  props: {
        cid:null,
        monumen_table:Array,
        monumen_show:[Array, Object]
      },
data: function() {
  this.serviceForData = [
      { prop: 'orderNO', label: '编号' },
      { prop: 'buyer', label: '购买人' },
      { prop: 'phone', label: '手机' },
      { prop: 'buryname', label: '墓主' },
      { prop: 'monumenstyle', label: '墓碑类型' },
      { prop: 'monumenttype', label: '碑文类型' },
      { prop: 'monumendate', label: '立碑时间' },
      { prop: 'monumenprice', label: '费用' },
      { prop: 'orderstatus', label: '缴费状态' }
    ];
   return { 
    MonumenDialogVisible:false,
    MonumenPayDialogVisible:false,
    count:0,
    monumen:{
    buyer:'',
    phone:'',
    bury:[],
    id:0,
    sid:0,
    cid:this.cid,
    isvoice:'0',
    monumenstyle:'',
    monumenttype:'',
    monumendate:new Date(),
    chargeitem:[],
    fklx:[],
    fklxval:[],
    },
   }
 },
 methods:{
 Monumenbury:function(v){
      if(!v){
        this.monumen.phone = ''
        return false
      }
      let obj = {};
      obj = this.monumen_show.linkmanlist.find((item)=>{
          return item.phone === v;
      });
      this.monumen.buyer = obj.linkname
      this.monumen.phone = v
},
 MonumenConfirm:function(){
  axios.post("../Api/Monumenservice_save_submit",this.monumen)
         .then (res=> {
            if(res.data.code == 0){
            this.MonumenPayDialogVisible = false;
            this.$message({
            message: '操作成功',
             type: 'success'
               });
            axios.post("../Api/Monumenservice_ajax_show",{cid: this.cid})
                  .then (res=> {
                    this.monumen_table = res.data.data.data.data
                  })
          }else{
            this.$message.error('操作失败');
          }
         })
 },
 ChangeCount:function(){
  this.count = 0
  this.monumen.chargeitem.forEach((v,k)=>{
  this.count+=Number(v);
  })
 },
fklxvalChange:function(v){
    this.monumen.fklxval[v] = ''
},
MonumenEdit:function(row){
 
  axios.post("../Api/Monumenservice_ajax_show",{cid: this.cid,id:row.id}) 
 .then (res=> {
let tamp = Object.assign({}, row)
console.log(tamp)
this.monumen.monumenttype = tamp.monumenttype == 0 ? '' : tamp.monumenttype.toString()
this.monumen.monumenstyle = tamp.monumenstyle ==0 ? '' : tamp.monumenstyle.toString()
this.monumen.buyer = tamp.buyer
this.monumen.phone = tamp.phone
this.monumen.monumendate = tamp.monumendate
this.monumen.id = tamp.id
this.monumen.sid = tamp.sid
 res.data.chargeitem.forEach((v,k)=>{
  this.monumen.chargeitem[v.id] = v.defaultprice
 })
  this.ChangeCount()
  for (let n in res.data.paytype) {
  this.monumen.fklx[n] = res.data.paytype[n].ischeck == 1 ? true : false
  this.monumen.fklxval[n] = res.data.paytype[n].value
  }
  this.monumen.isvoice = res.data.sellinfo.isvoice.toString()
  this.monumen.bury= tamp.buryname.split(",")
  this.MonumenPayDialogVisible = true;
  //  for (let i in this.monumen) {   //编辑赋值
 //    if(row[i]){
 //      this.monumen[i] = tamp[i]
 //      }
 // }
 })
 },
 }
}
  </script>
<style>
.font18{
  font-size:18px;
}
#monumen .monumen_line .el-form-item__label{
  width: 70px!important
}
</style>