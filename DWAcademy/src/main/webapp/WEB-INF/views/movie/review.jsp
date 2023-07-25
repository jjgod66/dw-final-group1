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
<%
	String mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		mem_cd = member.getMem_cd();
	}
%>
<div class="sub_visual">
    <h3>영화리뷰</h3>
    <h6>Movie Review</h6>
</div>
<div class="bg-white rounded shadow-sm p-4 mb-4 restaurant-detailed-ratings-and-reviews">
	<div class="container">
		<select name="searchType">
			<option value="movie">영화제목</option>
		</select>
		<input type="text" name="keyword" id="searchReview">
		<input class="btn" id="searchReviewBtn" type="submit" value="검색" onclick="javascript:searchList_go(1);">
	    <div class="container">
        	<c:if test="${reviewList[0].REVIEW_NO == null}">
        		<div class="reviews-members row" style="margin: 30px 0px 30px 0px;" >
	        		<div style="text-align: center;">
        				<p>등록된 리뷰가 없습니다.</p>
    	   			 </div>
        		</div>
        	</c:if>
			<c:if test="${reviewList[0].REVIEW_NO != null}">
				<c:forEach items="${reviewList}" var="review">
			        <div class="reviews-members row" style="margin: 30px 0px 30px 0px; border-radius: solid 1px #e5e5e5;" >
						<div class="col-1">
							<img alt="Generic placeholder image" src="../../resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 80px; height: 80px;">
							<p style="text-align: center;">
							<c:set var="mem_id_code" value="${review.MEM_ID}" />
							    ${fn:substring(mem_id_code,0,3) }**
							</p>
						</div>
						<div class="col-11">
							<div class="reviews-members-header row" style="padding-right: 0; justify-content: center; align-items: center;">
								<div class="reviews-members-header col-3 row" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
									<h1 id="review_rating" data-review_rating="${review.REVIEW_RATING }" class="col-7">${review.REVIEW_RATING } <span style="font-size: small;">점</span></h1>
									<span class="col-5" style="font-size: small;" >${review.MOVIE_NAME }</span>
								</div>
								<div class="col-7" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
									<p id="review_content">${review.REVIEW_CONTENT}</p>
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
								</div>
							</div>
						</div>
					</div>
	        	</c:forEach>
			</c:if>
<%@ include file="../common/pagination.jsp" %>
		</div>
	</div>
</div>
<script>
let mem_cd = "<%=mem_cd%>";
let searchFormUrl = "/movie/searchReview.do";
$('.reviews-members-body').on('click', '#likeBtn', function(){
	if(mem_cd == null || mem_cd == ""){
		alert("로그인이 필요합니다.");
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

function reviewHeart(review_no){
	if(mem_cd == null || mem_cd == ""){
		alert("로그인이 필요합니다.");
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