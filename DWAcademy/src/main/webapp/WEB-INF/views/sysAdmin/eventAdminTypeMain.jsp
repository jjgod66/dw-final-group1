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
				<div style="display: flex; justify-content: space-between;">
					<span class="ms-3 me-3">전체 ${pageMaker.totalCount}건</span>
					<span class="ms-3 me-3"><input type="text" name="keyword"><button class="btn_medium" onclick="javascript:searchList_go(1);">검색</button></span>
				</div>
				<div>
					<div class="eventCards row gx-3 gy-3">
						<c:forEach items="${eventList}" var="event">
							<div class="col-md-3" style="text-align: -webkit-center;">
								<div class="card text-center" style="width: 18rem;">
									<a href="/sysAdmin/eventAdminDetail?type=read&event_no=${event.event_no }">
										<img src="getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
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
	
	$('.searchTypeList a').on('click', function(){
		let searchType = $(this).html();
		$('select[name="searchType"] option[value="'+ searchType +'"]').prop('selected', true);
		$('input[name="keyword"]').val('');
	});
</script>   
<%@ include file="sysAdminFooter.jsp"%>