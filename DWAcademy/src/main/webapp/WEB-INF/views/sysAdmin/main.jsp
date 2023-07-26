<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
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
	margin: 4rem 2rem;
	
}
.moreBtn {
	cursor: pointer;
}
</style>
<div id="wrapper">
	<div id="content">
		<div class="row">
			<div class="col-md-12" style="text-align: -webkit-center;">
				<div style="width: 80%; height: 22rem;">
					<div class="d-flex justify-content-between">
						<h4>박스오피스</h4>
						<div class="moreBtn" onclick="javascript:location.href='movieAdminMain.do';">더보기></div>
					</div>
					<!-- Swiper -->
			  		<div class="swiper mySwiper1 swiper-container" style="border: 1px solid black; border-radius: 0.5rem; padding: 0.5rem;">
			    		<div class="swiper-wrapper">
			    			<c:forEach items="${currentMovieList }" var="movie">
			      				<div class="swiper-slide">
			      					<a href="movieRegistForm.do?movie_cd=${movie.movie_cd }">
				      					<img src="getPicture.do?name=${movie.movie_mainpic_path}&item_cd=${movie.movie_cd}&type=moviePoster">
			      					</a>
			      				</div>
			   				</c:forEach>
			   			</div>
					    <div class="swiper-button-next sbn1"></div>
		    			<div class="swiper-button-prev sbp1"></div>
					    <div class="swiper-pagination sp1"></div>
			  		</div>
				</div>
			</div>
		</div>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-12" style="text-align: -webkit-center;"> -->
<!-- 				<div style="width: 80%; height: 22rem;"> -->
<!-- 					Swiper -->
<!-- 			  		<div class="swiper mySwiper2"> -->
<!-- 						<div class="d-flex justify-content-between"> -->
<!-- 							<h4>상영예정작</h4> -->
<!-- 							<div class="moreBtn" onclick="javascript:location.href='movieAdminMain.do';">더보기></div> -->
<!-- 						</div> -->
<!-- 			    		<div class="swiper-wrapper"> -->
<%-- 			    			<c:forEach items="${currentMovieList }" var="movie"> --%>
<!-- 			      				<div class="swiper-slide"> -->
<%-- 			      					<img src="getPicture.do?name=${movie.movie_mainpic_path}&item_cd=${movie.movie_cd}&type=moviePoster"> --%>
<!-- 			      				</div> -->
<%-- 			   				</c:forEach> --%>
<!-- 			   			</div> -->
<!-- 					    <div class="swiper-button-next sbn2"></div> -->
<!-- 		    			<div class="swiper-button-prev sbp2"></div> -->
<!-- 					    <div class="swiper-pagination sp2"></div> -->
<!-- 			  		</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="row">
			<div class="col-md-6 gx-4 gy-2">
				<div class="d-flex justify-content-between">
					<h4>공지사항</h4>
					<div class="moreBtn" onclick="javascript:location.href='noticeAdminMain.do';">더보기></div>
				</div>
				<div>
					<div class="list-group">
						<c:forEach items="${noticeList }" var="notice">
							<a href="noticeAdminDetail.do?notice_no=${notice.notice_no }&type=read" class="list-group-item list-group-item-action">
								<span class="float-start"><b>[${notice.notice_thr }]</b> ${notice.notice_title }</span>
								<span class="float-end"><fmt:formatDate value='${notice.regdate}' pattern='yyyy-MM-dd'/></span>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-md-6 gx-4 gy-2">
				<div class="d-flex justify-content-between">
					<h4>1:1문의</h4>
					<div class="moreBtn" onclick="javascript:location.href='qnaAdminMain.do';">더보기></div>
				</div>
				<div>
					<div class="list-group">
						<c:forEach items="${qnaList }" var="qna">
							<a href="qnaAdminDetail.do?que_no=${qna.que_no }" class="list-group-item list-group-item-action">
								<span class="float-start"><b>[${qna.thr_name }]</b> ${qna.que_title }</span>
								<span class="float-end ms-4"><fmt:formatDate value='${qna.regdate}' pattern='yyyy-MM-dd'/></span>
								<span class="float-end">${empty qna.ans_content ? '<span style="color: blue">(답변 대기중)</span>' : '(답변 완료)' }</span>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-md-12 gy-5">
				<div class="d-flex justify-content-between">
					<h4>이벤트</h4>
					<div class="moreBtn" onclick="javascript:location.href='eventAdminMain.do';">더보기></div>
				</div>
				<div class="row">
					<c:forEach items="${eventList }" var="event">
						<div class="col-md-3" style="text-align : -webkit-center;">
							<div class="card text-center" style="width: 18rem;">
								<a href="eventAdminDetail?type=read&event_no=${event.event_no }">
									<img src="getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
								</a>
								<div class="card-body">
									<h5 class="card-title">${event.event_title }</h5>
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
	var swiper = new Swiper(".mySwiper1", {
	    slidesPerView: 4,
	    loop : true,
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
	    }
	  });
	var swiper2 = new Swiper(".mySwiper2", {
	    slidesPerView: 4,
	    centeredSlides: true,
	    spaceBetween: 30,
	    grabCursor: true,
	    pagination: {
	      el: ".sp2",
	      clickable: true,
	    },
	    loop : true,
	    navigation: {
	        prevEl: '.sbp2',
	        nextEl: '.sbn2',
	    }
	  });
</script>
<%@ include file="sysAdminFooter.jsp" %>