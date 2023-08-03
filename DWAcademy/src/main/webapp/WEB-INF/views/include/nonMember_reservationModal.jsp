<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#login-modal .modal-content{
    border-radius: 0.7rem;
}
#login-modal .modal-header img{
    width: 100px;
}
#login-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#login-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#login-modal .modal-footer{
    border-top: none;
}
#login-modal button:active{
    outline: none;
}
#login-modal button:focus{
   outline: none;
}
#login-modal .modal-body{
    text-align: center;
}
#login-modal form{
    padding: 3vh;
}
#login-modal input {
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
#login-modal .input-group {
    margin-bottom: 1rem;
}
#login-modal .input--style-3 {
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
#login-modal .btn {
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
#login-modal .btn--naver {
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
#login-modal .btn--kakao {
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
#login-modal .btn--login {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
#login-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#login-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#login-modal .col{
      padding: 2vh 10px 4vh;
}
#login-modal .new{
      padding-bottom: 0;
}
#login-modal .btn-primary{
      width:40%;
      margin:30%
}
#login-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
.nonMemberForm .col-md-2 {
	padding-left : 0;
	padding-right : 0;
}
.nonMemberForm .col-md-4 {
	padding-left : 0;
	padding-right : 0;
}
.nonMemberForm .col-md-6 {
	padding-left : 0;
	padding-right : 1rem;
}
.nonMemberForm .col-md-8 {
	padding-left : 0;
	padding-right : 0;
}
</style>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<script>
	Kakao.init('4d3eb758ca79e46a21afa1951cdbec30'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
</script>
<div class="modal fade" id="nonMember_reservationModal">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2">비회원 예매</h3>
            	<div class="row mb-3">
            		<div class="col-md-6 nonMemberForm">
		                <form id="formForNonMem" method="POST">
		                
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>이름</b>
		                	</div>
		                	<div class="col-md-8">
			                    <input class="form-control" type="text" name="non_mem_name" maxlength="30" placeholder="" name="text">
		                	</div>
		                </div>
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>생년월일</b>
		                	</div>
		                	<div class="col-md-8">
			                    <input class="form-control" type="text" name="non_mem_bir" maxlength="8" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="생년월일 앞 8자리 " name="text">
		                	</div>
		                </div>
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>휴대폰번호</b>
		                	</div>
		                	<div class="col-md-6">
			                    <input class="form-control" type="text" id="non_mem_phone" name="non_mem_phone" maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="-없이 입력" name="text">
		                	</div>
		                	<div class="col-md-2" style="text-align: center; align-self: center;">
		                		<button type="button" id="sendAuthNumberBtn" class="form-control" style="background-color: #e9ecef; border: none; border-radius: 0.5rem; font-size: 0.7rem; padding: 0.2rem 0.4rem;">인증요청</button>
		                	</div>
		                </div>
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>인증번호</b>
		                	</div>
		                	<div class="col-md-6">
			                    <input class="form-control" type="text" id="auth_number" placeholder="" maxlength="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="text">
		                	</div>
		                	<div class="col-md-2" style="text-align: center; align-self: center;">
		                		<button type="button" id="checkAuthNumberBtn"class="form-control" style="background-color: #e9ecef; border: none; border-radius: 0.5rem; font-size: 0.7rem; padding: 0.2rem 0.4rem;">확 인</button>
		                	</div>
		                </div>
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>비밀번호</b>
		                	</div>
		                	<div class="col-md-8">
			                    <input class="form-control" type="password" name="non_mem_pwd" id="non_mem_pwd" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자(4자리)" name="text">
		                	</div>
		                </div>
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>비밀번호확인</b>
		                	</div>
		                	<div class="col-md-8">
			                    <input class="form-control" type="password" id="non_mem_pwd_certify" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자(4자리)" name="text">
		                	</div>
		                </div>
		             
		                </form>
            		</div>
            		<div class="col-md-6">
            			<div class="card" style="border: 1px solid #d8d9db; width:100%; height:100%;">
            				<div class="card-header">비회원예매 개인정보 처리방침</div>
            				<div class="card-body mb-3">
            					<div class="row">
            						<div class="col-md-3 mb-2"><b>수집목적</b></div>
            						<div class="col-md-9">비회원예매 서비스 제공 / 이용자식별 / 구매 및 결제</div>
            						<div class="col-md-3 mb-2"><b>수집항목</b></div>
            						<div class="col-md-9">이름, 생년월일, 휴대폰번호, 비밀번호</div>
            						<div class="col-md-3 mb-3"><b>보유기간</b></div>
            						<div class="col-md-9" style="text-decoration: underline;">관람 또는 취소 후 <b style="color: red;">7</b>일 이내</div>
            						<div class="col-md-12 mb-3" style="background-color: #e9ecef; border-radius: 0.5rem; height: 2rem; line-height: 2rem;">
            							<input type="radio" name="agreeNonMem" id="Y"><label for="Y">동의</label>
            							<input type="radio" name="agreeNonMem" id="N"><label for="N">미동의</label>
            						</div>
            						<div class="col-md-12" style="color: #01738b;">
            							정보수집에 동의를 거부할 수 있으며, 동의하지 않을 경우 비회원 예매서비스를 이용하실 수 없습니다.
            						</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            	<div class="text-center">
            		<input type="hidden" id="nonMem_Modal_screen_cd" value="">
					<button type="button" id="submitNonMemberInfo"style="background-color: #4aa8d8; border: none; border-radius: 0.5rem; padding: 0.5rem 0.8rem; color: white;">확 인</button> 
				</div>
            </div>
        </div>
    </div>
</div>
<script>
let checkNonMemberNum = "";
let nonMemberPhone = '';
let nonMemberPhoneChecked = '';
$('#sendAuthNumberBtn').on('click',function(){
	let phone = $('#non_mem_phone').val();
	nonMemberPhone = phone;
	if(phone != ""){
		$.ajax({
			url : '<%=request.getContextPath()%>/SMS/send.do',
			method : 'post',
			data : {"phone" : phone},
			success : function(res){
				alert('메세지를 성공적으로 보냈습니다!')
				console.log(res);
				checkNonMemberNum = res;
			},
			error : function(err){
				alert(err.status);
			}
		})
	}else{
		alert('번호를 입력해주세요.');
	}
});

$('#checkAuthNumberBtn').on('click', function(){
	if(checkNonMemberNum != '') {
		if ($('#auth_number').val() == checkNonMemberNum) {
			alert('휴대폰 인증을 완료하였습니다.');
			nonMemberPhoneChecked = nonMemberPhone;
		} else {
			alert('올바르지 않은 인증번호입니다.');
		}
	} else {
		alert('인증번호를 입력하세요.');
	}
	
});

$('#submitNonMemberInfo').on('click', function(){
	for (let i = 0; i < $('.nonMemberForm input').get().length; i++) {
		if ($('.nonMemberForm input').eq(i).val() == "" || $('.nonMemberForm input').eq(i).val() == null) {
			alert("작성양식을 모두 기입해주세요.");
			return;
		}
	}
	if ($('input[name="non_mem_bir"]').val().length != 8) {
		alert("생년월일이 유효하지 않습니다.");
		return;
	}
	if (nonMemberPhoneChecked == '' || nonMemberPhoneChecked != $('#non_mem_phone').val()) {
		alert('휴대폰 인증을 하여야합니다');
		return;
	}
	
	if ($('#non_mem_pwd').val() != $('#non_mem_pwd_certify').val()) {
		alert("비밀번호가 일치하지 않습니다.");
		return;
	}
	
	if ($('input[name="agreeNonMem"]:checked').attr('id') != 'Y') {
		alert("정보수집에 동의하지 않으면 이용할 수 없습니다.");
	}
	
	let form = $('#formForNonMem');
	form.attr('action', '/reservation/detail.do?screen_cd='+$('#nonMem_Modal_screen_cd').val());
	form.submit();
	
});

</script>
<%@ include file = "login_modal_js.jsp" %>