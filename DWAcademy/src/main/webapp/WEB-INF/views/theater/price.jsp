<%@page import="java.util.Map"%>
<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp"%>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b454d2cc25dc49cf0d959c1f64b6aad"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

<style>
.tit-util {
    margin: 50px 0 10px;
}
.tit-util:after {
    clear: both;
}
.tit-util:after, .tit-util:before {
    content: '';
    display: block;
}

.tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}
.tit-util .float-end a {
    color: #333;
}


.inner-wrap {
	width: 1100px;
	margin: 0 auto
}

.inner-wrap:after, .inner-wrap:before {
	content: '';
	display: table
}

.inner-wrap:after {
	clear: both
}


.tab-list {
	position: static;
	width: 100%;
	background-color: rgba(255, 255, 255)
}

.tab-list:after, .tab-list:before {
	content: '';
	display: table
}

.tab-list:after {
	clear: both
}

.tab-list>ul {
	position: relative;
	width: 100%;
	height: 42px
}

.tab-list>ul:after {
	content: '';
	display: block;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: 2;
	width: 100%;
	height: 1px;
	background-color: #4aa8d8
}

.tab-list>ul>li {
	float: left;
	height: 42px;
	margin: 0;
	border: 1px solid #ebebeb;
	border-width: 1px 0 1px 1px
}

.tab-list>ul>li:last-child {
	border-right: 1px solid #ebebeb
}

.tab-list>ul>li.on {
	border: 1px solid #4aa8d8;
	border-bottom: 0
}

.tab-list>ul>li>a {
	position: relative;
	display: block;
	width: 100%;
	height: 41px;
	line-height: 40px;
	padding: 0;
	text-align: center;
	color: #222;
	font-size: 1.0667em;
	text-decoration: none
}

.tab-list>ul>li>a.disabled {
	color: #787878;
	background-color: #f3f4f5
}

.tab-list>ul>li.on>a {
	z-index: 3;
	color: #4aa8d8;
	background-color: #fff
}

.tab-list>ul>li.on>a:active, .tab-list>ul>li.on>a:focus, .tab-list>ul>li.on>a:hover,
	.tab-list>ul>li.on>a:visited {
	color: #4aa8d8;
	text-decoration: none
}

.tab-list>ul>li.on+li {
	border-left: 0
}

.tab-list>ul>li:first-child:nth-last-child(1), .tab-list>ul>li:first-child:nth-last-child(1)
	~li{
	width: 100%
}

.tab-list>ul>li:first-child:nth-last-child(2), .tab-list>ul>li:first-child:nth-last-child(2)
	~li{
	width: 50%
}

.tab-list>ul>li:first-child:nth-last-child(3) {
	width: 33.334%
}

.tab-list>ul>li:first-child:nth-last-child(3) ~li{
	width: 33.333%
}

.tab-list>ul>li:first-child:nth-last-child(4), .tab-list>ul>li:first-child:nth-last-child(4)
	~li{
	width: 25%
}

.tab-list>ul>li:first-child:nth-last-child(5), .tab-list>ul>li:first-child:nth-last-child(5)
	~li{
	width: 20%
}

.tab-list>ul>li:first-child:nth-last-child(6) {
	width: 17%
}

.tab-list>ul>li:first-child:nth-last-child(6) ~li{
	width: 16.6%
}

.tab-list>ul>li:first-child:nth-last-child(7) {
	width: 14.32%
}

.tab-list>ul>li:first-child:nth-last-child(7) ~li{
	width: 14.28%
}

.tab-list>ul>li:first-child:nth-last-child(8), .tab-list>ul>li:first-child:nth-last-child(8)
	~li{
	width: 12.5%
}

.tab-list.fixed.on {
	position: fixed;
	left: 0;
	right: inherit;
	top: 42px;
	z-index: 50;
	width: 100%;
	background-color: rgba(255, 255, 255, .9);
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, .12)
}

.tab-list.fixed.on>ul {
	width: 1100px;
	margin: 0 auto
}

.tab-list.fixed.on>ul:after {
	display: none
}

.tab-list.fixed.on>ul>li {
	width: auto !important;
	margin: 0 0 0 40px;
	border: 0
}

.tab-list.fixed.on>ul>li:first-child {
	margin-left: 0
}

.tab-list.fixed.on>ul>li a {
	height: 100%;
	border-bottom: 2px solid transparent
}

.tab-list.fixed.on>ul>li.on {
	background-color: transparent
}

.tab-list.fixed.on>ul>li.on a {
	background-color: transparent;
	border-color: #4aa8d8;
}

h2.tit.small {
	padding: 0 0 16px 0;
	font-size: 1.4666em;
	font-weight: 550;
	color: #4aa8d8
}

.pt40 {
    padding-top: 40px!important;
}
.mb40 {
	margin-bottom: 40px;
}

.mt70 {
	margin-top: 70px;
}

.button.blue {
    color: #fff;
    line-height: 36px;
    border: 0;
    background: #4aa8d8;
}

.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #4aa8d8;
    font-weight: 400;
    border-radius: 4px;
    text-decoration: none;
    border: 1px solid #4aa8d8;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}

a {
    text-decoration: none;
}

h3.tit.small {
    padding: 0 0 10px 0;
    font-size: 1.2em;
    color: #222;
}

.font-gblue {
    color: #4aa8d8!important;
}

.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}

.fee-table-box {
	width: 100%;
	overflow: hidden;
	margin-bottom: 30px
}

.fee-table-box .fee-table-tit {
	position: relative;
	margin: 0;
	padding: 0 0 10px 8px;
	line-height: 1.1
}

.fee-table-box .fee-table-tit:before {
	content: '';
	display: block;
	position: absolute;
	top: 5px;
	left: 0;
	background-color: #503396;
	width: 3px;
	height: 3px
}

.fee-table-box .fee-table {
	width: 530px;
	float: left
}

.fee-table-box .fee-table td, .fee-table-box .fee-table th {
	padding: 10px 0
}

.fee-table-box .fee-table th {
	text-align: center !important
}

.fee-table-box .fee-table:nth-child(odd) {
	margin-right: 40px
}
.table-wrap {
	position: relative;
	border-top: 1px solid #555
}
.data-table td, .data-table th, .data-table tr {
	padding: 10px 20px
}

.data-table th.bg {
	padding: 10px 20px;
	background-color: #f7f8f9
}

.data-table thead th {
	border-right: 1px solid #eaeaea;
	border-bottom: 1px solid #eaeaea;
	background-color: #f7f8f9
}

.data-table thead th:last-child {
	border-right: 0
}

.data-table tbody th {
	padding: 0;
	text-align: left;
	vertical-align: middle;
	border-right: 1px solid #eaeaea;
	border-bottom: 1px solid #eaeaea
}

.data-table tbody td {
	border-right: 1px solid #eaeaea;
	border-bottom: 1px solid #eaeaea
}

.data-table tbody td:last-child {
	border-right: 0
}

.data-table.bg tbody th {
	padding: 0 15px;
	background-color: #f7f8f9
}
.a-c {
	text-align: center !important
}
.theater-detail-page .theater-all .btn-util .btn {
	display: inline-block;
	min-width: 100px;
	height: 36px;
	line-height: 34px;
	margin: 0 6px 0 0;
	padding: 0 10px;
	font-size: .9333em;
	color: #fff;
	text-decoration: none;
	text-align: center;
	border: 1px solid #706f72;
	border-radius: 4px;
	background-color: rgba(0, 0, 0, .4)
}

.theater-detail-page .btn:hover {
	color: #222;
	background-color: #fff
}

.theater-detail-page .btn.btn-like .ico-like-line
	{
	margin-right: 4px
}

.theater-detail-page .btn.btn-like {
	display: block;
	right: 0;
	top: 107px;
	width: auto;
	padding: 0 20px
}

.theater-detail-page .btn.btn-like span {
	display: inline
}


.theater-detail-page .btn {
    display: inline-block;
    min-width: 100px;
    height: 36px;
    line-height: 34px;
    margin: 0 6px 0 0;
    padding: 0 10px;
    font-size: .9333em;
    color: #fff;
    text-decoration: none;
    text-align: center;
    border: 1px solid #706f72;
    border-radius: 4px;
    background-color: rgba(0,0,0,.4);
}
</style>
<%
	mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		Map member = (Map) session.getAttribute("loginUser");
		mem_cd = (String)member.get("CD");
	}
%>
<%@ include file="login_service_modal.jsp" %>
<%@ include file="alert_modal.jsp" %>
<div id="contents" class="no-padding">

	<div class="sub_visual theater-detail-page">
	    <h3>${theater.thr_name }</h3>
	    <button type="button" class="btn btn-like click" style="margin: 20px auto;">
			<i class="fa-regular fa-bookmark noneThLikeIcon"></i>
			<i class="fa-solid fa-bookmark ThLikeIcon" style="color: #4aa8d8; display: none"></i>
			<span> 선호극장</span>
	
			
		</button>
    </div>

	<div class="inner-wrap pt40">

		<div class="tab-list fixed mb40 tab-layer">
			<ul>
				<li><a href="<%=request.getContextPath()%>/theater/theater.do?thr_name=${theater.thr_name}" title="극장정보 탭으로 이동">극장정보</a></li>
				<li><a href="<%=request.getContextPath()%>/theater/screenSchedule.do?thr_name=${theater.thr_name}" title="상영시간표 탭으로 이동">상영시간표</a></li>
				<li class="on"><a href="#tab03" title="<%=request.getContextPath()%>/theater/price.do?thr_name=${theater.thr_name}">관람료</a></li>
			</ul>
		</div>

		<div class="tab-cont-wrap">

				<div id="tab03" class="tab-cont on" style="margin-bottom: 50px;">
					<h2 class="tit small">영화관람료</h2>
					<div class="fee-table-box">
						<div class="fee-table">
							<p class="fee-table-tit">2D</p>
							<div class="table-wrap">
								<table class="data-table a-c" summary="가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다." style="width: 100%;">
									<caption>가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다.</caption>
									<colgroup>
										<col>
										<col style="width: 25%;">
										<col style="width: 25%;">
										<col style="width: 25%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">요일</th>
											<th scope="col">상영시간</th>
											<th scope="col">일반</th>
											<th scope="col">청소년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="rowgroup" rowspan="2">월~목</th>
											<td>조조 (06:00~)</td>
											<td>12,000</td>
											<td>10,000</td>
										</tr>
										<tr>
											<td>일반 (10:01~)</td>
											<td>14,000</td>
											<td>12,000</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="2">금~일<br>공휴일
											</th>
											<td>조조 (06:00~)</td>
											<td>12,000</td>
											<td>10,000</td>
										</tr>
										<tr>
											<td>일반 (10:01~)</td>
											<td>14,000</td>
											<td>12,000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="fee-table">
							<p class="fee-table-tit">3D</p>
							<div class="table-wrap">
								<table class="data-table a-c" summary="가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다." style="width: 100%;">
									<caption>가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다.</caption>
									<colgroup>
										<col>
										<col style="width: 25%;">
										<col style="width: 25%;">
										<col style="width: 25%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">요일</th>
											<th scope="col">상영시간</th>
											<th scope="col">일반</th>
											<th scope="col">청소년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="rowgroup" rowspan="2">월~목</th>
											<td>조조 (06:00~)</td>
											<td>12,000</td>
											<td>10,000</td>
										</tr>
										<tr>
											<td>일반 (10:01~)</td>
											<td>14,000</td>
											<td>12,000</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="2">금~일<br>공휴일
											</th>
											<td>조조 (06:00~)</td>
											<td>12,000</td>
											<td>10,000</td>
										</tr>
										<tr>
											<td>일반 (10:01~)</td>
											<td>14,000</td>
											<td>12,000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<h2 class="tit small">요금제</h2>
					• <span style="color: #01738b">청소년 요금</span>&nbsp; 만7세~만18세 : 초등학생~고등학생(학생증, 교복, 청소년증, 의료보험증, 주민등록 등/초본, 그 외 청소년 확인 가능 서류)<br>
					• 48개월 미만의 경우 증빙원(예 : 의료보험증, 주민등록 초/등본 등) 지참 시에만 무료 관람 가능<br>
					<br> <br>
					<h2 class="tit small">우대적용</h2>
					 • <span style="color: #01738b">국가유공자</span>&nbsp; 현장에서 국가유공자증을 소지한 본인 외 동반 1인까지 적용<br>
					 • <span style="color: #01738b">장애인</span>&nbsp; 현장에서 복지카드를 소지한 장애인[중증 (1급~3급)까지 동반 1인까지 적용 / 경증(4급~6급)은 본인에 한함]<br>
					 • <span style="color: #01738b">경로</span>&nbsp; 만65세 이상 본인에 한함(신분증 확인)<br> 
					 • <span style="color: #01738b">미취학아동</span>&nbsp; 부모 동반한 만4세~ 만6세까지 본인(의료보험증, 주민등록 초/등본 확인)<br> 
					 • <span style="color: #01738b">소방종사자</span>&nbsp; 공무원증을 소지하거나 정복을 입은 소방관 본인
				</div>
			</div>
		</div>

</div>

<script>

let mem_cd = '<%=mem_cd%>';
let thr_name = '${theater.thr_name}';
$(function(){
	if(mem_cd != ''){
		
		$.ajax({
			url : '<%=request.getContextPath()%>/theater/likeThrYN.do',
			method : 'post',
			data : {"thr_name" : thr_name},
			success : function(res){
				if(res == 'Y'){
					$('.noneThLikeIcon').css('display', 'none');
					$('.ThLikeIcon').css('display', '');
				}
			},
			error : function(err){
				alert(errstatus);
			}
		});
		
	}
	
	$('.btn-like').on('click', function(){
		if(mem_cd == ''){
			$('#login-service-modal').modal("show");
			return;
		}
		
		$.ajax({
			url: '<%=request.getContextPath()%>/theater/likeThr.do',
			method : 'post',
			data : {'thr_name' : thr_name},
			success : function(res){
				console.log(res);
				if(res == 'over'){
					$('#alertContent').text("5개까지 선택 가능합니다.");
					$('#alert-modal').modal('show');
				}else if(res == 'like'){
					$('.noneThLikeIcon').css('display', 'none');
					$('.ThLikeIcon').css('display', '');
				}else{
					$('.ThLikeIcon').css('display', 'none');
					$('.noneThLikeIcon').css('display', '');
				}
			},
			error : function(err){
				alert(err.status);
			}
		});
		
		
	})
})
</script>
<%@ include file="../include/footer.jsp"%>