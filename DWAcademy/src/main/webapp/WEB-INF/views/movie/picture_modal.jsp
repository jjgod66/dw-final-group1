<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
HTML CSSResult Skip Results Iframe
EDIT ON
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
       .rate { display: inline-block;border: 0;margin-right: 15px;}
.rate > input {display: none;}
.rate > label {float: right;color: #ddd}
.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } 
.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  }

#picture-modal .modal-content{
    border-radius: 0.7rem;
}
#picture-modal .modal-header img{
    width: 100px;
}
#picture-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#picture-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#picture-modal .modal-footer{
    border-top: none;
}
#picture-modal button:active{
    outline: none;
}
#picture-modal button:focus{
   outline: none;
}
#picture-modal .modal-body{
    text-align: center;
}
#picture-modal form{
    padding: 3vh;
}
#picture-modal input {
    outline: none;
    margin: 0;
    border: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    width: 100%;
    font-size: 14px;
    font-family: inherit;
}
#picture-modal .input-group {
    margin-bottom: 1rem;
}
#picture-modal .input--style-3 {
    padding: 0.75rem !important;
    outline: none;
    width: 100% !important;
    min-width: unset;
    border: none;
    border-radius: 0;
    box-shadow: none !important;
    background: #f9f9f9;
    border: 1px solid #eee;
}
#picture-modal .btn {
    display: inline-block;
    line-height: 42px;
    padding: 0 33px;
    font-family: Poppins;
    cursor: pointer;
    color: #fff;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    transition: all 0.4s ease;
    font-size: 18px;
    width: 100%
}
#picture-modal .btn--naver {
    background-color: #27d34a !important;
    background-image: url(https://vendor-cdn.imweb.me/images/naver_login2x.png);
    background-size: 16px;
    background-position: 15px 50%;
    background-repeat: no-repeat;
    border-color: #27d34a !important;
    color: #fff !important;
    font-size: 12px;
    padding: 0;
}
#picture-modal .btn--kakao {
    background-color: #ffeb00 !important;
    background-image: url(https://vendor-cdn.imweb.me/images/kakao_icon.png);
    background-size: 20px;
    background-position: 12px 49%;
    background-repeat: no-repeat;
    border-color: #ffeb00 !important ;
    color: #333 !important;
    font-size: 12px;
    padding: 0;
}
#picture-modal .btn--login {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
#picture-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#picture-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 30%;
    margin-left: 10px;
    margin-right: 10px;
}
#picture-modal .btn-cancel:hover {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 30%;
    margin-left: 10px;
    margin-right: 10px;
}
#picture-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#picture-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#picture-modal .col{
      padding: 2vh 10px 4vh;
}
#picture-modal .new{
      padding-bottom: 0;
}
#picture-modal .btn-primary{
      width:40%;
      margin:30%
}
#picture-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
#picCan:hover{
	cursor: pointer;
}

</style>
<div class="modal fade" id="picture-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
                <div class="input-group moviePicDetail">
	                <img style="width: 100%;">
                </div>
                <div style="text-align: center;">
	                <button class="btn btn-cancel" type="button" data-target="#" id="picCan">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
	$('#picCan').on('click', function(){
		$('#picture-modal').modal("hide");
	})
})

</script>