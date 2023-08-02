<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/viewer.css">
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js"></script>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../resources/css/boxoffice.css">
<%@ include file="picture_modal.jsp" %>
<%@ include file="login_service_modal.jsp" %>
<%@ include file="review_modal.jsp" %>
<%@ include file="review_report_modal.jsp" %>
<%@ include file="alert_modal.jsp" %>
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
            	<c:forEach items="${movieView.genre_list }" var="genre">${genre } </c:forEach> </span>
            	<span><c:forEach items="${movieView.type_list }" var="type" varStatus="sta"><c:if test="${!sta.last }">${type }, </c:if><c:if test="${sta.last }">${type }</c:if></c:forEach>
            </span></p>
        </div>
        <div class="scon_02_detail">
            <div class="lbox">
<%--                 <img src="../../resources/img/poster/${movieView.movie.movie_mainpic_path}"> --%>
                <img src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${movieView.movie.movie_mainpic_path}&item_cd=${movieView.movie.movie_cd}&type=moviePoster">
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
                                <div class="reviwer-star-title">${movie_rate_avg }</div>
<!--                                 <div role="img" aria-label="별점 5개 만점에5개를 받았습니다." class="reviwer-star-img"> -->
<!--                                     <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="2"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span> -->
<!--                                     <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="4"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span> -->
<!--                                     <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="6"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span> -->
<!--                                     <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="8"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span> -->
<!--                                     <span aria-hidden="true" jsname="fI6EEc" class="star" data-number="10"><span class="star-on" aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"></path></svg></span></span> -->
<!--                                 </div> -->
                                <fieldset class="rateDe" id="rate" style="">
	                                <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="10점"></label>
	                                <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="9점"></label>
	                                <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="8점"></label>
	                                <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="7점"></label>
	                                <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="6점"></label>
	                                <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="5점"></label>
	                                <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="4점"></label>
	                                <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="3점"></label>
	                                <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="2점"></label>
	                                <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="1점"></label>
	
	                     </fieldset>
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
                            <p class="cont"><i class="bi bi-ticket"></i><em>${reserMap.yes_movie_reservers == 0 ? 0 : reserMap.yes_movie_reservers / reserMap.yes_all_reservers * 100}</em>%</p>
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
				<div class="col-2"><a href="<%=request.getContextPath()%>/movie/review.do" style="float: right;">리뷰 전체보기 ></a></div>
			</div>
		</div>
        <div class="container">
        	<c:if test="${reviewList[0].REVIEW_NO == null}">
        		<div class="reviews-members row" style="margin: 30px 0px 30px 0px;" >
	        		<div style="text-align: center;">
        				<p>등록된 리뷰가 없습니다.</p>
    	   			 </div>
        		</div>
        	</c:if>
			<c:if test="${reviewList[0].REVIEW_NO != null}">
				<c:forEach items="${reviewList }" var="review">
			        <div class="reviews-members row" style="margin: 30px 0px 30px 0px;" >
						<div class="col-1">
							<c:if test="${review.MEM_PIC_PATH != null}">
								<img alt="Generic placeholder image" src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${review.MEM_PIC_PATH}&item_cd=${review.MEM_CD}&type=memberPic" class="mr-3 rounded-pill" style="width: 80px; height: 80px;">
							</c:if>
							<c:if test="${review.MEM_PIC_PATH == null}">
								<img alt="Generic placeholder image" src="../../resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 80px; height: 80px;">
							</c:if>
							<p style="text-align: center;">
							<c:set var="mem_id_code" value="${review.MEM_ID}" />
							    ${fn:substring(mem_id_code,0,3) }**
							</p>
						</div>
						<div class="card col-11">
							<div class="card-body row" style="padding-right: 0;">
								<div class="reviews-members-header col-2" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
									<h1 id="review_rating" data-review_rating="${review.REVIEW_RATING }">${review.REVIEW_RATING } <span style="font-size: small;">점</span></h1>
								</div>
								<div class="reviews-members-body col-8" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
									<p id="review_content">${review.REVIEW_CONTENT }</p>
									<p style="font-size: small; color: gray;"><fmt:formatDate value="${review.REGDATE }" pattern="yyyy-MM-dd HH:mm"/></p>
								</div>
								<div class="reviews-members-body col-2 row" style="padding : 20px 0px; display: flex;">
									<c:if test="${review.reviewLikeActive == 'N'}">
										<a href="javascript:void(0);" id="likeBtn" style="color: black; text-align: right;" class="col-6" data-review_no="${review.REVIEW_NO }">
											<i class="fa-regular fa-thumbs-up">&nbsp;<span class="${review.REVIEW_NO }">${review.REVIEWLIKE }</span></i>
										</a>
									</c:if>
									<c:if test="${review.reviewLikeActive == 'Y'}">
										<a href="javascript:void(0);" id="likeCancelBtn" style="color: black; text-align: right;" class="col-6" data-review_no="${review.REVIEW_NO }">
											<i class="fa-solid fa-thumbs-up">&nbsp;<span class="${review.REVIEW_NO }">${review.REVIEWLIKE }</span></i>
										</a>
									</c:if>
									<c:if test="${review.MEM_CD != mem_cd }">
										<a href="javascript:void(0)" style="color: black; text-align: center;" class="col-6" id="reviewReportBtn" data-review_no="${review.REVIEW_NO }">
											<p>신고</p>
										</a>
									</c:if>
									<c:if test="${review.MEM_CD == mem_cd }">
										<a href="javascript:void(0);" style="color: black; text-align: center;" class="col-6" id="reviewUpdateBtn" data-review_no="${review.REVIEW_NO }">
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
				<div class="col-2"><a href="<%=request.getContextPath() %>/movie/moviePost.do?keyword=${movieView.movie.movie_name }" style="float: right; color: #fff;">무비포스트 전체보기 ></a></div>
			</div>
		</div>
        <div class="container" style="padding-bottom: 10px;">
        <c:if test="${empty moviePostList }">
        	<div style="text-align: center; color :white; margin-bottom: 50px;">
    			<p>등록된 무비포스트가 없습니다.</p>
	   		</div>
        </c:if>
        <c:if test="${!empty moviePostList }">
        	<div class="row" style="height: 400px;">
        		<c:forEach items="${moviePostList }" var="moviePost">
	        		<div class="col-3 post" style="height: 100%">
	        			<div class="card" style="margin: 20px; height: 90%;">
	        				<div class="card-body" style="height: 45%; background-image: url('<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${moviePost.MOVIE_PIC_PATH}&item_cd=${moviePost.MOVIE_CD}&type=movieImg');  background-repeat : no-repeat; background-size : cover;"></div>
	        				<div class="card-body" style="height: 55%;">
	        					<div><p style="font-size: small;"><c:set var="mem_id_post" value="${moviePost.MEM_ID}" />
							    ${fn:substring(mem_id_post,0,3) }**</p></div>
	        					<br>
	        					<div>${moviePost.MOVIE_NAME }</div>
	        					<div><p style="font-size: small;">${moviePost.MPOST_CONTENT }</p></div>
	        					<br>
	        					<div><p style="font-size: x-small;"><fmt:formatDate value="${moviePost.REGDATE }" pattern="yyyy-MM-dd HH:mm"/><br><br></p></div>
	        					<div>
	        						<i class="fa-regular fa-thumbs-up">&nbsp;<span>0</span></i>
	        						&nbsp;&nbsp;&nbsp;&nbsp;
	        						<i class="fa-regular fa-message">&nbsp;<span>0</span></i>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
        		</c:forEach>
        	</div>
       	 </c:if>
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

        <div class="moviePics container">
	        <c:if test="${empty pictureList }">
	        	<div style="margin: 20px auto; padding : 10px; text-align:center;">등록된 사진이 없습니다.</div>
	        </c:if>
	        <c:if test="${!empty pictureList }">
	        	<div class="row" style="width: 100%; margin: 0px 0px 30px 0px;">
	        		<c:forEach items="${pictureList }" var="pic">
		        		<div class="col-2" id="moviePic">
		        			<img src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${pic.movie_pic_path}&item_cd=${movieView.movie.movie_cd}&type=movieImg" style="width: 100%; border: solid 1px black;">
		        		</div>
	        		</c:forEach>
	
	        	</div>
        	</c:if>
        </div>

<!-- 		<div class="container" id="addMovieDiv" style="margin: 0 auto;"> -->
<!-- 			<div style="width: 100%; margin: 20px;"> -->
<!-- 				<button type="button" class="btn" id="btnAddMovie" style="width: 100%; border: 1px solid gray;">더보기 <i class="iconset ico-btn-more-arr"></i></button> -->
<!-- 			</div> -->
<!-- 		</div> -->
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
		  	<c:if test="${empty previewList }">
		  		<div style="margin: 20px auto; padding : 10px; text-align:center;">등록된 예고편이 없습니다.</div>
		  	</c:if>
		  	<c:if test="${!empty previewList }">
		        <div id="demo" class="carousel slide carousel-dark" style="height: 420px;">
			  
				  <div class="carousel-inner">
					<c:forEach items="${previewList }" var="preview">
					    <div class="carousel-item active" style="">
						 	<video class="vi" style="height: 400px; display : block; margin : auto;" controls>
								<source src='<%=request.getContextPath()%>/sysAdmin/getVideo.do?movie_cd=${movieView.movie.movie_cd }&movie_pre_path=${preview.movie_pre_path}'  type="video/mp4">
							</video>
					    	
					    </div>
				 	</c:forEach>
				    
				  </div>
				  
				  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
				    <span class="carousel-control-next-icon black"></span>
				  </button>
				</div>
			</c:if>
        </div>
    </div>
</div>
<style>
.rateDe { display: inline-block;border: 0;margin-right: 15px;}
.rateDe > input {display: none;}
.rateDe > label {float: right;color: #ddd}
.rateDe > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
.rateDe .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
.rateDe input:checked ~ label{ color: #4aa8d8 !important;  }


#moviePic:hover{
	cursor: pointer;
}

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
	let rateAvg = ${movie_rate_avg };
	$('.rateDe input[name=rating][value="' + Math.round(rateAvg) + '"]').prop('checked', 'checked');
	
	$('.moviePics').on('click', '#moviePic', function(){
		let imgsrc = $(this).find('img').prop('src');
		$('.moviePicDetail').find('img').prop('src', imgsrc);
		$('#picture-modal').modal('show');
	})
	
	$('#reviewUpdateBtn').on('click', function(){
		let review_content = $(this).parents('.card').find('#review_content').text();
		let review_rating = $(this).parents('.card').find('#review_rating').data("review_rating");
		$('#reviewtext').text(review_content);
		$('fieldset#rate').find('input[name="rating"][value=' + review_rating + ']').prop('checked', 'checked');
		$('#writecount').text(review_content.length);
		$('#updDiv').css('display', '');
		$('#regDiv').css('display', 'none');
		$('#review-modal').find('input[name="review_no"]').val($(this).data('review_no'));
		console.log($(this).data('review_no'));
		
		$('#review-modal').modal("show");
	})
	
	$('.reviews-members-body').on('click', '#reviewReportBtn', function(){
		if(mem_cd == null || mem_cd == ""){
			$('#login-service-modal').modal("show");
			return;
		}
		$('#reviewReportModalInputRN').val($(this).data('review_no'));
		$('#review-report-modal').modal("show");
	})

	
	$('#reviewModalBtn').on('click', function(){
		if(mem_cd == null || mem_cd == ""){
			$('#login-service-modal').modal("show");
			return;
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/movie/watchYN.do",
			method : 'post',
			data : {"movie_cd" : movie_cd},
			success : function(res){
				console.log(res);
				if(res == "non"){
					$('#alertContent').text("영화 관람 후 작성 가능합니다.");
					$('#alert-modal').modal('show');
					return;
				}else if(res == "write"){
					$('#alertContent').text("영화 당 한 개만 작성 가능합니다.");
					$('#alert-modal').modal('show');
					return;
				}
				$('#review-modal').modal("show");
			},
			error : function(err){
				alert(err);
			}
		})
	
	})
	
	$('.reviews-members-body').on('click', '#likeBtn', function(){
		if(mem_cd == null || mem_cd == ""){
			$('#login-service-modal').modal("show");
			return;
		}
		let review_no = $(this).data('review_no');
		reviewHeart(review_no);
		$(this).find('i').removeClass('fa-regular');
		$(this).find('i').addClass('fa-solid');
		$(this).prop('id', 'likeCancelBtn');
		let likecount = $(this).find('span').text();
		likecount++;
		$(this).find('span').text(likecount);
	})
	
	$('.reviews-members-body').on('click', '#likeCancelBtn', function(){
		let review_no = $(this).data('review_no');
		reviewHeartDel(review_no);
		$(this).find('i').removeClass('fa-solid');
		$(this).find('i').addClass('fa-regular');
		$(this).prop('id', 'likeBtn');
		let likecount = $(this).find('span').text();
		likecount--;
		$(this).find('span').text(likecount);
		
	})
});

function reviewHeart(review_no){
	if(mem_cd == null || mem_cd == ""){
		$('#login-service-modal').modal("show");
		return;
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/movie/reviewLike.do',
		method : 'post',
		data : {'review_no' : review_no},
		success : function(res){
			console.log(res);
		},
		errer : function(err){
			alert(err.status);
		}
	})
	
}

function reviewHeartDel(review_no){

	$.ajax({
		url : '<%=request.getContextPath()%>/movie/reviewLikeDel.do',
		method : 'post',
		data : {'review_no' : review_no},
		success : function(res){
			console.log(res);
		},
		errer : function(err){
			alert(err.status);
		}
	})
	
}

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
		$('#login-service-modal').modal("show");
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