<template>
<div class="box" contenteditable="true" v-drag v-html="innerText" @input="changeTxt" @focus="lock=true" @blur="lock=false" :style="styleobject"></div>
</template>
<script>
 module.exports = {
   props:{
        child:{
            type:Object,
            default:{

            }
        },
        styleobject:{
            type:Object,
            default:{

            }
        }
    },
    data:function(){
        return {
            innerText:this.child.txt,
            lock:false
        }
    },
     directives: {
        drag: {
            bind: function (el) {
                let odiv = el;   //获取当前元素
                odiv.onmousedown = (e) => {
                    //算出鼠标相对元素的位置
                    let disX = e.clientX - odiv.offsetLeft;
                    let disY = e.clientY - odiv.offsetTop;
                    
                    document.onmousemove = (e)=>{
                        //用鼠标的位置减去鼠标相对元素的位置，得到元素的位置
                        let left = e.clientX - disX;    
                        let top = e.clientY - disY;
                      
                        //绑定元素位置到positionX和positionY上面
                        this.positionX = top;
                        this.positionY = left;
                
                        //移动当前元素
                        odiv.style.left = left + 'px';
                        odiv.style.top = top + 'px';
                    };
                        document.onmouseup = (e) => {
                        document.onmousemove = null;
                        document.onmouseup = null;
                    };
                };
            }
        }
    },
    watch:{
        child:{
            handler(newValue, oldValue) {
                if(!this.lock) {
                    this.innerText=this.child.txt;
                };
        　　　},
        　　　deep:true
        }
    },
    methods:{
        changeTxt:function(e){
            this.child.txt=this.$el.innerHTML;
        }
    }

    }
</script>
<style>
         .box{
        position: absolute;    
        top: 10px;
        left: 10px;
        width: 20px;
        text-align: center;
        height: 100px;
        border: 1px dashed #666;
        border-top: 5px solid #4a9ff9;
        outline: none;

    }
</style>