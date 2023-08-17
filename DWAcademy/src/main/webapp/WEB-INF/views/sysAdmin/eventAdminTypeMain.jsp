<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
<c:set var="cri" value="${pageMaker.cri }" />
<style>
.card img {
	width : 100%;
	height: 15rem;
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
				<ul class="nav nav-tabs nav-fill searchTypeList">
				  <li class="nav-item">
				    <a class="nav-link" aria-current="page" href="eventAdminMain.do">전체</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link ${cri.searchType eq '영화' ? 'active' : ''}" href="javascript:searchList_go(1);">영화</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link ${cri.searchType eq '극장' ? 'active' : ''}" href="javascript:searchList_go(1);">극장</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link ${cri.searchType eq '시사회/무대인사' ? 'active' : ''}" href="javascript:searchList_go(1);">시사회/무대인사</a>
				  </li>
				</ul>
				<select name="searchType" style="display : none;">
					<option value="전체" >1</option>
					<option value="영화" ${cri.searchType eq '영화' ? 'selected' : ''}>2</option>
					<option value="극장" ${cri.searchType eq '극장' ? 'selected' : ''}>3</option>
					<option value="시사회/무대인사" ${cri.searchType eq '시사회/무대인사' ? 'selected' : ''}>4</option>
				</select>
			</div>
			<div>
				<div class="mt-3 mb-3" style="display: flex; justify-content: space-between;">
					<span class="ms-3 me-3">전체 <span style="color: red;"><b>${pageMaker.totalCount}</b></span>건</span>
					<span class="ms-3 me-3"><input type="text"  style="height:2.5rem;" name="keyword"><button class="bc_dw_black ms-2" onclick="javascript:searchList_go(1);">검색</button></span>
				</div>
				<div>
					<div class="eventCards row gx-3 gy-3">
						<c:forEach items="${eventList}" var="event">
							<div class="col-md-3" style="text-align: -webkit-center;">
								<div class="card text-center h-100" style="width: 18rem;">
									<a href="<%=request.getContextPath()%>/sysAdmin/eventAdminDetail.do?type=read&event_no=${event.event_no }">
										<img src="<%=request.getContextPath()%>/common/getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
									</a>
									<div class="card-body">
										<h3 class="card-title">${event.event_title }</h3>
										<p class="card-text"><fmt:formatDate value="${event.startdate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.enddate }" pattern="yyyy-MM-dd"/></p>
	<!-- 									<a href="#" class="btn btn-primary">Go somewhere</a> -->
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-5 mb-5" style="display: none;">
		<%@ include file="../common/pagination.jsp" %>
	</div>
</div>
    
<script>
let searchFormUrl = "eventAdminTypeMain.do";
window.onload = function(){
	
	$('.searchTypeList a').on('click', function(){
		let searchType = $(this).html();
		$('select[name="searchType"] option[value="'+ searchType +'"]').prop('selected', true);
		$('input[name="keyword"]').val('');
	});
}	
</script>   
<%@ include file="sysAdminFooter.jsp"%>