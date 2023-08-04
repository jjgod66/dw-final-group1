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
.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}
.board-list {
	width: 100%;
    line-height: 1.3;
}
.board-list>thead>tr>th {
    height: 45px;
    padding: 3px 10px;
    color: #222;
    background-color: #f2f4f5;
}
.board-list>tbody>tr>td,
.board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
}
.selectMargin{
	margin-top: 10px;
}
</style>
<div class="additionalinfo-wrapper">
<form role="additionInfo" action="<%=request.getContextPath()%>/member/addition.do" method="post">
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
				<input type="radio" name="gb_email_alert" id="chk3" value="Y">
				<label for="chk3" class="w80px">수신동의</label>
				<input type="radio" name="gb_email_alert" id="chk4" value="N">
				<label for="chk4" class="w80px">수신거부</label>
			</div>
			<div class="chk-box mt05">
				<strong class="label w80px sms">SMS</strong>
				<input type="radio" name="gb_sms_alert" id="chk5" value="Y">
				<label for="chk5" class="w80px">수신동의</label>

				<input type="radio" name="gb_sms_alert" id="chk6" value="N">
				<label for="chk6" class="w80px">수신거부</label>
			</div>
		</div>
	</div>
<h3 class="tit">부가정보</h3>
	<div class="container box-radius" style="padding: 0;">
		<table class="board-list">
			<caption>선호극장</caption>
			<colgroup>
				<col style="width:200px;">
				<col>
			</colgroup>
			<thead>
				<tr style="border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
					<th scope="row">선호극장</th>
					<td style="padding-left: 25px; border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
						<span>선호 영화관은 최대 3개까지 등록 가능합니다.</span>
						<div class="selectMargin">
							<span>1순위</span>
							<div style="display: inline-block;">
								<select name="selectThrLoc1st" class="form-select selectThrLoc" title="지역 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option class="bs-title-option">지역선택</option>
									<c:forEach items="${theaterList}" var="theaterList">
										<option class="bs-title-option">${theaterList.thr_loc}</option>
									</c:forEach>
								</select>
								<select name="selectThrName" id="selectThrName1st" class="form-select selectThrName" title="극장 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option value="">극장 선택</option>
								</select>
							</div>
						</div>
						<div class="selectMargin">
							<span>2순위</span>
							<div style="display: inline-block;">
								<select name="selectThrLoc2nd" class="form-select selectThrLoc" title="지역 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option class="bs-title-option">지역선택</option>
									<c:forEach items="${theaterList}" var="theaterList">
										<option class="bs-title-option">${theaterList.thr_loc}</option>
									</c:forEach>
								</select>
								<select name="selectThrName" id="selectThrName2nd" class="form-select selectThrName" title="극장 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option value="">극장 선택</option>
								</select>
							</div>
						</div>
						<div class="selectMargin">
							<span>3순위</span>
							<div style="display: inline-block;">
								<select name="selectThrLoc3rd" class="form-select selectThrLoc" title="지역 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option class="bs-title-option">지역선택</option>
									<c:forEach items="${theaterList}" var="theaterList">
										<option class="bs-title-option">${theaterList.thr_loc}</option>
									</c:forEach>
								</select>
								<select name="selectThrName" id="selectThrName3rd" class="form-select selectThrName" title="극장 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option value="">극장 선택</option>
								</select>
							</div>
						</div>
						<div class="selectMargin">
							<span>4순위</span>
							<div style="display: inline-block;"> 
								<select name="selectThrLoc4th" class="form-select selectThrLoc" title="지역 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option class="bs-title-option">지역선택</option>
									<c:forEach items="${theaterList}" var="theaterList">
										<option class="bs-title-option">${theaterList.thr_loc}</option>
									</c:forEach>
								</select>
								<select name="selectThrName" id="selectThrName4th" class="form-select selectThrName" title="극장 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option value="">극장 선택</option>
								</select>
							</div>
						</div>
						<div class="selectMargin">
							<span>5순위</span>
							<div style="display: inline-block;">
								<select name="selectThrLoc5th" class="form-select selectThrLoc" title="지역 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option class="bs-title-option">지역선택</option>
									<c:forEach items="${theaterList}" var="theaterList">
										<option class="bs-title-option">${theaterList.thr_loc}</option>
									</c:forEach>
								</select>
								<select name="selectThrName" id="selectThrName5th" class="form-select selectThrName" title="극장 선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
									<option value="">극장 선택</option>
								</select>
							</div>
						</div>
						<br>
					</td>
				</tr>
				<tr>
					<th scope="row" >선호 장르(3개 선택)</th>
					<td>
						<div class="row" style="display: inline-block; margin: 10px 0 10px 0;">
							<select name="genreType1" class="form-select selectGenre" title="장르선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
								<option>장르선택</option>
								<c:forEach items="${genreList}" var="genreList">
									<option value="${genre.genre_cd}">${genreList.genre_name}</option>
								</c:forEach>
							</select>
							<select name="genreType2" class="form-select selectGenre" title="장르선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
								<option>장르선택</option>
								<c:forEach items="${genreList}" var="genreList">
									<option value="${genre.genre_cd}">${genreList.genre_name}</option>
								</c:forEach>
							</select>
							<select name="genreType3" class="form-select selectGenre" title="장르선택" style="display: inline-block; margin-left: 30px!important; width: 150px;">
								<option>장르선택</option>
								<c:forEach items="${genreList}" var="genreList">
									<option value="${genre.genre_cd}">${genreList.genre_name}</option>
								</c:forEach>
							</select>
						</div>
					</td>
				</tr>
			</thead>
		</table>
	</div>
	<div>
		<div class="btn-group py-3">
			<button type="button" class="button large" id="cancelBtn">취소</button>
			<button type="button" class="button purple large" id="updateBtn" onclick="additionSubmit_go();">수정</button>
		</div>
	</div>
</form>
</div>

<script>
$('#chk1').on('click', function(){
	$('input[name=gb_sms_alert]').attr("disabled", true);
	$('input[name=gb_email_alert]').attr("disabled", true);
	$('#chk4').attr('checked', true);
	$('#chk6').attr('checked', true);
})
$('#chk2').on('click', function(){
	$('input[name=gb_sms_alert]').attr("disabled", false);
	$('input[name=gb_email_alert]').attr("disabled", false);
	
})

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
	$('input[name=gb_sms_alert]').attr("disabled", true);
	$('input[name=gb_email_alert]').attr("disabled", true);
}


/* 선호 극장 시작*/
let selectLocData = "";
let createOption = "";
let select = "";
let cd = "";
$('.selectThrLoc').on('change', function(){
	selectLocData = $(this).val();
	select = $(this);
	cd = select.attr('name').substr(12, 16);
	$.ajax({
		url : "<%=request.getContextPath()%>/member/searchTheater.do",
		method : "get",
		data : {selectLocData : selectLocData},
		success : function(res){
			$('#selectThrName'+ cd).html("<option value=''>극장 선택</option>");
			for(let i = 0; res.length > i; i++){
				
				createOption = "<option value='" + res[i].thr_name + "'>" + res[i].thr_name + "</option>";
				if(select.text() == $('select[name=selectThrLoc' + cd + ']').text()){
					$('#selectThrName'+ cd).append(createOption);
				}
				
			};
		},
		error : function(err){
			console.log(err);
		}
	})
});
let selectArr = [];
let selectThrName = "";
$('.selectThrName').on('change', function(){
	select = $(this);
	cd = select.attr('id').substr(13, 16);
	selectThrName = $('#selectThrName' + cd).val();
	console.log(selectThrName);
})
/* 선호 극장 끝 */
	
/* 선호 장르 시작 */
$('.selectGenre').on('change', function(){
	
});
/* 선호 장르 끝 */


/* 수정 버튼 */
function additionSubmit_go(){
let falg = true;
let sameWord = "";
	for(let i = 0; i < selectArr.length; i++){
		for(let j = selectArr.length-1; j > i; j--){
			if(selectArr[i] == selectArr[j]){
				sameWord = selectArr[j];
				console.log(sameWord);
				if($($('.selectThrName')[j]).val() == sameWord){
					$($('.selectThrName')[j]).focus();
					alert("선호극장은 중복될 수 없습니다! 다시 선택해주세요.")
					falg = false;
					return;
				}
			};
		};
	};
	if(falg == true){
		$('form[role=additionInfo]').submit();
	}
};
	
</script>
<%@ include file="../include/member_footer.jsp" %>