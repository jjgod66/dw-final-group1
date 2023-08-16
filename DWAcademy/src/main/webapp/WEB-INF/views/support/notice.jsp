<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body{font-family: 'IBM Plex Sans KR', sans-serif; background:#f8f9fa;}
 #wrapper {
 min-height:700px;
 margin-left:auto;
 margin-right:auto;
    width: 70%;
}

</style>

<div class="sub_visual">
    <h3>공지사항</h3>
    <h6>support notice</h6>
</div>
<%@ include file="sideMenu.jsp" %>
<div id="wrapper">



<%@ include file="noticeMini.jsp" %>

<c:if test="${empty noticeList }">
	<div class="mb-5 paginationdiv" style="display: none;">
		<%@ include file="../common/pagination.jsp" %>
	</div>
</c:if>
<c:if test="${!empty noticeList }">
	<div class="mb-5 paginationdiv">
		<%@ include file="../common/pagination.jsp" %>
	</div>
</c:if>
</div>
<%@ include file="../include/footer.jsp" %>