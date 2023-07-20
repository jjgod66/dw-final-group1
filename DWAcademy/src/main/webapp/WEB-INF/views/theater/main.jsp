<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/theater_main.css">

<style>


.accordion-list {
	border-top: 1px solid #555;
	margin-bottom: 30px;
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

.accordion-list ul li div.title p.cont-thr {
	width: 110px;
	text-align: left;
	float: left;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	padding-right: 30px
	
}
.accordion-list ul li div.title p.cont-admin {
	width: 200px
}

.accordion-list ul li div.title p.cont-date {
	width: 110px
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
    width: 20%;
    margin: 0 0 0 65px;
    padding: 0;
}

.event-box ul {
    overflow: hidden;
    margin: 0 0 0 -60px;
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
.tab-list>ul>li{
    width: 14.285%;
}

.loctheater li{
	position: relative;
    float: left;
    width: 16.666%;
    line-height: 40px;
    text-align: left;
    padding-left: 40px;	
}
.loctheater ul{
	overflow: hidden;
    width: 100%;
}
</style>
<div class="sub_visual">
    <h3>전체극장</h3>
    <h6>whole theater</h6>
</div>
<div class="theater-wrapper">
	<div class="container">
		<div class="tit-util">
			<h3 class="tit">전체 극장</h3>
		</div>
		<div class="tab-list fixed">
			<ul class="nav nav-tabs">
				<li class="nav-item active thr-loc-div"><a href="javascript:void(0)">서울</a></li>
				<li class="nav-item thr-loc-div"><a href="javascript:void(0)">강원</a></li>
				<li class="nav-item thr-loc-div"><a href="javascript:void(0)">경기</a></li>
				<li class="nav-item thr-loc-div"><a href="javascript:void(0)">광주/전라</a></li>
				<li class="nav-item thr-loc-div"><a href="javascript:void(0)">대전/충청</a></li>
				<li class="nav-item thr-loc-div"><a href="javascript:void(0)">부산/대구/경상</a></li>
				<li class="nav-item thr-loc-div"><a href="javascript:void(0)">제주</a></li>
			</ul>
			<div class="loctheater" style="width: 100%; border-bottom-right-radius : 30px;  border-bottom-left-radius : 30px; border-bottom: solid 1px #4aa8d8; border-right: solid 1px #4aa8d8; border-left: solid 1px #4aa8d8; padding: 50px;">
				<ul id="thrUl">
					<c:if test="${empty thrList}">
						해당 지역에 아직 극장이 없습니다.
					</c:if>
					<c:forEach items="${thrList }" var="thr">
						<li><i class="fa-solid fa-bookmark ThLikeIcon" style="color: #4aa8d8; visibility: hidden">&nbsp;</i>${thr }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="tit-util">
			<h3 class="tit">극장 이벤트</h3>
			<div class="float-end">
				<a href="/event/theater.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div class="event-box" style="margin-top: 20px;">
			<ul>
				<li>
					<a href="#" data-no="13527" data-netfunnel="N" class="eventBtn" title="[금정AK플라자] 오픈 1주년 기념 이벤트 상세보기">
						<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/22/lYvh9Hm1azfGygwBm4ew3sAwY6y04FEP.jpg" alt="[금정AK플라자] 오픈 1주년 기념 이벤트" onerror="noImg(this);"></p>
						<p class="tit">
							[금정AK플라자] 오픈 1주년 기념 이벤트
						</p>
						<p class="date">
							2023.07.13 ~ 2023.07.13
						</p>
					</a>
				</li>

			</ul>
		</div>
		<div class="tit-util">
			<h3 class="tit">극장 공지사항</h3>
			<div class="float-end">
				<a href="/support/notice.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div class="accordion-list">
				<ul>
					<li>
						<div class="title ">
							<a href="" title="[강남] 8/9 영화관 상영재개 및 극장방문시 진입로 안내">
								<p class="cont-thr">[강남]</p>
								<div class="cont-tit">[강남] 8/9 영화관 상영재개 및 극장방문시 진입로 안내</div>
								<p class="cont-admin">서울</p>
								<p class="cont-date">2022.08.09</p>
							</a>
						</div>
					</li>
					
				</ul>
			</div>

	</div>
</div>

<script>
$(function(){
	$('.thr-loc-div').on('click', function(){
		console.log("dd");
		$('.thr-loc-div').removeClass('active');
		$(this).addClass('active');
		
		let loc = $(this).find('a').text();
		locSelect(loc);
		
	})	
	
	$('#thrUl').on('mouseover', 'li', function(){
		$(this).css('text-decoration', 'underline');
		$(this).css('cursor', 'pointer');
		
	})
	$('#thrUl').on('mouseleave', 'li', function(){
		$(this).css('text-decoration', 'none');
		
	})
	
	$('#thrUl').on('click', 'li', function(){
		let thr_name = $(this).text();
		location.href="<%=request.getContextPath()%>/theater/theater.do?thr_name=" + thr_name;
		
	})
})

function locSelect(loc){
	
	$.ajax({
		url : '<%=request.getContextPath()%>/theater/locSelect.do',
		method : 'post',
		data : {'thr_loc' : loc},
		success : function(res){
			console.log(res);
			locSelSuccess(res);
		},
		error : function(err){
			alert(err.status);
		}		
	});
	
	
}

function locSelSuccess(res){
	let thrListli = '';
	for(let i = 0; i < res.length; i++){
		thrListli += '<li>';
		thrListli += res[i];
		thrListli += '</li>';
	}
	if(res.length < 1){
		thrListli = "해당 지역에 아직 극장이 없습니다.";
	}
	$('#thrUl').html(thrListli);
}
</script>
<%@include file="../include/footer.jsp" %>