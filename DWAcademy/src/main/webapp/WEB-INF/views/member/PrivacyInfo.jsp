<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/member_header.jsp" %>
<div class="additionalinfo-wrapper">
	<h2 class="tit">선택정보 수정</h2>
	<div class="box-radius">
		<div class="box-top">
			<strong>마케팅 활용을 위한 개인정보 수집 이용 안내</strong>
			<div class="righten">
				<input type="radio" name="personInfoUtilAgreeAt" id="chk1" value="N"><label for="chk1">미동의</label>
				<input type="radio" name="personInfoUtilAgreeAt" id="chk2" value="Y" checked=""><label for="chk2">동의</label>
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
				<strong class="label w80px">이메일</strong>
				<input type="radio" name="marketEmailRcvAgreeAt" id="chk3" value="Y" checked="">
				<label for="chk3" class="w80px">수신동의</label>
				<input type="radio" name="marketEmailRcvAgreeAt" id="chk4" value="N">
				<label for="chk4" class="w80px">수신거부</label>
					<span>(동의일시 : 2023-01-16 12:04)</span><br>
			</div>
			<div class="chk-box mt05">
				<strong class="label w80px">SMS</strong>
				<input type="radio" name="marketSmsRcvAgreeAt" id="chk5" value="Y" checked="">
				<label for="chk5" class="w80px">수신동의</label>

				<input type="radio" name="marketSmsRcvAgreeAt" id="chk6" value="N">
				<label for="chk6" class="w80px">수신거부</label>
					<span>(동의일시 : 2023-01-16 12:04)</span><br>
			</div>
		</div>
	</div>
	<h3 class="tit">부가정보</h3>
	<div class="btn-group py-3">
		<button class="button large" id="cancelBtn">취소</button>
		<button class="button purple large" id="updateBtn">수정</button>
	</div>
</div>
<%@ include file="../include/member_footer.jsp" %>