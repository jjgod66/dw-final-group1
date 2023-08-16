<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/member_header.jsp" %>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../resources/css/boxoffice.css">
<style>
.active{
    background: #ff8080;
    border-radius: 3px;
    border: solid 1px #ff8080;
    text-align: center;
    padding: 2px 5px 2px 5px;
}
.btn-heart{
    border: solid 1px #ff8080;
    text-align: center;
    padding: 2px 5px 2px 5px;
}
.btn_movieChart_ticketing{
	background: #4aa8d8;
    border: solid 1px #4aa8d8;
    padding: 2px 6px 2px 6px;
}
.movieChart_btn_wrap{
	margin-top: 5px;
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
.tab-block>ul>a{
	float: left;
	width: 20%;
	padding: 5px 0 5px 0;
	text-align: center;
	border: 1px solid #4aa8d8;
}
.on{
	background-color: #4aa8d8;
}
.btn_movieChart_ticketing{
	border-radius: 3px;
}
.container{min-height:900px;}
</style>
<div class="container" style=" width: 100%; display: flex; margin-top: 10px; flex-wrap: wrap;">
	<div style="width:100%;">
		<div class="tab-block tab-layer">
			<ul>
				<a href="<%=request.getContextPath()%>/member/movieTimeLine.do" class="" ><li>무비타임라인</li></a>
				<a href="<%=request.getContextPath()%>/member/myMoviepost.do" class=""><li>무비포스트</li></a>
				<a href="<%=request.getContextPath()%>/member/myReview.do" class=""><li>리뷰</li></a>
				<a href="<%=request.getContextPath()%>/member/myLikeMovie.do" class="on"><li>좋아요</li></a>
			</ul>
		</div>
	</div>
	<div class="row" style="width: 90%; margin: 0;">
		<p style="float:left;">
		<strong>총 <b class="font-gblue" id="myMoviePostCnt">${fn:length(LikeMovieList)}</b> 건</strong>
		</p>
		<c:if test="${empty LikeMovieList}">
			<div class="" style="padding-bottom: 10px; margin: auto;">
				<div style="text-align: center;">좋아요한 영화가 없습니다.</div>
			</div>
		</c:if>
		<c:set var="i" value="0"/>
		<c:forEach items="${LikeMovieList }" var="movie">
			<div class="movie col-3" style="padding: 30px 20px 30px 20px; min-width: 170px;">	
			 <div class="item_poster">
			        <div class="thumb_item">
	                    <a href="<%=request.getContextPath()%>/movie/viewer.do?movie_cd=${movie.MOVIE_CD}" class="btn_movieChart_detail">
				            <div class="poster_movie" style="background: url('<%=request.getContextPath() %>/common/getPicture.do?name=${movie.MOVIE_MAINPIC_PATH}&item_cd=${movie.MOVIE_CD}&type=moviePoster') no-repeat center /cover">
				<%-- 	                                        <span class="rank_num">${movie.movie_grade}</span> --%>
				<%-- 	                                        <span class="txt_tag">${movie.movie_grade}</span> --%>
				            </div>
	                    </a>
			        </div>
			        <div class="thumb_cont">
			            <strong class="tit_item">
				                                        <c:if test="${movie.MOVIE_GRADE eq '전체 관람가'}"><img src="../../resources/img/moviegrade/ALL.png" style="width: 8%; height: 8%;"></c:if>
				                                        <c:if test="${movie.MOVIE_GRADE eq '12세 관람가'}"><img src="../../resources/img/moviegrade/12.png" style="width: 8%; height: 8%;"></c:if>
				                                        <c:if test="${movie.MOVIE_GRADE eq '15세 관람가'}"><img src="../../resources/img/moviegrade/15.png" style="width: 8%; height: 8%;"></c:if>
				                                        <c:if test="${movie.MOVIE_GRADE eq '청소년 관람불가'}"><img src="../../resources/img/moviegrade/18.png" style="width: 8%; height: 8%;"></c:if>
				                                        <a href="<%=request.getContextPath()%>/movie/viewer.do?movie_cd=${movie.MOVIE_CD}" class="link_txt" data-tiara-layer="moviename"> ${movie.MOVIE_NAME}</a>
			            </strong>
		                <div class="movieChart_btn_wrap">
		                    <a href="<%=request.getContextPath()%>/reservation/cinema.do?movie_cd=${movie.MOVIE_CD}" class="btn_movieChart_ticketing">예매하기</a>
		                    <input type="hidden" value="${movie.MOVIE_CD}" id="movie_CD">
		                    <a href="javascript:void(0);" class="btn-heart active" data-moviecd="${movie.MOVIE_CD}" id="movieHeart${i}">♡ <span id="likeCount${i}">${likeCount[i]}</span></a>
		                </div>
			        </div>
			    </div>
		    </div>
		<c:set var="i" value="${i+1}"/>
		</c:forEach>
	</div>	
</div>
<div class="btn-more v1" id="addMovieDiv" style="width: 100%;; margin: 0 auto;">
	<div style="width: 90%; margin: 0 auto;">
		<button type="button" class="btn" id="AddMovieBtn" style="width: 100%; border: 1px solid gray;">더보기 <i class="iconset ico-btn-more-arr"></i></button>
	</div>
</div>
<script>
$(".btn-heart").click(function() {
	let movie_cd = $(this).data("moviecd");	
	let i = $(this).attr("id").substr(10, 11);
	console.log(i);
	console.log(movie_cd);

	$.ajax({
		url : '<%=request.getContextPath()%>/movie/likeMovie.do',
		method : 'post',
		data : {'movie_cd' : movie_cd},
		success : function(res){
			console.log(res);
			if(res == 'insert'){
				$('#movieHeart' + i).addClass("active");
				let likecount = parseInt($('#likeCount' + i).text());
				likecount += 1;
				console.log(likecount)
				$('#likeCount' + i).text(likecount);
			}else{
				$('#movieHeart' + i).removeClass("active");
				let likecount = parseInt($('#likeCount' + i).text());
				likecount -= 1;
				$('#likeCount' + i).text(likecount);
			}
		},
		error : function(err){
			alert(err.status);
		}
	})
});
if($('.movie.col-3').length <= 12){
	$('#AddMovieBtn').css('display', 'none');
}

let movieDiv = $('.movie.col-3').get();

for(let i = 12; i < movieDiv.length; i++){
	$('.movie.col-3').eq(i).css('display', 'none');
	$('.movie.col-3').eq(i).addClass('disnone');
}

$('#AddMovieBtn').on('click', function(){
	if($('.disnone').length <= 12){
		for(let i = 0; i < $('.disnone').length; i++){
			$('.disnone').eq(i).css('display', '');
		}
		for(let i = 0; i < $('.disnone').length; i++){
			$('.disnone').eq(i).removeClass('disnone');
		}
		$('#AddMovieBtn').css('display', 'none');
		return;
	}
	for(let i = 0; i < 12; i++){
		$('.disnone').eq(i).css('display', '');
		
	}
	for(let i = 0; i < 12; i++){
		$('.disnone').eq(i).removeClass('disnone');
		
	}
})
</script>
<%@ include file="../include/member_footer.jsp" %>