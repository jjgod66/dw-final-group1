<%@page import="java.util.Map"%>
<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp"%>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>

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
.schedule-slider {
    padding: 40px 60px;
    position: relative;
    background: #fff;
    border-bottom: 1px solid #eee;
}

.swiper-container {
    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    list-style: none;
    padding: 0;
    z-index: 1;
}

.swiper-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
    z-index: 1;
    display: flex;
    transition-property: transform;
    box-sizing: content-box;
}

.swiper-slide {
    flex-shrink: 0;
    width: 100%;
    height: 100%;
    position: relative;
    transition-property: transform;
}

.schedule-slider a {
    display: block;
    text-align: center;
}
a {
    text-decoration: none;
}

.schedule-slider a .time {
    width: 39px;
    margin: 0 auto;
}

.schedule-slider a.active .time strong {
    background: #000;
    color: #fff;
}
.schedule-slider a .time strong {
    display: block;
    margin: 0 auto;
    width: 39px;
    height: 39px;
    line-height: 38px;
    font-size: 21px;
    color: #333;
    border-radius: 100%;
    transition: all 0.3s ease;
}

.schedule-slider a.active .time p {
    color: #000;
    font-weight: 600;
}
.schedule-slider a .time p {
    font-size: 14px;
    color: #9b9b9b;
    transition: all 0.3s ease;
}

.schedule-slider a.disabled .time strong {
    color: #dbdbdb;
}

.theater-list {
    position: relative;
}

.theater-tit {
    width: 100%;
    overflow: hidden;
    background-color: #fff;
    display: block;
    padding: 10px 20px;
    background-color: #f7f8f9;
    border-top: 1px solid #eaeaea!important;
    border-bottom: 1px solid #eaeaea;
    margin-top: -1px!important;
    margin-bottom: 20px;
}

.theater-tit p.infomation {
    float: right;
}
.theater-tit p {
    float: left;
    padding: 0;
    margin: 0 5px 0 0;
    font-weight: 400;
}

.theater-tit p.infomation span {
    color: #01738b;
}

.theater-list .theater-type-box {
    overflow: hidden;
    width: 100%;
    position: relative;
    border-bottom: 1px solid #eaeaea;
}
.theater-list .theater-type-box .theater-type {
    text-align: left;
    width: 170px;
    display: table-cell;
    vertical-align: middle;
    position: absolute;
    top: 20px;
    left: 0;
    padding: 0!important;
    float: left;
}
.theater-list .theater-type-box .theater-type p.theater-name {
    font-size: 1.2em;
    color: #444;
    font-weight: 400;
    margin-bottom: 10px;
    line-height: 1em;
}
.theater-list .theater-type-box .theater-type p {
    padding: 0;
    margin: 0;
}

.theater-list .theater-type-box .theater-type p.chair {
    color: #666;
    margin-bottom: 10px;
    line-height: 1em;
}

.theater-list .theater-type-box .theater-time {
    width: 100%;
    float: left;
    margin: 20px 0 20px 190px;
}
.theater-list .theater-type-box .theater-time-box {
    display: table-cell;
    width: 800px;
}

.theater-list .theater-type-box .theater-time .time-list-table {
    border-top: 1px solid #ebebeb;
    border-left: 1px solid #ebebeb;
    width: 800px;
    margin-left: 9px;
    width: auto;
    table-layout: auto;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.theater-list .theater-type-box .theater-time .time-list-table tbody tr td {
    width: 99px;
    border-right: 1px solid #ebebeb;
    border-bottom: 1px solid #ebebeb;
    text-align: center;
}
.theater-list .theater-type-box .theater-time .time-list-table tbody tr td:hover {
    background-color: #ebebeb;
}

.theater-list .theater-type-box .theater-time .time-list-table tbody tr td .td-ab {
    width: 100%;
    height: 69px;
    display: table;
}

.theater-list .theater-type-box .theater-time .time-list-table tbody tr td .td-ab .txt-center {
    display: table-cell;
    vertical-align: middle;
    position: relative;
}

.theater-list .theater-type-box .theater-time .time-list-table tbody tr td .td-ab .txt-center a {
    display: inline-block;
    width: 100%;
}

.theater-list .theater-type-box .theater-time .time-list-table tbody tr td .td-ab p.time {
    font-size: 1.2em;
    color: #444;
    font-weight: 400;
    line-height: 1em;
    font-family: Roboto;
}
.theater-list .theater-type-box .theater-time .time-list-table tbody tr td .td-ab p {
    padding: 0;
    margin: 0;
}

.theater-list .theater-type-box .theater-time .time-list-table tbody tr td .td-ab p.chair {
    color: #01738b;
}
.theater-list .theater-type-box .theater-time .time-list-table tbody tr td .td-ab p {
    padding: 0;
    margin: 0;
}

.theater-list .theater-type-box .theater-type-area {
    display: table-cell;
    vertical-align: middle;
    width: 100px;
    background-color: #f2f4f5;
    text-align: center;
    color: #444;
    font-weight: 700;
    border-bottom: 0;
}

a {
	color : black;
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
<%@ include file="../include/login_modal.jsp" %>
<%@ include file="../include/nonMember_reservationModal.jsp" %>
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
				<li class="on"><a href="<%=request.getContextPath()%>/theater/screenSchedule.do?thr_name=${theater.thr_name}" title="상영시간표 탭으로 이동">상영시간표</a></li>
				<li><a href="<%=request.getContextPath()%>/theater/price.do?thr_name=${theater.thr_name}" title="관람료 탭으로 이동">관람료</a></li>
			</ul>
		</div>

		<div class="tab-cont-wrap">
			<div class="schedule-slider">
                <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                    <div class="swiper-wrapper" id="swiper-wrapper"><div class="swiper-slide swiper-slide-active" style="width: 52.8px;"><a href="#" class="btnDay" data-dt="2023-07-21"><div class="time"><strong>21</strong><p>금</p></div></a></div><div class="swiper-slide swiper-slide-next" style="width: 52.8px;"><a href="#" class="btnDay active" data-dt="2023-07-22"><div class="time"><strong>22</strong><p>토</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay  " data-dt="2023-07-23"><div class="time"><strong>23</strong><p>일</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay  " data-dt="2023-07-24"><div class="time"><strong>24</strong><p>월</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay  " data-dt="2023-07-25"><div class="time"><strong>25</strong><p>화</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay  " data-dt="2023-07-26"><div class="time"><strong>26</strong><p>수</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay disabled " data-dt="2023-07-27"><div class="time"><strong>27</strong><p>목</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay disabled " data-dt="2023-07-28"><div class="time"><strong>28</strong><p>금</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay disabled " data-dt="2023-07-29"><div class="time"><strong>29</strong><p>토</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay disabled " data-dt="2023-07-30"><div class="time"><strong>30</strong><p>일</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay disabled " data-dt="2023-07-31"><div class="time"><strong>31</strong><p>월</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay disabled " data-dt="2023-08-01"><div class="time"><strong>1</strong><p>화</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay disabled " data-dt="2023-08-02"><div class="time"><strong>2</strong><p>수</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay disabled " data-dt="2023-08-03"><div class="time"><strong>3</strong><p>목</p></div></a></div><div class="swiper-slide" style="width: 52.8px;"><a href="#" class="btnDay disabled " data-dt="2023-08-04"><div class="time"><strong>4</strong><p>금</p></div></a></div></div>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
		</div>
		<div id="movieShow">
			<c:if test="${empty allScreenList }">
				<div class="theater-list" style="text-align: center; margin: 20px 0;">
				해당 날짜에 상영하는 영화가 없습니다.
				</div>
			</c:if>
			<c:forEach items="${allScreenList }" var="movie">
				<div class="theater-list">
					<div class="theater-tit">
						<div style="display: inline; float: left; margin-right: 10px;">
					 	<c:if test="${movie[0][0].MOVIE_GRADE  eq '전체 관람가'}"><img src="../../resources/img/moviegrade/ALL.png" style="width: 23px; height: 23px;"></c:if>
	                    <c:if test="${movie[0][0].MOVIE_GRADE eq '12세 관람가'}"><img src="../../resources/img/moviegrade/12.png" style="width: 23px; height: 23px;"></c:if>
	                    <c:if test="${movie[0][0].MOVIE_GRADE eq '15세 관람가'}"><img src="../../resources/img/moviegrade/15.png" style="width: 23px; height: 23px;"></c:if>
	                    <c:if test="${movie[0][0].MOVIE_GRADE eq '청소년 관람불가'}"><img src="../../resources/img/moviegrade/18.png" style="width: 23px; height: 23px;"></c:if>
						</div>
	<!-- 					<p class="movie-grade age-15"></p> -->
						<p>
							<a href="<%=request.getContextPath()%>/movie/viewer.do?movie_cd=${movie[0][0].MOVIE_CD }">${movie[0][0].MOVIE_NAME }</a>
						</p>
						<p class="infomation">
							상영시간 ${movie[0][0].MOVIE_LENGTH }분
						</p>
					</div>
					<c:forEach items="${movie }" var="house">
						<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">${house[0].HOUSE_NAME }</p>
									<p class="chair">총 ${house[0].HOUSE_ROW * house[0].HOUSE_COLUMN } 석</p>
								</div>
							<div class="theater-time">
								<div class="theater-time-box">
									<table class="time-list-table">
										<tbody>
											<tr>
												<c:forEach items="${house }" var="screen">
													<td>
														<div class="td-ab">
															<div class="txt-center">
																<a href="javascript:screenDetail('${screen.SCREEN_CD}');" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																		<p>
																		<c:if test="${screen.MOVIE_TYPE_DES eq '없음/2D'}">2D</c:if>
																		<c:if test="${screen.MOVIE_TYPE_DES eq '없음/3D'}">3D</c:if>
																		<c:if test="${screen.MOVIE_TYPE_DES ne '없음/2D' and screen.MOVIE_TYPE_DES ne '없음/3D'}">${screen.MOVIE_TYPE_DES }</c:if>
																		</p>
																	<p class="time"><fmt:formatDate value="${screen.STARTDATE }" pattern="HH:mm"/></p>
																	<p class="chair">${screen.HOUSE_ROW * screen.HOUSE_COLUMN - screen.RESERVER } 석</p>
																	<div class="play-time">
																	</div>
																</a>
															</div>
														</div>
													</td>
												</c:forEach>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</c:forEach>
		
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>

let mem_cd = '<%=mem_cd%>';
let thr_name = '${theater.thr_name}';
$(function(){
	$('#swiper-wrapper').on('click', '.btnDay.abled', function(){
		let date = $(this).data('dt');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/theater/scheduleDay.do',
			method : 'post',
			data : {"date" : date, "thr_name" : thr_name},
			success : function(res){
				console.log(res);
				scheduleSetting(res);
			},
			error : function(err){
				alert(err.status);
			}
		})
	})

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

function scheduleSetting(res){
	let app = '';
	
	for(let i = 0; i < res.length; i++){
		app += '<div class="theater-list">';
		app += '<div class="theater-tit">';
		app += 	'<div style="display: inline; float: left; margin-right: 10px;">'
		if(res[i][0][0].MOVIE_GRADE == '전체 관람가'){
			app += '<img src="../../resources/img/moviegrade/ALL.png" style="width: 23px; height: 23px;">';
		}else if(res[i][0][0].MOVIE_GRADE == '12세 관람가'){
			app += '<img src="../../resources/img/moviegrade/12.png" style="width: 23px; height: 23px;">';
		}else if(res[i][0][0].MOVIE_GRADE == '15세 관람가'){
			app += '<img src="../../resources/img/moviegrade/15.png" style="width: 23px; height: 23px;">';
		}else{
			app += '<img src="../../resources/img/moviegrade/18.png" style="width: 23px; height: 23px;">';
		}
		app += '</div>';	
		app += '<p>';
		app += '<a href="<%=request.getContextPath()%>/movie/viewer.do?movie_cd=' + res[i][0][0].MOVIE_CD + '">' + res[i][0][0].MOVIE_NAME + '</a>';
		app += '</p>';
		app += '<p class="infomation">';
		app += '상영시간 ' + res[i][0][0].MOVIE_LENGTH + '분';
		app += '</p>';
		app += '</div>';	
		
		for(let j = 0; j < res[i].length; j++){
			app += '<div class="theater-type-box">';
			app += '<div class="theater-type">';
			app += '<p class="theater-name">' + res[i][j][0].HOUSE_NAME + '</p>';
			app += '<p class="chair">총 ' + res[i][j][0].HOUSE_ROW * res[i][j][0].HOUSE_COLUMN + ' 석</p>';
			app += '</div>';
			app += '<div class="theater-time">';
			app += '<div class="theater-time-box">';
			app += '<table class="time-list-table">';
			app += '<tbody>';
			app += '<tr>';
			for(let k = 0; k < res[i][j].length; k++){
				app += '<td>';
				app += '<div class="td-ab">';
				app += '<div class="txt-center">';
				app += '<a href="javascript:screenDetail(\'' + res[i][j][k].SCREEN_CD + '\');" title="영화예매하기">';
				app += '<div class="ico-box">';
				app += '<i class="iconset ico-off"></i>';
				app += '</div>';
				app += '<p>';
				if(res[i][j][k].MOVIE_TYPE_DES == '없음/2D'){
					app += '2D';
				}else if(res[i][j][k].MOVIE_TYPE_DES == '없음/3D'){
					app += '3D';
				}else{
					app += res[i][j][k].MOVIE_TYPE_DES;
				}
				app += '</p>';
				let date = new Date(res[i][j][k].STARTDATE);
				let hour = date.getHours();
				if(hour < 10){
					hour = '0' + hour;
				}
				let min = date.getMinutes();
				if(min < 10){
					min = '0' + min;
				}
				app += '<p class="time">' + hour + ':' + min + '</p>';
				let reSeats = res[i][j][k].HOUSE_ROW * res[i][j][k].HOUSE_COLUMN;
				if(res[i][j][k].RESERVER > 0){
					reSeats -= res[i][j][k].RESERVER;
				}
				app += '<p class="chair">' + reSeats + ' 석</p>';
				app += '<div class="play-time">';
				app += '</div>';
				app += '</a>';
				app += '</div>';
				app += '</div>';
				app += '</td>';
				
			}
			app += '</tr>';
			app += '</tbody>';
			app += '</table>';
			app += '</div>';
			app += '</div>';
			app += '</div>';
		}
	 app += '</div>';
	}
	if(res.length == 0){
		app += '<div class="theater-list" style="text-align: center; margin: 20px 0;">';
		app += '해당 날짜에 상영하는 영화가 없습니다';
		app += '</div>';
	}
$('#movieShow').html(app);
}

function screenDetail(screen_cd){
	if(mem_cd == ''){
		$('#login-modal').modal('show');
		$('.NonMemReservationDiv').show();
		$('#nonMem_Modal_screen_cd').val(screen_cd);
// 		$('#login-service-modal').modal("show");
		return;
	}
	location.href="<%=request.getContextPath()%>/reservation/detail.do?screen_cd=" + screen_cd;
}
// 로그인 모달 닫히면 비회원예매하기 버튼 hide
$('#login-modal').on('hidden.bs.modal', function(){
	$('.NonMemReservationDiv').hide();
});
$('#nonMemReservationBtn').on('click', function(){
	$('#login-modal').modal('hide');
	$('#nonMember_reservationModal').modal('show');
	checkNonMemberNum = '';
	nonMemberPhone = '';
	nonMemberPhoneChecked = '';
});

// 요일 한글로 변환 함수
function getKoreanDayOfWeek(dayOfWeek) {
  const days = ['일', '월', '화', '수', '목', '금', '토'];
  return days[dayOfWeek];
}

// 현재 날짜 가져오기
var currentDate = new Date();

// 14일 후의 날짜 계산
var endDate = new Date();
endDate.setDate(currentDate.getDate() + 14);

// 날짜 리스트 생성
var dateList = [];

while (currentDate <= endDate) {
  var day = currentDate.getDate();
  var dayOfWeek = currentDate.getDay();

  // 요일을 한글로 변환
  var koreanDayOfWeek = getKoreanDayOfWeek(dayOfWeek);

  // 클래스 추가 여부 확인
  var isDisabled = currentDate > new Date(new Date().getTime() + 6 * 24 * 60 * 60 * 1000) ? 'disabled' : 'abled';
  var isActive = currentDate.toDateString() === new Date().toDateString() && !isDisabled ? 'active' : '';

  // 태그 생성
  var tag = '<div class="swiper-slide" style="width: 113.75px; margin-right: 10px;">' +
                '<a href="#" class="btnDay ' + isDisabled + ' ' + isActive + '" data-dt="' + currentDate.toISOString().split('T')[0].replace('-', '').replace('-', '') + '">' +
                    '<div class="time">' +
                        '<strong>' + day + '</strong>' +
                        '<p>' + koreanDayOfWeek + '</p>' +
                    '</div>' +
                '</a>' +
            '</div>';

  // 태그를 리스트에 추가
  dateList.push(tag);

  // 다음 날짜로 이동
  currentDate.setDate(currentDate.getDate() + 1);
}



// 날짜 태그를 swiper-wrapper에 추가
var wrapperElement = document.getElementById('swiper-wrapper');
wrapperElement.innerHTML = dateList.join('');

// .btnMovie 클래스를 가진 모든 버튼 엘리먼트를 선택합니다.
const btnMovies = document.querySelectorAll('.btnMovie');

// // 입력 요소를 선택합니다.
// const movieCdInput = document.querySelector('input[name="movieCd"]');

// // 각 버튼에 대해 클릭 이벤트 리스너를 추가합니다.
// $('.cinema-click').click(function(event) {
//   // 클릭된 버튼의 data-moviecd 속성 값을 가져옵니다.

//   $('.cinema-click').removeClass('active');
//   $(this).addClass('active');

// });

// btnDay 클래스 클릭 이벤트 처리
var btnDayList = document.getElementsByClassName('btnDay');
for (var i = 0; i < btnDayList.length; i++) {
  btnDayList[i].addEventListener('click', function(e) {
    e.preventDefault();

    // 현재 disabled 클래스가 적용된 버튼 확인
    var isDisabled = this.classList.contains('disabled');

    if (isDisabled) {
      return; // disabled 버튼이면 이벤트 종료
    }

    // 현재 active 클래스가 적용된 버튼 확인
    var currentActive = document.querySelector('.btnDay.active');

    // 현재 active 클래스 제거
    if (currentActive) {
      currentActive.classList.remove('active');
    }

    // 클릭한 버튼에 active 클래스 추가
    this.classList.add('active');

//     // 선택된 날짜에 해당하는 데이터 가져오기
//     var selectedDate = this.dataset.dt;

//     // 데이터를 갖고 있는 input 요소 가져오기
//     var movieDay = document.querySelector('input[name="movieDay"]');
//     if (movieDay) {
//       // 선택된 날짜 값을 input 요소의 value로 설정
//       movieDay.value = selectedDate;
//     }

//     // 각 극장에 대한 예매 시간 생성
//     for (var theaterNumber = 1; theaterNumber <= 4; theaterNumber++) {
//       createMovieTimes(theaterNumber, selectedDate);
//     }
  });
}

// Swiper 인스턴스 생성
var swiper = new Swiper('.swiper-container', {
  // 설정 옵션
  slidesPerView: 10
});

// 이전 버튼 클릭 이벤트 처리
var prevButton = document.querySelector('.swiper-button-prev');
prevButton.addEventListener('click', function() {
  swiper.slidePrev();
});

// 다음 버튼 클릭 이벤트 처리
var nextButton = document.querySelector('.swiper-button-next');
nextButton.addEventListener('click', function() {
  swiper.slideNext();
});
    
// 슬라이드 이동 시 버튼 활성화 여부 변경
swiper.on('slideChange', function() {
  if (swiper.isBeginning) {
    prevButton.classList.add('swiper-button-disabled');
  } else {
    prevButton.classList.remove('swiper-button-disabled');
  }

  if (swiper.isEnd) {
    nextButton.classList.add('swiper-button-disabled');
  } else {
    nextButton.classList.remove('swiper-button-disabled');
  }
});

// 현재 시간 가져오기
var currentTime = new Date();

// 현재 날짜 가져오기 (년-월-일 형식)
var currentDateString = new Date().toISOString().split("T")[0];


// // 초기 페이지 로드 시 오늘 날짜로 예매 시간 생성
// for (var theaterNumber = 1; theaterNumber <= 4; theaterNumber++) {
//   createMovieTimes(theaterNumber, currentDateString);
// }

</script>
<%@ include file="../include/footer.jsp"%>