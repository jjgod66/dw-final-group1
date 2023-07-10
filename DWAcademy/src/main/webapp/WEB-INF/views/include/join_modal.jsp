<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#join-modal .modal-content{
    border-radius: 0.7rem;
}
#join-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#join-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#join-modal .modal-footer{
    border-top: none;
}
#join-modal .row-space {
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -moz-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
}
#join-modal input {
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
#join-modal .input-group {
    margin-bottom: 1rem;
}
#join-modal .input--style-3 {
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
#join-modal .input-group-icon {
    position: relative;
    width: 100%;
}
#join-modal .input-group-icon i {
    position: absolute;
    top: calc(50% - 15px);
    right: 15px;
    color: #999;
    font-size: 1.15rem;
}
#join-modal .p-t-10 {
    padding-top: 10px;
    width: 100%;
}
#join-modal .radio-container {
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
#join-modal .radio-container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}
#join-modal .radio-container input:checked~.checkmark {
    background-color: #e5e5e5
}
#join-modal .radio-container input:checked~.checkmark:after {
    display: block
}
#join-modal .radio-container .checkmark:after {
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
#join-modal .checkmark {
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
#join-modal .checkmark:after {
    content: "";
    position: absolute;
    display: none
}
#join-modal .btn {
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
#join-modal .btn--signup {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
</style>
<div class="modal fade" id="join-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2">회원가입</h3>
				<form role="joinForm" action="<%=request.getContextPath() %>/member/join.do" method="POST">
				<div class="row row-space">
					<div class="col-6">
						<div class="input-group">
							<label class="label">아이디</label>
							<input class="input--style-3" type="text" name="mem_id">
							<div><span id="result_checkId" style="font-size:12px;"></span></div>
						</div>
					</div>
					<div class="col-6">
					<br>
						<button type="button" onclick="idCheck_go();" class="btn btn--signup">중복확인</button>
					</div>
					<div class="col-6">
						<div class="input-group">
							<label class="label">이름</label>
							<input class="input--style-3" type="text" name="mem_name">
						</div>
					</div>
				</div>
				<div class="row row-space">
					<div class="col-6">
						<div class="input-group">
							<label class="label">비밀번호</label>
							<input class="input--style-3 pwdCheck" type="password" name="mem_pwd">
							<div><span id="result_pwdCheck" style="font-size:12px;"></span></div>
						</div>
					</div>
					<div class="col-6">
						<div class="input-group">
							<label class="label">비밀번호 확인</label>
							<input class="input--style-3 pwdCheck" type="password" name="pwd_re">
							<div><span id="result_pwdReCheck" style="font-size:12px;"></span></div>
						</div>
					</div>
				</div>
				<div class="row row-space">
					<div class="col-6">
						<div class="input-group">
							<label class="label">생년월일</label>
							<div class="input-group-icon">
								<input class="input--style-3 js-datepicker" type="text" name="mem_bir" readonly>
								<i class="bi bi-calendar-week js-btn-calendar"></i>
							</div>
						</div>
					</div>
					
				</div>
				<div class="row row-space">
					<div class="col-6">
						<div class="input-group">
							<label class="label">이메일</label>
							<input class="input--style-3" type="email" name="mem_email">
							<div><span id="result_emailCheck" style="font-size:12px;"></span></div>
						</div>
					</div>
					<div class="col-6">
						<div class="input-group">
							<label class="label">휴대폰 번호</label>
							<input class="input--style-3" type="text" name="mem_phone">
						</div>
					</div>
				</div>
				<div class="pt-3">
					<button class="btn btn--signup" type="button" onclick="submit_go();">회원가입</button>
				</div>
				</form>
            </div>
        </div>
    </div>
</div>
<%@ include file = "join_modal_js.jsp"  %>