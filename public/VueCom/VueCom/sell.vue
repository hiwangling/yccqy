  <template>
    <div> 
    <div v-if="status != 3 && status != 4"> 
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
    <el-select v-model="CemeteryType" placeholder="请选择" style="width:110px">
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
    <el-button icon="el-icon-delete" @click="handleDel" size="medium">取消</el-button>
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
      <el-input v-model="mw_sellprice" style="width:150px;"></el-input>
    </el-form-item>
    <el-form-item label="实收金额">
      <el-input v-model="mw_realprice" style="width:150px;float:left"></el-input> 
      <el-checkbox v-model="yh" style="float:right;margin-left:10px">优惠</el-checkbox>
    </el-form-item>
     <el-form-item label="优惠折扣" v-if="yh == true">
      <el-input v-model="yhShow" style="width:150px;" @change="preference"></el-input>
    </el-form-item>
     <el-form-item label="支付方式">
      <div v-for="item in pay" :key="item.value">
        <el-checkbox v-model="item.paycard" :label="item.text" class="pay"></el-checkbox>
        <el-input v-model="item.fklxval" style="width:80px;" v-if="item.paycard == true"></el-input>
      </div>
    </el-form-item>
    <el-form-item label="是否开票" style="display: block;">
    <el-radio v-model="isvoice" label="1">开票</el-radio>
    <el-radio v-model="isvoice" label="2">不开票</el-radio>
    </el-form-item>   
    <el-form-item label="总金额：" class="count">
      <span>¥</span><span>500</span>
      </el-form-item>
   </el-col>
   </el-form>
     </div>
    <div v-else>
     <el-table
      :data="selldata"
      border
      fit
      highlight-current-row
      style="width: 100%">
      <el-table-column
        prop="orderNO"
        label=" 编号">
      </el-table-column>
       <el-table-column
        prop="buyer"
        label=" 购买人">
      </el-table-column>
       <el-table-column
        prop="relation"
        label=" 关系">
      </el-table-column>
       <el-table-column
        prop="phone"
        label=" 手机">
      </el-table-column>
       <el-table-column
        prop="deathname"
        label=" 墓主">
      </el-table-column>
       <el-table-column
        prop="orderbegin"
        label=" 订单日期">
      </el-table-column>
       <el-table-column
        prop="zj"
        label=" 费用">
      </el-table-column>
       <el-table-column
        prop="orderstatus"
        label=" 缴费状态">
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
          type="danger"
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
      <el-table
      :data="buryinfo"
      border
      fit
      highlight-current-row
      style="width: 100%">
      <el-table-column
        prop="vcname"
        label=" 墓主">
      </el-table-column>
      <el-table-column
        prop="sex"
        label=" 墓主性别">
      </el-table-column>
      <el-table-column
        prop="linkname"
        label=" 家属姓名">
      </el-table-column>
      <el-table-column
        prop="phone"
        label=" 联系方式">
      </el-table-column>
      <el-table-column
        prop="burystatus"
        label=" 安葬状态">
      </el-table-column>
      <el-table-column
        prop="bury"
        label=" 安葬时间">
      </el-table-column>
      <el-table-column label="操作" width="220" align="center">
      <template slot-scope="scope">
          <el-button
          size="small "
          type="danger"
          >下葬单打印</el-button>
          <el-button
          size="small "
          >编辑</el-button>
          </div>
      </template>
    </el-table-column>
         </el-table>
    </div>
    </div>
  </template>
  <script>
module.exports = {
  props: {
         status:null,
         selldata:Array,
         buryinfo:Array 
  },
   data: function() {
   return { 
        status_:3,
        yh: false,
        paycard:false,
        paycash:false,
        paywx:false,
        payzfb:false,
        yhShow:'',
        isvoice:'',
        orientation:'南',
        stylename:'山西黑',
        CemeteryType:'',
        radio:'',
        fklxval:'',
        pay :[{
          name:'paycard',
          text:'刷卡',
          fklxval:''
        },{
          name:'paycash',
          text:'现金',
          fklxval:''
        },{
          name:'paywx',
          text:'微信',
          fklxval:''
        },{
          name:'payzfb',
          text:'支付宝',
          fklxval:''
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
              value:2
            }],
        mw_realprice:'0',
        mw_sellprice:'0',
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
            deathname: '',
            sex: '',
            sfz: '',
            birth:'',
            death:'',
            bury:''
          },
        bury:[{
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
    preference:function(val){
       this.mw_realprice = (val *this.mw_sellprice).toFixed(2)
    },
    mw_sellChange:function(val){
      this.mw_realprice = this.mw_sellprice = val;
    },
    handleAdd(){
        this.bury.push(Object.assign({}, this.temp))
    },
    handleDel(){
      this.bury.pop()
    },
   onRadioChange(row){
        this.radio_.forEach((v,k) =>v.value == row ? this.buyer = Object.assign(this.buyer, v) : row
              )
      },
    sellSubmit(){
      para = Object.assign(
        this.bury,
        this.buyer,
        this.CemeteryType
        )
      console.log(para)
    }
  }
}
  </script>
  <style>
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