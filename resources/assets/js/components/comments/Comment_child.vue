<template>
    <div class="col-md-12" :class="{ padding : show_level }"><!-- -->

        <div class="img-face">
            <img src="http://img02.cuctv.com/M00/01/01/rBFTjV0lpmaDLQ83AAAoh8_RkSY827_35X35.png">
        </div>
        <div class="img-content">
            <h5><span style=" font-weight: bold;">{{ comment['owner'] ? comment['owner'].name:''}}</span>:</h5>
            <h5>{{comment.body}}</h5>
            <p v-if="get_is_show_reply()"><a class="reply_btn btn btn-default btn-sm" @click="show_relpy">回复</a></p>
            <div v-show="is_show">
                <form @submit.prevent="post_comment" accept-charset="UTF-8">
                    <div class="form-group">
                    <textarea v-model="comment_content" id="body" name="body" class="form-control"
                              required="required"></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">立即回复</button>
                    <button @click="show_relpy()" type="submit" class="btn btn-default">取消回复</button>
                </form>
            </div>
            <div v-if="is_follow()">
                <comment_root :post_id="post_id" :user_id="user_id" :collections="get_child_list()"
                              :comments="real_comments"></comment_root>
            </div>
            <hr>

        </div>



    </div>
</template>
<style>
    .col-md-12{
        padding:0;
    }
    .padding{
        padding-left:1%;
    }
    .img-face{
        width: 5%;
        float: left;
        margin-top: 1rem;
    }
    .img-content{
        width: 95%;
        padding-left: 1rem;
        float: left;
    }
    @media screen and (max-width: 768px){
        .img-face{
            width: 10px;
            float: left;
            margin-top: 1rem;
        }

        .img-content{
            padding-left: 2.5rem;
            float: left;
        }

    }
    /*pad: w >= 768  && w< 992*/
    @media screen and (max-width: 992px) and (min-width: 768px) {
        .img-face{
            width: 10px;
            float: left;
            margin-top: 1rem;
        }

        .img-content{
            padding-left: 2.5rem;
            float: left;
        }

    }
    /*中等屏幕   w >= 992  && w<1200*/
    @media screen and (max-width: 1200px) and (min-width: 992px) {
        .img-face{
            width: 5% !important;
            float: left;
            margin-top: 1rem;
        }

    }
    .reply_btn{
        cursor : pointer;
        color:#ffffff;
        background-color:#a6a6a6;
        width: 100px;
    }
    .col-md-12 p{
        text-align: right;
    }
</style>
<script>
    export default{
        props:['comment','comments','user_id','post_id'],
        data(){
            return{
                 show_level:true,
                 is_show:false,
                 comment_content:'',
                 real_comments:this.comments,
            }
        },
        mounted(){
              if(this.comment.level >2){
                    this.show_level=false;
              }else{
                    this.show_level=true;
              }
        },
        methods:{
            show_relpy(){
                  this.is_show=!this.is_show;
            },
            is_follow(){
                if(typeof(this.comments[this.comment.id])=='undefined'){
                    return false;
                }
                return true;
             },
             get_child_list(){
                return this.comments[this.comment.id];
             },
             get_is_show_reply(){
                if(this.comment['owner'] && this.comment['owner'].id){
                    return this.user_id!=this.comment['owner'].id
                }
             },
             post_comment(){
                axios.post('/post/'+this.post_id+'/comments',{'parent_id':this.comment.id,'body':this.comment_content}).then((response)=>{
                    if(response.data.success){
                          this.comment_content='';
                          this.is_show=!this.is_show;
                          if(typeof(this.real_comments[''+response.data.reply_block.parent_id])!='undefined'){
                              this.real_comments[response.data.reply_block.parent_id].push(response.data.reply_block);
                          }else{
                              this.real_comments[this.comment.id]=new Array();
                              this.real_comments[this.comment.id].push(response.data.reply_block);
                          }
                    }
                });
             }
        },
    }








</script>
