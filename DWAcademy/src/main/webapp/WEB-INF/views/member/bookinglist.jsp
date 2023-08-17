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
.input-text {
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
.content {
min-height:900px;
	padding: 20px 0;
}
.moviePoster:hover{
	cursor: pointer;
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
			<li class="on"><a href="<%=request.getContextPath() %>/member/bookinglist.do" class="btn">예매 </a></li>
			<li><a href="<%=request.getContextPath() %>/member/buylist.do" class="btn">구매 </a></li>
		</ul>
	</div>
	<!-- <section id="myBokdArea"  class="content-section" style="display: block"> -->
	<div class="board-list-search mt20">
		<table summary="예매 조회 조건">
			<colgroup>
				<col style="width:75px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" style="border: none; background-color: transparent;">구분 </th>
					<td style="border: none;">
						<input type="radio" id="radBokd01" name="radBokd" value="B" checked="checked">
						<label for="radBokd01">예매내역 </label>
						
						<div class="dropdown bootstrap-select disabled small bs3">
							<select name="searchType">
								<option value="">선택</option>
								<option value="date" ${cri.searchType eq 'date' ? 'selected' : '' }>월별</option>
								<option value="movie" ${cri.searchType eq 'movie' ? 'selected' : '' }>영화별</option>
								<option value="theater" ${cri.searchType eq 'theater' ? 'selected' : '' }>극장별</option>
							</select>
						</div>
							<input type="text" class="small bd3 toggle input-text" name="keyword" value="${cri.keyword}">
						<div class=" bootstrap-select small bs3" id="selYM" style="display:none;">
						<c:set var="now" value="<%=new java.util.Date()%>" />
							<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
							<c:set var="sysMonth"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
							<c:set var="sysYearS" value="${sysYear }"/>
							<c:set var="sysMonthS" value="${sysMonth }"/>
							<c:set var="0" value="0"/>
							<select name="monthKeyword" class="selectpicker small" tabindex="-98">
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
						<button type="button" class="button gray-line small ml05" id="reserveSearchBtn" onclick=" searchList_go(1, '<%=request.getContextPath()%>/member/searchResDate.do');">
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
		<div class="container" id="myMovie" style="margin-top: 10px;">
	<c:if test="${empty movieInfoList}">
		<div class="" style="padding: 50px 0; margin: auto;">
			<div style="text-align: center;">예매내역이 없습니다.</div>
		</div>
	</c:if>
	<c:if test="${!empty movieInfoList}">
		<div>총 ${movieTotalCount}건</div>
	</c:if>
		<c:forEach items="${movieInfoList}" var="movieInfo">
		<div class="container" style="margin-top: 10px;">
			<div class="card-body row" style="padding: 30px; border: 1px solid gray; border-radius: 10px;">
				<div class="col-2 moviePoster" onclick="location.href='<%=request.getContextPath()%>/movie/viewer.do?movie_cd=${movieInfo.MOVIE_CD}'" style="background: url('<%=request.getContextPath() %>/common/getPicture.do?name=${movieInfo.MOVIE_MAINPIC_PATH}&item_cd=${movieInfo.MOVIE_CD}&type=moviePoster') no-repeat left /cover"></div>
				<div class="col-5">
					<span><strong>예매번호 </strong>${movieInfo.MERCHANT_UID}</span>
					<br><br>
					<span><strong>영화명 </strong>${movieInfo.MOVIE_NAME}</span>
					<br><br>
					<span><strong>극장/상영관 </strong>${movieInfo.THR_NAME} / ${movieInfo.HOUSE_NAME}</span>
					<br><br>
					<span><strong>관람일시 </strong>${movieInfo.STARTDATE}</span>
					<br><br>
					<span><strong>결제일시 </strong>${movieInfo.RESDATE}</span>
					<button type="button" class="btn-light CreBtn" data-merchant_uid="${movieInfo.MERCHANT_UID}" id="creInfoBtn">결제정보</button>
	<!-- 				<button type="button" class="btn-light">결제취소</button> -->
				</div>
				<div class="col-4 infodiv2">
					<br><br>
					<br><br>
					<span><strong>관람인원 </strong>${movieInfo.MEM_CAT}</span>
					<br><br>
					<span><strong>관람좌석 </strong>${movieInfo.RES_SEAT}</span>
					<br><br>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyyMMddHHmm" /></c:set> 
					<c:set var="screenDate"><fmt:formatDate value="${movieInfo.STARTDATE}" pattern="yyyyMMddHHmm" /></c:set> 
					<c:if test="${movieInfo.REFUNDDATE eq null}">
						<c:if test="${screenDate - 20 > sysDate }">
								<span><strong>취소일시 </strong><button type="button" class="btn-light CreBtn" data-merchant_uid="${movieInfo.MERCHANT_UID}" id="resRefundBtn">예매취소</button></span>
						</c:if>
						<c:if test="${screenDate < sysDate}">
							<c:if test="${movieInfo.GB_PRINT eq null }">
								<span><strong>포토티켓 </strong><button type="button" class="btn-light CreBtn" data-merchant_uid="${movieInfo.MERCHANT_UID}" id="photoTicketBtn">포토티켓 만들기</button></span>
							</c:if>
							<c:if test="${movieInfo.GB_PRINT ne null }">
								<span><strong>포토티켓 </strong>
									<c:if test="${movieInfo.GB_PRINT =='Y'}">
										(출력완료)
									</c:if>
									<c:if test="${movieInfo.GB_PRINT =='N'}">
										<button type="button" class="btn-light CreBtn" data-merchant_uid="${movieInfo.MERCHANT_UID}" id="photoTicketPreviewBtn">미리보기</button>
										<button type="button" class="btn-light CreBtn" data-merchant_uid="${movieInfo.MERCHANT_UID}" id="photoTicketRefundBtn">취소</button>
									</c:if>
								</span>
							</c:if>
						</c:if>
					</c:if>
	<%-- 				<c:if test="${movieInfo.REFUNDDATE eq null}"> --%>
	<!-- 					<span><strong>취소일시 </strong> - </span> -->
	<%-- 				</c:if> --%>
					<c:if test="${movieInfo.REFUNDDATE ne null}">
						<span><strong>취소일시 </strong>${movieInfo.REFUNDDATE}</span>
					</c:if>
				</div>
			</div>
		</div>
		<br>
		</c:forEach>
	</div>
	<c:if test="${empty movieInfoList}">
		<div class="mt-5 mb-5 paginationdiv" style="display: none;">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</c:if>
	<c:if test="${!empty movieInfoList}">
		<div class="mt-5 mb-5 paginationdiv">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</c:if>
	<br>
</div>
<script>
$(function(){

	$('#myMovie').on('click', '#photoTicketPreviewBtn', function(){
		
		let merchant_uid = $(this).data('merchant_uid');
		$.ajax({
			url : '<%=request.getContextPath()%>/photoTicket/gbPrintChk.do',
			data : {'merchant_uid' : merchant_uid},
			method : 'post',
			success : function(res){
				if(res == 'Y'){
					alert("이미 출력한 포토티켓입니다.");
					location.reload();
					return;
				}else{
					OpenWindow('<%=request.getContextPath() %>/photoTicket/photoTicketPreview.do?merchant_uid=' + merchant_uid, '포토티켓 미리보기', 1000, 600);
				}
			},
			error : function(err){
				alert(err.status);
			}
		})
<%-- 		OpenWindow('<%=request.getContextPath() %>/photoTicket/photoTicketPreview.do?merchant_uid=' + merchant_uid, '포토티켓 미리보기', 1000, 600); --%>
	})
	
	$('#myMovie').on('click', '#photoTicketRefundBtn', function(){
		let merchant_uid = $(this).data('merchant_uid');
		$.ajax({
			url : '<%=request.getContextPath()%>/photoTicket/gbPrintChk.do',
			data : {'merchant_uid' : merchant_uid},
			method : 'post',
			success : function(res){
				if(res == 'Y'){
					alert("이미 출력한 포토티켓입니다.");
					location.reload();
					return;
				}else{
					$('#ptrefundHiddenMUID').val(merchant_uid);
					$('#photoTicket-refund-modal').modal('show');
				}
			},
			error : function(err){
				alert(err.status);
			}
		})
// 		$('#ptrefundHiddenMUID').val(merchant_uid);
// 		$('#photoTicket-refund-modal').modal('show');
	})
	
	$('.infodiv2').on('click', '#photoTicketBtn', function(){
		let merchant_uid = $(this).data('merchant_uid');
		let page = '${pageMaker.cri.page}';
		location.href="<%=request.getContextPath()%>/photoTicket/edit.do?merchant_uid=" + merchant_uid + '&page=' + page;
		
	})
	
	$('#myMovie').on('click', '#resRefundBtn', function(){
		let merchant_uid = $(this).data('merchant_uid');
		$('#refundHiddenMUID').val(merchant_uid);
		$('#refund-modal').modal('show');
	})
	
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
	
	$('#myMovie').on('click', '#creInfoBtn', function(){
		
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

let searchUrl = "<%=request.getContextPath()%>/member/bookinglist.do"
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
let searchFormUrl = "<%=request.getContextPath()%>/member/bookinglist.do";
$(document).ready(function () {
	$('select[name="searchType"]').on('change', function(){
		console.log(this.value);
		if(this.value == "date"){
			$('input[name="keyword"]').hide();
			$('#selYM').show();
		}else if(this.value == "movie" || this.value == "theater"){
			$('#selYM').hide();
			$('input[name="keyword"]').show();
		}else{
			$('#selYM').hide();
			$('input[name="keyword"]').hide();
		}
	})
let searchType = "<c:out value='${cri.searchType}'/>";

	if(searchType == 'date'){
		$('#selYM').show();
	}else if(searchType == 'movie' || searchType == 'theater'){
		$('input[name="keyword"]').show();
	}


});



function resRefund(merchant_uid){
	$.ajax({
		url : "<%=request.getContextPath()%>/pay/refund.do", 
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
		url : "<%=request.getContextPath()%>/pay/ptrefund.do", 
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