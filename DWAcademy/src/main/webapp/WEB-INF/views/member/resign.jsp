<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/member_header.jsp" %>
<style>
.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}
#contents {
    width: 100%;
    margin: 0;
    padding: 40px 0 0 0;
}
* {
    box-sizing: border-box;
}
div {
    display: block;
}
body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.mt10 {
    margin-top: 10px!important;
}
ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
ol {
    display: block;
    list-style-type: decimal;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
/*     padding-inline-start: 40px; */
}
.user-out ol>li {
    padding: 0 0 30px 0;
    display: list-item;
    text-align: -webkit-match-parent;
}
.user-out ol>li .txt {
    padding: 0 0 5px 0;
    font-size: 1.3333em;
    font-weight: 700;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}
.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #4ba8d8;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #4ba8d8;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}
.button:hover {
    background-color: #4ba8d8;
    color: #fff;
}
.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}
table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}
.board-form tbody th {
    background: #f7f8f9;
}
.board-form tbody td, .board-form tbody th {
/*     position: relative; */
    height: 50px;
    padding: 7px 15px;
    text-align: left;
    border-bottom: 1px solid #d1d5dd;
}

label {
    display: inline-block;
    vertical-align: middle;
    cursor: pointer;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}
.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #4ba8d8;
    width: 3px;
    height: 3px;
}
</style>
    <div class="container has-lnb" style="padding-top: 20px;">
        	<div id="" class="location-fixed">
			<h2 class="tit">회원탈퇴</h2>
		
			<p class="reset">[주의] DW시네마 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
		
			<div class="user-out mt10">
				<ol>
					<li>
						<p class="txt">1. 30일간 회원 재가입이 불가능합니다.</p>
		
						<ul class="dot-list mt10">
							<li>회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.</li>
						</ul>
					</li>
					<li>
						<p class="txt">2. 다음에 경우에 회원 탈퇴가 제한됩니다.</p>
		
						<ul class="dot-list mt10">
							<li>영화예매 내역이 있는 경우</li>
							<li>모바일오더 주문건이 있는 경우</li>
							<li>기명식 기프트카드 잔액이 있을 경우</li>
							<li>기명식 기프트카드가 카드정지 상태인 경우</li>
							<li>기명식 기프트카드 환불신청이 진행중인 경우</li>
						</ul>
					</li>
					<li>
						<p class="txt">3. 탈퇴 후 삭제 내역</p>
						<p>(회원 탈퇴하시면 회원정보와 개인 보유 포인트 등 정보가 삭제되며 데이터는 복구되지 않습니다.)</p>
		
						<ul class="dot-list mt10">
							<li>DW시네마 멤버십 포인트 및 적립/차감 내역</li>
							<li>관람권 및 쿠폰</li>
							<li>영화 관람 내역</li>
							<li>간편 로그인 연동 정보</li>
						</ul>
					</li>
					<li>
						<p class="txt">4. 회원님의 비밀번호를 입력하시고 [탈퇴] 버튼을 클릭해주세요.</p>
		
						<div class="table-wrap">
							<table class="board-form">
								<tbody>
									<tr>
										<th style="width: 150px;">
											<label for="pwd_chk">비밀번호</label>
										</th>
										<td>
											<input type="password" class="input-text w160px" id="pwd">
										</td>
									</tr>
									<input type="hidden" name="${memberInfo.MEM_ID}"><!--아이디-->
								</tbody>
							</table>
						</div>
					</li>
				</ol>
			</div>
			<div class="btn-group" style="width: 100%; margin-bottom: 50px;">
				<div style="margin: 0 auto;">
					<button class="button large" id="cancelBtn">취소</button>
					<button class="button purple large" id="resignSubmitBtn">탈퇴</button>
				</div>
			</div>
		</div>
	</div>
<script>
$('#resignSubmitBtn').on('click', function(){
	if($('#pwd').val() == "${memberInfo.MEM_PWD}"){
		location.href="<%=request.getContextPath()%>/member/resignMember.do";
	}else{
		alert('비밀번호를 다시 입력해주세요');
	}
})
$('#cancelBtn').on('click', function(){
	location.href="<%=request.getContextPath()%>/member/PrivacyInfo.do";
})
</script>
<%@ include file="../include/member_footer.jsp" %>