<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../../resources/css/boxoffice.css">
<script src="https://www.gstatic.com/charts/loader.js"></script>
<div class="sub_visual">
    <h3>영화</h3>
    <h6>Movie</h6>
</div>
<div style="width: 100%;">
	<div class="movie_container" style="width: 1300px; height: 2000px; margin: 0 auto; display: flex;">
		<div class="movie" style="width: 15%; height: 20%; margin: 20px;">	
		 <div class="item_poster">
		        <div class="thumb_item">
		            <div class="poster_movie" style="background: url('../../resources/img/poster/') no-repeat center /cover">
		<%-- 	                                        <span class="rank_num">${movie.movie_grade}</span> --%>
		<%-- 	                                        <span class="txt_tag">${movie.movie_grade}</span> --%>
		                <div class="movieChart_btn_wrap">
		                    <a href="/movie/viewer.do?movie_cd=" class="btn_movieChart_detail">상세보기</a>
		                    <a href="/reservation/cinema.do?movie_cd=" class="btn_movieChart_ticketing">예매하기</a>
		                </div>
		            </div>
		        </div>
		        <div class="thumb_cont">
		            <strong class="tit_item">
		<%-- 	                                        <c:if test="${movie.movie_grade eq '전체 관람가'}"><img src="../../resources/img/moviegrade/ALL.png" style="width: 8%; height: 8%;"></c:if> --%>
		<%-- 	                                        <c:if test="${movie.movie_grade eq '12세 관람가'}"><img src="../../resources/img/moviegrade/12.png" style="width: 8%; height: 8%;"></c:if> --%>
		<%-- 	                                        <c:if test="${movie.movie_grade eq '15세 관람가'}"><img src="../../resources/img/moviegrade/15.png" style="width: 8%; height: 8%;"></c:if> --%>
		<%-- 	                                        <c:if test="${movie.movie_grade eq '청소년 관람불가'}"><img src="../../resources/img/moviegrade/18.png" style="width: 8%; height: 8%;"></c:if><a href="movie-view.jsp?movieCd=${movie.movie_cd}#view" class="link_txt" data-tiara-layer="moviename"> ${movie.movie_name}</a> --%>
		            </strong>
		            <span class="txt_append">
		                <span class="info_txt">상영시간<span class="txt_grade">150</span>분</span>
		                <span class="info_txt">누적관객수<span class="txt_num">50</span></span>
		            </span>
		            <span class="txt_info">
		<%-- 	                                        개봉일<span class="txt_num"><fmt:formatDate value="${movie.opendate}" pattern="yyyy-MM-dd"/></span> --%>
		            </span>
		        </div>
		    </div>
	    </div>


	</div>
</div>

<%@ include file="../include/footer.jsp" %>