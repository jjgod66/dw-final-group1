<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
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
				    <a class="nav-link active" aria-current="page" href="eventAdminMain.do">전체</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="javascript:searchList_go(1, 'eventAdminTypeMain.do');">영화</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="javascript:searchList_go(1, 'eventAdminTypeMain.do');">극장</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="javascript:searchList_go(1, 'eventAdminTypeMain.do');">시사회/무대인사</a>
				  </li>
				</ul>
				<select name="searchType" style="display : none;">
					<option value="전체" >1</option>
					<option value="영화" >2</option>
					<option value="극장" >3</option>
					<option value="시사회/무대인사" >4</option>
				</select>
			</div>
			<div>
				<div>
					<div class="row mt-2 mb-2"><div class="col-md-2 text-end" style="margin-left: auto;"><button class="btn_medium" id="registBtn">이벤트 등록</button></div></div>
					<div class="eventTypeHeader">
						<span class="typeName">영화</span>
						<span class="float-end moreBtn" data-searchType="영화">더보기 ></span>
					</div>
					<div class="eventCards row">
						<c:forEach items="${movEventList}" var="event">
							<div class="col-md-3">
								<div class="card text-center" style="width: 18rem;">
									<a href="/sysAdmin/eventAdminDetail?type=read&event_no=${event.event_no }">
										<img src="getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
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
				<div>
					<div class="eventTypeHeader">
						<span class="typeName">극장</span>
						<span class="float-end moreBtn" data-searchType="극장">더보기 ></span>
					</div>
					<div class="eventCards row">
						<c:forEach items="${thrEventList}" var="event">
							<div class="col-md-3">
								<div class="card text-center" style="width: 18rem;">
									<a href="/sysAdmin/eventAdminDetail?type=read&event_no=${event.event_no }">
										<img src="getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
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
				<div>
					<div class="eventTypeHeader">
						<span class="typeName">시사회/무대인사</span>
						<span class="float-end moreBtn" data-searchType="시사회/무대인사">더보기 ></span>
					</div>
					<div class="eventCards row">
						<c:forEach items="${actorEventList}" var="event">
							<div class="col-md-3">
								<div class="card text-center" style="width: 18rem;">
									<a href="/sysAdmin/eventAdminDetail?type=read&event_no=${event.event_no }">
										<img src="getPicture.do?name=${event.event_thum_path }&item_cd=${event.event_no}&type=eventThumb" class="card-img-top" alt="...">
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
	let searchFormUrl = "eventAdminTypeMain.do";
	$('.searchTypeList a').on('click', function(){
		let searchType = $(this).html();
		$('select[name="searchType"] option[value="'+ searchType +'"]').prop('selected', true);
		$('input[name="keyword"]').val('');
	});
	$('.moreBtn').on('click', function(){
		let searchType = $(this).attr('data-searchType');
		$('select[name="searchType"] option[value="'+ searchType +'"]').prop('selected', true);
		$('input[name="keyword"]').val('');
		searchList_go(1, 'eventAdminTypeMain.do');
	});
	$('#registBtn').on('click', function(){
		location.href='eventAdminDetail.do?type=create';
	});
</script>    
<%@ include file="sysAdminFooter.jsp"%>