<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
<style>
.eventTypeHeader .typeName {
	font-size : 1.5rem;
	font-weight : bold;
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
			<span>전체  ${pageMaker.totalCount}건</span>
			<span>
				<input type="text" placeholder="검색어를 입력해주세요." name="keyword">
				<button type="button" class="bc_dw_black" onclick="javascript:searchList_go(1);">검색</button>
			</span>
		</div>
		<div class="ms-5 me-5 mt-5">
			<table class="table table-border align-middle eventListTable" style="border-top : 1px solid black;">
				<c:forEach items="${eventList }" var="event">
					<tr style="height: 10rem;">
						<td style="width:10%;">
							<div style="width: 6rem; height: 6rem;">
								<img src="/common/getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
							</div>
						</td>
						<td>
							<a href="/sysAdmin/eventAdminDetail?type=read&event_no=${event.event_no }">
								<p><b>[${event.event_div }]</b></p>
								<p style="color: black;"><b>${event.event_title }</b></p>
								<p><fmt:formatDate value="${event.startdate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.enddate }" pattern="yyyy-MM-dd"/></p>
							</a>
						</td>
						<td style="width: 10%;">
							<button type="button" class="${empty event.winnerdate ? 'bc_dw_blue' : 'bc_dw_black' } registWinner" style="font-size: small;" data-no="${event.event_no }" data-type="${empty event.winnerdate ? 'create' : 'read' }">당첨자 발표  ${empty event.winnerdate ? '작성' : '조회' }</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="mt-5 mb-5">
		<%@ include file="../common/pagination.jsp" %>
		</div>
	</div>
</div>
<script>
window.onload = function(){
	let searchFormUrl = "eventAdminPastMain.do";
	$('.registWinner').on('click', function(){
		let event_no = $(this).attr('data-no');
		let type = $(this).attr('data-type');
		location.href="eventAdminWinnerRegistForm.do?event_no="+event_no+"&type="+type;
	});
}	
</script>
<%@ include file="sysAdminFooter.jsp"%>