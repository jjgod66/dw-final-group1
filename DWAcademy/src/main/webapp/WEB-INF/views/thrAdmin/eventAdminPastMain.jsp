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
.moreBtn {
	cursor: pointer;
}
.eventListTable tr:nth-child(odd) {
	background-color : #F6F6F6;
}
.eventListTable tr:hover {
	background-color : #EBF5FB;
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
		<div class="d-flex ms-5 me-5" style="justify-content: space-between;">
			<span>전체 <b style="color: red;"> ${pageMaker.totalCount}</b>건</span>
			<span>
				<input type="text" placeholder="검색어를 입력해주세요." name="keyword" style="height:100%;">
				<button type="button" class="bc_dw_black ms-2" onclick="javascript:searchList_go(1);">검색</button>
			</span>
		</div>
		<div class="ms-5 me-5 mt-5">
			<table class="table table-border align-middle eventListTable" style="border-top : 1px solid black;">
				<c:forEach items="${eventList }" var="event">
					<tr class="eventRow" style="height: 10rem;">
						<td style="width:10%;">
							<div style="width: 6rem; height: 6rem;">
								<img src="<%=request.getContextPath() %>/common/getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
							</div>
						</td>
						<td>
							<a href="<%=request.getContextPath() %>/thrAdmin/eventAdminDetail?type=read&event_no=${event.event_no }">
								<p><b>[${event.event_div }]</b></p>
								<p style="color: black;"><b>${event.event_title }</b></p>
								<p><fmt:formatDate value="${event.startdate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.enddate }" pattern="yyyy-MM-dd"/></p>
							</a>
						</td>
						<td style="width: 10%;">
							<button type="button" class=" ${empty event.winnerdate ? 'bc_dw_blue' : 'bc_dw_black' } registWinner" data-no="${event.event_no }" data-type="${empty event.winnerdate ? 'create' : 'read' }">당첨자 발표  ${empty event.winnerdate ? '작성' : '조회' }</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="paginationDiv">
		<%@ include file="../common/pagination.jsp" %>
		</div>
	</div>
</div>
<script>
let searchFormUrl = "eventAdminPastMain.do";
window.onload = function(){
	$('.registWinner').on('click', function(){
		let event_no = $(this).attr('data-no');
		let type = $(this).attr('data-type');
		location.href="eventAdminWinnerRegistForm.do?event_no="+event_no+"&type="+type;
	});
}
</script>
<%@ include file="thrAdminFooter.jsp"%>