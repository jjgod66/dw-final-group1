<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/viewer.css">
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js"></script>
<%-- <%@ include file="../common/boxoffice_detail.jsp" %> --%>
<%
	String mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		mem_cd = member.getMem_cd();
	}
%>
<div class="sub_visual">
    <h3>영화정보</h3>
    <h6>Movie information</h6>
</div>
<div class="boxoffice-detail">
    <div class="container">
        <div class="scon_02">
            <p>${movieView.movie.movie_grade }</p>
<%--             <h2><%=movieNm%><em><%=movieNmEn%></em></h2> --%>
            <p class="sinfo">
            <span>
            	<c:forEach items="${movieView.genre_list }" var="genre">${genre } </c:forEach> </span><span>${movieView.movie.movie_length }분
            </span></p>
        </div>
        <div class="scon_02_detail">
            <div class="lbox">
                <img src="../../resources/img/poster/${movieView.movie.movie_mainpic_path}">
                <a href="<%=request.getContextPath() %>/reservation/cinema.do?movie_cd=${movieView.movie.movie_cd }" class="btn btn-reservation">예매하기</a>
                <a href="javascript:movieHeart();" class="btn btn-heart ${active }">♡ <span id="likeCount">${likeCount }</span></a>
            </div>
            <div class="rbox">
                <dl>
                    <dt>감독</dt>
                    <dd>${movieView.movie.movie_director }</dd>
                </dl>
                </dl>
                <dl>
                    <dt>출연</dt>
                    <dd>${movieView.movie.movie_actor }</dd>
                </dl>
                <dl>
                    <dt>장르</dt>
                    <dd><c:forEach items="${movieView.genre_list }" var="genre">${genre } </c:forEach></dd>
                </dl>
                <dl>
                    <dt>러닝타임</dt>
                    <dd>${movieView.movie.movie_length }분</dd>
                </dl>
<!--                 <dl> -->
<!--                     <dt>상영타입</dt> -->
<!--                     <dd></dd> -->
<!--                 </dl> -->
                <dl>
                    <dt>줄거리</dt>
                    <dd>${movieView.movie.movie_info }</dd>
                </dl>
               <div class="reviwer-box">
                    <div class="reviwer-wrapper">
                        <div class="reviwer-inner">
                            <div>
                                <div class="reviwer-star-title">5.0</div>
                                <div role="img" aria-label="별점 5개 만점에5개를 받았습니다." class="reviwer-star-img">
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="1"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="2"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="3"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="4"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="5"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                </div>
                            </div>
                            <div class="reviwer-graph">
                                <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 5인 리뷰 1개">
                                    <div aria-hidden="true" class="reviwer-graph-title">5</div>
                                    <div aria-hidden="true" class="reviwer-graph-bar">
                                        <div class="reviwer-graph-bar-list" title="1" style="width: 100%;"></div>
                                    </div>
                                </div>
                                <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 4인 리뷰 0개">
                                    <div aria-hidden="true" class="reviwer-graph-title">4</div>
                                    <div aria-hidden="true" class="reviwer-graph-bar">
                                        <div class="reviwer-graph-bar-list" title="0" style="width: 0%;"></div>
                                    </div>
                                </div>
                                <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 3인 리뷰 0개">
                                    <div aria-hidden="true" class="reviwer-graph-title">3</div>
                                    <div aria-hidden="true" class="reviwer-graph-bar">
                                        <div class="reviwer-graph-bar-list" title="1" style="width: 0%;"></div>
                                    </div>
                                </div>
                                <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 2인 리뷰 0개">
                                    <div aria-hidden="true" class="reviwer-graph-title">2</div>
                                    <div aria-hidden="true" class="reviwer-graph-bar">
                                        <div class="reviwer-graph-bar-list" title="1" style="width: 0%;"></div>
                                    </div>
                                </div>
                                <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 1인 리뷰 0개">
                                    <div aria-hidden="true" class="reviwer-graph-title">1</div>
                                    <div aria-hidden="true" class="reviwer-graph-bar">
                                        <div class="reviwer-graph-bar-list" title="1" style="width: 0%;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="reviwer-info">
                        <div class="rate">
                            <p class="tit">예매율</p>
                            <p class="cont"><i class="bi bi-ticket"></i><em>0</em>위 (${reserMap.yes_movie_reservers == 0 ? 0 : reserMap.yes_movie_reservers / reserMap.yes_all_reservers}%)</p>
                        </div>
                        <div class="audience">
                            <div class="tit">누적관객수</div>
                            <p class="cont"><i class="bi bi-people"></i><em>${reserMap.all_reservers }</em> 명</p>
                        </div>
                    </div>
                </div>
<!--                 <div class="reviwer-title"> -->
<!--                     <h2 class="title">해당 영화에 대한 <span>1</span>개의 리뷰가 있어요!</h2> -->
<!--                 </div> -->
            </div>
        </div>
    </div>
    <div class="reviwer-post" style="background-color: #fff;  padding: 0px;"> 
        <div class="container">
        </div>
    </div>
    <div class="movie_post">
        <div class="container">
        </div>
    </div>
    <div class="photo">
        <div class="container">
        </div>
    </div>
    <div class="preview">
        <div class="container">
        </div>
    </div>
</div>
<style>
.fulltrailer {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    min-height: 722px;
    overflow: hidden;
    z-index: 9999999;
}
.fulltrailer.open {
    display: block;
}
.fulltrailer .dimmed {
    width: 100%;
    height: 100%;
    background-color: #000;
    opacity: .8;
}
.fulltrailer .content {
    position: absolute;
    top: calc(50% - 240px);
    left: calc(50% - 427px);
    width: 854px;
    height: 480px;
}
</style>
<div class="fulltrailer">
    <div class="dimmed"></div>
    <div class="content">
<%--         <iframe width="854" height="480" src="https://www.youtube.com/embed/<%=YoutubeTrailer%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> --%>
    </div>
</div>
<script>
$(function(){

	
})
let mem_cd = "<%=mem_cd%>";
console.log(mem_cd);
let movie_cd = '${movieView.movie.movie_cd }';
function movieHeart(){
	if(mem_cd == null || mem_cd == ""){
		alert("로그인이 필요합니다.");
		return;
	}
	

	$.ajax({
		url : '<%=request.getContextPath()%>/movie/likeMovie.do',
		method : 'post',
		data : {'movie_cd' : movie_cd},
		success : function(res){
			console.log(res);
			if(res == 'insert'){
				$('.btn-heart').addClass("active");
				let likecount = parseInt($('#likeCount').text());
				likecount += 1;
				$('#likeCount').text(likecount);
			}else{
				$('.btn-heart').removeClass("active");
				let likecount = parseInt($('#likeCount').text());
				likecount -= 1;
				$('#likeCount').text(likecount);
			}
		},
		error : function(err){
			alert(err.status);
		}
	})
}

const btnTrailer = document.querySelector('.btn-trailer');
const fullTrailer = document.querySelector('.fulltrailer');
const dimmed = document.querySelector('.dimmed');

btnTrailer.addEventListener('click', () => {
  fullTrailer.classList.add('open');
});

dimmed.addEventListener('click', () => {
  fullTrailer.classList.remove('open');
});
</script>
<%@ include file="../include/footer.jsp" %>