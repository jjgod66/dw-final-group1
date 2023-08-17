<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp" %>
<style>
#wrapper {
    background-color: #fff;
    z-index: 5;
    min-width: 1210px;
    zoom: 1;
}
#content {
	max-width: 80rem;
	margin : 2rem auto 2rem auto;
    padding-bottom: 100px;
    border: 1px solid #ccc;
}
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
.card img {
	width : 100%;
	height: 15rem;
}

.swiper {
      width: 100%;
      height: 100%;
}

.swiper-slide {
  text-align: center;
  font-size: 18px;
  background: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
}

.swiper-slide img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
:root {
	--swiper-theme-color: #4aa8d8;
}
#content > .row {
/* 	margin: 4rem 2rem; */
	
}
.moreBtn {
	cursor: pointer;
}
</style>
<div id="wrapper">
	<div id="content">
		<div class="row" style="margin: 3rem; 0">
			<div class="col-md-12" style="text-align: -webkit-center;">
				<div style="width: 80%;">
					<div class="d-flex justify-content-between mb-2">
						<h4><b>박스오피스</b></h4>
						<div class="moreBtn" onclick="javascript:location.href='movieAdminMain.do';">더보기></div>
					</div>
					<!-- Swiper -->
					<div style="position:relative;">
			  		<div class="swiper mySwiper1 swiper-container" style="position: static;">
			    		<div class="swiper-wrapper">
			    			<c:forEach items="${currentMovieList }" var="movie">
			      				<div class="swiper-slide" >
			      					<a href="movieAdminMain.do">
				      					<img src="<%=request.getContextPath() %>/common/getPicture.do?name=${movie.movie_mainpic_path}&item_cd=${movie.movie_cd}&type=moviePoster" style="border-radius: 0.5rem; height:332px;">
			      					</a>
			      				</div>
			   				</c:forEach>
			   			</div>
			  		</div>
					    <div class="swiper-button-next sbn1" style="position: absolute; right: -50px;"></div>
		    			<div class="swiper-button-prev sbp1" style="position: absolute; left: -50px;"></div>
					    <div class="swiper-pagination sp1" style="position: absolute; bottom: -30px;"></div>
	    			</div>
				</div>
			</div>
		</div>
		<div class="row mx-3">
			<div class="col-md-6 gx-4 gy-4">
				<div class="d-flex justify-content-between mb-2">
					<h4><b>공지사항</b></h4>
					<div class="moreBtn" onclick="javascript:location.href='noticeAdminMain.do';">더보기></div>
				</div>
				<div>
					<div class="list-group">
						<c:forEach items="${noticeList }" var="notice">
							<a href="noticeAdminDetail.do?notice_no=${notice.notice_no }&type=read" class="list-group-item list-group-item-action">
								<div style="display: inline-block; width: 80%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><b>[${notice.notice_thr }]</b> ${notice.notice_title }</div>
								<span class="float-end"><fmt:formatDate value='${notice.regdate}' pattern='yyyy-MM-dd'/></span>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-md-6 gx-4 gy-4">
				<div class="d-flex justify-content-between mb-2">
					<h4><b>1:1문의</b></h4>
					<div class="moreBtn" onclick="javascript:location.href='qnaAdminMain.do';">더보기></div>
				</div>
				<div>
					<div class="list-group">
						<c:forEach items="${qnaList }" var="qna">
							<a href="qnaAdminDetail.do?que_no=${qna.que_no }" class="list-group-item list-group-item-action">
								<div style="display: inline-block; width: 60%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><b>[${qna.thr_name }]</b> ${qna.que_title }</div>
								<span class="float-end ms-4"><fmt:formatDate value='${qna.regdate}' pattern='yyyy-MM-dd'/></span>
								<span class="float-end">${empty qna.ans_content ? '<span style="color: blue">(답변 대기중)</span>' : '(답변 완료)' }</span>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="row mx-3 mt-5">
			<div class="col-md-12">
				<div class="d-flex justify-content-between mb-2">
					<h4><b>이벤트</b></h4>
					<div class="moreBtn" onclick="javascript:location.href='eventAdminMain.do';">더보기></div>
				</div>
				<div class="row">
					<c:forEach items="${eventList }" var="event">
						<div class="col-md-3" style="text-align : -webkit-center;">
							<div class="card text-center h-100" style="width: 18rem;">
								<a href="eventAdminDetail?type=read&event_no=${event.event_no }">
									<img src="<%=request.getContextPath() %>/common/getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
								</a>
								<div class="card-body">
									<h5 class="card-title"><b>${event.event_title }</b></h5>
									<p class="card-text"><fmt:formatDate value="${event.startdate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.enddate }" pattern="yyyy-MM-dd"/></p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
window.onload = function(){
	var swiper = new Swiper(".mySwiper1", {
	    slidesPerView: 3,
	    loop : true,
		loopAdditionalSlides: 1,
	    centeredSlides: true,
	    spaceBetween: 30,
	    grabCursor: true,
	    pagination: {
	      el: ".sp1",
	      clickable: true,
	    },
	    navigation: {
	        prevEl: '.sbp1',
	        nextEl: '.sbn1',
	    },
	    observer: true,
	    observeParents: true,
	  });
}
</script>
<%@ include file="thrAdminFooter.jsp" %>