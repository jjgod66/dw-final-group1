<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/member_header.jsp" %>
<style>
h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #503396;
    line-height: 1.1;
    margin-top: 70px!important;
}
.tab-block {
    position: relative;
}
.tab-block:before {
    content: '';
    position: absolute;
    left: 0;
    top: 35px;
    width: 100%;
    height: 1px;
    background-color: #d8d9db;
}
.tab-block ul:after,
.tab-block ul:before {
    content: '';
    display: table;
}
.tab-block ul:after {
    clear: both;
}
.tab-block ul li {
    position: relative;
    float: left;
    width: 20%;
    border: 1px solid #d8d9db;
    border-left: 0;
}
.tab-block ul li:last-child {
    border-right: 1px solid #d8d9db;
}
.tab-block ul li:first-child, .tab-block ul li:nth-child(6) {
    border-left: 1px solid #d8d9db;
}
.tab-block ul li.hover, .tab-block ul li.on {
    border-color: #555;
}
.tab-block ul li.hover:first-child, .tab-block ul li.on:first-child {
    border-color: #555;
}
.tab-block ul li .btn {
    display: block;
    width: 100%;
    height: 34px;
    margin: 0;
    padding: 0;
    border: 0;
    line-height: 34px;
    text-align: center;
    background-color: transparent;
    text-decoration: none;
    border-radius: 0;
}
.tab-block ul li.hover .btn, .tab-block ul li.on .btn {
    color: #fff;
    background-color: #555;
}
.board-list-search {
    margin-top: 20px!important;
    padding: 20px 40px;
    background-color: #f2f4f5;
}
.board-list-search table tbody tr td,
.board-list-search table tbody tr th {
    padding: 2px 0;
    text-align: left;
}
.board-list-search [type=checkbox],
.board-list-search [type=radio],
.board-list-search label {
    display: inline-block;
    vertical-align: middle;
}
.board-list-search table tbody tr td label {
    margin-right: 20px;
}
.board-list-search table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}
.bootstrap-select:not(.input-group-btn), .bootstrap-select[class*=col-] {
    float: none;
    display: inline-block;
    margin-left: 0;
}
.bootstrap-select>select {
    display: block!important;
    height: 34px;
    line-height: 34px;
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
.button.small {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
}
.button.gray-line {
    color: #444;
    line-height: 36px;
    border: 1px solid #c1c1c1;
    background-color: #fff;
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
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
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
.board-list-util {
    margin: 30px 0 15px 0;
    text-align: right;
}
.board-list-util:after,
.board-list-util:before {
    content: '';
    display: table;
}
.board-list-util:after {
    clear: both;
}
.board-list-util .result-count {
    position: relative;
    float: left;
    margin: 0;
    padding-top: 15px;
    line-height: 1.1;
    vertical-align: top;
}
.cont {
    display: block;
    margin: 0;
    padding: 20px;
}
.cont .mb30 {
    margin-bottom: 30px!important;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #503396;
    width: 3px;
    height: 3px;
}
.dot-list>li+li {
    margin-top: 2px;
}
.dot-list>li>ul {
    padding-top: 5px;
}
.dash-list>li {
    position: relative;
    padding: 0 0 0 11px;
    font-size: .9333em;
}
.dash-list>li:before {
    content: '';
    display: block;
    position: absolute;
    left: 0;
    top: 10px;
    width: 4px;
    height: 1px;
    margin: 0;
    padding: 0;
    background-color: #333;
}
.content-section {
    display: block;
}
</style>
<h2 class="tit">예매/구매 내역</h2>
<div class="tab-block tab-layer">
	<ul>
		<li data-url="/mypage/bookinglist?tab=01" data-tit="예매내역" title="예매내역 탭으로 이동" class="on"><a href="#myBokdArea" class="btn">예매 </a></li>
		<li data-url="/mypage/bookinglist?tab=02" data-tit="구매내역" title="구매내역 탭으로 이동" class=""><a href="#myPurcArea" class="btn">구매 </a></li>
	</ul>
</div>
<section id="myBokdArea"  class="content-section" style="display: block">
<div class="board-list-search mt20">
	<table summary="예매 조회 조건">
		<colgroup>
			<col style="width:75px;">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">구분 </th>
				<td>
					<input type="radio" id="radBokd01" name="radBokd" value="B" checked="checked">
					<label for="radBokd01">예매내역 </label>
					<input type="radio" id="radBokd02" name="radBokd" value="E">
					<label for="radBokd02">지난내역 </label>

					<div class="dropdown bootstrap-select disabled small bs3">
						<select name="selYM" class="selectpicker small" disabled="disabled" tabindex="-98">
							<option value="202307">2023년 7월</option>
							<option value="202306">2023년 6월</option>
							<option value="202305">2023년 5월</option>									
							<option value="202304">2023년 4월</option>
							<option value="202303">2023년 3월</option>
							<option value="202302">2023년 2월</option>
							<option value="202301">2023년 1월</option>
							<option value="202212">2022년 12월</option>
							<option value="202211">2022년 11월</option>
							<option value="202210">2022년 10월</option>
							<option value="202209">2022년 9월</option>
							<option value="202208">2022년 8월</option>
						</select>
					</div>
					<button type="button" class="button gray-line small ml05" name="search">
						<i class="iconset ico-search-gray"></i> 조회 
					</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div id="bokdList"><div class="no-history-reservation mt20">	예매 내역이 없습니다. </div></div>
<h3 class="tit mt70">예매취소내역</h3>
<ul class="dot-list">
	<li>상영일 기준 7일간 취소내역을 확인하실 수 있습니다.</li>
</ul>
<div class="table-wrap mt10">
	<table class="board-list" summary="취소일시, 영화명, 극장, 상영일시, 취소금액 항목을 가진 취소내역 목록 표">
		<caption>취소일시, 영화명, 극장, 상영일시, 취소금액 항목을 가진 취소내역 목록 표</caption>
		<colgroup>
			<col style="width:160px;">
			<col>
			<col style="width:130px;">
			<col style="width:188px;">
			<col style="width:105px;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">취소일시</th>
				<th scope="col">영화명</th>
				<th scope="col">극장</th>
				<th scope="col">상영일시</th>
				<th scope="col">취소금액</th>
			</tr>
		</thead>
		<tbody><tr><td colspan="5" class="a-c">취소내역이 없습니다.</td></tr></tbody>
	</table>
</div>
<div class="cont">
	<strong>[예매 안내]</strong>
	<ul class="dot-list mb30">
		<li>만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.</li>
		<li>예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.</li>
	</ul>

	<strong>[티켓교환 안내]</strong>
	<ul class="dot-list mb30">
		<li>극장의 무인발권기(KIOSK)를 통해 예매번호 또는 고객확인번호(생년월일+휴대폰번호)를 입력하여 편리하게 티켓을 발권하실 수 있습니다.</li>
		<li>무인발권기 이용이 어려우신경우, 티켓교환권을 출력하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다.</li>
		<li>(티켓교환권 출력이 어려운경우 예매번호와 신분증을 지참하여 매표소에 방문하시면 티켓을 발권하실 수 있습니다)</li>
	</ul>

	<strong>[예매취소 안내]</strong>
	<ul class="dot-list">
		<li>온라인(홈페이지/모바일) 예매 취소는 상영시간 20분전까지 입니다.</li>
		<li>위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.</li>
		<li>LIVE 공연 콘텐트는 취소 기준은 아래와 같습니다.
			<ul class="dash-list">
				<li>관람 4일전 : 취소 가능</li>
				<li>관람 3일 ~ 1일전 : 취소 수수료 부담 후 취소 가능</li>
				<li>관람 당일 : 취소 및 환불 불가</li>
			</ul>
		</li>
		<li>공연 관람시 시작 시간 이후에는 입장이 제한 됩니다.</li>
		<li>발권된 티켓은 상영시간 전까지 현장 방문 시에만 취소가 가능합니다.</li>
	</ul>
</div>
</section>
<section id="myPurcArea"  class="content-section" style="display: none">
<div class="board-list-util mb10">
	<p class="result-count pt00">
		<strong>전체 <b class="font-gblue">0</b>건</strong>
	</p>
</div>
<div class="table-wrap">
	<table class="board-list" summary="결제일시, 구분, 상품명, 결제금액, 상태 항목을 가진 결제내역 목록 표">
		<caption>결제일시, 구분, 상품명, 결제금액, 상태 항목을 가진 결제내역 목록 표</caption>
		<colgroup>
			<col style="width:160px;">
			<col style="width:150px;">
			<col>
			<col style="width:120px;">
			<col style="width:120px;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">결제일시</th>
				<th scope="col">구분</th>
				<th scope="col">상품명</th>
				<th scope="col">결제금액</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
		<tbody><tr><td colspan="5" class="a-c">결제내역이 없습니다.</td></tr></tbody>
	</table>
</div>
<div class="cont">
	<strong>[스토어 구매/취소 안내]</strong>
	<ul class="dot-list mb30">
		<li>스토어 상품은 구매 후 취소가능기간 내 100% 환불이 가능하며, 부분환불은 불가 합니다. </li>
		<li>(ex. 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며 그 중 사용하신 쿠폰이 있는 경우 환불이 불가합니다)</li>
		<li>스토어 교환권은 MMS로 최대 1회 재전송 하실 수 있습니다.</li>
	</ul>
	<strong>[모바일오더 구매/취소 안내]</strong>
	<ul class="dot-list mb30">
		<li class="font-red">ⓘ 모바일오더는 모바일앱을 통해 이용하실 수 있습니다.</li>
		<li>모바일오더는 구매 후 즉시 조리되는 상품으로 취소가 불가 합니다.</li>
		<li>극장 매점에서 주문번호가 호출되면 상품을 수령하실 수 있습니다.</li>
		<li>극장 상황에 따라 상품준비시간이 다소 길어질 수 있습니다.</li>
	</ul>
</div>
</section>
<script>
$(document).ready(function () {
	// 페이지가 로드되면 해시태그에 따라 해당 콘텐츠를 보여주거나 감추는 함수 실행
	handleHashChange();

	$('#myBokdArea').show();
	// 예매, 구매 탭을 클릭할 때 해시태그 변경 및 콘텐츠 표시/감추기
	$(".tab-block li").on("click", function (event) {
		event.preventDefault();
		var href = $(this).find("a").attr("href");
		history.pushState({}, "", href);
		handleHashChange();

		// 클릭한 탭 버튼에 클래스를 추가하여 활성화 표시
		$(".tab-block li.on").removeClass("on");
		$(this).addClass("on");
	});

	// 브라우저 뒤로 가기 버튼 클릭 시에도 해시태그에 따라 콘텐츠를 보여주거나 감춤
	$(window).on("popstate", function () {
		handleHashChange();

		// 뒤로 가기 버튼에 따라 탭 버튼도 변경
		$(".tab-block li.on").removeClass("on");
		var hash = window.location.hash;
		var targetTab = $('a[href="' + hash + '"]').parent();
		targetTab.addClass("on");
	});

	// 해시태그에 따라 콘텐츠를 보여주거나 감추는 함수
	function handleHashChange() {
		var hash = window.location.hash;
		$(".content-section").hide();
		$(hash).show();
	}
});
</script>
<%@ include file="../include/member_footer.jsp" %>