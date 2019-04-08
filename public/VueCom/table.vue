<template>
  <div> 
          <el-form :inline="true" :model="formInline" class="demo-form-inline">
              <el-form-item label="墓号 :">
                <el-input v-model="formInline.vno" placeholder="墓号"></el-input>
              </el-form-item>
              <el-form-item label="墓园 :">
                <el-select v-model="formInline.gardenID" clearable  placeholder="墓园"  @change="getRole($event)">
                 <el-option
                  v-for="item in gardens"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                  </el-option>
                </el-select>
              </el-form-item>
                    <el-form-item label="墓区 :">
                  <el-select v-model="formInline.areaID" clearable placeholder="墓园">
                 <el-option
                  v-for="item in areas"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                  </el-option>
                </el-select>
              </el-form-item>
                <el-form-item label="类型 :">
                  <el-select v-model="formInline.typeID" clearable placeholder="类型">
                 <el-option
                  v-for="item in types"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                  </el-option>
                </el-select>
              </el-form-item>
                <el-form-item label="样式 :">
                  <el-select v-model="formInline.style" clearable placeholder="样式">
                 <el-option
                  v-for="item in styles"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id">
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item>
                <el-button type="primary" @click="onSubmit">查询</el-button>
              </el-form-item>
            </el-form>
            <div class="container_table">
                <el-table 
                :data="datatable.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                stripe
                v-loading="loading"
                class="spheight"
                style="width: 100%"
                @row-click="handleDelete"
                >
                 <el-table-column
                  type="index"
                  width="55">
                </el-table-column>

                <el-table-column
                  v-for="item in tableParam"
                  :key="item.index"
                  :prop="item.prop"
                  :label="item.label"
                  :width="item.width">
                </el-table-column>

                <el-table-column label="操作">
                  <template slot-scope="scope">
                     <el-button type="primary" icon="el-icon-check" ></el-button>
                  </template>
                </el-table-column>
             </el-table>
                  <el-pagination class="fy"
                     layout="total, sizes, prev, pager, next"
                     @current-change="current_change"
                      @size-change="handleSizeChange" 
                     :total="datatable.length"
                      :current-page="currentPage" 
                      :page-sizes="[5, 10, 20, 50, 100]"
                     :page-size="pagesize"
                     background
                    >
                  </el-pagination>
            </div>

            </div>
</template>
<script>
module.exports = {
      props: {
        datatable: Array,
        gardens:Array,
        areas:Array,
        styles:Array,
        types:Array,
        tablelist:Array,
        loading:{ 
          type:Boolean,
          default:true
           }
    },
    data: function() {
        return {
            currentPage:1,//默认开始页面
            istag: true,
            pagesize:5,
            formInline: {
              vno: '',
              gardenID: '',
              areaID:'',
              typeID:'',
              style:'',
            },
        tableParam:[
        {
          prop:'garden_name',
          label:'墓园',
          width:'180',
          index:1
        },
        {
          prop:'area_name',
          label:'墓区',
          width:'180',
          index:2
        },
         {
          prop:'name',
          label:'墓穴',
          width:'auto',
          index:3
        },
        {
          prop:'type_name',
          label:'类型',
          width:'auto',
          index:4
        },
        {
          prop:'style_name',
          label:'样式',
          width:'auto',
          index:5
        }
        ],
        }
    },
      methods: {
      onSubmit() {
          this.$emit('tableinit',this.formInline)
        },
       getRole (prov) {
          this.$emit('garden_param',prov)
      },
       handleDelete(row, event, column) {
         this.$emit('rowdata',row)
      },
       handleSizeChange: function (size) { 
         this.pagesize = size; 
         }, 
      current_change:function(currentPage){
        this.currentPage = currentPage;
      }
    },
    watch:{
      Area(newName, oldName) {   
     
     }
    }

}
</script>
<style>
.spheight tr{
  height:35px;
}
</style>
