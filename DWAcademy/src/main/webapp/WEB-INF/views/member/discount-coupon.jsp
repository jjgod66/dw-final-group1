<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/member_header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
.mypage-infomation {
    position: relative;
    min-height: 36px;
    padding-bottom: 10px;
    margin-bottom: 30px;
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
.dot-list>li+li {
    margin-top: 2px;
}
.dot-list>li>ul {
    padding-top: 5px;
}
.mypage-infomation .btn-group {
    position: absolute;
    top: 0;
    right: 0;
    padding: 0;
    margin: 0;
}
.btn-group:after,
.btn-group:before {
    content: '';
    display: table;
}
.btn-group:after {
    clear: both;
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
.board-list-util {
    position: relative;
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
.cont {
    display: block;
    margin: 0;
    padding: 20px;
}
.content {
	min-height:900px;
	padding: 20px 0;
}
</style>
<div class="content">
	<h2 class="tit">보유 쿠폰 내역</h2>
	<div class="mypage-infomation mb30">
		<ul class="dot-list">
			<li>보유하신 쿠폰 내역입니다.</li>
			<li>각 쿠폰 별 사용 방법이 다르니 사용 전 상세 쿠폰정보를 확인바랍니다.</li>
		</ul>
	</div>
	<div class="board-list-util por">
		<p class="result-count">
	 		총 <b class="font-gblue">${totalCount}</b>매
		</p>
	</div>
	<div class="table-wrap mt10">
		<table class="board-list" summary="취소일시, 영화명, 극장, 상영일시, 취소금액 항목을 가진 취소내역 목록 표">
			<caption>취소일시, 영화명, 극장, 상영일시, 취소금액 항목을 가진 취소내역 목록 표</caption>
			<colgroup>
				<col style="width:15%;">
				<col>
				<col style="width:30%;">
				<col style="width:15%;">
			</colgroup>
			<thead>
			<tr>
				<th style="text-align: center;" scope="col">번호</th>
				<th style="text-align: center;" scope="col">쿠폰명</th>
				<th style="text-align: center;" scope="col">할인금액(할인율)</th>
				<th style="text-align: center;" scope="col">유효기간</th>
				<th style="text-align: center;" scope="col">사용상태</th>
			</tr>
			</thead>
			<c:if test="${empty couponList}">
				<tr><td colspan="5">보유 쿠폰내역이 없습니다.</td></tr>
			</c:if>
		<c:forEach items="${couponList}" var="coupon">
			<tbody>
				<c:if test="${empty couponList}">
					<tr><td colspan="5" class="a-c">취소내역이 없습니다.</td></tr>
				</c:if>
				<tr>
					<td>${coupon.ROWNUM}</td>
					<td>${coupon.COUPON_NAME}</td>
					<td>${coupon.DISCOUNT}</td>
					<td><fmt:formatDate value="${coupon.ENDDATE}" type="both"/>까지</td>
					<td>${coupon.GB_USE eq 'N' ? '사용가능' : '사용완료'}</td>
				</tr>
			</tbody>
		</c:forEach>
		</table>
	</div>
	<c:if test="${!empty couponList }">
		<div class="mt-5 mb-5 paginationdiv">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</c:if>
	<c:if test="${empty couponList }">
		<div class="mt-5 mb-5 paginationdiv" style="display: none;">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</c:if>
	<div class="cont">
		<ul class="dot-list">
			<li>등록하신 쿠폰은 영화 예매 시 결제수단 &gt; 포인트/할인쿠폰 &gt; 할인쿠폰에서 사용 가능합니다.</li>
			<li>매점 전용 쿠폰은 모바일앱을 통해 쿠폰을 매점에 제시 후 사용 가능합니다.</li>
			<li>온라인 전용으로 발행된 쿠폰의 경우에는 현장 사용이 불가능합니다.</li>
			<li>취소 시 현금 환불은 되지 않으며, 기존 쿠폰으로 유효기간 중에 재사용 하실 수 있습니다.</li>
			<li>기타 할인쿠폰에 대한 문의사항이 있으실 경우,  042-257-8349 또는 홈페이지를 이용해 주시기 바랍니다.</li>
		</ul>
	</div>
</div>
<script>
	let searchFormUrl = "<%=request.getContextPath()%>/member/discount-coupon.do";
</script>
<%@ include file="../include/member_footer.jsp" %>