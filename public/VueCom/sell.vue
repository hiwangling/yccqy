  <template>
    <div> 
<el-dialog
  title="添加信息"
  :visible.sync="SelldialogVisible"
  width="80%"
  top="5vh"
  append-to-body>
  <el-row>
    <el-form :inline="true" :model="sell" class="demo-form-inline" ref="sell">
    <el-col :md="16">
      <div> 
    <h3 class="title">墓穴信息</h3>
    <el-tag size="medium" type="danger" style="font-size:16px;">生态园/花坛葬三区/生态园花坛葬三区3-2</el-tag>
    </div>
    <div style="margin-top:10px;"> 
    <el-form-item label="朝向">
      <el-input
      style="width:50px"
    v-model="orientation"
    :disabled="true">
  </el-input>
  </el-form-item>
    <el-form-item label="风格">
      <el-input
      style="width:80px"
    v-model="stylename"
    :disabled="true">
  </el-input>
  </el-form-item>
  <el-form-item label="墓型">
    <el-select v-model="comp.CemeteryType" placeholder="请选择" style="width:110px">
    <el-option
      v-for="item in CemeteryTypes"
      :key="item.key"
      :label="item.name"
      :value="item.value">
    </el-option>
  </el-select>
  </el-form-item>

  <el-form-item label="墓位销售价">
    <el-select v-model="mw_sell" clearable placeholder="请选择" @change="mw_sellChange">
    <el-option
      v-for="item in mw_sellprice_"
      :key="item.key"
      :label="item.name"
      :value="item.value">
    </el-option>
  </el-select>
  </el-form-item>
  <div>
   <h3 class="title">墓主信息</h3>
 
  <el-button type="primary" icon="el-icon-plus" @click="handleAdd" size="medium">添加</el-button>
    <el-button icon="el-icon-delete" @click="handleDelete" size="medium">取消</el-button>
  </div>

 <template>
    <el-table
      :data="bury"
      style="width: 100%">
      <el-table-column
        prop="deathname"
        align="center"
        label="姓名">
         <template slot-scope="scope">
        <el-input v-model="bury[scope.$index].deathname" placeholder=""></el-input>
        </template>
      </el-table-column>
      <el-table-column
        prop="sex"
        align="center"
        width="120px"
        label="性别">
        <template slot-scope="scope">
    <el-select v-model="bury[scope.$index].sex" placeholder="请选择">
    <el-option
      v-for="item in sex_"
      :key="item.value"
      :label="item.name"
      :value="item.value">
    </el-option>
  </el-select>
      </template>
      </el-table-column>
      <el-table-column
        prop="sfz"
        align="center"
        label="身份证">
        <template slot-scope="scope">
        <el-input v-model="bury[scope.$index].sfz" placeholder="请输入内容"></el-input>
            </template>
      </el-table-column>
       <el-table-column
        prop="birth"
        align="center"
        label="出生日期">
        <template slot-scope="scope">
     <el-date-picker
      v-model="bury[scope.$index].birth"
      type="date"
      value-format="yyyy-MM-dd"
      placeholder="选择日期">
    </el-date-picker>
        </template>
      </el-table-column>
       <el-table-column
        prop="death"
        align="center"
        label="死亡日期">
        <template slot-scope="scope">
           <el-date-picker
      v-model="bury[scope.$index].death"
       value-format="yyyy-MM-dd"
      type="date"
      placeholder="选择日期">
    </el-date-picker>
        </template>
      </el-table-column>
      <el-table-column
        prop="bury"
        align="center"
        label="安葬日期">
        <template slot-scope="scope">
        <el-date-picker
      v-model="bury[scope.$index].bury"
      type="date"
       value-format="yyyy-MM-dd"
      placeholder="选择日期">
    </el-date-picker>
        </template>
      </el-table-column>
    </el-table>
  </template>
  <div><h3 class="title">认购人信息 </h3></div>

<div style="height: 40px;line-height: 30px;">
  <el-form-item label="" label-width="1rem" >
  <el-radio-group v-model="radio" @change="onRadioChange">
      <el-radio :label="item.value" :key="item.value" v-for="item in radio_">{{item.buyer}}</el-radio>
  </el-radio-group>
</el-form-item>
  </div>
    <el-form-item label="姓名">
    <el-input v-model="buyer.buyer"></el-input>
  </el-form-item>
  <el-form-item label="联系电话">
    <el-input v-model="buyer.phone" style="width:120px"></el-input>
  </el-form-item>
  <el-form-item label="家庭住址">
    <el-input v-model="buyer.adress"></el-input>
  </el-form-item>
  <el-form-item label="关系">
    <el-input v-model="buyer.relation" style="width:80px"></el-input>
  </el-form-item>
  <el-form-item label="性别">
  <el-select v-model="buyer.sex" placeholder="请选择" style="width:100px">
    <el-option
      v-for="item in sex_"
      :key="item.value"
      :label="item.name"
      :value="item.value">
    </el-option>
  </el-select>
  </el-form-item>
  <el-form-item label="购买日期">
        <el-date-picker type="date" placeholder="选择日期"  value-format="yyyy-MM-dd" v-model="buyer.ordainbegin" style="width: 140px"></el-date-picker>
  </el-form-item>
  <el-form-item label="到期日期">
        <el-date-picker placeholder="选择时间" value-format="yyyy-MM-dd" v-model="buyer.ordainend" style="width: 140px"></el-date-picker>
  </el-form-item>
  <el-form-item label="备注">
    <el-input v-model="buyer.vcdesc"></el-input>
  </el-form-item>
       <div slot="footer" class="dialog-footer">
        <el-button @click="innerVisible = false">取消</el-button>
        <el-button type="primary" @click="sellSubmit">确定</el-button>
    </div>
  </div>

    </el-col> 
   <el-col :md="8">
     <h3 class="title">购墓缴费信息</h3>
     <el-form-item label="应收金额">
      <el-input v-model="comp.mw_sellprice" style="width:150px;"></el-input>
    </el-form-item>
    <el-form-item label="实收金额" style="width: 100%;">
      <el-input v-model="comp.mw_realprice" style="width:150px;float:left"></el-input> 
      <el-checkbox v-model="yh" style="float:right;margin-left:10px">优惠</el-checkbox>
    </el-form-item>
     <el-form-item label="优惠折扣" v-if="yh == true" style="width: 100%;">
      <el-input v-model="comp.yhShow" style="width:150px;" @change="preference"></el-input>
    </el-form-item>
     <el-form-item label="支付方式">
      <div v-for="item in comp.fklx" :key="item.value">
        <el-checkbox v-model="item.fklx" :label="item.text" class="pay"></el-checkbox>
        <el-input v-model="item.fklxval" style="width:80px;" v-if="item.fklx == true"></el-input>
      </div>
    </el-form-item>
    <el-form-item label="是否开票" style="display: block;">
    <el-radio v-model="comp.isvoice" label="1">开票</el-radio>
    <el-radio v-model="comp.isvoice" label="2">不开票</el-radio>
    </el-form-item>   
    <el-form-item label="总金额：" class="count">
      <span>¥</span><span>500</span>
      </el-form-item>
   </el-col>
   </el-form>
    </el-row>
</el-dialog>
    <h3 class="title">购买人信息</h3>
     <el-button type="primary" @click="SelldialogVisible=true">添加认购信息</el-button>
     <el-table
      :data="selldata"
      border
      fit
      highlight-current-row
      style="width: 100%;margin-top: 10px">
      <el-table-column
      v-for="{ prop, label } in sellForData"
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
       <h3 class="title">墓主信息</h3>
       <el-button type="primary" @click="sell_info">添加墓主</el-button>
      <el-table
      :data="buryinfo"
      border
      fit
      highlight-current-row
      style="width: 100%;margin-top:10px">
      <el-table-column
        prop="vcname"
        label=" 墓主">
      </el-table-column>
      <el-table-column
        prop="sex"
        :formatter="sexRest"
        label=" 墓主性别">
      </el-table-column>
      <el-table-column
        prop="buyer"
        label=" 家属姓名">
      </el-table-column>
      <el-table-column
        prop="phone"
        label=" 联系方式">
      </el-table-column>
      <el-table-column
        prop="burystatus"
        :formatter="buryRest"
        label=" 安葬状态">
      </el-table-column>
      <el-table-column
        prop="bury"
        label=" 安葬时间">
      </el-table-column>
      <el-table-column label="操作" width="255px" align="center">
      <template slot-scope="scope">
          <el-button
          size="small "
          type="danger"
          >下葬单打印</el-button>
          <el-button
          size="small"
          @click="sellEdit(scope.$index, scope.row)"
          >编辑</el-button>
           <el-button size="small" @click="sellDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>
         </el-table>
   

    <el-dialog
  :title="!this.check ? '修改信息' : '增加墓主'"
  :visible.sync="dialogSell"
  width="60%"
  top="5vh"
  append-to-body>
  <el-form :inline="true" :model="sellEditForm" class="demo-form-inline" ref="sellEditForm">
    <el-tag size="medium" type="danger" class="tagStyle">生态园/花坛葬三区/生态园花坛葬三区3-2</el-tag>
    <el-form-item label="墓主名称">
    <el-input v-model="sellEditForm.vcname"></el-input>
  </el-form-item>

  <el-form-item label="性别">
  <el-select v-model="sellEditForm.sex" placeholder="请选择" style="width:100px">
    <el-option
      v-for="item in sex_"
      :key="item.value"
      :label="item.name"
      :value="item.value">
    </el-option>
  </el-select>
  </el-form-item>

    <el-form-item label="身份证">
    <el-input v-model="sellEditForm.sfz" ></el-input>
  </el-form-item>

<el-form-item label="出生日期">
        <el-date-picker type="date" placeholder="出生日期"  value-format="yyyy-MM-dd" v-model="sellEditForm.birth" style="width: 140px"></el-date-picker>
  </el-form-item>
  <el-form-item label="死亡日期">
        <el-date-picker type="date" placeholder="死亡日期"  value-format="yyyy-MM-dd" v-model="sellEditForm.death" style="width: 140px"></el-date-picker>
  </el-form-item>
  <el-form-item label="安葬日期">
        <el-date-picker type="date" placeholder="出生日期"  value-format="yyyy-MM-dd" v-model="sellEditForm.bury" style="width: 140px"></el-date-picker>
  </el-form-item>
      <el-form-item label="联系人">
    <el-input v-model="sellEditForm.buyer" ></el-input>
  </el-form-item>
      <el-form-item label="联系电话">
    <el-input v-model="sellEditForm.phone"></el-input>
  </el-form-item>
      <el-form-item label="关系">
    <el-input v-model="sellEditForm.relation" style="width:80px"></el-input>
  </el-form-item>
        <el-form-item label="备注">
    <el-input v-model="sellEditForm.vcdesc" ></el-input>
  </el-form-item>
  </el-form>
        <div slot="footer" class="dialog-footer">
        <el-button @click="dialogSell = false">取消</el-button>
        <el-button type="primary" @click="check  == false ? sellConfirm('edit') : sellConfirm('add')">确定</el-button>
          </div>
 
</el-dialog>
    </div>
  </template>
  <script>
module.exports = {
  props: {
         cid:null,
         status:null,
         selldata:Array,
         buryinfo:Array 
  },
   data: function() {
     this.sellForData = [
      { prop: 'orderNO', label: '编号' },
      { prop: 'buyer', label: '购买人' },
      { prop: 'relation', label: '关系' },
      { prop: 'phone', label: '手机' },
      { prop: 'deathname', label: '墓主' },
      { prop: 'orderbegin', label: '订单日期' },
      { prop: 'zj', label: '费用' },
      { prop: 'orderstatus', label: '订单状态' }
    ]
   return { 
        check:false,
        SelldialogVisible:false,
        status_:2,
        dialogSell:false,
        yh: false,
        yhShow:'',
        orientation:'南',
        stylename:'山西黑',
        radio:'',
        sellEditForm:{
          vcname:'',
          sex:'',
          id:'',
          sfz:'',
          birth:'',
          death:'',
          bury:'',
          buyer:'',
          phone:'',
          relation:'',
          vcdesc:''
        },
        comp: {
        id:'',
        isvoice:'',
        mw_realprice:'0',
        mw_sellprice:'0',
        CemeteryType:'',
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
        },
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
              adress:'宜昌市',
              relation:'母女'
            }],
        CemeteryTypes:[{
             name : '单穴',
             value : 1
        },{
             name : '双穴',
             value : 2
        },{
             name : '三穴',
             value : 3
        }
        ],
        sex_:[{
              name:'男',
              value:1
            },{
              name:'女',
              value:0
            }],
        mw_sell:'',
        mw_sellprice_:[{
          name:'墓穴（低保）-- 7980.00',
          value:'7980.00'
        },{
          name:'墓穴（低保）-- 7980.00',
          value:'7980.00'
        },{
          name:'墓穴（低保）-- 7980.00',
          value:'7980.00'
        }
        ],
        sell:{},
        buyer: {
              buyer:'',
              phone:'',
              address:'',
              relation:'',
              sex:'',
              orderbegin:'',
              orderend:'',
              vcdesc:''
            },
        temp:{
            id:0,
            deathname: '',
            sex: '',
            sfz: '',
            birth:'',
            death:'',
            bury:''
          },
        bury:[{
            id:0,
            deathname: '',
            sex: '',
            sfz: '',
            birth:'',
            death:'',
            bury:''
          }]
   }
},
  computed: {
   
  },
  methods: {
    buryRest:function(row, column){
         return row[column.property] == 0 ? '未安葬' : '已安葬'
    },
    sexRest:function(row, column) {
          return row[column.property] == 1 ? '男' : '女'
     },
    preference:function(val){
       this.comp.mw_realprice = (val *this.comp.mw_sellprice).toFixed(2)
    },
    mw_sellChange:function(val){
      this.comp.mw_realprice = this.comp.mw_sellprice = val;
    },
    handleAdd(){
        this.bury.push(Object.assign({}, this.temp))
    },
    handleDelete(){
         this.bury.pop()
    },
   onRadioChange(row){
      this.radio_.forEach((v,k) =>v.value == row ? this.buyer = Object.assign(this.buyer, v) : row)
      },
   sellSubmit(){
      axios.post("../Api/Sell_submit",{
        bury:this.bury,
        sell:this.buyer,
        comp:this.comp,
        cid:this.cid
      })
      .then(res=>{
       if(res.data.code == 0){
           axios.post("../Api/update_table",{cid: this.cid})
                  .then (res=> {
                    this.selldata = res.data.data.data
                    this.buryinfo = res.data.buryinfo
            })
          this.SelldialogVisible = false
          this.$message({
          message: '操作成功',
          type: 'success'
          });
       }else{
          this.$message.error('操作失败');
       }
      })
    },
    sellEdit(index,row){
      this.sellEditForm = Object.assign({}, row)
      this.check = false
      this.dialogSell = true
    },

    sellConfirm(v){
      if(v == 'add'){ 
      this.sellEditForm['cid'] = this.cid
      this.sellEditForm['linkname'] = this.sellEditForm['buyer']
      }
      if(v=='edit' && this.sellEditForm['id'] == ''){
         this.$message.error('参数错误,请刷新页面');
         return false
      }
      axios.post("../Api/deather_sumit_ajax",this.sellEditForm)
      .then(res=>{
        if(res.data.code ==0){
          this.dialogSell = false
          this.$message({
          message: '操作成功',
          type: 'success'
          });
        v == 'add' ? this.buryinfo.push(this.sellEditForm) : this.update_sell(this.sellEditForm)    //增加or修改
        }else{
        this.$message.error('修改失败');
        }
      })
    },

   update_sell(val){
         for (const v of this.buryinfo) {    //动态修改表格
              if (v.id === val.id) {
                const index = this.buryinfo.indexOf(v)
                this.buryinfo.splice(index, 1, val)
                break
              }
        }
    },

  sell_info(){
      this.check = true
      this.dialogSell = true
      Object.keys(this.sellEditForm).forEach(key => this.sellEditForm[key]= '');  //清空对象
    },

  sellDelete(index, row) {     
  this.$confirm("您确认删除吗？", "提示", {}).then(() => {
      axios.post("../Api/deather_delete_ajax",{
      id: row.id,
      cid: this.cid
      })
      .then(res => {
          if(res.data.code == 0){
             this.$message({
                 message: '删除成功',
                 type: 'success'
              });
             this.buryinfo.splice(index, 1)
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

  }
}
  </script>
  <style>
  .sellDialog{
    height: 900px
  }
  .tagStyle{
    font-size:16px; 
    display: block;
    width: 310px;
    margin-bottom: 15px;
  }
  .pay .el-checkbox__label{
    width: 50px;
    text-align: center;
  }
  .count{
    display: block!important;
    border-top: 2px dashed #eee;
    padding-top: 15px;
  }
  .count .el-form-item__label{
    font-size: 18px;
    font-weight: 100
  }
  .count span{
    font-size: 25px;
        color: red;
    margin-right: 5px;
  }
</style>