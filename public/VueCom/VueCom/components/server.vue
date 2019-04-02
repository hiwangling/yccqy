<template>	
<div> 
<el-form :inline="true" :model="reserve" class="demo-form-inline" :rules="rules" ref="reserve">
	<el-form-item label="预订的人" prop="buyer">
    <el-input v-model="reserve.buyer" name="buyer"></el-input>
  </el-form-item>
  <el-form-item label="联系电话" prop="phone">
    <el-input v-model="reserve.phone"></el-input>
  </el-form-item>
      <el-form-item label="预定时间"  prop="ordainbegin">
        <el-date-picker type="date" placeholder="选择日期" value-format="yyyy-MM-dd" v-model="reserve.ordainbegin" style="width: 100%;"></el-date-picker>
      </el-form-item>
      <el-form-item label="到期日期" prop="ordainend">
        <el-date-picker placeholder="选择时间" value-format="yyyy-MM-dd" v-model="reserve.ordainend" style="width: 100%;"></el-date-picker>
      </el-form-item>
  <el-form-item label="联系邮箱">
    <el-input v-model="reserve.email"></el-input>
  </el-form-item>
     <el-form-item label="联系地址">
    <el-input v-model="reserve.address"></el-input>
  </el-form-item>
     <el-form-item label="逝者关系" prop="relation">
    <el-input v-model="reserve.relation"></el-input>
  </el-form-item>
  <el-form-item label="身份证">
    <el-input v-model="reserve.sfz"></el-input>
  </el-form-item>
   <el-form-item label="定金">
    <el-input v-model="reserve.ordainprice"></el-input>
  </el-form-item>
    </el-form-item>
   <el-form-item label="预定方式">
  <el-select v-model="reserve.ordaintype" clearable placeholder="请选择">
    <el-option
      v-for="item in ordaintypes"
      :key="item.value"
      :label="item.text"
      :value="item.id">
    </el-option>
  </el-select>
  </el-form-item>
     <el-form-item label="业务人员" prop="sellname">
  <el-select v-model="reserve.sellname" clearable placeholder="请选择">
    <el-option
      v-for="item in getmember"
      :key="item.value"
      :label="item.nickname"
      :value="item.nickname">
    </el-option>
  </el-select>
  </el-form-item>
  <el-form-item label="备注">
  <el-input
  type="textarea"
  :rows="2"
  placeholder="请输入内容"
  name="vcdesc"
  v-model="reserve.vcdesc">
</el-input>
</el-form-item>
  <el-form-item label="" v-show="false">
    <el-input v-model="reserve.id"></el-input>
</el-form-item>
<el-row>
   <el-button type="primary" @click="reserve.id===''?ServerFrom('reserve',0):ServerFrom('reserve',1)">确定</el-button>
   <el-button @click="CloseDialog('reserve')">关闭</el-button>
 
  </el-row>
</el-form>


</div>
</template>	
<script>
module.exports = {
	props: {
  getmember:Array,
  cid:null,
  reserve:{
     type:Object,
     default:function() {
      return {
             buyer:'',
             id:'',
             ordainbegin:'',
             ordainend:'',
             phone:'',
             ordainprice:'',
             email:'',
             sfz:'',
             sex:'',
             address:'',
             relation:'',
             ordaintype:'',
             sellname:'',
             vcdesc:''
      }
 }
  }
	},
  created(){
  },
  data(){
   return { 
     rules: {
          buyer: [
             { required: true, message: '请输入预定人', trigger: 'blur' },
          ],
          phone: [
            { required: true, message: '请输入电话', trigger: 'blur' }
          ],
          sellname: [
           { required: true, message: '请选择业务人员', trigger: 'blur' }
          ],
          ordainbegin: [
          { required: true, message: '请选择开始日期', trigger: 'blur'}
          ],
          ordainend: [
          { required: true, message: '请选择结束日期', trigger: 'blur'}
          ],
          relation: [
           { required: true, message: '请说明关系', trigger: 'blur' }
          ]
        },
    deleteObj:['name','garden_name','area_name','ts'],
    ordaintypes:[{
        text:'电话预定',
        id:'1'
       },{
        text:'现场预定',
        id:'2'
      },{
        text:'网络预定',
        id:'3'
      }]
   }
 },
 methods:{
  ServerFrom(formName,id) {
        let update_server = Object.assign({}, this.reserve);
        this.deleteObj.forEach((v,k)=>Vue.delete(this.reserve,v))
        this.$refs[formName].validate((valid) => {
          if (valid) {
            let para = Object.assign({}, this.reserve);
            para['cid'] = this.cid;
            msg = id == 0 ? '增加成功' : '修改成功'; 
            axios.post("../Api/Schedule_submit_ajax",para)
                  .then (res=> {
                     if(res.data.code == 0){
                       this.$message({
                        message: msg,
                        type: 'success'
                       });
                       this.$emit('update_server',update_server)
                       this.$emit('colorstatus',this.cid)
                       this.$emit('closedialog',false)
                     }else{
                       this.$message({
                        message: '添加失败',
                        type: 'warning'
                       });
                     }
                  this.$refs[formName].resetFields();
                  })
          }
        });
      },
  CloseDialog(formName){
    this.$emit('outclose',false)
    this.$emit('closedialog',false)
    this.$refs[formName].resetFields();
  }
 }
}
</script>