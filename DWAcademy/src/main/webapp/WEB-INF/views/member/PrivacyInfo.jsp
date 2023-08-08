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

p.reset {
    padding: 0;
    margin: 0;
}
.lh32 {
    line-height: 32px;
}

.float-l {
    float: left!important;
}

.profile-photo .profile-img img {
    width: 100%;
    height: 100%;
}
.profile-photo .profile-img {
    overflow: hidden;
    float: left;
    width: 68px;
    height: 68px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border-radius: 68px;
    background-size: 100%;
    background-position: center;
}

.profile-photo {
    overflow: hidden;
}
.profile-photo .button.member-out {
    float: right;
    margin-left: 0;
}

.input-text {
    display: inline-block;
    width: 100%;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
.tit-util .right {
    float: right;
}

.board-form tbody td, .board-form tbody th {
    position: relative;
    height: 50px;
    padding: 7px 15px;
    text-align: left;
}
</style>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<script>
	Kakao.init('4d3eb758ca79e46a21afa1951cdbec30'); //발급받은 키 중 javascript키를 사용해준다.
</script>
<div class="additionalinfo-wrapper">
	<div id="contents" class="">
          <h2 class="tit">개인정보 수정</h2>

          <ul class="dot-list mb10">
              <li>회원님의 정보를 정확히 입력해주세요.</li>
          </ul>
			<div class="box-radius">
				<div class="box-top">
		          <div class="table-wrap">
		              <table class="board-form" style="width:100%;">
		                  <caption>프로필사진, 아이디 항목을 가진 표</caption>
		                  <colgroup>
		                      <col style="width:180px;">
		                      <col>
		                  </colgroup>
		                  <tbody>
		                      <tr>
		                          <th scope="row">프로필 사진</th>
		                          <td>
		                              <div class="profile-photo">
		                                  <form name="fileForm">
		                                      <input type="file" id="profileTarget" name="file" style="display: none;">
		                                      
		                                  </form>
		                                          <div class="profile-img">
		                                              <img src="../../resources/img/defaultprofile.png">
		                                          </div>
		                                          <button type="button" class="button small gray-line" id="addProfileImgBtn">이미지 등록</button>
		                                  <a href="#" class="button small member-out" title="회원탈퇴">회원탈퇴</a>
		                              </div>
		                          </td>
		                      </tr>
		                      <tr>
		                          <th scope="row">아이디</th>
		                          <td>test123</td>
		                      </tr>
		                  </tbody>
		              </table>
		          </div>
	          </div>
          </div>
		<div class="box-radius">
			<div class="box-top">
	          <div class="tit-util mt40 mb10">
	              <strong>기본정보</strong>
	              <div class="right">
	                  <p class="reset"><em class="font-orange">*</em> 필수</p>
	              </div>
	          </div>
	              <div class="table-wrap mb40">
	                  <table class="board-form">
	                      <caption>이름, 생년월일, 휴대폰, 이메일, 비밀번호, 주소 항목을 가진 기본정보 표</caption>
	                      <colgroup>
	                          <col style="width:180px;">
	                          <col>
	                      </colgroup>
	                      <tbody>
	                          <tr>
	                              <th scope="row">
	                                  이름 <em class="font-orange">*</em>
	                              </th>
	                              <td>
	                                  <span class="mbNmClass">김민경</span>
	                              </td>
	                          </tr>
	                          <tr>
	                              <th scope="row">
	                                  생년월일 <em class="font-orange">*</em>
	                              </th>
	                              <td>
	                                  2023년
	                                  00월
	                                  00일
	                              </td>
	                          </tr>
	                          <tr>
	                              <th scope="row">
	                                  <label for="num">휴대폰</label> <em class="font-orange">*</em>
	                              </th>
	                              <td>
	                                  <div class="clearfix">
	                                      <p class="reset float-l w170px lh32 changeVal" data-name="phoneNo">
	                                          010-1111-1111
	                                      </p>
	                                      <div class="float-l">
	                                          <button type="button" class="button small gray-line change-phone-num" id="phoneChgBtn" title="휴대폰번호 변경">휴대폰번호 변경</button>
	                                      </div>
	                                  </div>
	                                  <div class="change-phone-num-area">
	                                      <div class="position">
	                                          <label for="chPhone" class="label">변경할 휴대폰</label>
	                                          <input type="text" id="chPhone" class="input-text w160px numType" placeholder="'-'없이 입력해 주세요" title="변경할 휴대폰 번호 입력" maxlength="11">
	                                          <button type="button" class="button small gray-line" id="sendNumberBtn">인증번호 전송</button>
	                                      </div>
	                                      <div class="position" style="display: none;">
	                                          <label for="chkNum" class="label">인증번호 입력</label>
	
	                                          <div class="chk-num small">
	                                              <div class="line">
	                                                  <input type="text" id="chkNum" class="input-text w180px" title="인증번호 입력" placeholder="인증번호를 입력해 주세요" maxlength="4">
	                                                  <div class="time-limit" id="timeLimit">3:00</div>
	                                              </div>
	                                          </div>
	                                          <button type="button" class="button small gray-line" id="chgBtn">변경완료</button>
	                                      </div>
	                                  </div>
	                              </td>
	                          </tr>
	                          <tr>
	                              <th scope="row">
	                                  <label for="email">이메일</label> <em class="font-orange">*</em>
	                              </th>
	                              <td>
	                                  <input type="text" id="email" name="mbEmail" class="input-text w500px" value="test1@test.com">
	                              </td>
	                          </tr>
	                          <tr>
	                              <th scope="row">비밀번호 <em class="font-orange">*</em></th>
	                              <td>
	                                  <a href="/on/oh/ohh/Mypage/userPwdChangePage.do" class="button small gray-line" title="비밀번호 변경">비밀번호 변경</a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <th scope="row">주소</th>
	                              <td>
	                                  <span></span>
	                                  <a href="#none" id="addrBtn" class="button small gray-line ml10" title="우편번호 검색">우편번호 검색</a>
	                                  <p class="reset mt10"></p>
	                                  <input type="text" name="mem_addr_detail" placeholder="상세주소입력" class="input-text">
	                              </td>
	                          </tr>
	                      </tbody>
	                  </table>
	              </div>
	          </div>
          </div>
		</div>
         <div class="btn-group py-3">
			<button class="button large" id="cancelBtn">취소</button>
			<button class="button purple large" id="updateBtn">수정</button>
		</div>
      </div>
	
</div>
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