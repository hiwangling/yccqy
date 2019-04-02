  <template>
  	<div>
    <my-drag></my-drag>
  	</div>
  	</template>
  	<script>
module.exports = {
components: {
    'my-drag': httpVueLoader('../VueCom/components/drag.vue')
        },
data: function() {
   return { 
   }
 }
}
  </script>
