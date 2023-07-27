<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/member_header.jsp" %>
<style>
.additionalinfo-wrapper {
}
.additionalinfo-wrapper h2.tit {
    padding: 26px 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
.additionalinfo-wrapper .box-radius {
    border: 1px solid #d8d9db;
    border-radius: 5px;
    margin: 0 0 30px 0;
}
.additionalinfo-wrapper .box-radius .box-top {
    position: relative;
    line-height: 48px;
    padding: 0 30px;
    border-bottom: 1px solid #d8d9db;
}
.additionalinfo-wrapper .box-radius .box-top strong {
    font-size: 1.2em;
}
.additionalinfo-wrapper .box-radius .box-top .righten {
    position: absolute;
    right: 30px;
    top: 0;
}
.additionalinfo-wrapper .box-radius .box-top .righten input {
    margin: 0 5px 0 10px;
}
.additionalinfo-wrapper .box-radius .box-top .righten [type=checkbox], 
.additionalinfo-wrapper .box-radius .box-top .righten [type=radio] {
    width: 16px;
    height: 16px;
    vertical-align: middle;
}
.additionalinfo-wrapper .box-radius .box-bot {
    padding: 30px;
}
.additionalinfo-wrapper .box-radius p {
    margin: 0;
    padding: 0;
}
.additionalinfo-wrapper .box-radius p+p {
    margin: 10px 0 0 0;
}
.additionalinfo-wrapper .iconset {
    overflow: hidden;
    display: inline-block;
    margin: -1px 0 0 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
    background-position: 0 0;
    background-repeat: no-repeat;
}
.additionalinfo-wrapper .ico-exclamation-gblue {
    width: 16px;
    height: 16px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-exclamation-gblue.png);
}
.additionalinfo-wrapper .chk-box .label {
    display: inline-block;
    vertical-align: middle;
}
.additionalinfo-wrapper .chk-box .w80px {
    width: 80px!important;
}
.additionalinfo-wrapper .btn-group {
    display: block;
    margin: 20px auto 30px;
    text-align: center;
}
.additionalinfo-wrapper .button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #503396;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}
.additionalinfo-wrapper .button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}
</style>
<div class="additionalinfo-wrapper">
	<h2 class="tit">선택정보 수정</h2>
	<div class="box-radius">
		<div class="box-top">
			<strong>마케팅 활용을 위한 개인정보 수집 이용 안내</strong>
			<div class="righten">
				<label for="chk1"><input type="radio" name="personInfoUtilAgreeAt" id="chk1" value="N">미동의</label>
				
				<label for="chk2"><input type="radio" name="personInfoUtilAgreeAt" id="chk2" value="Y">동의</label>
				
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
				<strong class="label w80px email">이메일</strong>
				<input type="radio" name="marketEmailRcvAgreeAt" id="chk3" value="Y">
				<label for="chk3" class="w80px">수신동의</label>
				<input type="radio" name="marketEmailRcvAgreeAt" id="chk4" value="N">
				<label for="chk4" class="w80px">수신거부</label>
			</div>
			<div class="chk-box mt05">
				<strong class="label w80px sms">SMS</strong>
				<input type="radio" name="marketSmsRcvAgreeAt" id="chk5" value="Y">
				<label for="chk5" class="w80px">수신동의</label>

				<input type="radio" name="marketSmsRcvAgreeAt" id="chk6" value="N">
				<label for="chk6" class="w80px">수신거부</label>
			</div>
		</div>
	</div>
	<h3 class="tit">부가정보</h3>
	<div class="btn-group py-3">
		<button class="button large" id="cancelBtn">취소</button>
		<button class="button purple large" id="updateBtn">수정</button>
	</div>
</div>

<script>
$('#chk1').on('click', function(){
	$('input[name=marketSmsRcvAgreeAt]').attr("disabled", true);
	$('input[name=marketEmailRcvAgreeAt]').attr("disabled", true);
	$('#chk4').attr('checked', true);
	$('#chk6').attr('checked', true);
})
$('#chk2').on('click', function(){
	$('input[name=marketSmsRcvAgreeAt]').attr("disabled", false);
	$('input[name=marketEmailRcvAgreeAt]').attr("disabled", false);
	
})

// console.log($('#chk3').val())
// console.log($('#chk4').val())
// console.log($('#chk5').val())
// console.log($('#chk6').val())


if($('#chk3').val() == "${member.gb_email_alert}"){
	$('#chk3').attr("checked", true);
}
if($('#chk4').val() == "${member.gb_email_alert}"){
	$('#chk4').attr("checked", true);
}
if($('#chk5').val() == "${member.gb_sms_alert}"){
	$('#chk5').attr("checked", true);
}
if($('#chk6').val() == "${member.gb_sms_alert}"){
	$('#chk6').attr("checked", true);
}
if($('#chk3').is(':checked') || $('#chk5').is(':checked')){
	$('#chk2').attr('checked', true);
}
else if($('#chk4').is(':checked') || $('#chk6').is(':checked')){
	$('#chk1').attr('checked', true);
	$('input[name=marketSmsRcvAgreeAt]').attr("disabled", true);
	$('input[name=marketEmailRcvAgreeAt]').attr("disabled", true);
}

$('#updateBtn').on('click', function(){
console.log($('input:radio[name=marketSmsRcvAgreeAt]:checked').val())
console.log($('input:radio[name=marketEmailRcvAgreeAt]:checked').val())
let sms = $('input:radio[name=marketSmsRcvAgreeAt]:checked').val();
let email = $('input:radio[name=marketEmailRcvAgreeAt]:checked').val();
	$.ajax({
		url : "<%=request.getContextPath()%>/member/addition.do",
		method : "post",
		data : {gb_sms_alert : sms,
				gb_email_alert : email},
		success : function(res){
			console.log(res);
		},
		error : function(err){
			console.log(err);
		}
	})
})

</script>
<%@ include file="../include/member_footer.jsp" %>