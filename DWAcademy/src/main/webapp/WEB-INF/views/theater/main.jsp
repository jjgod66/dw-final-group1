<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div class="theater-wrapper" style="width: 1300px; margin: 0 auto;">
<!-- 	<div class="container"> -->
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
				<a href="<%=request.getContextPath()%>/event/theater.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div class="event-box" style="margin-top: 20px;">
			<c:if test="${empty eventList }">
				<div style="text-align: center; margin: 50px 0;">이벤트가 없습니다.</div>
			</c:if>
			<c:if test="${!empty eventList }">
			<ul>
				<c:forEach items="${eventList }" var="event">
					<li>
						<a href="<%=request.getContextPath()%>/event/eventDetail.do?event_no=${event.event_no}" data-netfunnel="N" class="eventBtn">
							<p class="img"> <img src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${event.event_thum_path}&item_cd=${event.event_no}&type=eventThumb" onerror="noImg(this);"></p>
							<p class="tit">
								${event.event_title }
							</p>
							<p class="date">
							<fmt:formatDate value="${event.startdate }" pattern="yyyy-MM-dd"/> ~ 
							<fmt:formatDate value="${event.enddate }" pattern="yyyy-MM-dd"/>
							</p>
						</a>
					</li>
				</c:forEach>

			</ul>
			</c:if>
		</div>
		<div class="tit-util">
			<h3 class="tit">극장 공지사항</h3>
			<div class="float-end">
				<a href="<%=request.getContextPath()%>/support/notice.do?searchType=지점" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div class="accordion-list">
			<c:if test="${empty noticeList }">
				<div style="text-align: center; margin: 50px 0;">공지사항이 없습니다.</div>
			</c:if>
			<c:if test="${!empty noticeList }">
				<ul>
					<c:forEach items="${noticeList }" var="notice">
						<li>
							<div class="title">
								<a href="<%=request.getContextPath()%>/support/noticeMini_Detail.do?notice_no=${notice.NOTICE_NO }" title="${notice.NOTICE_TITLE }">
									<p class="cont-thr">[${notice.NOTICE_THR }]</p>
									<div class="cont-tit">${notice.NOTICE_TITLE }</div>
									<p class="cont-admin">${notice.THR_LOC }</p>
									<p class="cont-date"><fmt:formatDate value="${notice.REGDATE }" pattern="yyyy-MM-dd"/></p>
								</a>
							</div>
						</li>
					</c:forEach>
					
				</ul>
			</c:if>
		</div>

<!-- 	</div> -->
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