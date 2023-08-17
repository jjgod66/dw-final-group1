<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dwcinema.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">




<style>

.tablef th {
	text-align : center;
}
.tablef td {
	text-align : center;
}
.imgDiv {
	width: 80px;
	height: 80px;
	border-radius : 70%;
	overflow: hidden;
}
.profileImg {
	width : 100%;
	height : 100%;
	object-fit : cover;
}
.moreBtn {
	cursor: pointer;
}
.deleteBtn {
 	cursor: pointer; 
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="content">
			<jsp:include page="admin_contentHeader.jsp">
				<jsp:param value="${subject }" name="subject" />
				<jsp:param value="${item1 }" name="item1" />
				<jsp:param value="${item2 }" name="item2" />
				<jsp:param value="${url }" name="url" />
			</jsp:include>
			<div class="tbl_frm01 row mt-3">
				<div class="col-md-12">
					<h3></h3>
					<table class="tablef table table-striped">
						<colgroup>
							<col>
							<col class="w150">
							<col class="w50">
							<col class="w80">
							<col class="w80">
							<col class="w130">
							<col class="w130">
							<col class="w30">
						</colgroup>
						<tbody>
								<tr>
									<th>영화제목</th>
									<th>내용</th>
									<th>평점</th>
									<th>공감수</th>
									<th>신고수</th>
									<th>작성일자</th>
									<th>삭제여부</th>
									<th></th>
								</tr>
								<c:if test="${empty reviewList }">
									<tr><th scope="row" colspan="3">작성 글이 없습니다.</th></tr>
								</c:if>								
								<c:forEach items="${reviewList}" var="review">
								<tr>
									<th scope="row">${review.MOVIE_NAME }</th>
									<td><div style="width: 400px; margin: auto; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${review.REVIEW_CONTENT }</div></td>
									<td><span class="badge" style="background-color : #4aa8d8;">${review.REVIEW_RATING }</span></td>
									<td><b>${review.LIKECNT }</b></td>
									<td><b style="color : red;">${review.REPORTCNT }</b></td>
									<td><fmt:formatDate value="${review.REGDATE }" pattern="yyyy-MM-dd"/></td>
									<td>${review.GB_DEL }</td>
									<td class="deleteBtn" style="color: red;">
									<c:if test="${review.GB_DEL eq 'N' }">
										<i class="bi bi-x-octagon-fill"></i><input type="hidden" name="review_no" value="${review.REVIEW_NO }">
									</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
$('.deleteBtn').on('click', function(){
	if (confirm('해당 관람평을 정말 삭제하시겠습니까?')) {
		let review_no = $(this).find('input[name="review_no"]').val();
		location.href="<%=request.getContextPath()%>/sysAdmin/deleteReview.do?review_no=" + review_no;
	}
});
</script>
</html>