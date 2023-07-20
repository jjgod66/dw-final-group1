<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/member_header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<script>
	Kakao.init('4d3eb758ca79e46a21afa1951cdbec30'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
</script>
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
						<td><fmt:formatDate value="${kakao.linkdate}" pattern="yyyy-MM-dd"/> ${kakao.sns_email}</td>
						<td style="text-align: center;">
						<c:choose>
							<c:when test="${kakao.mem_cd eq null or kakao.sns ne 'K'}">
								<a id="btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=bf62309a02d7160678300f689ce8d447&redirect_uri=http://localhost/kakao/callback">연동</a>
							</c:when>
							<c:when test="${kakao.mem_cd ne null and kakao.sns eq 'K'}">
								<a id="btn" href="#" onclick="unLink_go();">연동해제</a>
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
								<a id="btn" href="#" onclick="unLink_go();">연동해제 </a>
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
function unLink_go(){
	Kakao.API.request({
	  url: '/v1/user/unlink',
	})
	.then(function(res){
		location.href="<%=request.getContextPath()%>/sns/unlink.do",
// 		alert('success: ' + JSON.stringify(res));
	    console.log(response);
	    location.reload();
	})
	.catch(function(err){
// 		alert('fail: ' + JSON.stringify(err));
		console.log(err);
	})
}
</script>
<%@ include file="../include/member_footer.jsp" %>