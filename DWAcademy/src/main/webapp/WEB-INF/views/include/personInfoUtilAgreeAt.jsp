<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#personInfoUtilAgreeAt .modal-content{
    border-radius: 0.7rem;
}
#personInfoUtilAgreeAt .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#personInfoUtilAgreeAt .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#personInfoUtilAgreeAt .modal-footer{
    border-top: none;
}
#personInfoUtilAgreeAt .row-space {
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -moz-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
}
#personInfoUtilAgreeAt input {
    outline: none;
    margin: 0;
    border: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
/*     width: 100%; */
    font-size: 14px;
    font-family: inherit;
}
#personInfoUtilAgreeAt .input-group {
    margin-bottom: 1rem;
}
#personInfoUtilAgreeAt .input--style-3 {
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
#personInfoUtilAgreeAt .input-group-icon {
    position: relative;
    width: 100%;
}
#personInfoUtilAgreeAt .input-group-icon i {
    position: absolute;
    top: calc(50% - 15px);
    right: 15px;
    color: #999;
    font-size: 1.15rem;
}
#personInfoUtilAgreeAt .p-t-10 {
    padding-top: 10px;
    width: 100%;
}
#personInfoUtilAgreeAt .checkmark {
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
#personInfoUtilAgreeAt .checkmark:after {
    content: "";
    position: absolute;
    display: none
}
#personInfoUtilAgreeAt .btn {
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
#personInfoUtilAgreeAt .btn--signup {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
#personInfoUtilAgreeAt .box-radius {
    border: 1px solid #d8d9db;
    border-radius: 5px;
    margin: 0 0 30px 0;
}
#personInfoUtilAgreeAt .box-radius .box-top {
    position: relative;
    line-height: 48px;
    padding: 0 30px;
    border-bottom: 1px solid #d8d9db;
}
#personInfoUtilAgreeAt .box-radius .box-top strong {
    font-size: 1.2em;
}
#personInfoUtilAgreeAt .box-radius .box-top .righten {
    position: absolute;
    right: 30px;
    top: 0;
}
#personInfoUtilAgreeAt .box-radius .box-top .righten input {
    margin: 0 5px 0 10px;
}
#personInfoUtilAgreeAt .box-radius .box-top .righten [type=checkbox], 
#personInfoUtilAgreeAt .box-radius .box-top .righten [type=radio] {
    width: 16px;
    height: 16px;
    vertical-align: middle;
}
#personInfoUtilAgreeAt .box-radius .box-bot {
    padding: 30px;
}
#personInfoUtilAgreeAt .box-radius p {
    margin: 0;
    padding: 0;
}
#personInfoUtilAgreeAt .box-radius p+p {
    margin: 10px 0 0 0;
}
#personInfoUtilAgreeAt .chk-box .label {
    display: inline-block;
    vertical-align: middle;
}
#personInfoUtilAgreeAt .chk-box .w80px {
    width: 80px!important;
}
</style>
<div class="modal fade" id="personInfoUtilAgreeAt">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            <form class="memberInfo">
            	<div class="box-radius">
					<div class="box-top">
						<strong>마케팅 활용을 위한 개인정보 수집 이용 안내</strong>
						<div class="righten">
							<input type="radio" name="personInfoUtilAgreeAt1" id="chk11" value="N"><label for="chk11">미동의</label>
							<input type="radio" name="personInfoUtilAgreeAt1" id="chk22" value="Y" checked=""><label for="chk22">동의</label>
						</div>
					</div>
					<div class="box-bot">
						<p>
							[수집 목적]<br>
							고객 맞춤형 상품 및 서비스 추천. 당사 신규 상품/서비스 안내 및 권유. 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유
						</p>
						<p>
							[수집 항목]<br>
							이메일, 휴대폰번호, 주소, 생년월일, 선호극장, 문자/이메일/앱푸쉬 정보 수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그
						</p>
						<p>
							[보유 및 이용 기간]<br>
							회원 탈퇴 시 혹은 이용 목적 달성 시까지
						</p>
					</div>
				</div>
				<br>
				<div class="box-radius">
					<div class="box-top">
						<strong>마케팅정보 수신동의</strong>
					</div>
						<div class="box-bot">
							<p>
								거래정보와 관련된 내용(예매완료/취소)과 소멸포인트 안내는 수신동의 여부와 관계없이 SMS, PUSH 알림 또는 이메일로 발송됩니다.<br>
								이 외 타 정보는 수신동의를 하셔야만 받으실 있습니다. (2014.05.16 기준)
							</p>
							<div class="my-3">
								<i class="iconset ico-exclamation-gblue"></i> 수신동의 여부를 선택해 주세요.
							</div>
							<div class="chk-box">
								<strong class="label w80px">이메일</strong>
								<input type="radio" name="marketEmailRcvAgreeAt1" id="chk33" value="Y">
								<label for="chk33" class="w80px">수신동의</label>
								<input type="radio" name="marketEmailRcvAgreeAt1" id="chk44" value="N" checked="">
								<label for="chk44" class="w80px">수신거부</label>
							<div class="chk-box">
								<strong class="label w80px">SMS</strong>
								<input type="radio" name="marketSmsRcvAgreeAt1" id="chk55" value="Y">
								<label for="chk55" class="w80px">수신동의</label>
								<input type="radio" name="marketSmsRcvAgreeAt1" id="chk66" value="N" checked="">
								<label for="chk66" class="w80px">수신거부</label>
							</div>
						</div>
					</div>
				</div>
				<div class="pt-3">
					<button class="btn btn--signup" type="button" onclick="join_go();">확인</button>
				</div>
				</form>
            </div>
        </div>
    </div>
</div>
<script>
$('#chk11').on('click', function(){
	$('input[name=marketSmsRcvAgreeAt1]').attr("disabled", true);
	$('input[name=marketEmailRcvAgreeAt1]').attr("disabled", true);
	$('#chk44').attr('checked', true);
	$('#chk66').attr('checked', true);
})
$('#chk22').on('click', function(){
	$('input[name=marketSmsRcvAgreeAt1]').attr("disabled", false);
	$('input[name=marketEmailRcvAgreeAt1]').attr("disabled", false);
})
</script>
<%@ include file = "join_modal_js.jsp"  %>
<%@ include file = "../common/searchAdress.jsp"  %>