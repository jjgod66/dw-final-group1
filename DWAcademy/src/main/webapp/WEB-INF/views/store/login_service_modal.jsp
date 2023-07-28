<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#login-service-modal .modal-content{
    border-radius: 0.7rem;
}
#login-service-modal .modal-header img{
    width: 100px;
}
#login-service-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#login-service-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#login-service-modal .modal-footer{
    border-top: none;
}
#login-service-modal button:active{
    outline: none;
}
#login-service-modal button:focus{
   outline: none;
}
#login-service-modal .modal-body{
    text-align: center;
}
#login-service-modal form{
    padding: 3vh;
}
#login-service-modal input {
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
#login-service-modal .input-group {
    margin-bottom: 1rem;
}
#login-service-modal .input--style-3 {
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
#login-service-modal .btn {
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


#login-service-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#login-service-modal .btn-regist:hover {
    background: #fff;
    color: #4aa8d8;
}

</style>
<div class="modal fade" id="login-service-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 70%; height: 130px; margin: 0 auto;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5>로그인이 필요한 서비스입니다.</h5>
                 <div style="display: flex; margin-top:20px;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" id="loginServiceModalClose">확인</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	$('#loginServiceModalClose').on('click', function(){
		$('#login-service-modal').modal("hide");
	})
</script>