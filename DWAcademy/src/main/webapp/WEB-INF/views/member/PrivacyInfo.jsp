<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/member_header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
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
<div class="PrivacyInfo-wrapper">
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
		                                          <div class="profile-img" id="preview">
                                    					<c:if test="${memberInfo.MEM_PIC_PATH != null}">
															<img alt="Generic placeholder image" src="<%=request.getContextPath() %>/common/getPicture.do?name=${memberInfo.MEM_PIC_PATH}&item_cd=${memberInfo.MEM_CD}&type=memberPic" class="mr-3 rounded-pill" style="width: 75px; height: 75px;">
														</c:if>
														<c:if test="${memberInfo.MEM_PIC_PATH == null}">
															<img alt="Generic placeholder image" src="../../resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 80px; height: 80px;">
														</c:if>
		                                          </div>
		                                          <button type="button" class="button small gray-line" id="profileBtn">이미지 등록</button>
		                                  <a href="#" class="button small member-out" id="resignBtn" title="회원탈퇴">회원탈퇴</a>
		                              </div>
		                          </td>
		                      </tr>
		                      <tr>
		                          <th scope="row">아이디</th>
		                          <td>${memberInfo.MEM_ID}</td>
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
	                                  <span class="mbNmClass">${memberInfo.MEM_NAME}</span>
	                              </td>
	                          </tr>
	                          <tr>
	                              <th scope="row">
	                                  생년월일 <em class="font-orange">*</em>
	                              </th>
	                              <td>
	                                 <fmt:formatDate value="${memberInfo.MEM_BIR}" pattern="yyyy-MM-dd"/>
	                              </td>
	                          </tr>
	                          <tr>
	                              <th scope="row">
	                                  <label for="num">휴대폰</label><em class="font-orange">*</em>
	                              </th>
	                              <td>
	                                  <div class="clearfix">
	                                      <p class="reset float-l w170px lh32 changeVal" id="mem_phone" data-name="phoneNo">${memberInfo.MEM_PHONE}</p> 
	                                      <div class="float-l">
	                                          <button type="button" class="button small gray-line change-phone-num" id="phoneChgBtn" title="휴대폰번호 변경">휴대폰번호 변경</button>
	                                      </div>
	                                  </div>
	                                  <div class="change-phone-num-area" style="display:none;">
	                                      <div class="position">
	                                          <label for="chPhone" class="label">변경할 휴대폰</label>
	                                          <input type="text" id="chPhone" class="input-text w160px numType" placeholder="'-'없이 입력해 주세요" title="변경할 휴대폰 번호 입력" maxlength="11">
	                                          <button type="button" class="button small gray-line" id="sendNumberBtn">인증번호 전송</button>
	                                      </div>
	                                      <div class="position" id="authNum" style="display: none;">
	                                          <label for="chkNum" class="label">인증번호 입력</label>
	
	                                          <div class="chk-num small">
	                                              <div class="line">
	                                                  <input type="text" id="chkNum" class="input-text w180px" title="인증번호 입력" placeholder="인증번호를 입력해 주세요" maxlength="6">
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
	                                  <input type="text" id="email" name="mbEmail" class="input-text w500px" value="${memberInfo.MEM_EMAIL}">
	                              </td>
	                          </tr>
	                          <tr>
	                              <th scope="row">비밀번호 <em class="font-orange">*</em></th>
	                              <td>
	                                  <a href="<%=request.getContextPath()%>/common/pwdChangePage.do?mem_id=${memberInfo.MEM_ID}" class="button small gray-line" title="비밀번호 변경">비밀번호 변경</a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <th scope="row">주소</th>
	                              <td>
	                                  <span id="m_addr_post">${memberInfo.MEM_ZIPCODE}</span>
	                                  <a href="#none" id="addrBtn" class="button small gray-line ml10" onclick="sample6_execDaumPostcode1();" title="우편번호 검색">우편번호 검색</a>
	                                  <br>
	                                  <span id="m_addr">${memberInfo.MEM_ADDR}</span>
	                                  <span id="m_addr_detail">${memberInfo.MEM_ADDR_DETAIL}</span>
	                                  <p class="reset mt10"></p>
	                                  <input type="text" id="mem_addr_detail" placeholder="상세주소입력" class="input-text" style="display: none;">
	                              </td>
	                          </tr>
	                      </tbody>
	                  </table>
	              </div>
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
			</div>
		</div>
	</div>
         <div class="btn-group py-3">
			<button class="button large" id="cancelBtn">취소</button>
			<button class="button purple large" id="updateBtn">수정</button>
		</div>
	</div>
<form enctype="multipart/form-data" id="PriUpdateForm" action="<%=request.getContextPath()%>/member/PrivacyInfoUpdate.do" method="post">
	<input type="hidden" name="oldPicture" value="${memberInfo.MEM_PIC_PATH}">
    <input type="file" id="imgFile" name="member_pic_path" accept=".jpeg, .png, .jpg, .gif" onchange="imgChange_go();" style="display: none;">
	<input type="hidden" name="mem_email">
	<input type="hidden" name="mem_phone">
	<input type="hidden" name="mem_zipcode">
	<input type="hidden" name="mem_addr">
	<input type="hidden" name="mem_addr_detail">
</form>
<script>
let imageURL = '/common/getPicture.do?name=${memberInfo.MEM_PIC_PATH}&item_cd=${memberInfo.MEM_CD}&type=memberPic';	// 이미지명 가지고 와서 셋팅
function imgChange_go() {
	let inputImage = $('input#imgFile')[0];
	preViewPicture(inputImage, $('#preview'));
	$('#preview').find('img').hide();
}
// 등록이 아니라 수정시 기존 이미지 프리뷰
if ('${memberInfo.MEM_PIC_PATH}' != null && '${memberInfo.MEM_PIC_PATH}' != '') {
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

// 탈퇴버튼 클릭
$('#resignBtn').on('click', function(){
	location.href="<%=request.getContextPath()%>/member/resign.do";
})

// 휴대폰 번호 변경 버튼 클릭
$('#phoneChgBtn').on('click', function(){
	$('.change-phone-num-area').show();
})
// 인증번호 전송 버튼 클릭
let authNum = "";
$('#sendNumberBtn').on('click', function(){
	let phone = $('#chPhone').val();
	if(phone != ""){
		$.ajax({
			url : '<%=request.getContextPath()%>/SMS/send.do',
			method : 'post',
			data : {"phone" : phone},
			success : function(res){
				alert('메세지를 성공적으로 보냈습니다!')
				console.log(res);
				authNum = res;
				$('#authNum').show();
			},
			error : function(err){
				alert(err.status);
			}
		})
	}else{
		alert('번호를 입력해주세요.');
	}
})
$('#chgBtn').on('click', function(){
	let chkNum = $('#chkNum').val();
	let mem_phone = $('#chPhone').val();
	if(chkNum == authNum){
		$.ajax({
			method : "post",
			url : "<%=request.getContextPath()%>/member/CheckMember.do",
			data : {mem_phone : mem_phone},
			success : function(res){
				if(res != ""){
					alert('이미 가입된 회원번호입니다!');
				}else{
					$('#mem_phone').html(mem_phone);
					$('.position').hide();
					$('.position').val('');
				}
			},
			error : function(err){
				alert(err.status);
			}
		})
	}else{
		alert('인증번호가 일치하지 않습니다! 다시 인증해주세요');
		authNum = "";
		$('#authNum').hide();
	}
	
})
// 주소 변경 클릭
$('#addrBtn').on('click', function(){
	$('#mem_addr_detail').show();
	$('#mem_addr_detail').val("${memberInfo.MEM_ADDR_DETAIL}")
	$('#m_addr_detail').hide();
})


let emailReg = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
let PriUpdateForm = $('#PriUpdateForm')
$('#updateBtn').on('click', function(){
	let input_email = $('input[name=mbEmail]').val();
	if(emailReg.test(input_email)){
		PriUpdateForm.find('input[name=mem_email]').val(input_email)
		PriUpdateForm.find('input[name=mem_phone]').val($('#mem_phone').text())
		PriUpdateForm.find('input[name=mem_zipcode]').val($('#m_addr_post').text())
		PriUpdateForm.find('input[name=mem_addr]').val($('#m_addr').text())
		PriUpdateForm.find('input[name=mem_addr_detail]').val($('#mem_addr_detail').val())
		$('#PriUpdateForm').submit();
	}else{
		alert('이메일을 형식에 맞게 작성해주세요!')
	}
	
})
</script>
<%@ include file="../include/member_footer.jsp" %>