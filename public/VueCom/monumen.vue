  <template>
  	<div>
    <el-button type="primary" @click="Monumenpayment">缴费</el-button>
    <el-button type="primary" @click="MonumenDrag">刻碑</el-button>
    <el-dialog
    title="刻碑服务"
    :visible.sync="MonumenDialogVisible"
    width="80%"
    top="5vh"
    append-to-body>
    <my-drag></my-drag>
     </el-dialog>
<!--     <el-table
      :data="monumen_show.data.data.data"
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
     </el-table> -->

      <el-dialog
    title="碑文缴费"
    :visible.sync="MonumenPayDialogVisible"
    width="80%"
    top="5vh"
    append-to-body>
      <h3 class="title">墓穴信息</h3>
    <el-tag size="medium" type="danger" style="font-size:16px;margin-bottom: 10px;">生态园/花坛葬三区/生态园花坛葬三区3-2/山西黑/单穴  /南</el-tag>

<el-form :inline="true" :model="monumen" class="demo-form-inline">
    <el-form-item label="购买人">
  <el-select v-model="monumen.buryer" clearable placeholder="请选择" style="width:100px" @change="Monumenbury" >
    <el-option
      v-for="(item, index) in monumen_show.linkmanlist"
      :key="index"
      :label="item.linkname"
      :value="item.phone">
    </el-option>
  </el-select> 
      </el-form-item>
      <el-form-item label="电话">
  <el-input v-model="monumen.phone" style="width: 120px"></el-input>
    </el-form-item>
    <el-form-item label="墓主" v-if="monumen.bury != ''">
      <el-checkbox-group 
    v-model="monumen.bury">
    <el-checkbox v-for="item in monumen_show.bury" :label="item.vcname" :key="item.key">{{item.vcname}}</el-checkbox>
  </el-checkbox-group>
    </el-form-item> 

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
  <el-select v-model="monumen.monumentype" clearable placeholder="请选择" style="width:100px" >
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

     <h3 class="title">配套服务</h3>
     <el-form-item v-for="(item, index) in monumen_show.chargeitem" :label="item.name" >
    <el-input v-model="monumen.chargeitem[item.id]" style="width: 120px" @blur="ChangeCount"></el-input>
    </el-form-item>

    <h3 class="title">特殊服务</h3>

       <el-form-item label="支付方式" >
      <div v-for="(item, key, index) in monumen_show.paytype" :key="index" style="width: 170px;float: left;">
        <el-checkbox v-model="monumen.fklx[key]" :label="item.name" class="pay"></el-checkbox>
        <el-input v-model="monumen.fklxval[key]" style="width:80px;"></el-input>
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
        <el-button>取消</el-button>
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
        monumen_show:[Array, Object, Boolean,String]
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
    count:'80',
    monumen:{
    buryer:'',
    phone:'',
    bury:'',
    isvoice:'',
    monumenstyle:'',
    monumentype:'',
    monumendate:'',
    chargeitem:[],
    fklx:[],
    fklxval:[],
    },
   }
 },
 methods:{
Monumenbury:function(){

},
 MonumenDrag:function(){
  this.MonumenDialogVisible = true
 },
 Monumenpayment:function(){
  this.MonumenPayDialogVisible = true
 },
 MonumenEdit:function(val){

 },
 MonumenConfirm:function(){
  console.log(this.monumen)
 },
 ChangeCount:function(){
  console.log(this.monumen.chargeitem);

 },
 }
}
  </script>
<style>
.font18{
  font-size:18px;
}
</style>