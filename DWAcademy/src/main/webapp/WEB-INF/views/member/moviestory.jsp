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
<h2 class="tit">나의 무비스토리</h2>
<div class="tab-block tab-layer">
	<ul>
		<li data-url="/mypage/movieStory?tab=01" data-tit="무비타임라인" title="무비타임라인 탭으로 이동" class="on"><a href="#myMovieTimeLineArea" data-type="01" class="btn">무비타임라인</a></li>
		<li data-url="/mypage/movieStory?tab=02" data-tit="무비포스트" title="무비포스트 탭으로 이동" class=""><a href="#myMoviepostArea" data-type="02" class="btn">무비포스트</a></li>
		<li data-url="/mypage/movieStory?tab=03" data-tit="리뷰" title="리뷰 탭으로 이동" class=""><a href="#myReviewArea" class="btn">리뷰</a></li>
		<li data-url="/mypage/movieStory?tab=04" data-tit="좋아요" title="좋아요 탭으로 이동" class=""><a href="#myLikeMovieArea" class="btn">좋아요</a></li>
	</ul>
</div>
<!-- 무비타임라인 시작 -->
<section id="myMovieTimeLineArea"  class="content-section" style="display: none;">
	<div>1</div>
</section>
<!-- 무비타임라인 끝 -->
<!-- 나의 무비포스트 시작 -->
<section id="myMoviepostArea"  class="content-section" style="display: none;">
	<div>2</div>
</section>
<!-- 나의 무비포스트 끝 -->
<!-- 리뷰 시작 -->
<section id="myReviewArea"  class="content-section" style="display: none;">
	<div>3</div>
</section>
<!-- 리뷰 끝 -->
<!-- 좋아요 시작 -->
<section id="myLikeMovieArea"  class="content-section" style="display: none;">
	<div>4</div>
</section>
<!-- 좋아요 끝 -->

<script>
$(document).ready(function () {
	// 페이지가 로드되면 해시태그에 따라 해당 콘텐츠를 보여주거나 감추는 함수 실행
	handlerHashChange();
	// 예매, 구매 탭을 클릭할 때 해시태그 변경 및 콘텐츠 표시/감추기
	$(".tab-block li").on("click", function (event) {
// 		event.preventDefault();
		var href = $(this).find("a").attr("href");
		history.pushState({}, "", href);
		handlerHashChange();

		// 클릭한 탭 버튼에 클래스를 추가하여 활성화 표시
		$(".tab-block li.on").removeClass("on");
		$(this).addClass("on");
	});

	// 브라우저 뒤로 가기 버튼 클릭 시에도 해시태그에 따라 콘텐츠를 보여주거나 감춤
	$(window).on("popstate", function () {
		handlerHashChange();

		// 뒤로 가기 버튼에 따라 탭 버튼도 변경
		$(".tab-block li.on").removeClass("on");
		var hash = window.location.hash;
		var targetTab = $('a[href="' + hash + '"]').parent();
		targetTab.addClass("on");
	});

	// 해시태그에 따라 콘텐츠를 보여주거나 감추는 함수
	function handlerHashChange() {
		var hash = window.location.hash;
		$(".content-section").hide();
		$(hash).show();
	};
}
</script>
<%@ include file="../include/member_footer.jsp" %>