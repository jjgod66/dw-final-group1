<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/review.css">
<script src="https://www.gstatic.com/charts/loader.js"></script>
<div class="sub_visual">
    <h3>영화리뷰</h3>
    <h6>Movie Review</h6>
</div>
<div class="bg-white rounded shadow-sm p-4 mb-4 restaurant-detailed-ratings-and-reviews">
	<div class="container">
		<a href="#" class="btn btn-outline-primary btn-sm float-end">Top Rated</a>
		<h5 class="mb-1">All Ratings and Reviews</h5>
		<c:forEach items="${reviewList }" var="review">
		<div class="reviews-members pt-4 pb-4">
			<div class="card">
<!-- 				<div><img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar1.png" class="mr-3 rounded-pill"></div> -->
				<div class="card-body">
					<div class="reviews-members-header">
						<h6 class="mb-1"><a class="text-black" href="#">
						</a></h6>
					<div class="reviews-members-body">
						<p>${review.MEM_ID}</p>
						<p>${review.MOVIE_NAME}</p>
						<p>${review.REVIEW_RATING}</p>
						<p>${review.REVIEW_CONTENT}</p>
					</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>