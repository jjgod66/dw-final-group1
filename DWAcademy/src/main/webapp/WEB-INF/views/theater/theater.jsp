<%@page import="java.util.Map"%>
<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../include/header.jsp"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
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

.accordion-list {
	border-top: 1px solid #555
}

.accordion-list a {
	text-decoration: none;
	display: inline-block;
	color: #444
}

.accordion-list ul li div.title {
	position: relative;
	box-sizing: border-box;
	border-bottom: 1px solid #eaeaea;
	font-weight: 400
}

.accordion-list ul li div.title.on {
	background-color: #f2f4f5;
	background-color: transparent
}

.accordion-list ul li div.title.on:after {
	transform: rotate(180deg)
}

.accordion-list ul li div.title a {
	display: block;
	width: 100%;
	padding: 15px 0 15px 20px;
	overflow: hidden
}

.accordion-list ul li div.title p {
	float: left;
	padding: 0;
	margin: 0;
	text-align: center
}

.accordion-list ul li div.title div.cont-tit {
	width: 800px;
	text-align: left;
	float: left;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	padding-right: 30px
}

.accordion-list ul li div.title p.cont-admin {
	width: 110px
}

.accordion-list ul li div.title p.cont-date {
	width: 110px
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


h2.tit.small {
	padding: 0 0 16px 0;
	font-size: 1.4666em;
	font-weight: 550;
	color: #4aa8d8
}

.theater-info-text {
	padding: 0;
	border-bottom: 1px solid #ebebeb
}

.theater-info-text p {
	margin: 0;
	padding: 0
}

.theater-info-text .big {
	padding: 0 0 20px 0;
	font-size: 1.8666em
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

.event-box ul li a {
    overflow: hidden;
    display: block;
    border: 1px solid #e4e4e4;
    border-radius: 10px;
    min-height: 364px;
}

.event-box ul li {
    position: relative;
    float : left;
    width: 23%;
    margin: 0 0 0 20px;
    padding: 0;
}

.event-box ul {
    overflow: hidden;
}

.event-box ul li a .img img {
    width: 100%!important;
    height: 243px!important;
}
.event-box ul li a .tit {
    overflow: hidden;
    height: 60px;
    margin: 0 0 10px 0;
    padding: 20px 17px 0 17px;
    line-height: 1.3;
    font-weight: 700;
    color: #222;
}

.event-box ul li a .date {
    padding: 0 17px 20px 17px;
    font-size: .8667em;
    line-height: 1.1;
    color: #666;
}
.event-box p {
    display: block;
    margin: 0;
    padding: 0;
}

.location-map-btn>div {
	padding: 0;
	margin: 0
}

.location-map-btn a:before {
	content: '';
	display: inline-block;
	width: 10px;
	height: 17px;
	background:
		url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-location-map.png)
		0 0 no-repeat;
	padding-right: 3px;
	vertical-align: middle
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
				<li class="on"><a href="<%=request.getContextPath()%>/theater/theater.do?thr_name=${theater.thr_name}" title="극장정보 탭으로 이동">극장정보</a></li>
				<li><a href="<%=request.getContextPath()%>/theater/screenSchedule.do?thr_name=${theater.thr_name}" title="상영시간표 탭으로 이동">상영시간표</a></li>
				<li><a href="<%=request.getContextPath()%>/theater/price.do?thr_name=${theater.thr_name}" title="관람료 탭으로 이동">관람료</a></li>
			</ul>
		</div>

		<div class="tab-cont-wrap">
			<div id="tab01" class="tab-cont on">
				<div class="theater-info-text mt40">
					<p style="font-size: 20px;">
						${fn:replace(theater.thr_info, replaceChar, "<br/>")}
					</p>
				</div>
				<h2 class="tit small mt70">위치안내</h2>
				<h3 class="tit small">약도</h3>
				<div id="map" style="width:300px;height:300px;"></div>
				<ul class="dot-list" style="margin: 10px 0;">
					<li><span class="font-gblue">도로명주소 : </span>
						${theater.thr_addr } ${theater.thr_addr_detail }</li>
				</ul>
				<div class="location-map-btn mt15">
					<div class="btn-group left">
						<a
							href="https://map.kakao.com/link/to/DW시네마${theater.thr_name },${theater.thr_y },${theater.thr_x}"
							class="button blue" target="_blank" title="새창열림">실시간 길찾기</a>
					</div>
				</div>
			</div>
		</div>
		<!--// location-info -->
		<div class="tit-util" style="border-bottom: solid 1px black; padding-bottom: 10px;">
			<h2 class="tit small">이벤트</h3>
			<div class="float-end">
				<a href="/event/theater.do?keyword=${theater.thr_name }" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div class="event-box" style="margin-top:20px;">
			<c:if test="${empty eventList }">
				<div style="text-align: center; margin: 50px 0;">이벤트가 없습니다.</div>
			</c:if>
			<c:if test="${!empty eventList }">
				<ul>
					<c:forEach items="${eventList }" var="event">
						<li>
							<a href="<%=request.getContextPath()%>/event/eventDetail.do?event_no=${event.event_no}" data-no="13565" data-netfunnel="N" class="eventBtn" title=${event.event_title}">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="<%=request.getContextPath() %>/common/getPicture.do?name=${event.event_thum_path}&item_cd=${event.event_no}&type=eventThumb" alt="${event.event_title}" onerror="noImg(this);"></p>
								<p class="tit">
									${event.event_title}
								</p>
								<p class="date">
									<fmt:formatDate value="${event.startdate}" pattern="yyyy-MM-dd"/> ~ 
									<fmt:formatDate value="${event.enddate}" pattern="yyyy-MM-dd"/>
								</p>
							</a>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
		<div class="tit-util">
			<h2 class="tit small">공지사항</h3>
			<div class="float-end">
				<a href="/support/notice.do?searchType=지점&keyword=${theater.thr_name  }" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div id="brchNoti" style="margin-bottom : 20px;">
<!-- 			<h2 class="tit small mt70">공지사항</h2> -->
			<!-- accordion-list -->
			<div class="accordion-list">
				<c:if test="${empty noticeList }">
					<div style="text-align: center; margin: 50px 0;">공지사항이 없습니다.</div>
				</c:if>
				<c:if test="${!empty noticeList }">
					<ul>
						<c:forEach items="${noticeList }" var="notice">
							<li>
								<div class="title ">
									<a href="<%=request.getContextPath()%>/support/noticeMini_Detail.do?notice_no=${notice.notice_no }" title="${notice.notice_title }">
										<div class="cont-tit">${notice.notice_title }</div>
										<p class="cont-admin">${notice.notice_thr }</p>
										<p class="cont-date"><fmt:formatDate value="${notice.regdate }" pattern="yyyy-MM-dd"/> </p>
									</a>
								</div>
							</li>
						</c:forEach>
						
					</ul>
				</c:if>
			</div>
			<!--// accordion-list -->
		</div>
	</div>

</div>

<script>
var container = document.getElementById('map');
var options = {
	center: new kakao.maps.LatLng(${theater.thr_y}, ${theater.thr_x}),
	level: 3
};

var map = new kakao.maps.Map(container, options);

var markerPosition  = new kakao.maps.LatLng(${theater.thr_y}, ${theater.thr_x}); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition
});

marker.setMap(map);

mem_cd = '<%=mem_cd%>';
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
					$('#alertContent').text("5개까지 가능합니다.");
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