<template>
    <div>
<!--     <div style="height: 40px;line-height: 30px;">
  <el-form-item label="" label-width="1rem" >
  <el-radio-group v-model="radio" @change="onRadioChange">
      <el-radio :label="item.value" :key="item.value" v-for="item in radio_">{{item.buyer}}</el-radio>
  </el-radio-group>
</el-form-item>
  </div> -->
    <el-form-item label="姓名">
    <el-input v-model="temp.buyer" size="small"></el-input>
  </el-form-item>
  <el-form-item label="联系电话">
    <el-input v-model="temp.phone" size="small"></el-input>
  </el-form-item>
  <el-form-item label="家庭住址">
    <el-input v-model="temp.adress" size="small"></el-input>
  </el-form-item>
  <el-form-item label="关系">
    <el-input v-model="temp.relation" size="small"></el-input>
  </el-form-item>
  <el-form-item label="性别">
  <el-select v-model="temp.sex" placeholder="请选择" size="small">
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
        <el-date-picker type="date" placeholder="选择日期" size="small" v-model="temp.ordainbegin"></el-date-picker>
      </el-form-item>
    </el-col>
  </el-form-item>
  <el-form-item label="到期日期">
      <el-col>
      <el-form-item prop="date2">
        <el-date-picker placeholder="选择时间" size="small" v-model="temp.ordainend"></el-date-picker>
      </el-form-item>
    </el-col>
  </el-form-item>
  <el-form-item label="备注">
    <el-input v-model="temp.vcdesc" size="small"></el-input>
  </el-form-item>
    </div>
</template>

<script>
module.exports = {
    props:{
       
    },
    data: function() {
        return {
            radio:'',
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
             sex_:[{
                 name:'男',
                 value:'1'
              },{
                 name:'女',
                 value:'2'
              }],
            temp: {
            	buyer:'',
            	phone:'',
            	address:'',
            	relation:'',
            	sex:'',
            	orderbegin:'',
            	orderend:'',
              vcdesc:''
            }
        }
    },
    methods:{
        onRadioChange(row){
        this.radio_.forEach((v,k) =>v.value == row ? this.temp = Object.assign(this.temp, v) : row
              )
        }
    }
}
</script>
