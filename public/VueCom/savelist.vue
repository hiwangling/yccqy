  <template>
  	<div> 
  	<el-button type="primary" class="filter-container" icon="el-icon-edit" @click="handleCreate" >寄存登记</el-button>
    <el-table
      :data="data"
      border
      fit
      highlight-current-row
      style="width: 100%">
      <el-table-column
        prop="saveareananme"
        label="寄存地点">
      </el-table-column>
      <el-table-column
        prop="buyer"
        label="寄存人">
      </el-table-column>
      <el-table-column
        prop="relation"
        label="关系">
      </el-table-column>
      <el-table-column
        prop="phone"
        label="	电话">
      </el-table-column>
      <el-table-column
        prop="deathname"
        label="逝者">
      </el-table-column>
      <el-table-column
        prop="savebegindate"
        label="开始日期">
      </el-table-column>
      <el-table-column
        prop="saveenddate"
        label="结束日期">
      </el-table-column>
           <el-table-column
        prop="saveprice"
        label="费用">
      </el-table-column>
           <el-table-column
        prop="savestatus"
        :formatter="getstatus"
        label="状态"
        width="50px"
        >
      </el-table-column>
      <el-table-column
        prop="ts"
        label="过期天数">
         <template slot-scope="scope">
                <p v-html='scope.row.ts'></p>
         </template>
      </el-table-column>
      <el-table-column
        prop="canceldate"
        label="取走日期">
      </el-table-column>
          <el-table-column label="操作" width="220" fixed="right" align="center">
      <template slot-scope="scope">
        <el-button
          size="small "
          type="primary"
          @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button
          size="small "
          type="danger"
          @click="handleGo(scope.$index, scope.row)">取走</el-button>
        <el-button
          size="small "
          @click="handleDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>
    </el-table>

    <el-dialog
      width="54%"
      :title="dialogStatus"
      top="5vh"
      :visible.sync="innerVisible"
      append-to-body>
      <el-form :inline="true" ref="dataForm" :model="temp" class="demo-form-inline" id="save">
    <el-form-item label="请选择" style="display:block" v-if="dialogStatus==='登记'">
   <el-radio-group v-model="radio" @change="onRadioChange">
      <el-radio :label="item.value" :key="item.value" v-for="item in radio_">{{item.buyer}}</el-radio>
      <i class="el-icon-delete"></i>
      <el-button type="danger" icon="el-icon-delete" size="mini" @click="radio=resetTemp()"></el-button>
  </el-radio-group>
   </el-form-item>
	  <el-form-item label="联系人">
	    <el-input v-model="temp.buyer" name="name"></el-input>
	  </el-form-item>
	  	  <el-form-item label="联系电话">
	    <el-input v-model="temp.phone" name="name"></el-input>
	  </el-form-item>
	  	  <el-form-item label="联系地址">
	    <el-input v-model="temp.address" name="name"></el-input>
	  </el-form-item>
	  	  <el-form-item label="逝者姓名">
	    <el-input v-model="temp.deathname" name="name"></el-input>
	  </el-form-item>
	  	  <el-form-item label="关系">
	    <el-input v-model="temp.relation" name="name"></el-input>
	  </el-form-item>

	  	  <el-form-item label="费用">
	    <el-input v-model="temp.saveprice" name="name"></el-input>
	  </el-form-item>

      <el-form-item label="开始日期">
        <el-date-picker placeholder="选择时间" value-format="yyyy-MM-dd" v-model="temp.savebegindate" style="width: 100%;"></el-date-picker>
      </el-form-item>
      <el-form-item label="结束日期" >
        <el-date-picker placeholder="选择时间" value-format="yyyy-MM-dd" v-model="temp.saveenddate" style="width: 100%;"></el-date-picker>
      </el-form-item>
	  <el-form-item label="寄存地址">
	    <el-select v-model="temp.saveareaid" placeholder="请选择">
    <el-option
      v-for="item in savearea"
      :key="item.value"
      :label="item.name"
      :value="item.id">
    </el-option>
  </el-select>
   </el-form-item>
  <el-form-item label="缴费方式">
    <el-select v-model="temp.paytype" placeholder="请选择">
    <el-option
      v-for="item in paytype"
      :key="item.value"
      :label="item.text"
      :value="item.value">
    </el-option>
  </el-select>
   </el-form-item>
  <el-form-item label="是否开票">
    <el-select v-model="temp.isvoice" placeholder="请选择">
    <el-option
      v-for="item in isvoice"
      :key="item.value"
      :label="item.text"
      :value="item.value">
    </el-option>
  </el-select>
   </el-form-item>
   <el-form-item label="备注">
      <el-input v-model="temp.vcnote" name="name"></el-input>
    </el-form-item>
       </el-form>
    <div slot="footer" class="dialog-footer">
        <el-button @click="innerVisible = false">取消</el-button>
        <el-button type="primary" @click="dialogStatus==='登记'?createData(0):createData(1)">确定</el-button>
    </div>
    </el-dialog>
    </div>
  </template>
<script>
module.exports = {
	props: {
     data:Array,
     cid:null,
     savearea:Array
	},
   data: function() {
   return { 
   	innerVisible :false,
   	dialogStatus:'',
   	value: '',
    radio:'',
    paytype:[{
          text:'刷卡',
          value:1
         },{
          text:'现金',
          value:2
        },{
          text:'微信',
          value:3
        },{
          text:'支付宝',
          value:4
        }],
    isvoice:[{
          text : '开票',
          value:0
        },{
          text:'不开票',
          value:1
        }],
    radio_: [{
              value:1,
              buyer:'张三',
              sex:'男',
              phone:'1501654121',
              address:'宜昌市西陵区',
              relation:'父子'
            },{
              value:2,
              buyer:'李四',
              sex:'女',
              phone:'1501654444',
              address:'宜昌市',
              relation:'母女'
            }],
   	temp: {
          id:'',
          saveareananme: '',
          saveareaid:'',
          buyer: '',
          relation: '',
          phone:'',
          address:'',
          deathname:'',
          savebegindate:'',
          saveenddate:'',
          saveprice:'',
          savestatus:'',
          ts:'',
          canceldate:'',
          isvoice:0,
          paytype:'',
          vcnote:''
        }
   }
},
 computed:{
  list:function(){
  	
  },
 },
  created(){
 
        },
   methods: {
      resetTemp() {
      this.temp = {
          id:'',
          saveareananme: '',
          saveareaid:'',
          buyer: '',
          relation: '',
          phone:'',
          address:'',
          deathname:'',
          savebegindate:'',
          saveenddate:'',
          saveprice:'',
          savestatus:'',
          ts:'',
          canceldate:'',
          isvoice:0,
          paytype:'',
          vcnote:''
        }
    },
      handleCreate(){
      	 this.dialogStatus = '登记'
         this.innerVisible = true
         this.resetTemp() 
      },
      handleEdit(index, row) {
      	this.innerVisible = true;
      	this.dialogStatus = '编辑'
        this.temp = Object.assign({}, row)
        this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
      },
      updateData() {
            for (const v of this.data) {
              if (v.id === this.temp.id) {  
                const index = this.data.indexOf(v)
                this.data.splice(index, 1, this.temp)
                break
              }
            }
      },
      onRadioChange(row){
              this.radio_.forEach((v,k) =>v.value == row ? this.temp = Object.assign(this.temp, v) : row
              )
        },
      getstatus(row, column) {
       switch (row[column.property]) {
               case 1:
               return '寄存中' ;
               break;
               case 2:
               return '已取走' ;
               default:
               return row.savestatus
       }     
      },
     createData(v){
            msg = v == 0 ? '增加成功' : '修改成功'; 
            this.temp['cid'] = this.cid;
            axios.post("../Api/Save_submit_ajax",this.temp)
                  .then (res=> {
                     if(res.data.code == 0){
                       this.$message({
                        message: msg,
                        type: 'success'
                       });
                       this.innerVisible = false;
                       this.savearea.forEach((v,k)=>{
                       this.temp['saveareananme'] = v.id ==this.temp['saveareaid'] ? v.name : ''    
                       })
                      this.temp['savestatus'] = this.temp['savestatus'] == '' ? '寄存中'  : this.temp['savestatus']
                       v == 0 ? this.data.push(this.temp) : this.updateData()
                     }else{
                       this.$message({
                        message: '添加失败',
                        type: 'warning'
                       });
                     }
                  })
     },

      handleDelete(index, row) {     
      this.$confirm("您确认删除吗？", "提示", {}).then(() => {
      axios.post("../Api/Save_delete_ajax",{
      id: row.id,
      cid: this.cid
      })
      .then(res => {
          if(res.data.code == 0){
             this.$message({
                 message: '删除成功',
                 type: 'success'
              });
             this.data.splice(index, 1)
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
      handleGo(index, row) {
      this.$confirm("您确认取走吗？", "提示", {}).then(() => {
      axios.post("../Api/Save_take_ajax",{
      id: row.id,
      cid: this.cid
      })
      .then(res => {
          if(res.data.code == 0){
             this.$message({
                 message: '成功取走',
                 type: 'success'
              });
            row.savestatus =='已取走';
            row.ts ='';
            row.canceldate=moment().format('YYYY-MM-DD');
          }else{
             this.$message({
                 message: '取走失败',
                 type: 'warning'
              });
          }
      })
   })
      .catch(() => {
      this.$message({message: '已取消'});
     })

    },

    }
}
</script>
<style>
  #save .el-input,#save .el-form-item__content{
    width: 210px;
  }
  #save .el-form-item__label{
width: 100px!important
  }
</style>
