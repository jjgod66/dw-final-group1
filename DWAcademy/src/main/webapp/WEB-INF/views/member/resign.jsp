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
    padding-inline-start: 40px;
}
.user-out ol>li {
    padding: 0 0 30px 0;
    display: list-item;
    text-align: -webkit-match-parent;
}
.user-out ol>li .txt {
    padding: 0 0 5px 0;
    font-size: 1.3333em;
    font-weight: 400;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
</style>
    <div class="container has-lnb">
        	<div id="contents" class="location-fixed">
			<h2 class="tit">회원탈퇴</h2>
		
			<p class="reset">[주의] 메가박스 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
		
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
							<li>메가박스 멤버십 포인트 및 적립/차감 내역</li>
							<li>관람권 및 쿠폰</li>
							<li>영화 관람 내역</li>
							<li>간편 로그인 연동 정보</li>
						</ul>
					</li>
					<li>
						<p class="txt">4. 회원님의 비밀번호를 입력하시고 [탈퇴] 버튼을 클릭해주세요.</p>
		
						<div class="table-wrap">
							<table class="board-form">
								<caption>비밀번호 입력 항목을 가진 회원 탈퇴시 비밀번호 확인 표</caption>
								<colgroup>
									<col style="width:180px;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
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
			<div class="btn-group">
				<button class="button large" id="cancelBtn">취소</button>
				<button class="button purple large" id="resignSubmitBtn">탈퇴</button>
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
</script>
<%@ include file="../include/member_footer.jsp" %>