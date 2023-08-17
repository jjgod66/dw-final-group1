<%@page import="java.util.Map"%>
<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/review.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/viewer.css">
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="review_modal.jsp" %>
<%@ include file="review_report_modal.jsp" %>
<style>
.post-lank-box p {
	margin: 0;
	padding: 0
}

.post-lank-box .inner-wrap {
	position: relative
}

.post-lank-box .post-lank {
	float: left;
	height: 194px;
	margin: 0 0 0 -58px
}

.post-lank-box .post-lank li {
	position: relative;
	float: left;
	margin-left: 58px
}

.post-lank-box .post-lank li a {
	display: block;
	width: 135px;
	height: 194px
}

.post-lank-box .post-lank li a .img img {
	width: 135px !important;
	height: 194px !important
}

.post-lank-box .post-lank li a .lank {
	position: absolute;
	top: 10px;
	left: 10px;
	z-index: 3;
	font-size: 1.6em;
	line-height: 1em;
	color: #fff;
	font-family: Roboto;
	font-weight: 300;
	font-style: italic
}

.post-lank-box .post-lank li a .post-count {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 2;
	width: 135px;
	height: 194px;
	padding-top: 73px;
	background-color: rgba(0, 0, 0, .6);
	text-align: center
}

.post-lank-box .post-lank li a .post-count .tit {
	font-size: .8667em;
	line-height: 1.1;
	color: #fff
}

.post-lank-box .post-lank li a .post-count .count {
	font-size: 2.1333em;
	font-family: Roboto;
	color: #fff;
	font-weight: 300
}

.post-lank-box .post-lank li a:hover .lank {
	left: -10000px
}

.post-lank-box .post-lank li a:hover .post-count {
	left: -10000px
}

.post-lank-box .mypost-box {
	position: relative;
	float: left;
	width: 135px;
	height: 194px;
	margin: 0 0 0 58px
}

.post-lank-box .mypost-box .lank {
	position: absolute;
	top: 10px;
	left: 10px;
	z-index: 3;
	font-size: 1.6em;
	line-height: 1em;
	color: #fed143;
	font-family: Roboto;
	font-weight: 300;
	font-style: italic
}

.post-lank-box .mypost-box .post-count {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 2;
	width: 135px;
	height: 194px;
	padding-top: 73px;
	background-color: rgba(0, 0, 0, .6);
	text-align: center
}

.post-lank-box .mypost-box .post-count .tit {
	font-size: .8667em;
	line-height: 1.1;
	color: #fff
}

.post-lank-box .mypost-box .post-count .count {
	font-size: 2.1333em;
	color: #fff
}

.post-lank-box .mypost-box .post-count a.txt-login {
	display: inline-block;
	padding: 10px 0 0 0;
	color: #fff;
	border-bottom: 1px solid #fff;
	text-decoration: none
}

.post-lank-box .mypost-box .before {
	width: 100%;
	height: 100%;
	background:
		url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-post-no-login.png)
		no-repeat 0 0
}

.post-lank-box .mypost-box .after {
	width: 100%;
	height: 100%;
	background:
		url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-post-no-login.png)
		no-repeat 0 0
}

.post-lank-box .mypost-box .after a {
	display: block;
	width: 135px;
	height: 100%
}

.post-lank-box .mypost-box .after a .img img {
	width: 135px !important;
	height: 194px !important
}

.post-lank-box .mypost-box .after .txt-info {
	position: absolute;
	left: -10000px;
	top: 0;
	bottom: 0;
	width: 100%;
	padding: 80px 0 0 0;
	text-align: center;
	color: #fff;
	background-color: rgba(0, 0, 0, .6)
}

.post-lank-box .mypost-box .after:hover .lank {
	left: -10000px
}

.post-lank-box .mypost-box .after:hover .post-count {
	left: -10000px
}

.post-lank-box .mypost-box .after:hover .txt-info {
	left: 0
}

.post-lank-box .add-post {
	position: absolute;
	right: 0;
	top: 0
}

.post-lank-box .add-post .button {
	width: 123px;
	padding: 0
}

.postLankMoive:hover .lankcount{
	display: none;
}
.postLankMoive:hover{
	cursor: pointer;
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
select {
    overflow: hidden;
    height: 34px;
    border: 1px solid #d8d9db;
}
</style>
<%
	mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		Map member = (Map) session.getAttribute("loginUser");
		mem_cd = (String)member.get("CD");
	}
%>
<%@ include file="login_service_modal.jsp" %>
<%@ include file="review_delete_modal.jsp" %>
<c:set var="cri" value="${pageMaker.cri }" />
<div class="sub_visual">
    <h3>영화리뷰</h3>
    <h6>Movie Review</h6>
</div>
<div class="sub_visual" style="background-color: white; padding-top: 50px; height: 300px; padding-left: 100px;">
    <div class="row" style="width: 1300px; margin: 0 auto;">
    	<c:forEach items="${top5Moive }" var="movie">
	    	<div class="col-2 postLankMoive" style="position: relative; margin-right: 20px;" data-movie_name="${movie.MOVIE_NAME }">
	    		<div style="width: 180px; height: 250px; position: absolute;" >
	    			<img
								src="<%=request.getContextPath() %>/common/getPicture.do?name=${movie.MOVIE_MAINPIC_PATH}&item_cd=${movie.MOVIE_CD}&type=moviePoster"
								onerror="noImg(this)" alt="${movie.MOVIE_NAME }" style="width: 100%; height: 100%;">
	    		</div>
	    		<div style="width: 180px; height: 250px; position: absolute; background-color:rgba(0, 0, 0, 0.5); color : white;" class="lankcount">
	    			<p class="lank" style="text-align: left; font-size: 30px;">&nbsp;${movie.RNUM }</p>
	
						<div class="post-count">
							<p class="tit" style="font-size: 20px;">REVIEW</p>
							<p class="count" style="font-size: 30px;">${movie.WRITECNT }</p>
							<p class="tit" style="font-size: 20px;"></p>
							<p class="count" style="font-size: 30px;"><span style="font-size: 12px;">평균</span>${movie.RATE }<span style="font-size: 12px;">점</span></p>
						</div>
	    		</div>
	    	</div>
    	</c:forEach>
    </div>
</div>

<div style="width: 1300px; height: 80px; margin: 0 auto;">
	<div style="width: 95%; margin: 0 auto;">
		<div style="margin: 20px 0px 10px 10px; display: flex; float: right;">
			<div style="margin: 10px;">
				<span>
					<select name="searchType" id="searchType" onchange="javascript:searchList_go(1);">
									<option value="regdate" ${cri.searchType eq 'regdate' ? 'selected' : '' }>최신순 </option>
									<option value="like" ${cri.searchType eq 'like' ? 'selected' : '' }>공감순 </option>
					</select>
				</span>
			</div>
			<div id="boardSearch" class="inner-wrap" style="margin: 10px;">
				<div class="board-list-util mt0">
					<div class="board-search">
						<input type="text" title="영화 제목을 입력해 주세요." placeholder="영화 제목을 입력해 주세요." name="keyword"
							class="input-text" id="search" value="${cri.keyword }">
						<button type="button" class="btn-search-input" id="searchBtn">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <div class="bg-white rounded shadow-sm p-4 mb-4 restaurant-detailed-ratings-and-reviews"> -->
	<div class="container">
<!-- 		<select name="searchType"> -->
<!-- 			<option value="movie">영화제목</option> -->
<!-- 		</select> -->
<!-- 		<input type="text" name="keyword" id="searchReview"> -->
<!-- 		<input class="btn" id="searchReviewBtn" type="submit" value="검색" onclick="javascript:searchList_go(1);"> -->
	    <div class="">
        	<c:if test="${reviewList[0].REVIEW_NO == null}">
        		<div class="reviews-members row" style="margin: 30px 0px 30px 0px;" >
	        		<div style="text-align: center;">
        				<p>등록된 리뷰가 없습니다.</p>
    	   			 </div>
        		</div>
        	</c:if>
			<c:if test="${reviewList[0].REVIEW_NO != null}">
				<c:forEach items="${reviewList}" var="review">
			        <div class="row" style="margin: 30px 0px 30px 0px; border-radius: solid 1px #e5e5e5; width: 1300px;" >
						<div class="col-1">
							<c:if test="${review.MEM_PIC_PATH != null}">
								<img alt="Generic placeholder image" src="<%=request.getContextPath() %>/common/getPicture.do?name=${review.MEM_PIC_PATH}&item_cd=${review.MEM_CD}&type=memberPic" class="mr-3 rounded-pill" style="width: 80px; height: 80px;">
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
								<div class="reviews-members-header row" style="padding-right: 0; justify-content: center; align-items: center;">
									<div class="reviews-members-header col-2 row" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
										<h1 id="review_rating" data-review_rating="${review.REVIEW_RATING }" class="col-12">${review.REVIEW_RATING } <span style="font-size: small;">점</span></h1>
									</div>
									<div class="col-8" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
										<span class="" style="font-size: small;" id="movieName">${review.MOVIE_NAME }</span>
										<p id="review_content" style="margin-top: 10px;">${review.REVIEW_CONTENT}</p>
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
										<div class="w20 reUD col-6" style="text-align: right; padding: 0;">
											<a href="javascript:void(0)" style="color: black; text-align: center; display: inline; margin-right: 10px;" id="reviewUpdateBtn" data-review_no="${review.REVIEW_NO }">
												수정
											</a>
											<a href="javascript:void(0)" style="color: black; text-align: center; display: inline; margin-right: 10px;" id="reviewDeleteBtn" data-review_no="${review.REVIEW_NO }">
												삭제
											</a>
										</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
	        	</c:forEach>
			</c:if>
		<div class="mt-5 mb-5 paginationdiv">
			<%@ include file="../common/pagination.jsp" %>
		</div>
		</div>
	</div>
<!-- </div> -->
<script>

$(function(){
	
	
	$('.container').on('click', '#reviewDeleteBtn', function(){
		let review_no = $(this).data('review_no');
		$('#reviewDelReplyNo').val(review_no);
		$('#review-delete-modal').modal('show');
	})
	
	$('.container').on('click', '#reviewUpdateBtn', function(){
		let review_content = $(this).parents('.card').find('#review_content').text();
		let review_rating = $(this).parents('.card').find('#review_rating').data("review_rating");
		let mn = $(this).parents('.card').find('#movieName').text();
		$('#reviewtext').text(review_content);
		$('#reviewMovieName').text('영화 "' + mn + '"')
		$('fieldset#rate').find('input[name="rating"][value=' + review_rating + ']').prop('checked', 'checked');
		$('#writecount').text(review_content.length);
		$('#updDiv').css('display', '');
		$('#regDiv').css('display', 'none');
		$('#review-modal').find('input[name="review_no"]').val($(this).data('review_no'));
		console.log($(this).data('review_no'));
		
		$('#review-modal').modal("show");
	})
	
	$('.postLankMoive').on('click', function(){
		let movie_name = $(this).data('movie_name');
		$('input[name="keyword"]').val(movie_name);
		searchList_go(1);
	})
	
	$('#searchBtn').on('click', function(){
		searchList_go(1);
	})
})

mem_cd = "<%=mem_cd%>";
let searchFormUrl = "<%=request.getContextPath()%>/movie/review.do";
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

$('.reviews-members-body').on('click', '#reviewReportBtn', function(){
		if(mem_cd == null || mem_cd == ""){
			$('#login-service-modal').modal("show");
			return;
		}
		$('#reviewReportModalInputRN').val($(this).data('review_no'));
		$('#review-report-modal').modal("show");
	})

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
</script>
<%@ include file="../include/footer.jsp" %>