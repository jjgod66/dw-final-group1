<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/member_header.jsp" %>
<style>
.content {
	padding: 15px 0;
}
h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #503396;
    line-height: 1.1;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #503396;
    width: 3px;
    height: 3px;
}
.board-list-search {
    padding: 20px 40px;
    background-color: #f2f4f5;
}
}
.board-list-search table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}
.board-list-search table tbody tr td,
.board-list-search table tbody tr th {
    padding: 2px 0;
    text-align: left;
}
.board-list-search table tbody tr td .btn-period {
    display: inline-block;
}
.board-list-search table tbody tr td .btn-period:after {
    content: '';
    clear: both;
    display: block;
}
.board-list-search button.btn {
    width: 60px;
    height: 36px;
    margin: 0;
    padding: 0;
    float: left;
    color: #666;
    border: 1px solid #ccc;
    box-sizing: border-box;
    border-width: 1px 0 1px 1px;
    background-color: #fff;
    border-radius: 0;
}
.board-list-search button.btn.on {
    color: #01738b;
    font-weight: 400;
}
.board-list-search button.btn:first-child {
    border-radius: 5px 0 0 5px;
}
.board-list-search button.btn:last-child {
    border-radius: 0 5px 5px 0;
    border-right: 1px solid #ccc;
}
.board-list-search .date {
    display: inline-block;
    vertical-align: top;
    padding: 0 0 0 5px;
}
.date-calendar {
    display: inline-block;
    width: 118px;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    border-radius: 0!important;
    border: 1px solid #d8d9db;
    border-width: 1px 0 1px 1px;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
.ui-datepicker-trigger {
    width: 32px;
    height: 32px;
    margin: 0;
    padding: 0;
    border: 1px solid #d8d9db;
    border-width: 1px 1px 1px 0;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-calendar.png) no-repeat center;
}
.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #503396;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}
.board-list-search .date .button {
    min-width: 0;
    padding: 0 10px;
    border-color: #ccc;
}
.button.gray-line {
    color: #444;
    line-height: 36px;
    border: 1px solid #c1c1c1;
    background-color: #fff;
}
.board-list-util {
    margin: 30px 0 15px 0;
    text-align: right;
}
.board-list-util:after,
.board-list-util:before {
    content: '';
    display: table;
}
.board-list-util:after {
    clear: both;
}
.board-list-util .result-count {
    position: relative;
    float: left;
    margin: 0;
    padding-top: 15px;
    line-height: 1.1;
    vertical-align: top;
}
.board-list-util .result-count b {
    color: #01738b;
}
.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}
.board-list {
	width: 100%;
    line-height: 1.3;
}
.board-list>thead>tr>th {
    height: 45px;
    padding: 3px 10px;
    color: #222;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    background-color: #f2f4f5;
}
.board-list>tbody>tr>td,
.board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
}
.mypage-infomation .btn-group {
    position: absolute;
    top: 0;
    right: 0;
    padding: 0;
    margin: 0;
}
.btn-group:after, .btn-group:before {
    content: '';
    display: table;
}
*, ::after, ::before {
    box-sizing: border-box;
}
.mypage-infomation {
    position: relative;
    min-height: 36px;
    margin-top: 20px;
    padding-bottom: 10px;
}
</style>
<%@include file="giftCard_modal.jsp" %>
<div class="content">
	<h2 class="tit">포인트 이용내역</h2>
	<div class="mypage-infomation mt20">
		<ul class="dot-list mb20">
					<li>하단 내역은 상영일 및 구매일 기준이며, 해당일 익일(+1) 에 사용 가능 포인트로 전환됩니다.</li>
			<!-- 		<li>적립 예정 포인트는 사용 가능포인트에 포함되지 않으며, 환불 또는 거래 취소가 될 경우 내역에서 삭제됩니다.</li> -->
		</ul>
		<div class="btn-group right">
			<button class="button" id="giftCardRegBtn" title="기프트카드 등록">기프트카드 등록</button>
		</div>
	</div>
	<div class="board-list-search mt-4">
		<table>
			<colgroup>
				<col style="width:75px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">조회기간</th>
					<td>
<!-- 						<div class="btn-period"> -->
<!-- 							<button type="button" class="btn on" value="D7">1주일</button> -->
<!-- 							<button type="button" class="btn" value="M1">1개월</button> -->
<!-- 							<button type="button" class="btn" value="M3">3개월</button> -->
<!-- 							<button type="button" class="btn" value="M6">6개월</button> -->
<!-- 						</div> -->

						<div class="date">
<!-- 							<input type="text" title="조회기간 시작 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar"><button type="button" class="ui-datepicker-trigger">날짜 선택</button> -->
							<input type="date" title="조회기간 시작 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar" name="searchType" style="width: 150px;" id="startdate" value="${pageMaker.cri.searchType }">
							<span>~</span>
<!-- 							<input type="text" title="조회기간 마지막 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar"><button type="button" class="ui-datepicker-trigger">날짜 선택</button> -->
							<input type="date" title="조회기간 마지막 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar" name="searchType2" style="width: 150px;" id="enddate"  value="${pageMaker.cri.searchType2 }">
							<button type="button" class="button gray-line" name="search" onclick="pointSearchList_go(1)"><i class="iconset ico-search-gray"></i> 조회</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="board-list-util">
		<p class="result-count"><strong>전체 <b>${pageMaker.totalCount }</b> 건</strong></p>
	</div>
	<div class="table-wrap">
		<table class="board-list">
			<caption>일자, 구분, 내용, 극장, 포인트 항목을 가진 포인트 이용내역 목록 표</caption>
			<colgroup>
				<col style="width:120px;">
				<col style="width:200px;">
				<col>
<!-- 				<col style="width:150px;"> -->
				<col style="width:110px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" style="text-align: center;">일자</th>
					<th scope="col" style="text-align: center;">구분</th>
					<th scope="col" style="text-align: center;">내용</th>
<!-- 					<th scope="col">지점</th> -->
					<th scope="col" style="text-align: center;">포인트</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${pointList }" var="point">
				<tr>
					<td><fmt:formatDate value="${point.REGDATE }" pattern="yyyy-MM-dd"/> </td>
					<td>
						<c:set var="point_cd" value="${point.POINT_CD}" />
						<c:set var="point_type" value="${fn:substring(point_cd,0,1) }" />
						<c:if test="${point_type eq 'A' }">적립</c:if>
						<c:if test="${point_type eq 'U' }">사용</c:if>
					</td>
					<td>
						${point.POINT_NAME }
					</td>
					
					<c:if test="${point_type eq 'A' }">
						<td style="color:green;">
							+<fmt:formatNumber value="${point.POINT}" pattern="#,###"/> 
						</td>
					</c:if>
					<c:if test="${point_type eq 'U' }">
						<td style="color:red;">
							-<fmt:formatNumber value="${point.POINT}" pattern="#,###"/> 
						</td>
					</c:if>
				</tr>
			</c:forEach>
			
			<c:if test="${empty pointList }">
				<tr><td colspan="5" class="a-c">조회된 내역이 없습니다</td></tr>
			</c:if>
			</tbody>
		</table>
	</div>
	<c:if test="${!empty pointList }">
		<div class="mt-5 mb-5 paginationdiv">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</c:if>
	<c:if test="${empty pointList }">
		<div class="mt-5 mb-5 paginationdiv" style="display: none;">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</c:if>
</div>
<form id="pointSearchForm">
	<input type="hidden" name="page">
	<input type="hidden" name="perPageNum">
	<input type="hidden" name="searchType">
	<input type="hidden" name="searchType2">
</form>
<script>
	let searchFormUrl = '<%=request.getContextPath()%>/member/point-list.do';
	
	$(function(){
		$('#giftCardRegBtn').on('click', function(){
			$('#giftCard-modal').modal('show');
		});
	})
function pointSearchList_go(page, url) {
		if (page < 1) {
			return;
		}
		
		let perPageNum = 10;
		if ($('select[name="perPageNum"]').val()) {
			perPageNum = $('select[name="perPageNum"]').val();
		}
		let searchForm = $('#pointSearchForm');
		searchForm.find('[name="page"]').val(page);
		searchForm.find('[name="perPageNum"]').val(perPageNum);
		searchForm.find('[name="searchType"]').val($('input[name="searchType"]').val());
		searchForm.find('[name="searchType2"]').val($('input[name="searchType2"]').val());
		searchForm.attr("method", "post");
		if (url) {
			searchForm.attr("action", url);
		} else {
			searchForm.attr("action", searchFormUrl);
		}
		searchForm.submit();
	}	
</script>
<%@ include file="../include/member_footer.jsp" %>