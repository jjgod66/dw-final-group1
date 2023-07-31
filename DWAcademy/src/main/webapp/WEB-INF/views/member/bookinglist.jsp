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
</style>
<h2 class="tit">예매/구매 내역</h2>
<div class="tab-block tab-layer">
	<ul>
		<li data-url="/mypage/bookinglist?tab=01" data-tit="예매내역" title="예매내역 탭으로 이동" class="on"><a href="#myBokdArea" class="btn">예매 </a></li>
		<li data-url="/mypage/bookinglist?tab=02" data-tit="구매내역" title="구매내역 탭으로 이동" class=""><a href="#myPurcArea" class="btn">구매 </a></li>
	</ul>
</div>
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
					<input type="radio" id="radBokd01" name="radBokd" value="B" checked="checked">
					<label for="radBokd01">예매내역 </label>
					<input type="radio" id="radBokd02" name="radBokd" value="E">
					<label for="radBokd02">지난내역 </label>

					<div class="dropdown bootstrap-select disabled small bs3">
						<select name="selYM" class="selectpicker small" disabled="disabled" tabindex="-98">
							<option value="202307">2023년 7월</option>
							<option value="202306">2023년 6월</option>
							<option value="202305">2023년 5월</option>									
							<option value="202304">2023년 4월</option>
							<option value="202303">2023년 3월</option>
							<option value="202302">2023년 2월</option>
							<option value="202301">2023년 1월</option>
							<option value="202212">2022년 12월</option>
							<option value="202211">2022년 11월</option>
							<option value="202210">2022년 10월</option>
							<option value="202209">2022년 9월</option>
							<option value="202208">2022년 8월</option>
						</select>
					</div>
					<button type="button" id="selYMSearchBtn" class="button gray-line small ml05" name="search">
						<i class="iconset ico-search-gray"></i> 조회 
					</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
	<div class="container" id="myMovie">
<div>총 ${fn:length(movieInfo)}건</div>
<c:if test="">
	<div id="bokdList"><div class="no-history-reservation mt20">예매 내역이 없습니다.</div></div>
</c:if>
	<c:forEach items="${movieInfo}" var="movieInfo">
	<div class="container">
		<div class="card-body row" style="padding-rigth: 0; border: 1px solid #503396">
			<div class="col-2" style="background: url('<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${movieInfo.MOVIE_MAINPIC_PATH}&item_cd=${movieInfo.MOVIE_CD}&type=moviePoster') no-repeat left /cover"></div>
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
			</div>
			<div class="col-4 ">
				<br><br>
				<br><br>
				<span><strong>관람인원 </strong>${movieInfo.MEM_CAT}</span>
				<br><br>
				<span><strong>관람좌석 </strong>${movieInfo.RES_SEAT}</span>
				<br><br>
				<c:if test="${movieInfo.REFUNDDATE eq null}">
					<span><strong>취소일시 </strong> - </span>
				</c:if>
				<c:if test="${movieInfo.REFUNDDATE ne null}">
					<span><strong>취소일시 </strong>${movieInfo.REFUNDDATE}</span>
				</c:if>
			</div>
		</div>
	</div>
	<br>
	</c:forEach>
</div>
</section>

<!-- 구매 내역 시작 -->
<section id="myPurcArea"  class="content-section" style="display: block">
<div class="board-list-search mt20">
	<table summary="구매 조회 조건">
		<colgroup>
			<col style="width:75px;">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">구분 </th>
				<td>
					<div class="dropdown bootstrap-select disabled small bs3">
						<select name="buyYM" class="selectpicker small" tabindex="-98">
							<option value="202307">2023년 7월</option>
							<option value="202306">2023년 6월</option>
							<option value="202305">2023년 5월</option>									
							<option value="202304">2023년 4월</option>
							<option value="202303">2023년 3월</option>
							<option value="202302">2023년 2월</option>
							<option value="202301">2023년 1월</option>
							<option value="202212">2022년 12월</option>
							<option value="202211">2022년 11월</option>
							<option value="202210">2022년 10월</option>
							<option value="202209">2022년 9월</option>
							<option value="202208">2022년 8월</option>
						</select>
					</div>
					<button type="button" id="buyYMSearchBtn" class="button gray-line small ml05" name="search">
						<i class="iconset ico-search-gray"></i> 조회 
					</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="container" id="myBuy">
<div>총 ${fn:length(memBuyInfo)}건</div>
<c:if test="">
	<div id="buyList"><div class="no-history-reservation mt20">구매 내역이 없습니다.</div></div>
</c:if>
<c:forEach items="${memBuyInfo}" var="buyInfo">
	<div class="container">
		<div class="card-body" style="padding-rigth: 0; border-top: 1px solid #503396">
			<table style="width : 100%;">
				<tr>
					<th style="width : 20%; text-align : center;">결제일시</th>
					<th style="width : 10%; text-align : center;">구분</th>
					<th style="text-align : center;">상품명</th>
					<th style="width : 10%; text-align : center;">결제금액</th>
					<th style="width : 10%; text-align : center;">상태</th>
				</tr>
				<tr>
					<td style="width : 20%; text-align : center;"><fmt:formatDate value="${buyInfo.buydate}"/></td>
					<td style="width : 10%; text-align : center;">${buyInfo.product_div}</td>
					<td style="text-align : center;">${buyInfo.product_name}</td>
					<td style="width : 10%; text-align : center;">${buyInfo.product_price}원</td>
					<c:if test="${buyInfo.gb_use eq 'N'}">
						<td style="width : 10%; text-align : center;">사용가능</td>
					</c:if>
					<c:if test="${buyInfo.gb_use eq 'Y'}">
						<td style="width : 10%; text-align : center;">사용완료</td>
					</c:if>
					<c:if test="${buyInfo.refunddate ne null}">
						<td style="width : 10%; text-align : center;">결제취소</td>
					</c:if>
				</tr>
			</table>
		</div>
	</div>
	</c:forEach>
</div>
</section>
<script>
$(document).ready(function () {
	// 페이지가 로드되면 해시태그에 따라 해당 콘텐츠를 보여주거나 감추는 함수 실행
	handleHashChange();

	$('#myBokdArea').show();
	// 예매, 구매 탭을 클릭할 때 해시태그 변경 및 콘텐츠 표시/감추기
	$(".tab-block li").on("click", function (event) {
		event.preventDefault();
		var href = $(this).find("a").attr("href");
		history.pushState({}, "", href);
		handleHashChange();

		// 클릭한 탭 버튼에 클래스를 추가하여 활성화 표시
		$(".tab-block li.on").removeClass("on");
		$(this).addClass("on");
	});

	// 브라우저 뒤로 가기 버튼 클릭 시에도 해시태그에 따라 콘텐츠를 보여주거나 감춤
	$(window).on("popstate", function () {
		handleHashChange();

		// 뒤로 가기 버튼에 따라 탭 버튼도 변경
		$(".tab-block li.on").removeClass("on");
		var hash = window.location.hash;
		var targetTab = $('a[href="' + hash + '"]').parent();
		targetTab.addClass("on");
	});

	// 해시태그에 따라 콘텐츠를 보여주거나 감추는 함수
	function handleHashChange() {
		var hash = window.location.hash;
		$(".content-section").hide();
		$(hash).show();
	};
	$('#radBokd02').on('click', function(){
		$('select[name=selYM]').attr("disabled" ,false);
	});
	$('#radBokd01').on('click', function(){
		$('select[name=selYM]').attr("disabled" ,true);
		location.reload();
	});
	$('#selYMSearchBtn').on('click', function(){
		let contextPath = "<%=request.getContextPath()%>";
		if($('select[name=selYM]').attr("disabled") != "disabled"){
			let searchVal = $('select[name=selYM]').val();
			$.ajax({
				url : "<%=request.getContextPath()%>/member/searchResDate.do",
				method : "post",
				data : {searchVal : searchVal},
				success : function(res){
					$('#myMovie').html('');
					$('#myMovie').append('<div>총 '+ res.length + '건</div>');
					let str = "";
					for(let i = 0; i < res.length; i++){
					console.log(res[i].MOVIE_MAINPIC_PATH);
						str = "";
						str +=    '<div class="card-body row" style="padding-rigth: 0; border: 1px solid #503396">'
								+ '<div class="col-2" style="background: url('+ "'"+contextPath+'/sysAdmin/getPicture.do?name=' + res[i].MOVIE_MAINPIC_PATH + '&item_cd=' + res[i].MOVIE_CD + '&type=moviePoster' + "')" + 'no-repeat left /cover"></div>'
								+ '<div class="col-5">'
								+	'<span><strong>예매번호 </strong>' + res[i].MERCHANT_UID + '</span>'
								+	'<br><br>'
								+	'<span><strong>영화명 </strong>' + res[i].MOVIE_NAME + '</span>'
								+	'<br><br>'
								+	'<span><strong>극장/상영관 </strong>' + res[i].THR_NAME + '/' + res[i].HOUSE_NAME + '</span>'
								+	'<br><br>'
								+	'<span><strong>관람일시 </strong>' + moment(res[i].STARTDATE).format("YYYY-MM-DD HH:mm:ss") + '</span>'
								+	'<br><br>'
								+	'<span><strong>결제일시 </strong>' + moment(res[i].RESDATE).format("YYYY-MM-DD HH:mm:ss") + '</span>'
								+ '</div>'
								+ '<div class="col-4 ">'
								+	'<br><br>'
								+	'<br><br>'
								+	'<span><strong>관람인원 </strong>' + res[i].MEM_CAT + '</span>'
								+	'<br><br>'
								+	'<span><strong>관람좌석 </strong>' + res[i].RES_SEAT + '</span>'
								+	'<br><br>'
								if(res[i].REFUNDDATE == null){
									str += '<span><strong>취소일시 </strong> - </span>'
								}
								if(res[i].REFUNDDATE != null){
									str += '<span><strong>취소일시 </strong>' +  res[i].REFUNDDATE + '</span>'
								}
							+	'</div>'
						+	'</div>'
						+ '</div>'
						+ '<br>';
						$('#myMovie').append(str);
					};
				},
				error : function(err){
					console.log(err.status);
				}
			})
		}
	});
	
	$('#buyYMSearchBtn').on('click', function(){
		let searchVal = $('select[name=buyYM]').val();
		$.ajax({
			url : "<%=request.getContextPath()%>/member/searchBuyDate.do",
			method : "post",
			data : {searchVal : searchVal},
			success : function(res){
				console.log(res);
			},
			error : function(err){
				console.log(err.status);
			}
		})
	});
});
</script>
<%@ include file="../include/member_footer.jsp" %>