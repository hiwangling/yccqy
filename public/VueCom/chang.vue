  <template>
  	<div> 
  		<el-form :inline="true" :model="chang" class="demo-form-inline">
	  <el-col :md="16">
	  	<div> 
      <h3 class="title">新墓穴信息</h3>
      </div>
      <el-button type="primary" icon="el-icon-plus">添加墓穴</el-button>
       <el-form-item label="墓穴位置">
	    <el-input v-model="newcname"></el-input>
	  </el-form-item>
	  <el-form-item label="墓型">
	    <el-select placeholder="请选择" v-model="CemeteryType" style="width:110px">
	    <el-option
	      v-for="item in CemeteryType_"
	      :key="item.key"
	      :label="item.name"
	      :value="item.value">
	    </el-option>
	  </el-select>
	  </el-form-item>
      <h3 class="title">联系人信息</h3>
      <my-from></my-from>
       <h3 class="title">收费项目</h3>
         <el-form-item label="安葬礼仪">
	    <el-input v-model="chargeitem"></el-input>
	  </el-form-item>
	  <el-form-item label="变更补交">
	    <el-input v-model="chargeitem"></el-input>
	  </el-form-item>
	  
	  	 </el-col> 
	 <el-col :md="8">
	 	  <h3 class="title">旧墓穴信息</h3>
         <el-form-item label="购买人">
	    <el-input v-model="chargeitem"></el-input>
	  </el-form-item>
	  <el-form-item label="墓主信息">
	    <el-input v-model="chargeitem"></el-input>
	  </el-form-item>
	  <el-table
    :data="oldFinanceinfo"
    style="width: 100%">
    <el-table-column
      label="收费项目"
      prop="selltitle">
    </el-table-column>
    <el-table-column
      label="金额"
      prop="realprice">
    </el-table-column>
     </el-table>

	 	 </el-col>

	 </el-form>

  	</div>
  </template>
  <script>
     module.exports = {
     	props: {
        
     	},
     	components: {
        'my-from': httpVueLoader('../VueCom/components/from.vue')
        },
	   data: function() {
	   return { 
          chang:{

          },
         newcname:'',
         chargeitem:'',
         oldFinanceinfo:[{
         selltitle:'墓位费',
         realprice:'7980.00'
         },{
         selltitle:'总金额',
         realprice:'7980.00'
         }],
         CemeteryType:'',
         CemeteryType_:[{
             name : '单穴',
             value : 1
        },{
             name : '双穴',
             value : 2
        },{
             name : '三穴',
             value : 3
        }],
	   }}
     }
  </script>
     <style>
.el-form--inline .el-form-item__label{
	width:auto!important;
}
</style>