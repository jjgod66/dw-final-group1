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
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<div class="additionalinfo-wrapper">
	<h2 class="tit">개인정보 수정</h2>
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
						<td>${linkDate}</td>
						<td style="text-align: center;">
						<c:choose>
							<c:when test="${sns == null}">
								<a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=bf62309a02d7160678300f689ce8d447&redirect_uri=http://localhost/kakao/callback">연동</a>
							</c:when>
							<c:otherwise>
								<a id="kakao-login-btn" href="#" onclick="unLink_go();">연동해제</a>
							</c:otherwise>
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
console.log(${sns_email});
console.log(${linkDate});
function unLink_go(){
	Kakao.API.request({
	  url: '/v1/user/unlink',
	  success: function(response) {
	    console.log(response);
	  },
	  fail: function(error) {
	    console.log(error);
	  },
	});
}
</script>
<%@ include file="../include/member_footer.jsp" %>