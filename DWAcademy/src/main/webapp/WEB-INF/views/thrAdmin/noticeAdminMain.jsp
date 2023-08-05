<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<style>
.list li:nth-child(odd) {
	background: #fbfbfb;
}
.board-body .list .dep1:hover {
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
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
		        <div class="board-header">
		            <div class="board-nav">
		            	<div style="height:76px;"></div>
		                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
		            </div>
		        </div>
		        <div class="board-body">
		            <div class="tools">
		                <div class="search">
		                    <input type="text" id="keyword" class="borderLeftRadius" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }" style="bord">
		                    <button type="button" class="btn_medium borderRightRadius" id="btnSearch" onclick="javascript:searchList_go(1);"><i class="bi bi-search"></i></button>
		                </div>
		                <button type="button" id="registBtn" class="btn_medium borderRadius" style="height: 42px; background-color: #4aa8d8; color: white; border: 1px solid #4aa8d8;">등록</button>
		            </div>
		            <ul class="list">
		    			<c:if test="${empty noticeList }">
							<li class="dep1" style="min-height: 30px;">
			                    <div class="leftInfo"><span class="sort"></span></div>
			                    <div class="titInfo" style="padding: 0; text-align: center; ">
			                        <p class="tit" style="margin-bottom : 0;"><a href="#"> <b>게시글이 없습니다.</b></a></p>
			                    </div>
			                </li>
						</c:if>
		            	<c:forEach items="${ noticeList}" var="notice">
			                <li class="dep1">
			                    <div class="leftInfo"><span class="sort">${notice.notice_thr }</span></div>
			                    <div class="titInfo">
			                        <p class="tit"><a href="noticeAdminDetail.do?notice_no=${notice.notice_no }&type=read"><b>${notice.notice_title }</b></a></p>
			                    </div>
			                    <div class="etc">
			                        <ul class="clearFix">
			                            <li class="date" style="background-color: inherit;">
			                                <span class="ico"><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_time.png" alt="time"></span>
			                                <span><fmt:formatDate value='${notice.regdate}' pattern='yyyy-MM-dd'/></span>
			                            </li>
			                        </ul>
			                    </div>
			                </li>
		            	</c:forEach>
		            </ul>
		        </div>
	        </div>
	        <div class="col-md-1"></div>
        </div>
		<div class="paginationDiv">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</div>
</div>
<script>
	let searchFormUrl = "noticeAdminMain.do";
window.onload = function(){
	$('#registBtn').on('click', function(){
		location.href='noticeAdminDetail.do?type=create';
	});
}	
</script>
<%@ include file="thrAdminFooter.jsp"%>