  <template>
  	<div>
    <el-button type="primary" @click="MonumenDrag">刻碑</el-button>
    <el-dialog
    title="刻碑服务"
    :visible.sync="MonumenDialogVisible"
    width="660px"
    @close="closeDiaglog"
    top="5vh"
    append-to-body>
    <my-drag></my-drag>
     </el-dialog>
  	</div>
  	</template>
  	<script>
module.exports = {
components: {
'my-drag': httpVueLoader('../VueCom/components/drag.vue')
        },
data: function() {
   return { 
    MonumenDialogVisible:false
   }
 },
 methods:{
 MonumenDrag:function(){
  this.MonumenDialogVisible = true
 }
 }
}
  </script>
