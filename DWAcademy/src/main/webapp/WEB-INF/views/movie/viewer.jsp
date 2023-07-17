<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/viewer.css">
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js"></script>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../resources/css/boxoffice.css">
<%@ include file="review_modal.jsp" %>
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
                    <dt>제목</dt>
                    <dd>${movieView.movie.movie_name }</dd>
                </dl>
                <dl>
                    <dt>감독</dt>
                    <dd>${movieView.movie.movie_director }</dd>
                </dl>
                </dl>
                <dl>
                    <dt>출연</dt>
                    <dd>${movieView.movie.movie_actor }</dd>
                </dl>
<!--                 <dl> -->
<!--                     <dt>장르</dt> -->
<%--                     <dd><c:forEach items="${movieView.genre_list }" var="genre">${genre } </c:forEach></dd> --%>
<!--                 </dl> -->
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
<!--                         <div class="reviwer-inner"> -->
                            <div>
                                <div class="reviwer-star-title">&nbsp;10</div>
                                <div role="img" aria-label="별점 5개 만점에5개를 받았습니다." class="reviwer-star-img">
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="2"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="4"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="6"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="8"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                    <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="10"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span>
                                </div>
                            </div>
<!--                             <div class="reviwer-graph"> -->
<!--                                 <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 5인 리뷰 1개"> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-title">10</div> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-bar"> -->
<!--                                         <div class="reviwer-graph-bar-list" title="1" style="width: 100%;"></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 4인 리뷰 0개"> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-title">8</div> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-bar"> -->
<!--                                         <div class="reviwer-graph-bar-list" title="0" style="width: 0%;"></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 3인 리뷰 0개"> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-title">6</div> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-bar"> -->
<!--                                         <div class="reviwer-graph-bar-list" title="1" style="width: 0%;"></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 2인 리뷰 0개"> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-title">4</div> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-bar"> -->
<!--                                         <div class="reviwer-graph-bar-list" title="1" style="width: 0%;"></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="reviwer-graph-img" role="img" aria-label="별점 평점이 1인 리뷰 0개"> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-title">2</div> -->
<!--                                     <div aria-hidden="true" class="reviwer-graph-bar"> -->
<!--                                         <div class="reviwer-graph-bar-list" title="1" style="width: 0%;"></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                    <div class="reviwer-info">
                        <div class="rate">
                            <p class="tit">예매율</p>
                            <p class="cont"><i class="bi bi-ticket"></i><em>${reserMap.yes_movie_reservers == 0 ? 0 : reserMap.yes_movie_reservers / reserMap.yes_all_reservers}</em>%</p>
                        </div>
                        <div class="audience">
                            <div class="tit">누적관객수</div>
                            <p class="cont"><i class="bi bi-people"></i><em>${reserMap.all_reservers }</em> 명</p>
                        </div>
                    </div>
                </div>
                <div class="review-write" style="margin: 30px 0px 0px 0px; display: flex;">
                	<textarea class="form-control" id="exampleFormControlTextarea1" style="width: 85%; height: 80px; resize: none; color: gray;" disabled>${movieView.movie.movie_name } 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.</textarea>
<!-- 	        		<a href="#" data-bs-toggle="modal" data-bs-target="#review-modal" class="btn btn-trailer" id="reviewModalBtn" style="width: 13%; height: 80px; margin: 0px 0px 0px 20px; padding: 25px 20px 25px 20px;">리뷰작성</a> -->
	        		<a href="#" class="btn btn-trailer" id="reviewModalBtn" style="width: 13%; height: 80px; margin: 0px 0px 0px 20px; padding: 25px 20px 25px 20px;">리뷰작성</a>
	        	</div>
<!--                 <div class="reviwer-title"> -->
<!--                     <h2 class="title">해당 영화에 대한 <span>1</span>개의 리뷰가 있어요!</h2> -->
<!--                 </div> -->
            </div>
        </div>
    </div>
    <div class="reviwer-post" style="background-color: #fff;  padding: 0px;"> 
	    <div class="container">
			<div class="row" style="display: flex; margin: 50px 0px 30px 0px;">
				<div class="col-2">
					<h3 style="color: #4aa8d8;">영화리뷰</h3>
				</div>
				<div class="col-8">
				</div>
				<div class="col-2"><a href="#" style="float: right;">리뷰 전체보기 ></a></div>
			</div>
		</div>
        <div class="container">
        	<c:if test="${reviewList[0].review_no == null}">
        		<div class="reviews-members row" style="margin: 30px 0px 30px 0px;" >
        			<p>등록된 리뷰가 없습니다.</p>
        		</div>
        	</c:if>
			<c:if test="${reviewList[0].review_no != null}">
				<c:forEach items="${reviewList }" var="review">
			        <div class="reviews-members row" style="margin: 30px 0px 30px 0px;" >
						<div class="col-1">
							<img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar1.png" class="mr-3 rounded-pill" style="width: 80px; height: 80px;">
							<p style="text-align: center;">${review.mem_cd }</p>
						</div>
						<div class="card col-11">
							<div class="card-body row" style="padding-right: 0;">
								<div class="reviews-members-header col-2" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
									<h1>${review.review_rating } <span style="font-size: small;">점</span></h1>
								</div>
								<div class="reviews-members-body col-8" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
									<p>${review.review_content }</p>
									<p style="font-size: small; color: gray;"><fmt:formatDate value="${review.regdate }" pattern="yyyy-MM-dd HH:mm"/></p>
								</div>
								<div class="reviews-members-body col-2 row" style="padding : 20px 0px; display: flex;">
									<a href="javascript:reviewHeart();" id="likeBtn" style="color: black; text-align: right;" class="col-6">
										<i class="fa-regular fa-thumbs-up">&nbsp;<span>0</span></i>
									</a>
									<a href="javascript:reviewHeartDel();" id="likeCancelBtn" style="color: black; display: none">
										<i class="fa-solid fa-thumbs-up">&nbsp;<span>0</span></i>
									</a>
									<c:if test="${review.mem_cd != mem_cd }">
										<a href="javascript:reviewReport();" style="color: black; text-align: center;" class="col-6">
											<p>신고</p>
										</a>
									</c:if>
									<c:if test="${review.mem_cd == mem_cd }">
										<a href="javascript:reviewUpdate();" style="color: black; text-align: center;" class="col-6">
											<p>수정</p>
										</a>
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
	        	</c:forEach>
			</c:if>
		</div>
    </div>
    <div class="movie_post" style="background-color: gray;">
    	<div class="container" style="padding-top: 10px;">
			<div class="row" style="display: flex; margin: 50px 0px 30px 0px;">
				<div class="col-2">
					<h3 style="color: #fff;">무비포스트</h3>
				</div>
				<div class="col-8">
				</div>
				<div class="col-2"><a href="#" style="float: right; color: #fff;">무비포스트 전체보기 ></a></div>
			</div>
		</div>
        <div class="container" style="height: 400px; padding-bottom: 10px;">
        	<div class="row" style="height: 100%">
        		<div class="col-3 post" style="height: 100%">
        			<div class="card" style="margin: 20px; height: 90%;">
        				<div class="card-body" style="height: 45%; background-image: url('../../resources/img/poster/미션임파서블.jpg');  background-repeat : no-repeat; background-size : cover;"></div>
        				<div class="card-body" style="height: 55%;">
        					<div><p style="font-size: small;">ddsjfa00</p></div>
        					<br>
        					<div>영화이름 엘리멘탈</div>
        					<div><p style="font-size: small;">포스트내용ㄴㅇ라먼ㅇ리ㅓㄴ</p></div>
        					<br>
        					<div><p style="font-size: x-small;">2023-07-17 11:25<br><br></p></div>
        					<div>
        						<i class="fa-regular fa-thumbs-up">&nbsp;<span>0</span></i>
        						&nbsp;&nbsp;&nbsp;&nbsp;
        						<i class="fa-regular fa-message">&nbsp;<span>0</span></i>
        					</div>
        				</div>
        			</div>
        		</div>	
        	</div>
        </div>
    </div>
    <div class="photo">
    	<div class="container" style="padding-top: 10px;">
			<div class="row" style="display: flex; margin: 30px 0px 30px 0px;">
				<div class="col-2">
					<h3 style="color: #4aa8d8;">영화 사진</h3>
				</div>
				<div class="col-8">
				</div>
				<div class="col-2"></div>
			</div>
		</div>
<!--         <div class="container"> -->
<!-- 	        <div id="demo" class="carousel slide carousel-dark" style="height: 420px;"> -->
<!-- 			  <div class="carousel-inner"> -->
<!-- 			    <div class="carousel-item active" style=""> -->
<!-- 			      <img src="../../resources/img/poster/미션임파서블.jpg" alt="Los Angeles" class="d-block" style="width: auto; height: 400px; display : block; margin : auto;"> -->
<!-- 			    </div> -->
<!-- 			    <div class="carousel-item"> -->
<!-- 			      <img src="../../resources/img/store/15464115505070.jpg" alt="Chicago" class="d-block" style="width: auto; height: 400px; display : block; margin : auto;"> -->
<!-- 			    </div> -->
<!-- 			    <div class="carousel-item"> -->
<!-- 			      <img src="../../resources/img/poster/엘리멘탈 메인 포스터.jpg" alt="New York" class="d-block" style="width: auto; height: 400px; display : block; margin : auto;"> -->
<!-- 			    </div> -->
<!-- 			  </div> -->
			  
<!-- 			  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev"> -->
<!-- 			    <span class="carousel-control-prev-icon"></span> -->
<!-- 			  </button> -->
<!-- 			  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next"> -->
<!-- 			    <span class="carousel-control-next-icon black"></span> -->
<!-- 			  </button> -->
<!-- 			</div> -->
<!--         </div> -->

        <div class="container">
        	<div class="row" style="width: 100%; margin: 0px 0px 30px 0px;">
        		<div class="col-2">
        			<img src="../../resources/img/store/15464115505070.jpg" style="width: 100%; border: solid 1px black;">
        		</div>
        		<div class="col-2">
        			<img src="../../resources/img/store/15464115505070.jpg" style="width: 100%; border: solid 1px black;">
        		</div>
        		<div class="col-2">
        			<img src="../../resources/img/store/15464115505070.jpg" style="width: 100%; border: solid 1px black;">
        		</div>
        		<div class="col-2">
        			<img src="../../resources/img/poster/엘리멘탈 메인 포스터.jpg" style="width: 100%; border: solid 1px black;">
        		</div>
        		<div class="col-2">
        			<img src="../../resources/img/store/15464115505070.jpg" style="width: 100%; border: solid 1px black;">
        		</div>
        		<div class="col-2">
        			<img src="../../resources/img/poster/엘리멘탈 메인 포스터.jpg" style="width: 100%; border: solid 1px black;">
        		</div>
        		<div class="col-2">
        			<img src="../../resources/img/poster/엘리멘탈 메인 포스터.jpg" style="width: 100%; border: solid 1px black;">
        		</div>
        		<div class="col-2">
        			<img src="../../resources/img/poster/엘리멘탈 메인 포스터.jpg" style="width: 100%; border: solid 1px black;">
        		</div>

        	</div>
        </div>

		<div class="container" id="addMovieDiv" style="margin: 0 auto;">
			<div style="width: 100%; margin: 20px;">
				<button type="button" class="btn" id="btnAddMovie" style="width: 100%; border: 1px solid gray;">더보기 <i class="iconset ico-btn-more-arr"></i></button>
			</div>
		</div>
    </div>
    <div class="preview">
   		<div class="container" style="padding-top: 10px;">
			<div class="row" style="display: flex; margin: 30px 0px 30px 0px;">
				<div class="col-2">
					<h3 style="color: #4aa8d8;">예고편</h3>
				</div>
				<div class="col-8">
				</div>
				<div class="col-2"></div>
			</div>
		</div>
        <div class="container" style="padding-bottom: 10px;">
	        <div id="demo" class="carousel slide carousel-dark" style="height: 420px;">
			  <div class="carousel-inner">
			    <div class="carousel-item active" style="">
			    	<video src="../../resources/img/test/video/테스트용동영상1.mp4" style="height: 400px; display : block; margin : auto;" controls></video>
<!-- 			    	<video> -->
<!-- 					  <source src="../../resources/img/test/video/테스트용동영상1.mp4"></source> -->
<!-- 					</video> -->
			    </div>
			    <div class="carousel-item">
			    	<video src="../../resources/img/test/video/테스트용동영상2.mp4" style="height: 400px; display : block; margin : auto;" controls></video>
			    </div>
			    <div class="carousel-item">
			    	<video src="../../resources/img/test/video/테스트용동영상3.mp4" style="height: 400px; display : block; margin : auto;" controls></video>
			    </div>
			  </div>
			  
			  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
			    <span class="carousel-control-next-icon black"></span>
			  </button>
			</div>
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
/* .fulltrailer.open { */
/*     display: block; */
/* } */
/* .fulltrailer .dimmed { */
/*     width: 100%; */
/*     height: 100%; */
/*     background-color: #000; */
/*     opacity: .8; */
/* } */
/* .fulltrailer .content { */
/*     position: absolute; */
/*     top: calc(50% - 240px); */
/*     left: calc(50% - 427px); */
/*     width: 854px; */
/*     height: 480px; */
/* } */
</style>
<div class="fulltrailer">
    <div class="dimmed"></div>
    <div class="content">
<%--         <iframe width="854" height="480" src="https://www.youtube.com/embed/<%=YoutubeTrailer%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> --%>
    </div>
</div>
<script>

$(function() {
	$('#reviewModalBtn').on('click', function(){
		if(mem_cd == null || mem_cd == ""){
			alert("로그인이 필요합니다.");
			return;
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/movie/watchYN.do",
			method : 'post',
			data : {"movie_cd" : movie_cd},
			success : function(res){
				console.log(res);
				if(res == "non"){
					alert("리뷰는 관람 후 작성 가능합니다.");
					return;
				}else if(res == "write"){
					alert("리뷰는 영화 당 한 개만 작성 가능합니다.");
					return;
				}
				$('#review-modal').modal("show");
			},
			error : function(err){
				alert(err);
			}
		})
	
	})
});


var mySwiper = new Swiper('.swiper-container', {

	   // 여기에 옵션을 넣어야 합니다.

	   // 예시 코드
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev'
	  },
	  slidesPerView: '5',
	  loop : false
	});

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