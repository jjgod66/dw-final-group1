<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
<c:set var="cri" value="${pageMaker.cri }" />
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
.btn_ssmall, .btn_small, .btn_lsmall, .btn_medium, .btn_large {
    background: #333;
    border: 1px solid #333;
    color: #fff !important;
}
.btn_medium {
    padding: 8px 15px;
    font-size: 13px;
    line-height: 1.444;
    font-weight: 600;
}
.eventTypeHeader .typeName {
	font-size : 1.5rem;
	font-weight : bold;
}
</style>
<c:set var="cri" value="${pageMaker.cri }" />
<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
		</jsp:include>
		<div>
			<ul class="nav nav-tabs nav-fill">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="eventAdminMain.do">전체</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="eventAdminTypeMain.do?">영화</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="eventAdminTypeMain.do">극장</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="eventAdminTypeMain.do">시사회/무대인사</a>
			  </li>
			</ul>
		</div>
		<div>
			<div style="display: flex; justify-content: space-between;">
				<span class="ms-3 me-3">전체 ${pageMaker.totalCount}건</span>
				<span class="ms-3 me-3"><input type="text"><button>검색</button></span>
			</div>
			<div>
				<div class="eventCards row mt-5 ms-3 ml-3">
					<c:forEach items="${eventList}" var="event">
						<div class="col-md-3">
							<div class="card" style="width: 18rem;">
								<img src="..." class="card-img-top" alt="...">
								<div class="card-body">
									<h5 class="card-title">${event.event_title }</h5>
									<p class="card-text">${event.event_content }</p>
									<a href="#" class="btn btn-primary">Go somewhere</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-5 mb-5" style="display: none;">
		<%@ include file="../common/pagination.jsp" %>
	</div>
</div>
    
<script>
	if ($('select[name="searchType"]').length == 0 ) {
	console.log('test');
	} else {
		console.log('test!');
	}
	let searchFormUrl = "eventAdminTypeMain.do";
</script>   
<%@ include file="sysAdminFooter.jsp"%>