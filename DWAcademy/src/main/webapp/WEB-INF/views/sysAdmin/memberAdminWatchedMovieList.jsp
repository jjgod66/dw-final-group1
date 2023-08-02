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
							<col class="w100">
							<col>
							<col class="w150">
							<col class="w130">
							<col class="w130">
						</colgroup>
						<tbody>
								<tr>
									<th>결제코드</th>
									<th>영화제목</th>
									<th>관람권</th>
									<th>결제금액</th>
									<th>관람일자</th>
								</tr>
								<c:if test="${empty watchedMovieList }">
									<tr><th scope="row" colspan="5">관람 기록이 없습니다.</th></tr>
								</c:if>								
								<c:forEach items="${watchedMovieList}" var="movie">
								<tr>
									<th scope="row">${movie.MU }</th>
									<td>${movie.MOVIE_NAME }</td>
									<td>${movie.MEMLIST }</td>
									<td><fmt:formatNumber value="${movie.PAID_AMOUNT }" pattern="#,###" />원</td>
									<td><fmt:formatDate value="${movie.STARTDATE }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>