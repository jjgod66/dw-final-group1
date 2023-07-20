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
</style>
<c:set var="cri" value="${pageMaker.cri }" />
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
                    <li><a href="#" class="${cri.searchType eq 'all' ? 'active' : '' }" id="all">전체</a></li>
                    <li><a href="#" id="dwc" class="${cri.searchType eq 'dwc' ? 'active' : '' }">DW시네마 공지</a></li>
                    <li><a href="#" id="thr" class="${cri.searchType eq 'thr' ? 'active' : '' }">지점공지</a></li>
                </ul>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                <select style="display: none;" id="searchType" name="searchType">
                	<option value="all" ${cri.searchType eq 'all' ? 'selected' : '' }>all</option>
                	<option value="dwc" ${cri.searchType eq 'dwc' ? 'selected' : '' }>dwc</option>
                	<option value="thr" ${cri.searchType eq 'thr' ? 'selected' : '' }>thr</option>
                </select>
            </div>
        </div>
        <div class="board-body">
            <div class="tools">
                <div class="search">
                    <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }">
                    <button type="button" id="btnSearch" onclick="javascript:searchList_go(1);"><span class="icon"></span><span class="acchidden">검색</span></button>
                </div>
                <button type="button" id="registBtn">등록</button>
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
            	<c:forEach items="${ noticeList}" var="notice">
	                <li class="dep1">
	                    <div class="leftInfo"><span class="sort">${notice.notice_thr }</span></div>
	                    <div class="titInfo">
	                        <p class="tit"><a href="noticeAdminDetail.do?notice_no=${notice.notice_no }&type=read">${notice.notice_title }</a><img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_new.png" alt="new" class="ico new"></p>
	                    </div>
	                    <div class="etc">
	                    <div class="rightInfo">
	                    	<p>${notice.gb_del }</p>
	                    </div>
	                        <ul class="clearFix">
	                            <li class="date">
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
	<div class="mt-5 mb-5">
		<%@ include file="../common/pagination.jsp" %>
	</div>
</div>
<script>
	let searchFormUrl = "noticeAdminMain.do";
	$(function(){
		$('#all').on('click', function(){
			$('select[name="searchType"] option:eq(0)').prop('selected', true);
			$('input[name="keyword"]').val('');
			searchList_go(1);
		});
		$('#dwc').on('click', function(){
			$('select[name="searchType"] option:eq(1)').prop('selected', true);
			$('input[name="keyword"]').val('');
			searchList_go(1);
		});
		$('#thr').on('click', function(){
			$('select[name="searchType"] option:eq(2)').prop('selected', true);
			$('input[name="keyword"]').val('');
			searchList_go(1);
		});
		$('#registBtn').on('click', function(){
			location.href='noticeAdminDetail.do?type=create';
		});
	});
	
</script>
<%@ include file="sysAdminFooter.jsp"%>