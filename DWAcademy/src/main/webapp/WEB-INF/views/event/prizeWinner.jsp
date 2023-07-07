<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
#contents {
    width: 100%;
    margin: 0;
    padding: 40px 0 0 0;
}
.inner-wrap {
    width: 900px;
    margin: 0 auto;
}
.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}

h1, h2, h3, h4, h5, h6 {
    margin: 0;
    padding: 0;
    font-weight: 400;
}


.text-util .left {
    float: left;
}

.pt05 {
    padding-top: 5px!important;
}


.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}

.text-util .right {
    float: right;
}
.button {
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


.board-list-util {
    margin: 30px 0 15px 0;
    text-align: right;
}
.board-list-util .result-count {
    position: relative;
    float: left;
    margin: 0;
    padding-top: 15px;
    line-height: 1.1;
    vertical-align: top;
}

.text-util:after {
    clear: both;
}
.text-util:after, .text-util:before {
    content: '';
    display: block;
}
b, strong {
    font-weight: 700;
}
.board-search {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    width: 230px;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
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
button, input {
    overflow: visible;
}
.board-search .btn-search-input {
    position: absolute;
    right: 1px;
    top: 1px;
}

.btn-search-input {
    overflow: hidden;
    width: 30px;
    height: 32px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
    text-indent: -9999px;
    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-search-input.png) no-repeat center;
}
.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}
.board-list {
    line-height: 1.3;
}


.board-list>thead>tr>th {
    height: 45px;
    padding: 3px 10px;
    color: #222;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    background-color: #f2f4f5;
}

.board-list>tbody>tr>td, .board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
}


.board-list>tbody>tr>th {
    text-align: left;
    font-weight: 400;
}

.board-list>tbody>tr>th {
    text-align: left;
    font-weight: 600;
}
</style>
<div class="sub_visual">
    <h3>당첨자 발표 </h3>
    <h6>Prize Winner!</h6>
</div>

<div id="contents">
	<!-- inner-wrap -->
	<div class="inner-wrap">
		<h2 class="tit">당첨자발표</h2>
		<div class="text-util">
			<div class="left pt05">
				<ul class="dot-list">
					<li>응모하신 이벤트의 당첨 여부는 나의 응모결과 확인을 통해 확인하실 수 있습니다.</li>
					<li>개인정보 처리방침에 따라 당첨자 발표일로 부터 6개월간 당첨자 발표내역을 확인할 수 있습니다.</li>
				</ul>
			</div>
			<div class="right">
				<!-- 로그인 전 -->
				<button type="button" class="button">
					<span>나의 응모결과확인</span> 
				</button>
			</div>
		</div>

		<div class="board-list-util">
			<p class="result-count">
				<strong>전체 607건</strong>
			</p>
			<div class="board-search">
				<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요."
					class="input-text">
				<button type="button" class="btn-search-input">검색</button>
			</div>
		</div>

		<div class="table-wrap">
			<table class="board-list">
				<caption>게시판 목록 제목</caption>
				<colgroup>
					<col style="width: 80px;">
					<col style="width: 130px;">
					<col>
					<col style="width: 100px;">
					<col style="width: 110px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">분류</th>
						<th scope="col">이벤트명</th>
						<th scope="col">발표일</th>
						<th scope="col">당첨자발표</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>607</td>
						<td>시사회/무대인사</td>
						<th scope="row"><a href="#" data-no="13517"
							data-netfunnel="N" class="eventBtn"
							title="<극장판 피노키오 위대한 모험> 메가박스 회원 시사회 상세보기">&lt;극장판 피노키오 위대한
								모험&gt; 메가박스 회원 시사회</a></th>
						<td>2023.07.06</td>
						<td><a href="<%=request.getContextPath()%>/event/prizeWinnerResult.do"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
					<tr>
						<td>606</td>
						<td>메가Pick</td>
						<th scope="row"><a href="#" data-no="13470"
							data-netfunnel="N" class="eventBtn"
							title="[엘리멘탈] 불VS물 투표 관람 이벤트 상세보기">[엘리멘탈] 불VS물 투표 관람 이벤트</a></th>
						<td>2023.07.05</td>
						<td><a href="javascript:fn_moveDetail(13470)"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
					<tr>
						<td>605</td>
						<td>메가Pick</td>
						<th scope="row"><a href="#" data-no="13464"
							data-netfunnel="N" class="eventBtn"
							title="메가박스가 주는 회춘 선물! HAPPY YOUTHDAY😊 상세보기">메가박스가 주는 회춘 선물!
								HAPPY YOUTHDAY😊</a></th>
						<td>2023.07.05</td>
						<td><a href="javascript:fn_moveDetail(13464)"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
					<tr>
						<td>604</td>
						<td>메가Pick</td>
						<th scope="row"><a href="#" data-no="13430"
							data-netfunnel="N" class="eventBtn"
							title="[엘리멘탈] 엘리버드 사전 예매 이벤트 상세보기">[엘리멘탈] 엘리버드 사전 예매 이벤트</a></th>
						<td>2023.06.23</td>
						<td><a href="javascript:fn_moveDetail(13430)"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
					<tr>
						<td>603</td>
						<td>영화</td>
						<th scope="row"><a href="#" data-no="13428"
							data-netfunnel="N" class="eventBtn"
							title="[워너 필름 소사이어티 시즌2] 런칭기념 기대평 이벤트  상세보기">[워너 필름 소사이어티
								시즌2] 런칭기념 기대평 이벤트 </a></th>
						<td>2023.06.20</td>
						<td><a href="javascript:fn_moveDetail(13428)"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
					<tr>
						<td>602</td>
						<td>메가Pick</td>
						<th scope="row"><a href="#" data-no="13332"
							data-netfunnel="N" class="eventBtn"
							title="Part Of Your World <인어공주> 1PICK 이벤트 상세보기">Part Of Your
								World &lt;인어공주&gt; 1PICK 이벤트</a></th>
						<td>2023.06.20</td>
						<td><a href="javascript:fn_moveDetail(13332)"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
					<tr>
						<td>601</td>
						<td>영화</td>
						<th scope="row"><a href="#" data-no="13303"
							data-netfunnel="N" class="eventBtn"
							title="[슬픔의 삼각형] N차의 역삼각형 상세보기">[슬픔의 삼각형] N차의 역삼각형</a></th>
						<td>2023.06.20</td>
						<td><a href="javascript:fn_moveDetail(13303)"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
					<tr>
						<td>600</td>
						<td>시사회/무대인사</td>
						<th scope="row"><a href="#" data-no="13384"
							data-netfunnel="N" class="eventBtn"
							title="<엔니오: 더 마에스트로> 메가박스 필름/클래식 소사이어티 회원시사 상세보기">&lt;엔니오: 더
								마에스트로&gt; 메가박스 필름/클래식 소사이어티 회원시사</a></th>
						<td>2023.06.14</td>
						<td><a href="javascript:fn_moveDetail(13384)"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
					<tr>
						<td>599</td>
						<td>시사회/무대인사</td>
						<th scope="row"><a href="#" data-no="13424"
							data-netfunnel="N" class="eventBtn"
							title="<엘리멘탈> 메가박스 회원 시사회 상세보기">&lt;엘리멘탈&gt; 메가박스 회원 시사회</a></th>
						<td>2023.06.09</td>
						<td><a href="javascript:fn_moveDetail(13424)"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
					<tr>
						<td>598</td>
						<td>시사회/무대인사</td>
						<th scope="row"><a href="#" data-no="13357"
							data-netfunnel="N" class="eventBtn"
							title="<귀공자> 메가박스 회원 시사회 상세보기">&lt;귀공자&gt; 메가박스 회원 시사회</a></th>
						<td>2023.06.07</td>
						<td><a href="javascript:fn_moveDetail(13357)"
							class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a></td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
	<!--// inner-wrap -->
</div>



<%@ include file="../include/footer.jsp"%>