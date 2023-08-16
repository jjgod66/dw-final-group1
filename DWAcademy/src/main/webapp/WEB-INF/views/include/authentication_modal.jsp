<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#authentication-modal .modal-content{
    border-radius: 0.7rem;
}
#authentication-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#authentication-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#authentication-modal .modal-footer{
    border-top: none;
}
#authentication-modal .row-space {
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -moz-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
}
#authentication-modal input {
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
#authentication-modal .input-group {
    margin-bottom: 1rem;
}
#authentication-modal .input--style-3 {
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
#authentication-modal .input-group-icon {
    position: relative;
    width: 100%;
}
#authentication-modal .input-group-icon i {
    position: absolute;
    top: calc(50% - 15px);
    right: 15px;
    color: #999;
    font-size: 1.15rem;
}
#authentication-modal .p-t-10 {
    padding-top: 10px;
    width: 100%;
}
#authentication-modal .radio-container {
    display: inline-block;
    position: relative;
    padding-left: 30px;
    cursor: pointer;
    font-size: 16px;
    color: #666;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}
#authentication-modal .radio-container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}
#authentication-modal .radio-container input:checked~.checkmark {
    background-color: #e5e5e5
}
#authentication-modal .radio-container input:checked~.checkmark:after {
    display: block
}
#authentication-modal .radio-container .checkmark:after {
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%,-50%);
    -moz-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    -o-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
    width: 12px;
    height: 12px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    background: #4aa8d8
}
#authentication-modal .checkmark {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
    -moz-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -o-transform: translateY(-50%);
    transform: translateY(-50%);
    left: 0;
    height: 20px;
    width: 20px;
    background-color: #e5e5e5;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    -webkit-box-shadow: inset 0 1px 3px 0 rgba(0,0,0,.08);
    -moz-box-shadow: inset 0 1px 3px 0 rgba(0,0,0,.08);
    box-shadow: inset 0 1px 3px 0 rgba(0,0,0,.08)
}
#authentication-modal .checkmark:after {
    content: "";
    position: absolute;
    display: none
}
#authentication-modal .btn {
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
    width: 100%;
}
#authentication-modal .btn--signup {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
</style>
<div class="modal fade" id="authentication-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2">본인인증</h3>
				<form role="authForm" action="<%=request.getContextPath()%>/member/authentication.do" method="post">
				<div class="row row-space">
					<div class="col-6">
						<div class="input-group">
							<label class="label">이름</label>
							<input class="input--style-3" type="text" name="name">
						</div>
					</div>
					<div class="col-6">
						<div class="input-group">
							<label class="label">생년월일</label>
								<input class="input--style-3 js-datepicker" type="text" name="bir" placeholder="ex)20020101" maxlength="8">
						</div>
					</div>
				</div>
				<div class="row row-space">
					<div class="col-6">
						<div class="input-group">
							<label class="label">전화번호</label>
							<input class="input--style-3" id="phone" type="text" pattern="{10, 11}" placeholder="-없이 숫자만 입력하세요" required>
						</div>
						<div>
							<button type="button" id="sendSMS" class="btn btn--signup" >인증번호 보내기</button>
						</div>
					</div>
					<div class="col-6">
						<div class="input-group">
							<label class="label">인증번호</label>
							<span id="result_checkCode" style="font-size:12px;"></span>
							<input class="input--style-3" id="SMSCheckInput" type="text" min="10" max="11" placeholder="인증번호 6자리를 입력하세요.">
						</div>
						<div>
							<button type="button" id="SMSCheck" class="btn btn--signup">인증번호 확인</button>
						</div>
					</div>
				</div>
				<div class="pt-3">
					<button class="btn btn--signup" id="joinFormGo" type="button" disabled data-bs-toggle="modal" data-bs-target="#join-modal">확인</button>
				</div>
				</form>
            </div>
        </div>
    </div>
</div>
<%@ include file="authentication_modal_js.jsp" %>