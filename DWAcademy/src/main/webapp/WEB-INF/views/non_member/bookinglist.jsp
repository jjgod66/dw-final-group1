<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
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
    margin-top: 70px!important;
}
.tab-block {
    position: relative;
}
.tab-block:before {
    content: '';
    position: absolute;
    left: 0;
    top: 35px;
    width: 100%;
    height: 1px;
    background-color: #d8d9db;
}
.tab-block ul:after,
.tab-block ul:before {
    content: '';
    display: table;
}
.tab-block ul:after {
    clear: both;
}
.tab-block ul li {
    position: relative;
    float: left;
    width: 20%;
    border: 1px solid #d8d9db;
    border-left: 0;
}
.tab-block ul li:last-child {
    border-right: 1px solid #d8d9db;
}
.tab-block ul li:first-child, .tab-block ul li:nth-child(6) {
    border-left: 1px solid #d8d9db;
}
.tab-block ul li.hover, .tab-block ul li.on {
    border-color: #555;
}
.tab-block ul li.hover:first-child, .tab-block ul li.on:first-child {
    border-color: #555;
}
.tab-block ul li .btn {
    display: block;
    width: 100%;
    height: 34px;
    margin: 0;
    padding: 0;
    border: 0;
    line-height: 34px;
    text-align: center;
    background-color: transparent;
    text-decoration: none;
    border-radius: 0;
}
.tab-block ul li.hover .btn, .tab-block ul li.on .btn {
    color: #fff;
    background-color: #555;
}
.board-list-search {
    margin-top: 20px!important;
    padding: 20px 40px;
    background-color: #f2f4f5;
}
.board-list-search table tbody tr td,
.board-list-search table tbody tr th {
    padding: 2px 0;
    text-align: left;
}
.board-list-search [type=checkbox],
.board-list-search [type=radio],
.board-list-search label {
    display: inline-block;
    vertical-align: middle;
}
.board-list-search table tbody tr td label {
    margin-right: 20px;
}
.board-list-search table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}
.bootstrap-select:not(.input-group-btn), .bootstrap-select[class*=col-] {
    float: none;
    display: inline-block;
    margin-left: 0;
}
.bootstrap-select>select {
    display: block!important;
    height: 34px;
    line-height: 34px;
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
.button.small {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
}
.button.gray-line {
    color: #444;
    line-height: 36px;
    border: 1px solid #c1c1c1;
    background-color: #fff;
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
.cont {
    display: block;
    margin: 0;
    padding: 20px;
}
.cont .mb30 {
    margin-bottom: 30px!important;
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
.dash-list>li {
    position: relative;
    padding: 0 0 0 11px;
    font-size: .9333em;
}
.dash-list>li:before {
    content: '';
    display: block;
    position: absolute;
    left: 0;
    top: 10px;
    width: 4px;
    height: 1px;
    margin: 0;
    padding: 0;
    background-color: #333;
}
.content-section {
    display: block;
}
.toggle {
	display: none;
}
.CreBtn{
	border: solid 1px gray;
	border-radius: 5px;
	padding: 5px;
	margin-left: 5px;
}
.proName:hover{
	text-decoration: underline;
	cursor: pointer;
}
</style>
<div class="sub_visual">
    <h3>비회원 예매내역</h3>
<!--     <h6>my page</h6> -->
</div>
<%@include file="creditInfo_modal.jsp" %>
<%@include file="refund_modal.jsp" %>
<div style="width: 1000px; margin: 0 auto;">
<!-- <h2 class="tit">예매/구매 내역</h2> -->

<section id="myBokdArea"  class="content-section" style="display: block">
<div class="board-list-search mt20">
	<table summary="예매 조회 조건">
		<colgroup>
			<col style="width:75px;">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">구분 </th>
				<td>
				<c:if test="${pageMaker.cri.searchType != 'past' }">
					<input type="radio" id="radBokd01" name="searchTyperes" value="curr" checked="checked">
					<label for="radBokd01">예매내역 </label>
					<input type="radio" id="radBokd02" name="searchTyperes" value="past">
					<label for="radBokd02">지난내역 </label>
				</c:if>
				<c:if test="${pageMaker.cri.searchType == 'past' }">
					<input type="radio" id="radBokd01" name="searchType" value="curr">
					<label for="radBokd01">예매내역 </label>
					<input type="radio" id="radBokd02" name="searchType" value="past"  checked="checked">
					<label for="radBokd02">지난내역 </label>
				</c:if>

<%-- 						<input type="text" class="small bd3" name="keyword" value="${cri.keyword}"> --%>

					<button type="button" class="button gray-line small ml05" id="reserveSearchBtn">
						<i class="iconset ico-search-gray"></i> 조회 
					</button>
					<select style="display:none;" name="perPageNum">
						<option value="5" selected></option>
					</select>
				</td>
			</tr>
		</tbody>
	</table>
</div>
	<div class="container" id="myMovie">
<c:if test="${empty resList}">
	<div class="" style="padding: 30px; margin: auto;">
		<div style="text-align: center;">내역이 없습니다.</div>
	</div>
</c:if>
<c:if test="${!empty resList}">
	<div>총 ${totalCount}건</div>
</c:if>
	<c:forEach items="${resList}" var="res">
	<div class="container">
		<div class="card-body row" style="padding-rigth: 0; border: 1px solid #503396">
			<div class="col-2" style="background: url('<%=request.getContextPath() %>/common/getPicture.do?name=${res.MOVIE_MAINPIC_PATH}&item_cd=${res.MOVIE_CD}&type=moviePoster') no-repeat left /cover"></div>
			<div class="col-5">
				<span><strong>예매번호 </strong>${res.MERCHANT_UID}</span>
				<br><br>
				<span><strong>영화명 </strong>${res.MOVIE_NAME}</span>
				<br><br>
				<span><strong>극장/상영관 </strong>${res.THR_NAME} / ${res.HOUSE_NAME}</span>
				<br><br>
				<span><strong>관람일시 </strong>${res.STARTDATE}</span>
				<br><br>
				<span><strong>결제일시 </strong>${res.RESDATE}</span>
				<button type="button" class="btn-light CreBtn" data-merchant_uid="${res.MERCHANT_UID}" id="creInfoBtn">결제정보</button>
<!-- 				<button type="button" class="btn-light">결제취소</button> -->
			</div>
			<div class="col-4 infodiv2">
				<br><br>
				<br><br>
				<span><strong>관람인원 </strong>${res.MEM_CAT}</span>
				<br><br>
				<span><strong>관람좌석 </strong>${res.RES_SEAT}</span>
				<br><br>
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyyMMddHHmm" /></c:set> 
				<c:set var="screenDate"><fmt:formatDate value="${res.STARTDATE}" pattern="yyyyMMddHHmm" /></c:set> 
				<c:if test="${res.REFUNDDATE eq null}">
					<c:if test="${screenDate - 30 > sysDate }">
							<span><strong>취소일시 </strong><button type="button" class="btn-light CreBtn" data-merchant_uid="${res.MERCHANT_UID}" id="resRefundBtn">예매취소</button></span>
					</c:if>
					<c:if test="${screenDate - 30 < sysDate }">
							<span><strong>취소일시 </strong> - </span>
					</c:if>
				</c:if>
<%-- 				<c:if test="${resList.REFUNDDATE eq null}"> --%>
<!-- 					<span><strong>취소일시 </strong> - </span> -->
<%-- 				</c:if> --%>
				<c:if test="${res.REFUNDDATE ne null}">
					<span><strong>취소일시 </strong>${res.REFUNDDATE}</span>
				</c:if>
			</div>
		</div>
	</div>
	<br>
	</c:forEach>
</div>
<c:if test="${empty resList}">
		<div class="mt-5 mb-5 paginationdiv" style="display: none">
			<%@ include file="../common/pagination.jsp" %>
		</div>
</c:if>
<c:if test="${!empty resList}">
		<div class="mt-5 mb-5 paginationdiv">
			<%@ include file="../common/pagination.jsp" %>
		</div>
</c:if>

<br>
</section>
</div>
<form id="nonMemForm" method="post" action="<%=request.getContextPath()%>/nonMem/login.do">
	<input type="hidden" name="non_mem_name" value="${non_mem.non_mem_name }">
	<input type="hidden" name="non_mem_pwd" value="${non_mem.non_mem_pwd }">
	<input type="hidden" name="non_mem_phone" value="${non_mem.non_mem_phone }">
	<input type="hidden" name="non_mem_bir" value="${non_mem.non_mem_bir }">
	<input type="hidden" name="searchType" value="">
</form>
<script>
$(function(){
	$('#myMovie').on('click', '#creInfoBtn', function(){
		
		let merchant_uid = $(this).data('merchant_uid');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/pay/creInfo.do',
			method : 'post',
			data : {'merchant_uid' : merchant_uid},
			success : function(res){
				console.log(res);
				payInfoRes(res);
				$('#creditInfo-modal').modal('show');
			},
			error : function(err){
				alert(err.status);
			}
		})
		
	})
	
		$('#myMovie').on('click', '#resRefundBtn', function(){
		let merchant_uid = $(this).data('merchant_uid');
		$('#refundHiddenMUID').val(merchant_uid);
		$('#refund-modal').modal('show');
	})
	
	$('input[name="searchTyperes"]').on('change', function(){
		let searchType = $('input[name="searchTyperes"]:checked').val();
		console.log(searchType);
		$('#nonMemForm input[name="searchType"]').val(searchType);
	})
	$('#reserveSearchBtn').on('click', function(){
		$('#nonMemForm').submit();
	})
	
	
})

function resRefund(merchant_uid){
	$.ajax({
		url : "/pay/refund.do", 
	    type : "POST",
	    data : {'merchant_uid' : merchant_uid},
	    success : function(res){
	    	console.log(res);
	    	if(res != 'F'){
	    		alert("취소가 완료되었습니다.");
	    		location.reload();
	    	}
	    },
	    error : function(err){
	    	alert(err.status);
	    }
	})
}

function payInfoRes(res){
	let paydate = dateFormat(new Date(res.PAYDATE));
	
	$('#infoModalPriceSum').text(res.PRICESUM + '원');
	$('#infoModalDiscount').text(res.DISCOUNT + '원');
	$('#infoModalPaidAmount').text(res.PAID_AMOUNT + '원');
	$('#infoModalRefundPaidAmount').text(res.PAID_AMOUNT + '원');
	$('#infoModalPaydate').text(paydate);
	let cardShow = '';
	cardShow += res.CARD_NAME + ' '; 
	if(res.CARD_QUOTA == 0){
		cardShow += '(일시불)';
	}else{
		cardShow += '(' + res.CARD_QUOTA + '개월)';
		
	}
	$('#infoModalCard').text(cardShow);
	
	if(res.REFUNDDATE != null){
		let refunddate = dateFormat(new Date(res.REFUNDDATE));
		$('#infoModalRefunddate').text(refunddate);
		$('.creInfoModalRefundInfo').css('display', '');
	}else{
		$('.creInfoModalRefundInfo').css('display', 'none');
	}
	$('.creInfoModalBuyInfo').css('display', 'none');
}

function dateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;
    second = second >= 10 ? second : '0' + second;

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
}


</script>
<%@ include file="../include/member_footer.jsp" %>