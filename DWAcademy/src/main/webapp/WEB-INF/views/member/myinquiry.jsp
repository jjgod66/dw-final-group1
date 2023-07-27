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
.mypage-infomation {
    position: relative;
    min-height: 36px;
    margin-top: 20px;
    padding-bottom: 10px;
}
.mypage-infomation .btn-group {
    position: absolute;
    top: 0;
    right: 0;
    padding: 0;
    margin: 0;
}
.btn-group:after,
.btn-group:before {
    content: '';
    display: table;
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
.btn-group:after {
    clear: both;
}
.btn-group .button {
    margin: 0 3px;
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
.mypage-infomation+.board-list-util {
    padding: 0;
    margin: 0;
    margin-bottom: 10px;
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
.board-list-util .result-count b {
    color: #01738b;
}
.bootstrap-select:not(.input-group-btn), .bootstrap-select[class*=col-] {
    float: right;
    display: inline-block;
    margin-left: 0;
}
.bootstrap-select select {
    margin: 0;
    padding: 7.5px;
    border: 1px solid #666;
    border-radius: 4px;
    background-color: #fff;
    vertical-align: bottom;
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
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
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
.board-search .btn-search-input {
    position: absolute;
    right: 1px;
    top: 1px;
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
</style>
<h2 class="tit">나의 문의내역</h2>
<div class="mypage-infomation mt20">
	<ul class="dot-list mb20">
		<li id="tabDesc">고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.</li>
		<!-- <li>문의하시기 전 <a href="/support/faq" class="a-link"><strong>자주묻는질문</strong></a>을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다</li> -->
	</ul>
	<div class="btn-group right">
		<a href="#" class="button" id="inqBtn" title="1:1 문의하기">1:1 문의하기</a>
	</div>
</div>
<div class="board-list-util mb10">
	<p class="result-count">
		<!-- to 개발 : 검색을 안한 경우 -->
		<strong>전체 (<b id="totalCnt">0</b>건)</strong>
	</p>
	<div class="dropdown bootstrap-select bs3">
		<select id="custInqStatCd" onchange="javascript:$('#searchBtn').click();" class="" tabindex="-98">
			<option value="">전체</option>
			<option value="INQST1">미답변</option>
			<option value="INQST2">답변완료</option>
		</select>
		<div class="board-search ml07">
			<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" id="searchTxt" value="">
			<button type="button" class="btn-search-input" id="searchBtn">검색</button>
		</div>
	</div>
</div>
<div class="table-wrap">
	<table class="board-list a-c">
		<caption>번호, 극장, 유형, 제목, 답변상태, 등록일 순서로 보여주는 1:1 문의 내역 표입니다</caption>
		<colgroup>
			<col style="width:80px">
			<col style="width:140px;">
			<col style="width:120px;">
			<col>
			<col style="width:160px;">
			<col style="width:100px;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">극장</th>
				<th scope="col">유형</th>
				<th scope="col">제목</th>
				<th scope="col">답변상태</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody><tr><td colspan="6">목록이 없습니다.</td></tr></tbody>
	</table>
</div>

<%@ include file="../include/member_footer.jsp" %>