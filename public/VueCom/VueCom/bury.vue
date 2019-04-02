  <template>
  	<div> 
  		<div> 
    <h3 class="title">墓穴信息</h3>
	  <el-tag size="medium" type="danger" style="font-size:16px;">生态园/花坛葬三区/生态园花坛葬三区3-2/山西黑/单穴	/南</el-tag>
	  </div>
	    <h3 class="title">墓主信息</h3>
	        <el-table
      :data="burydata"
      border
      fit
      highlight-current-row
      style="width: 100%">
      <el-table-column
        prop="vcname"
        label="墓主">
      </el-table-column>
      <el-table-column
        prop="sex"
        width="100px"
        label="墓主性别">
      </el-table-column>
      <el-table-column
        prop="linkname"
        label="家属姓名">
      </el-table-column>
      <el-table-column
        prop="phone"
        label="	联系方式">
      </el-table-column>
      <el-table-column
        prop="burystatus"
        label="安葬状态">
      </el-table-column>
      <el-table-column
        prop="bury"
        label="	安葬时间">
      </el-table-column>
      <el-table-column
        prop="burytype"
        label="	安葬">
      </el-table-column>
      <el-table-column
        prop="burystyle"
        label="	葬式">
      </el-table-column>
      <el-table-column
        prop="burystatus"
        label="	状态">
      </el-table-column>
          <el-table-column label="操作" width="220" align="center">
      <template slot-scope="scope">
          <div v-if="scope.row.burystatus ==1">
          	<el-button
          size="small "
          type="danger"
           >结算/打印</el-button>
          <el-button
          size="small "
          type="danger"
          >编辑</el-button>
          <el-button
          size="small "
          >删除</el-button>
          </div>
          <el-button
          size="small "
          type="danger"
          @click="handleBuryGo(scope.$index, scope.row)" v-else>下葬</el-button>
      </template>
    </el-table-column>
    </el-table>

    <el-dialog
      width="55%"
      top="1vh"
      :title="dialogStatus"
      :visible.sync="innerVisible"
      append-to-body>
      <el-form :inline="true" :model="temp" class="demo-form-inline">
       <div>
       <h3 class="title">墓穴信息</h3>
	  <el-tag size="medium" type="danger" style="font-size:16px;margin-bottom:10px">生态园/花坛葬三区/生态园花坛葬三区3-2/山西黑/单穴	/南</el-tag>
	  </div>
       <el-form-item label="联系人" width="100px">
	    <el-input v-model="temp.vcname"></el-input>
	  </el-form-item>
	      <el-form-item label="性别">
	    <el-input v-model="temp.sex"></el-input>
	  </el-form-item>
	      <el-form-item label="出生日期">
	    <el-input v-model="temp.birth"></el-input>
	  </el-form-item>
	      <el-form-item label="死亡日期">
	    <el-input v-model="temp.death"></el-input>
	  </el-form-item>
	      <el-form-item label="安葬日期">
	    <el-input v-model="temp.bury"></el-input>
	  </el-form-item>
	  <el-form-item label="安葬内容">
	    <el-select v-model="temp.burytype" placeholder="请选择">
	    <el-option
	      v-for="item in temp.burytype_"
	      :key="item.value"
	      :label="item.name"
	      :value="item.value">
	    </el-option>
	  </el-select>
	  </el-form-item>
	  <el-form-item label="葬式">
     <el-select v-model="temp.burystyle" placeholder="请选择">
    <el-option
      v-for="item in temp.burytype_"
      :key="item.value"
      :label="item.name"
      :value="item.value">
    </el-option>
  </el-select>
	  </el-form-item>
	  <h3 class="title">墓穴信息</h3>
	  <el-form-item label="联系人">
	    <el-input v-model="buryfrom.buyer"></el-input>
	  </el-form-item>
	  <el-form-item label="联系电话">
	    <el-input v-model="buryfrom.phone"></el-input>
	  </el-form-item>
	  	  <el-form-item label="工作单位">
	    <el-input v-model="buryfrom.job"></el-input>
	  </el-form-item>
	  	  <el-form-item label="家庭住址">
	    <el-input v-model="buryfrom.address"></el-input>
	  </el-form-item>
	  	  <el-form-item label="关系">
	    <el-input v-model="buryfrom.relation"></el-input>
	  </el-form-item>
	  	  <el-form-item label="性别">
	    <el-input v-model="buryfrom.sex"></el-input>
	  </el-form-item>
	    <el-form-item label="缴费方式">
    <el-select v-model="temp.ordaintype" placeholder="请选择">
    <el-option
      v-for="item in temp.ordaintypes"
      :key="item.value"
      :label="item.text"
      :value="item.value">
    </el-option>
  </el-select>
   </el-form-item>
  <el-form-item label="是否开票">
    <el-select v-model="temp.ordaintype" placeholder="请选择">
    <el-option
      v-for="item in temp.ordaintypes"
      :key="item.value"
      :label="item.text"
      :value="item.value">
    </el-option>
  </el-select>
   </el-form-item>
   	  <h3 class="title">收费项目</h3>
   	  	  <el-form-item label="绿化费">
	    <el-input v-model="chargeitem.defaultprice"></el-input>
	  </el-form-item>
	  <el-form-item label="墓证费">
	    <el-input v-model="chargeitem.defaultprice"></el-input>
	  </el-form-item>
	  <el-form-item label="安葬礼仪">
	    <el-input v-model="chargeitem.defaultprice"></el-input>
	  </el-form-item>
	  <el-form-item label="锣鼓乐队">
	    <el-input v-model="chargeitem.defaultprice"></el-input>
	  </el-form-item>
	  <el-form-item label="管理费">
	<el-select v-model="temp.ordaintype" placeholder="请选择">
    <el-option
      v-for="item in temp.ordaintypes"
      :key="item.value"
      :label="item.text"
      :value="item.value">
    </el-option>
  </el-select>
	  </el-form-item>
	  	  <h3 class="title">服务项目</h3>
    <el-checkbox v-model="paycard" label="骨灰坛(100.00)" class="pay"></el-checkbox>
    <el-checkbox v-model="paycash" label="锣鼓乐队(1000.00) " class="pay"></el-checkbox>
    <el-checkbox v-model="paywx" label="瓷像安装(200.00)" class="pay"></el-checkbox>
      	 </el-form>
      	    <div slot="footer" class="dialog-footer">
        <el-button @click="innerVisible = false">取消</el-button>
        <el-button type="primary" @click="burySubmit">确定</el-button>
    </div>
    </el-dialog>
    </div>
  </template>
  <script>
   module.exports = {
    props: {
     burydata:Array,
     buryfrom:null,
	},
   data: function() {
   return { 
    status_:4,
  dialogStatus:'下葬记录单',
  innerVisible:false,
  paycard:false,
  paycash:false,
  paywx:false,
  chargeitem:{
  	defaultprice:'',
  	chargeitem:[{

  	},{

  	}]
  },
  temp:{
   vcname:'',
   sex:'',
   birth:'',
   death:'',
   bury:'',
   burytype:'',
   burystyle:'',
   burytype_:[{
    name:'骨灰',
    value:'1'
   },{
    name:'衣冠',
    value:'2'
   },{
    name:'遗骨',
    value:'3'
   }],
   burystyle_:[{
    name:'骨灰',
    value:'1'
   },{
    name:'衣冠',
    value:'2'
   },{
    name:'遗骨',
    value:'3'
   }],
  }
   }},
   methods:{
   	handleBuryGo(index, row){
        this.$emit('bury',row)
        this.temp = Object.assign({}, row)
        this.innerVisible = true

   	},
    burySubmit(){
      console.log(this.status)
    }
   }
}
</script>
<style>
  .el-form--inline .el-form-item__label{
    width: 90px;
  }
</style>