<%@page import="java.util.Map"%>
<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../../resources/css/boxoffice.css">
<style>

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
select {
    overflow: hidden;
    height: 34px;
    border: 1px solid #d8d9db;
}

.tab-list>ul {
    position: relative;
    width: 100%;
    height: 42px;
}

.tab-list>ul>li {
    float: left;
    height: 42px;
    margin: 0;
    border: 1px solid #ebebeb;
    border-width: 1px 0 1px 1px;
}

.nav-tabs {
    --bs-nav-tabs-border-width: 1px;
    --bs-nav-tabs-border-color: #dee2e6;
    --bs-nav-tabs-border-radius: 0.375rem;
    --bs-nav-tabs-link-hover-border-color: #e9ecef #e9ecef #dee2e6;
    --bs-nav-tabs-link-active-color: #495057;
    --bs-nav-tabs-link-active-bg: #fff;
    --bs-nav-tabs-link-active-border-color: #dee2e6 #dee2e6 #fff;
    border-bottom: var(--bs-nav-tabs-border-width) solid var(--bs-nav-tabs-border-color);
}

.tab-list>ul>li.active a {
    position: relative;
    border: 1px solid #4aa8d8;
    border-bottom: 0;
    background-color: #fff;
    z-index: 3;
}

.tab-list>ul>li>a {
    position: relative;
    display: block;
    width: 100%;
    height: 41px;
    line-height: 40px;
    padding: 0;
    text-align: center;
    color: #222;
    font-size: 1.0667em;
    text-decoration: none;
}

.tab-list>ul>li {
    width: 33%;
}
</style>
<%
	mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		Map member = (Map) session.getAttribute("loginUser");
		mem_cd = (String)member.get("CD");
	}
%>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<div class="sub_visual">
    <h3>선호장르영화</h3>
    <h6>Genre Movie</h6>
</div>
<div style="width: 100%;">
<div style="padding: 30px;">
	<div style="width: 1300px; margin: 0 auto;">
		<div style="width: 90%; margin: 0 auto;">
		<div class="tab-list fixed">
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item"><a href="/movie/allMovie.do">전체</a></li>
				<li class="nav-item"><a href="/movie/screenMovie.do">현재상영</a></li>
				<li class="nav-item"><a href="/movie/comingMovie.do">상영예정</a></li>
				<li class="nav-item active" id="like" style="display: none;"><a href="/movie/likeGenreMovie.do">선호장르</a></li>
			</ul>
		</div>
<!-- 			<ul style="margin: 30px 10px 0px 10px;"> -->
<!-- 			  <li id="all" style="display: inline;"> -->
<!-- 			    <span class="click-type 23type">전체영화</span> -->
<!-- 			  </li> -->
<!-- 			  <li id="cur" style="display: inline;"> -->
<!-- 			    <span class="non-click-type">현재상영작</span> -->
<!-- 			  </li> -->
<!-- 			  <li id="fut" style="display: inline;"> -->
<!-- 			    <span class="non-click-type">상영예정작</span> -->
<!-- 			  </li> -->
<!-- 			</ul> -->
		</div>

		<div style="width: 90%; margin: 0 auto;">
			<div style="margin: 20px 10px 10px 10px; float: right; display: flex;">
				<div style="margin: 10px;">
					<span>
						<select name="searchType" id="searchType" onchange="javascript:searchList_go(1);">
										<option value="reserve" ${searchType eq 'reserve' ? 'selected' : '' }>예매율 </option>
										<option value="movie_name" ${searchType eq 'movie_name' ? 'selected' : '' }>영화명 </option>
										<option value="opendate" ${searchType eq 'opendate' ? 'selected' : '' }>개봉일 </option>
						</select>
					</span>
				</div>
				<div id="boardSearch" class="inner-wrap" style="margin: 10px;">
					<div class="board-list-util mt0">
						<div class="board-search">
							<input type="text" title="영화 제목을 입력해 주세요." placeholder="영화 제목을 입력해 주세요."
								class="input-text" id="search" value="${keyword }">
							<button type="button" class="btn-search-input" id="searchBtn">검색</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="movie_container" style="width: 1300px; margin: 0 auto; display: flex;">
		<div class="row" style="width: 90%; margin: 0 auto;">
			<c:if test="${genreYN eq 'N'}">
				<div style="text-align: center;">선호 장르가 등록되지 않았습니다.</div>
			</c:if>
			<c:forEach items="${movieList }" var="movie">
				<div class="movie col-3" style="padding: 30px 20px 30px 20px;">	
				 <div class="item_poster">
				        <div class="thumb_item">
				            <div class="poster_movie" style="background: url('<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${movie.MOVIE_MAINPIC_PATH}&item_cd=${movie.MOVIE_CD}&type=moviePoster') no-repeat center /cover">
					                                        <span class="rank_num">${movie.movie_grade}</span>
					                                        <span class="txt_tag">${movie.movie_grade}</span>
				                <div class="movieChart_btn_wrap">
				                    <a href="<%=request.getContextPath()%>/movie/viewer.do?movie_cd=${movie.MOVIE_CD}" class="btn_movieChart_detail">상세보기</a>
				                    <a href="<%=request.getContextPath()%>/reservation/cinema.do?movie_cd=${movie.MOVIE_CD}" class="btn_movieChart_ticketing">예매하기</a>
				                </div>
				            </div>
				        </div>
				        <div class="thumb_cont">
				            <strong class="tit_item">
					                                        <c:if test="${movie.MOVIE_GRADE eq '전체 관람가'}"><img src="../../resources/img/moviegrade/ALL.png" style="width: 8%; height: 8%;"></c:if>
					                                        <c:if test="${movie.MOVIE_GRADE eq '12세 관람가'}"><img src="../../resources/img/moviegrade/12.png" style="width: 8%; height: 8%;"></c:if>
					                                        <c:if test="${movie.MOVIE_GRADE eq '15세 관람가'}"><img src="../../resources/img/moviegrade/15.png" style="width: 8%; height: 8%;"></c:if>
					                                        <c:if test="${movie.MOVIE_GRADE eq '청소년 관람불가'}"><img src="../../resources/img/moviegrade/18.png" style="width: 8%; height: 8%;"></c:if>
					                                        <a href="<%=request.getContextPath()%>/movie/viewer.do?movie_cd=${movie.MOVIE_CD}" class="link_txt" data-tiara-layer="moviename"> ${movie.MOVIE_NAME}</a>
				            </strong>
				            <span class="txt_append">
				                <span class="info_txt">상영시간<span class="txt_grade">${movie.MOVIE_LENGTH}</span>분</span>
				                <span class="info_txt">예매율<span class="txt_num">${movie.resRate }</span>%</span>
				            </span>
				            <span class="txt_info">
					                                        개봉일<span class="txt_num"><fmt:formatDate value="${movie.OPENDATE}" pattern="yyyy-MM-dd"/></span>
				            </span>
				        </div>
				    </div>
			    </div>
			</c:forEach>
	    </div>


	</div>
	<div class="btn-more v1" id="addMovieDiv" style="width: 1300px; margin: 0 auto;">
		<div style="width: 90%; margin: 0 auto;">
			<button type="button" class="btn" id="btnAddMovie" style="width: 100%; border: 1px solid gray;">더보기 <i class="iconset ico-btn-more-arr"></i></button>
		</div>
	</div>
</div>
</div>
<form id="searchForm" method="post" action="<%=request.getContextPath() %>/movie/comingMovie.do">
	<input type="hidden" name="searchType">
	<input type="hidden" name="keyword">
</form>
<script>
$(function(){
	if($('.movie.col-3').length <= 12){
		$('#btnAddMovie').css('display', 'none');
	}
	
	let mem_cd = "<%=mem_cd%>";
	
	if(mem_cd == null || mem_cd == ""){
		alert("로그인이 필요합니다.");
		location.href="<%=request.getContextPath()%>/main.do"
	}
	
	console.log(mem_cd);
	if(mem_cd != null && mem_cd !== ""){
		$('#like').css('display', '');
		$('.nav.nav-tabs li').css('width', '25%');
	}

	
	$('#searchType').on('change', function(){
		$('#searchForm').find('input[name="searchType"]').val($('select[name="searchType"]').val());
		$('#searchForm').find('input[name="keyword"]').val($('input#search').val());
		$('#searchForm').submit();
	})
	
	$('#searchBtn').on('click', function(){
		$('#searchForm').find('input[name="searchType"]').val($('select[name="searchType"]').val());
		$('#searchForm').find('input[name="keyword"]').val($('input#search').val());
		$('#searchForm').submit();
	})
	
	let movieDiv = $('.movie.col-3').get();

	for(let i = 12; i < movieDiv.length; i++){
		$('.movie.col-3').eq(i).css('display', 'none');
		$('.movie.col-3').eq(i).addClass('disnone');
	}
	
	$('#btnAddMovie').on('click', function(){
		if($('.disnone').length <= 12){
			for(let i = 0; i < $('.disnone').length; i++){
				$('.disnone').eq(i).css('display', '');
			}
			for(let i = 0; i < $('.disnone').length; i++){
				$('.disnone').eq(i).removeClass('disnone');
			}
			$('#btnAddMovie').css('display', 'none');
			return;
		}
		for(let i = 0; i < 12; i++){
			$('.disnone').eq(i).css('display', '');
			
		}
		for(let i = 0; i < 12; i++){
			$('.disnone').eq(i).removeClass('disnone');
			
		}
	})
})
</script>
<%@ include file="../include/footer.jsp" %>