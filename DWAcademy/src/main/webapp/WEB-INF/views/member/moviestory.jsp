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
    box-sizing: border-box;
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
.content-div {
    display: block;
}
</style>
<h2 class="tit">나의 무비스토리</h2>
<div class="tab-block tab-layer">
	<ul>
		<li data-url="/mypage/moviestory?tab=mt" data-tit="무비타임라인" title="무비타임라인 탭으로 이동" class="on"><a id="movieTimeLineTab" href="#" data-type="mt" class="btn">무비타임라인</a></li>
		<li data-url="/mypage/moviestory?tab=mp" data-tit="무비포스트" title="무비포스트 탭으로 이동" class=""><a href="#" data-type="mp" class="btn">무비포스트</a></li>
		<li data-url="/mypage/moviestory?tab=re" data-tit="리뷰" title="리뷰 탭으로 이동" class=""><a href="#" data-type="re" class="btn">리뷰</a></li>
		<li data-url="/mypage/moviestory?tab=lk" data-tit="좋아요" title="좋아요 탭으로 이동" class=""><a href="#" data-type="lk" class="btn">좋아요</a></li>
	</ul>
</div>
<!-- 무비타임라인 시작 -->
<div class="my-timeline myTimeline myMovieStory" style="display: block;">
	<div>1</div>
</div>
<!-- 무비타임라인 끝 -->
<!-- 나의 무비포스트 시작 -->
<div class="my-movie-post myMoviePost myMovieStory" style="display: none;">
	<div>2</div>
</div>
<!-- 나의 무비포스트 끝 -->
<!-- 리뷰 시작 -->
<div class="my-appraisal myOne myMovieStory" style="display: none;">
	<div>3</div>
</div>
<!-- 리뷰 끝 -->
<!-- 좋아요 시작 -->
<div class="my-movie-list myLikeMovie myMovieStory" style="display: none;">
	<div>4</div>
</div>
<!-- 좋아요 끝 -->

<script>
$(document).ready(function () {

	var tab = '';

	$(function() {
		// 탭 버튼
		$('.tab-block a').on('click', function(e) {
			e.preventDefault();

			var type = $(this).data('type');

			$('#currentPage').val('1'); // 페이지 번호 초기화
			$('.tab-block li.on').removeClass('on');
			$(this).parent().addClass('on');

			$('.myMovieStory').hide();

			if(type == 'mt') { // 무비타임라인
				$('.myTimeline').show();
				alert('1')

			} else if(type == 'mp') { // 무비포스트
				$('.myMoviePost').show();

			} else if(type == 're') { // 리뷰
				$('.myOne').show();
			} else if(type == 'lk') { // 좋아요
				$('.myLikeMovie').show();
			}

		});

		// 더보기 버튼
		$('#btnAddMovie').on('click', function() {

			fn_movieSerach(true);
		});



		if(tab == 'mp') $('.tab-block li').eq(1).addClass('on'); // 무비포스트 탭 활성화
		else if(tab == 're') $('.tab-block li').eq(2).addClass('on'); // 관람평 탭 활성화
		else if(tab == 'lk') $('.tab-block li').eq(4).addClass('on'); // 좋아요 탭 활성화
		else $('.tab-block li').eq(0).addClass('on'); // 무비타임라인 탭 활성화

		$('.tab-block li.on a').click(); // 활성화 된 탭 컨텐츠 조회

	});

}
</script>
<%@ include file="../include/member_footer.jsp" %>