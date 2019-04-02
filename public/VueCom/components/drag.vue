  <template>
  	<div style="height: 800px" class="app">
    <el-form :inline="true"  class="demo-form-inline" v-if="status">
   <template v-for="item in content" >
  		<my-edit :child="item" :styleobject="item.styleObject" ></my-edit>
  		<el-form-item :label="item.label">
  			<el-input v-model="item.txt" style="width:100px"></el-input> 
  		</el-form-item>
  </template>
  <p>大字：{{fn.max}}</p>
  <p>小字：{{fn.min}}</p>
</el-form>
  	</div>
  	</template>
  	<script>
module.exports = {
components: {
    'my-edit': httpVueLoader('../components/edit.vue')
        },
data: function() {
   return { 
        status: true,
        content:[{
        	txt:'一九八九',
        	label:'生于',
          type:'min',
        	styleObject: {
			    left: '834px',
			    top: '82px',
			  }
        },{
        	txt:'一九七七',
        	label:'逝于',
          type:'max',
        	styleObject: {
			    left: '701px',
			    top: '88px',
			  }
        },{
          txt:'一九五二',
          label:'逝于',
          type:'max',
          styleObject: {
          left: '600px',
          top: '88px',
        },

        },{
          txt:'一九五二',
          label:'逝于',
          type:'max',
          styleObject: {
          left: '600px',
          top: '128px',
        },
        },{
          txt:'一九五二',
          label:'逝于',
          type:'max',
          styleObject: {
          left: '600px',
          top: '128px',
        },
        }
        ]
   }
},
computed: {
fn:function(){
   let max = 0,min = 0;
   this.content.filter((v,k)=>v.type == 'max' ? max += v.txt.length : min += v.txt.length
   )
   return {max,min} 
}
},
methods:{

}
}
</script>
