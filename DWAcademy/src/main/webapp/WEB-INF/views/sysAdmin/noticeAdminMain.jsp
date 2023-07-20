<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
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
</style>

<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
		</jsp:include>
        <div class="board-header">
            <div class="board-nav">
                <ul>
                    <li><a href="#" class="active">전체</a></li>
                    <li><a href="#">DW시네마 공지</a></li>
                    <li><a href="#">지점공지</a></li>
                </ul>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
            </div>
        </div>
        <div class="board-body">
            <div class="tools">
                <div class="search">
                    <input type="text" id="txtSearch" placeholder="검색어를 입력하세요." value="">
                    <button type="button" id="btnSearch"><span class="icon"></span><span class="acchidden">검색</span></button>
                </div>
            </div>
            <ul class="list">
    			<c:if test="${empty noticeList }">
					<li class="dep1">
	                    <div class="leftInfo"><span class="sort"></span></div>
	                    <div class="titInfo" style="padding: 0; text-align: center; ">
	                        <p class="tit"><a href="#"> 게시글이 없습니다.</a></p>
	                    </div>
	                </li>
				</c:if>
            	<c:forEach items="noticeList" var="notice">
	                <li class="dep1">
	                    <div class="leftInfo"><span class="sort">지점공지</span></div>
	                    <div class="titInfo">
	                        <p class="tit"><a href="#"> asd</a><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_new.png" alt="new" class="ico new"></p>
	                    </div>
	                    <div class="etc">
	                        <ul class="clearFix">
	                            <li class="date">
	                                <span class="ico"><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_time.png" alt="time"></span>
	                                <span>41분 전</span>
	                            </li>
	                        </ul>
	                    </div>
	                </li>
            	</c:forEach>
            </ul>
        </div>
	</div>
</div>
<script>

</script>
<%@ include file="sysAdminFooter.jsp"%>