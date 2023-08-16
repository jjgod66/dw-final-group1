<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/member_header.jsp" %>
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
.content {
	min-height:900px;
	padding: 20px 0;
}
</style>

<%@include file="creditInfo_modal.jsp" %>
<%@include file="refund_modal.jsp" %>
<%@include file="buy_refund_modal.jsp" %>
<%@include file="photoTicket_refund_modal.jsp" %>
<div class="content">
	<h2 class="tit">예매/구매 내역</h2>
	<div class="tab-block tab-layer">
		<ul>
			<li><a href="<%=request.getContextPath() %>/member/bookinglist.do" class="btn">예매 </a></li>
			<li class="on"><a href="<%=request.getContextPath() %>/member/buylist.do" class="btn">구매 </a></li>
		</ul>
	</div>
	<!-- 구매 내역 시작 -->
	<!-- <section id="myPurcArea" class="content-section" style="display: block"> -->
	<div class="board-list-search mt20">
		<table summary="구매 조회 조건">
			<colgroup>
				<col style="width:75px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" style="border: none; background-color: transparent;">구분 </th>
					<td style="border: none;">
						<div class="dropdown bootstrap-select small bs3">
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
							<c:set var="sysMonth"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
							<c:set var="sysYearS" value="${sysYear }"/>
							<c:set var="sysMonthS" value="${sysMonth }"/>
							<c:set var="0" value="0"/>
							<select name="buyYM" class="selectpicker small" tabindex="-98">
							
							<c:forEach begin="1" end="12" varStatus="status">
								<option value="${sysYearS }${sysMonthS}" ${cri.monthKeyword eq sysYearS += sysMonthS ? 'selected' : '' }>${sysYearS }년 ${sysMonthS }월</option>	
								<c:choose> 
									<c:when test="${sysMonthS - 1 >= 1}">
										<c:set var="sysMonthS" value="${sysMonthS - 1 }"/>
										<c:if test="${sysMonthS < 10 }">
											<c:set var="sysMonthS" value="${0 }${sysMonthS}"/>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:set var="sysYearS" value="${sysYearS - 1 }"/>
										<c:set var="sysMonthS" value="12"/>
									</c:otherwise> 
								</c:choose>
							</c:forEach>
							</select>
							
						</div>
						<button type="button" id="buyYMSearchBtn" class="button gray-line small ml05" name="search" onclick="searchBuyList_go(1);">
							<i class="iconset ico-search-gray"></i> 조회 
						</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container" id="myBuy">
	<c:if test="${buyTotalCount eq 0}">
		<div class="" style="padding: 50px 0; margin: auto;">
			<div style="text-align: center;">구매내역이 없습니다.</div>
		</div>
	</c:if>
		<div class="container" style="margin-top: 10px;">
		<c:if test="${!empty buyInfoList}">
		<div>총 ${buyTotalCount}건</div>
			<div class="card-body" style="margin-top: 10px;">
				<table style="width : 100%;">
					<tr>
						<th style="width : 20%; text-align : center;">결제일시</th>
						<th style="width : 10%; text-align : center;">구분</th>
						<th style="text-align : center;">상품명</th>
						<th style="width : 10%; text-align : center;">결제금액</th>
						<th style="width : 10%; text-align : center;">상태</th>
						<th style="width : 10%; text-align : center;">취소</th>
					</tr>
	<c:forEach items="${buyInfoList}" var="buyInfo">
					<tr>
						<td style="width : 20%; text-align : center;"><fmt:formatDate value="${buyInfo.BUYDATE}"/></td>
						<td style="width : 10%; text-align : center;">${buyInfo.PRODUCT_DIV}</td>
						<td style="text-align : center;" class="proName" data-mem_product_cd="${buyInfo.MEM_PRODUCT_CD }">${buyInfo.PRODUCT_NAME}</td>
						<td style="width : 10%; text-align : center;"><fmt:formatNumber value="${buyInfo.PRODUCT_PRICE}" pattern="#,###"/> 원</td>
						<c:if test="${buyInfo.GB_USE eq 'N'}">
							<td style="width : 10%; text-align : center; color: blue">사용가능</td>
						</c:if>
						<c:if test="${buyInfo.GB_USE eq 'Y'}">
							<td style="width : 10%; text-align : center;">사용완료</td>
						</c:if>
						<c:if test="${buyInfo.GB_USE eq 'R'}">
							<td style="width : 10%; text-align : center; color: red;">사용불가</td>
						</c:if>
						<c:if test="${buyInfo.REFUNDDATE eq null}">
							<c:if test="${buyInfo.GB_ONE_USE eq 'N'}">
								<td style="width : 10%; text-align : center;"><button type="button" class="btn-light CreBtn" data-merchant_uid="${buyInfo.MERCHANT_UID}" id="buyRefundBtn">취소</button></td>
							</c:if>
							<c:if test="${buyInfo.GB_ONE_USE eq 'Y'}">
								<td style="width : 10%; text-align : center; color: red;">취소불가</td>
							</c:if>
						</c:if>
						<c:if test="${buyInfo.REFUNDDATE ne null}">
							<td style="width : 10%; text-align : center;">취소완료</td>
						</c:if>
					</tr>
		</c:forEach>
				</table>
			</div>
		</c:if>
		</div>
	</div>
	<br>
	<c:if test="${buyTotalCount eq 0}">
		<div class="mt-5 mb-5 paginationdiv" style="display: none;">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</c:if>
	<c:if test="${buyTotalCount ne 0}">
		<div class="mt-5 mb-5 paginationdiv">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</c:if>
	<br>
</div>
<form id="reserveSearchForm">
	<input type="hidden" name="page">
	<input type="hidden" name="perPageNum">
	<input type="hidden" name="monthKeyword">
</form>
<!-- </section> -->
<script>
$(function(){
	$('#myBuy').on('click', '#buyRefundBtn', function(){
		let merchant_uid = $(this).data('merchant_uid');
		$('#buyrefundHiddenMUID').val(merchant_uid);
		$('#buy-refund-modal').modal('show');
	})
	
	$('#myBuy').on('click', '.proName', function(){
		let mem_product_cd = $(this).data('mem_product_cd');
		$("#infoModalMemProCd").text(mem_product_cd);
		$.ajax({
			url : '<%=request.getContextPath()%>/pay/buyCreInfo.do',
			method : 'post',
			data : {'mem_product_cd' : mem_product_cd},
			success : function(res){
				console.log(res);
				payInfoBuy(res);
				$('#creditInfo-modal').modal('show');
			},
			error : function(err){
				alert(err.status);
			}
		})
	})

	$('.infodiv2').on('click', '#photoTicketBtn', function(){
		let merchant_uid = $(this).data('merchant_uid');
		location.href="<%=request.getContextPath()%>/photoTicket/edit.do?merchant_uid=" + merchant_uid;
		
	})
	
	
	$('#myBuy').on('click', '#creInfoBtn', function(){
		
		let merchant_uid = $(this).data('merchant_uid');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/pay/creInfo.do',
			method : 'post',
			data : {'merchant_uid' : merchant_uid},
			success : function(res){
				console.log(res);
			},
			error : function(err){
				alert(err.status);
			}
		})
		
		$('#creditInfo-modal').modal('show');
	})
})

let searchUrl = "/member/buylist.do"
if (${not empty sessionScope.admin_cd}) {
	$('#reserveSearchForm').find('[name="adminType"]').val('${sessionScope.admin_cd}');
}
function searchBuyList_go(page, url) {
	if (page < 1) {
		return;
	}
	
	let perPageNum = 10;
	if ($('select[name="perPageNum"]').val()) {
		perPageNum = $('select[name="perPageNum"]').val();
	}
	
	let reserveSearchForm = $('#reserveSearchForm');
	reserveSearchForm.find('[name="page"]').val(page);
	reserveSearchForm.find('[name="perPageNum"]').val(perPageNum);
	reserveSearchForm.find('[name="monthKeyword"]').val($('select[name="buyYM"]').val());
	reserveSearchForm.attr("method", "post");
	if (url) {
		reserveSearchForm.attr("action", url);
	} else {
		reserveSearchForm.attr("action", searchUrl);
	}
	reserveSearchForm.submit();
}
let searchFormUrl = "/member/buylist.do";
// $(document).ready(function () {
// 	// 페이지가 로드되면 해시태그에 따라 해당 콘텐츠를 보여주거나 감추는 함수 실행
// 	handleHashChange();
// 	if($('li[data-tit="구매내역"]').hasClass('on') == true){
// 		$('#myPurcArea').show();
// 	}else{
// 		$('#myBokdArea').show();
// 	}
// 	// 예매, 구매 탭을 클릭할 때 해시태그 변경 및 콘텐츠 표시/감추기
// 	$(".tab-block li").on("click", function (event) {
// 		event.preventDefault();
// 		var href = $(this).find("a").attr("href");
// 		history.pushState({}, "", href);
// 		handleHashChange();

// 		// 클릭한 탭 버튼에 클래스를 추가하여 활성화 표시
// 		$(".tab-block li.on").removeClass("on");
// 		$(this).addClass("on");
// 	});

// 	// 브라우저 뒤로 가기 버튼 클릭 시에도 해시태그에 따라 콘텐츠를 보여주거나 감춤
// 	$(window).on("popstate", function () {
// 		handleHashChange();

// 		// 뒤로 가기 버튼에 따라 탭 버튼도 변경
// 		$(".tab-block li.on").removeClass("on");
// 		var hash = window.location.hash;
// 		var targetTab = $('a[href="' + hash + '"]').parent();
// 		targetTab.addClass("on");
// 	});

// 	// 해시태그에 따라 콘텐츠를 보여주거나 감추는 함수
// 	function handleHashChange() {
// 		var hash = window.location.hash;
// 		$(".content-section").hide();
// 		$(hash).show();
// 	};
// 	$('select[name="searchType"]').on('change', function(){
// 		console.log(this.value);
// 		if(this.value == "date"){
// 			$('input[name="keyword"]').hide();
// 			$('#selYM').show();
// 		}else if(this.value == "movie" || this.value == "theater"){
// 			$('#selYM').hide();
// 			$('input[name="keyword"]').show();
// 		}else{
// 			$('#selYM').hide();
// 			$('input[name="keyword"]').hide();
// 		}
// 	})
// let searchType = "<c:out value='${cri.searchType}'/>";

// 	if(searchType == 'date'){
// 		$('#selYM').show();
// 	}else if(searchType == 'movie' || searchType == 'theater'){
// 		$('input[name="keyword"]').show();
// 	}

// 	$('#radBokd01').on('click', function(){
<%-- 		location.href="<%=request.getContextPath()%>/member/bookinglist.do"; --%>
// 	});

// });



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

function ptRefund(merchant_uid){
	$.ajax({
		url : "/pay/ptrefund.do", 
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

function payInfoBuy(res){
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
	if(res.IMP_UID.substring(0, 1) == 'Z'){
		cardShow = '포인트';
	}
	$('#infoModalCard').text(cardShow);
	
	if(res.REFUNDDATE != null){
		let refunddate = dateFormat(new Date(res.REFUNDDATE));
		$('#infoModalRefunddate').text(refunddate);
		$('.creInfoModalRefundInfo').css('display', '');
	}else{
		$('.creInfoModalRefundInfo').css('display', 'none');
	}
	
	$('#infoModalProName').text(res.PRODUCT_NAME);
	$('#infoModalBuyAmount').text(res.AMOUNT + '개');
	$('.creInfoModalBuyInfo').css('display', '');
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
	if(res.IMP_UID.substring(0, 1) == 'Z'){
		cardShow = '포인트';
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