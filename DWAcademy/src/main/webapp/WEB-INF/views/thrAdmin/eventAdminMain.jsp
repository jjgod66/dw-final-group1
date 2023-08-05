<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp" %>
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
.moreBtn {
	cursor: pointer;
}
.card img {
	width : 100%;
	height: 15rem;
}
.eventTypeHeader {
	margin-bottom : 1rem;
}
.pagination li a{
	color : black;
}
</style>
<c:set var="cri" value="${pageMaker.cri }" />
<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		<div class="ms-3 me-3">
			<div>
				<div class="mt-3 mb-3" style="display: flex; justify-content: space-between;">
					<span class="ms-3 me-3">전체 <span style="color: red;"><b>${pageMaker.totalCount}</b></span>건</span>
					<span class="ms-3 me-3"><input type="text" style="height:2.5rem;" name="keyword"> <button class="btn_medium ms-2 borderRadius" style="height:2.5rem; background-color: #4aa8d8; border: none;" onclick="javascript:searchList_go(1);">검색</button>  <button class="btn_medium ms-2 borderRadius" id="registBtn" style="height:2.5rem; border:none;">이벤트 등록</button></span>
					
				</div>
				<div>
					<div class="eventCards row gx-3 gy-3">
						<c:forEach items="${eventList}" var="event">
							<div class="col-md-3" style="text-align: -webkit-center;">
								<div class="card text-center h-100" style="width: 18rem;">
									<a href="/thrAdmin/eventAdminDetail?type=read&event_no=${event.event_no }">
										<img src="/common/getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
									</a>
									<div class="card-body">
										<h3 class="card-title">${event.event_title }</h3>
										<p class="card-text"><fmt:formatDate value="${event.startdate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.enddate }" pattern="yyyy-MM-dd"/></p>
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
</div>
<script>
window.onload = function(){
	let searchFormUrl = "eventAdminMain.do";

	$('#registBtn').on('click', function(){
		location.href='eventAdminDetail.do?type=create';
	});
}	
</script>    
<%@ include file="thrAdminFooter.jsp"%>