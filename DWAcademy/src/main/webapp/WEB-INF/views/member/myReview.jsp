<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/member_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/review.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/viewer.css">
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<style>
.movie-sorting{
	float: left;
    padding: 0 0 0 0;
}
.on {
    color: #222;
    font-weight: 700;
}
.input-text{
	position: relative;
    float: right;
    height: 36px;
    margin: 0;
    padding: 0 15px 0 15px;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.movie-search{
	position: relative;
    float: right;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.btn-search-input{
	position: absolute;
    right: 1px;
    top: 1px;
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
</style>
<%@ include file="../movie/review_delete_modal.jsp" %>
<%@ include file="reviewUpdate_modal.jsp" %>
<c:set var="cri" value="${pageMaker.cri }"/>
<div class="container" style="margin-top: 10px;">
	<div class="row" style="width:100%;">
		<div class="tab-block tab-layer">
			<ul>
				<a href="<%=request.getContextPath()%>/member/movieTimeLine.do" class="" ><li>무비타임라인</li></a>
				<a href="<%=request.getContextPath()%>/member/myMoviepost.do" class=""><li>무비포스트</li></a>
				<a href="<%=request.getContextPath()%>/member/myReview.do" class="on"><li>리뷰</li></a>
				<a href="<%=request.getContextPath()%>/member/myLikeMovie.do" class=""><li>좋아요</li></a>
			</ul>
		</div>
	</div>
	<div class="row">
		<p style="float:left;">
		<strong>총 <b class="font-gblue" id="myMoviePostCnt">${fn:length(myReivewList)}</b> 건</strong>
		</p>
		<div style="float: right;">
			<div class="movie-sorting" style="margin: 10px;">
				<button type="button" id="newest" class="">최신순</button>
				<button type="button" id="likest"class="">공감순</button>
			</div>
			<div class="movie-search">
				<select name="searchType" id="searchType">
					<option value="movieName" ${cri.searchType eq 'movieName' ? 'selected' : '' }>영화</option>
					<option value="reviewContent" ${cri.searchType eq 'reviewContent' ? 'selected' : '' }>내용</option>
				</select>
				<input type="text" title="검색할 내용을 입력해 주세요." placeholder="검색할 내용을 입력해 주세요." name="keyword"
					class="input-text" id="search" value="${cri.keyword }">
				<button type="button" class="btn-search-input" id="searchReviewBtn" onclick="searchList_go(1);">검색</button>
			</div>
		</div>
	</div>
		<c:if test="${empty myReivewList}">
        		<div class="reviews-members row" style="margin: 30px 0px 30px 0px;" >
	        		<div style="text-align: center;">
        				<p>등록된 리뷰가 없습니다.</p>
    	   			 </div>
        		</div>
      	</c:if>
	<c:forEach items="${myReivewList}" var="mr">
        <div class="row" style="margin: 30px 0px 30px 0px; border-radius: solid 1px #e5e5e5;" >
			<div class="col-2">
				<c:if test="${mr.MEM_PIC_PATH != null}">
					<img alt="Generic placeholder image" src="<%=request.getContextPath() %>/common/getPicture.do?name=${mr.MEM_PIC_PATH}&item_cd=${mr.MEM_CD}&type=memberPic" class="rounded-pill" style="width: 80px; height: 80px; display:flex; align-items: center;">
				</c:if>
				<c:if test="${mr.MEM_PIC_PATH == null}">
					<img alt="Generic placeholder image" src="../../resources/img/defaultprofile.png" class="rounded-pill" style="width: 80px; height: 80px;">
				</c:if>
				<p style="text-align: center;">
				<c:set var="mem_id_code" value="${mr.MEM_ID}" />
				    ${fn:substring(mem_id_code,0,3) }**
				</p>
			</div>
			<div class="col-10 reviewCard">
				<div class="card-body row" style="padding-right: 0;">
					<div class="reviews-members-header row" style="padding-right: 0; justify-content: center; align-items: center;">
						<div class="reviews-members-header col-2" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
							<h3 id="review_rating" data-review_rating="${mr.REVIEW_RATING }" class="col-11">${mr.REVIEW_RATING } <span style="font-size: small;">점</span></h3>
						</div>
						<div class="col-7" style="padding : 10px 30px; border-right: solid 1px #e5e5e5;">
							<span class="" style="font-size: small;" id="movieName">${mr.MOVIE_NAME }</span>
							<p id="review_content" style="margin-top: 10px;">${mr.REVIEW_CONTENT}</p>
							<p style="font-size: small; color: gray;"><fmt:formatDate value="${mr.REGDATE }" pattern="yyyy-MM-dd HH:mm"/></p>
						</div>
						<div class="reviews-members-body col-3" style="padding : 20px 0px; display: flex; justify-content: center;">
							<i class="fa-regular fa-thumbs-up">&nbsp;<span class="${mr.REVIEW_NO }">${mr.REVIEWLIKE }</span></i>
							<c:if test="${mr.MEM_CD == mr.MEM_CD }">
							<div class="w20 reUD col-6" style="text-align: right; padding: 0;">
								<a href="javascript:void(0)" style="color: black; text-align: center; display: inline; margin-right: 10px;" id="reviewUpdateBtn" data-review_no="${mr.REVIEW_NO }">
									수정
								</a>
								<a href="javascript:void(0)" style="color: black; text-align: center; display: inline; margin-right: 10px;" id="reviewDeleteBtn" data-review_no="${mr.REVIEW_NO }">
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
   	<div class="mt-5 mb-5 paginationdiv">
	<%@ include file="../common/pagination.jsp" %>
	</div>
</div>
<script>
$('#newest').on('click', function(){
	let posts = $('.post').toArray();
	
	// timestamp를 기준으로 내림차순 정렬
	posts.sort(function(a ,b){
		let timestampA = new Date($(a).find('#mpCard').data('timestamp'));
		let timestampB = new Date($(b).find('#mpCard').data('timestamp'));
		return timestampB - timestampA;
	});
	
	// 정렬된 요소를 부모 요소에 추가
	let container = $('.col-3.post').parent();
	container.empty
	posts.forEach(function(post){
		container.append(post);
	});
});

$('#likest').on('click', function(){
	let posts = $('.post').toArray();
	
	// 공감 수를 기준으로 내림차순 정렬
	posts.sort(function(a ,b){
		let likeCntA = new Date($(a).find('.fa-thumbs-up span').text());
		let likeCntB = new Date($(b).find('.fa-thumbs-up span').text());
		return likeCntB - likeCntA;
	});
	
	// 정렬된 요소를 부모 요소에 추가
	let container = $('.col-3.post').parent();
	container.empty
	posts.forEach(function(post){
		container.append(post);
	});
});
let searchFormUrl = "searchMyReview.do";

$('.container').on('click', '#reviewDeleteBtn', function(){
	let review_no = $(this).data('review_no');
	$('#reviewDelReplyNo').val(review_no);
	$('#review-delete-modal').modal('show');
})

$('.container').on('click', '#reviewUpdateBtn', function(){
	let review_content = $(this).parents('.reviewCard').find('#review_content').text();
	let review_rating = $(this).parents('.reviewCard').find('#review_rating').data("review_rating");
	let mn = $(this).parents('.reviewCard').find('#movieName').text();
	$('#reviewtext').text(review_content);
	$('#reviewMovieName').text('영화 "' + mn + '"')
	$('fieldset#rate').find('input[name="rating"][value=' + review_rating + ']').prop('checked', 'checked');
	$('#writecount').text(review_content.length);
	$('#updDiv').css('display', '');
	$('#regDiv').css('display', 'none');
	$('#reviewUpdate_modal').find('input[name="review_no"]').val($(this).data('review_no'));
	console.log($(this).data('review_no'));
	
	$('#reviewUpdate_modal').modal("show");
	
})
</script>
<%@ include file="../include/member_footer.jsp"%>