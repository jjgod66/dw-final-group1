<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/member_header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.PrivacyInfo-wrapper {
}
.PrivacyInfo-wrapper h2.tit {
    padding: 26px 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
.PrivacyInfo-wrapper .box-radius {
    border: 1px solid #d8d9db;
    border-radius: 5px;
    margin: 0 0 30px 0;
}
.PrivacyInfo-wrapper .box-radius .box-top {
    position: relative;
    line-height: 48px;
    padding: 0 30px;
}
.PrivacyInfo-wrapper .box-radius .box-top strong {
    font-size: 1.2em;
}
.PrivacyInfo-wrapper .box-radius .box-top .righten {
    position: absolute;
    right: 30px;
    top: 0;
}
.PrivacyInfo-wrapper .box-radius .box-top .righten input {
    margin: 0 5px 0 10px;
}
.PrivacyInfo-wrapper .box-radius .box-top .righten [type=checkbox], 
.PrivacyInfo-wrapper .box-radius .box-top .righten [type=radio] {
    width: 16px;
    height: 16px;
    vertical-align: middle;
}
.PrivacyInfo-wrapper .box-radius .box-bot {
    padding: 30px;
}
.PrivacyInfo-wrapper .box-radius p {
    margin: 0;
    padding: 0;
}
.PrivacyInfo-wrapper .box-radius p+p {
    margin: 10px 0 0 0;
}
.PrivacyInfo-wrapper .iconset {
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
.PrivacyInfo-wrapper .ico-exclamation-gblue {
    width: 16px;
    height: 16px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-exclamation-gblue.png);
}
.PrivacyInfo-wrapper .chk-box .label {
    display: inline-block;
    vertical-align: middle;
}
.PrivacyInfo-wrapper .chk-box .w80px {
    width: 80px!important;
}
.PrivacyInfo-wrapper .btn-group {
    display: block;
    margin: 20px auto 30px;
    text-align: center;
}
.PrivacyInfo-wrapper .button {
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
.PrivacyInfo-wrapper .button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
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
</style>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<script>
	Kakao.init('4d3eb758ca79e46a21afa1951cdbec30'); //발급받은 키 중 javascript키를 사용해준다.
</script>
<div class="PrivacyInfo-wrapper">
	<form enctype="multipart/form-data" role="form" name="registForm">
		<h2 class="tit">개인정보 수정</h2>
		<div class="box-radius">
			<table class="board-list" style="width: 100%;">
				<colgroup>
				<col style="width:200px;">
				<col>
				</colgroup>
				<thead>
					<tr style="border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
						<th scope="row">프로필 사진</th>	
						<td style="padding: 10px 0 10px 0">
						<c:if test="${memberInfo.MEM_PIC_PATH != null}">
							<img alt="Generic placeholder image" id="preview" src="<%=request.getContextPath()%>/common/getPicture.do?name=${memberInfo.MEM_PIC_PATH}&item_cd=${memberInfo.MEM_CD}&type=memberPic" class="mr-3 rounded-pill" style="width: 80px; height: 80px;">
						</c:if>
						<c:if test="${memberInfo.MEM_PIC_PATH == null}">
							<img alt="Generic placeholder image" id="preview" src="../../resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 80px; height: 80px;">
						</c:if>
							<button type="button" class="btn-sm" style="border: 1px solid;" id="profileBtn">이미지 등록</button>
							<input type="hidden" name="oldPicture" value="${memberInfo.MEM_PIC_PATH}">
							<input type="file" id="imgFile" name="mem_pic_path" accept=".jpeg, .png, .jpg, .gif" onchange="imgChange_go();" style="display: none;">
						</td>
						<td><button type="button" id="resignBtn" style="float:right;">회원 탈퇴</button></td>
					</tr>
					<tr style="border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
						<th scope="row">아이디</th>	
						<td> ${memberInfo.MEM_ID}</td>				
					</tr>
				</thead>
			</table>
		</div>
		<div class="box-radius">
			<div class="box-top">
				<strong>기본 정보</strong>
			</div>
				<table class="board-list" style="width: 100%;">
					<colgroup>
					<col style="width:200px;">
					<col>
					</colgroup>
					<thead>
						<tr style="border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
							<th scope="row">이름</th>
							<td> ${memberInfo.MEM_NAME}
								<button type="button">이름 변경</button>
								<span>*이름을 계명한 경우 변경할 수 있습니다.</span>			
							</td>
						</tr>
						<tr style="border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
							<th scope="row">생년월일</th>			
							<td><fmt:formatDate value="${memberInfo.MEM_BIR}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr style="border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
							<th scope="row">휴대폰</th>
							<td> ${memberInfo.MEM_PHONE}
								<button type="button">휴대폰 번호 변경</button>
							</td>					
						</tr>
						<tr style="border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
							<th scope="row">이메일</th>
							<td> ${memberInfo.MEM_EMAIL}</td>				
						</tr>
						<tr style="border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
							<th scope="row">비밀번호</th>
							<td><button type="button">비밀번호 변경</button></td>			
						</tr>
						<tr style="border: 1px solid #eaeaea; border-width: 0 0 1px 0;">
							<th scope="row">주소</th>					
							<td> ${memberInfo.MEM_ADDR} ${memberInfo.MEM_ADDR_DETAIL}
								<button type="button">주소 변경</button>
							</td>
						</tr>
					</thead>
				</table>
			</div>
		</form>
	<div class="box-radius">
		<div class="box-top">
			<strong>간편로그인 계정 연동</strong>
			<div class="table-wrap">
			<table class="board-list" style="width: 100%;">
				<caption>게시판 목록 제목</caption>
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 70%;">
					<col style="width: 20%;">
				</colgroup>
				<thead>
					<tr style="text-align: center;">
						<th scope="col">구분</th>
						<th scope="col">연동정보</th>
						<th scope="col">연결</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row" style="text-align: center;">카카오</td>
						<td><fmt:formatDate value="${kakao.linkdate}" pattern="yyyy-MM-dd"/> ${kakao.sns_email}</td>
						<td style="text-align: center;">
						<c:choose>
							<c:when test="${kakao.mem_cd eq null or kakao.sns ne 'K'}">
								<a id="btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=bf62309a02d7160678300f689ce8d447&redirect_uri=http://localhost/kakao/callback">연동</a>
							</c:when>
							<c:when test="${kakao.mem_cd ne null and kakao.sns eq 'K'}">
								<a id="btn" href="<%=request.getContextPath()%>/kakao/unConnect">연동해제</a>
							</c:when>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td scope="row" style="text-align: center;">네이버</td>
						<td><fmt:formatDate value="${naver.linkdate}" pattern="yyyy-MM-dd"/> ${naver.sns_email}</td>
						<td style="text-align: center;">
						<c:choose>
							<c:when test="${naver.mem_cd eq null or naver.sns ne 'N'}">
								<a id="btn" href="<%=request.getContextPath()%>${url}">연동</a>
							</c:when>
							<c:when test="${naver.mem_cd ne null and naver.sns eq 'N'}">
								<a id="btn" href="<%=request.getContextPath()%>/naver/unConnect.do">연동해제 </a>
							</c:when>
						</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
	</div>
	<div class="btn-group py-3">
		<button class="button large" id="cancelBtn">취소</button>
		<button class="button purple large" id="updateBtn">수정</button>
	</div>
</div>
<script>
function imgChange_go() {
	let inputImage = $('input#imgFile')[0];
	preViewPicture(inputImage, $('#preview'));
}
// 등록이 아니라 수정시 기존 이미지 프리뷰
if ('${memberInfo.MEM_PIC_PATH}' != null && '${memberInfo.MEM_PIC_PATH}' != '') {
	let imageURL = '/common/getPicture.do?name=${memberInfo.MEM_PIC_PATH}&item_cd=${memberInfo.MEM_CD}&type=productImg';	// 이미지명 가지고 와서 셋팅
	$('#preview').css({
							'background-image' : 'url("' + imageURL + '")',
							'background-position' : 'center',
							'background-size' : 'cover',
							'background-repeat' : 'no-repeat'
						});
	$('#inputFileName').val('${memberInfo.MEM_PIC_PATH}');
}
//이미지버튼 클릭
$('#profileBtn').on('click', function(e){
	e.preventDefault();
	$('#imgFile').click();
});
$('#imgFile').on('change', function(){
	$('#inputFileName').removeClass('is-invalid');
})

// 탈퇴버튼 클릭
$('#resignBtn').on('click', function(){
	location.href="<%=request.getContextPath()%>/member/resign.do";
})
</script>
<%@ include file="../include/member_footer.jsp" %>