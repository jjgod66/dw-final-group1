<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<% 
// https://getbootstrap.kr/docs/5.2/components/card 
%>
<style>
.event-warpper {
}
.event-warpper h2.event-title {
	padding: 40px 0px 40px 0px
}
.event-warpper .tab-list {
    position: static;
    width: 100%;
    background-color: rgba(255,255,255);
}
.event-warpper .tab-list:after {
    clear: both;
}
.event-warpper .tab-list:after,
.event-warpper .tab-list:before {
    content: '';
    display: table;
}
.event-warpper .tab-list>ul {
    position: relative;
    width: 100%;
    height: 42px;
}
.event-warpper .tab-list>ul:after {
    content: '';
    display: block;
    position: absolute;
    left: 0;
    bottom: 0;
    z-index: 2;
    width: 100%;
    height: 1px;
    background-color: #4aa8d8;
}
.event-warpper .tab-list>ul>li:first-child:nth-last-child(4) {
    width: 25%;
}
.event-warpper .tab-list>ul>li:first-child:nth-last-child(4)~li {
    width: 25%;
}
.event-warpper .tab-list>ul>li {
    float: left;
    height: 42px;
    margin: 0;
    border: 1px solid #ebebeb;
    border-width: 1px 0 1px 1px;
}
.event-warpper .tab-list>ul>li:last-child {
    border-right: 1px solid #ebebeb;
}
.event-warpper .tab-list>ul>li.active a {
    position: relative;
    border: 1px solid #4aa8d8;
    border-bottom: 0;
    background-color: #fff;
    z-index: 3;
}
.event-warpper .tab-list>ul>li>a {
    position: relative;
    display: block;
    width: 100%;
    height: 41px;
    line-height: 40px;
    padding: 0;
    text-align: center;
    color: #222;
    font-size: 1.0667em;
    text-decoration: none;
}
.event-warpper .tab-content {
    padding: 0 0 50px;
}
.event-warpper .tit-util {
    margin: 50px 0 10px;
}
.event-warpper .tit-util:after {
    clear: both;
}
.event-warpper .tit-util:after,
.event-warpper .tit-util:before {
    content: '';
    display: block;
}
.event-warpper h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #222;
    line-height: 1.1;
}
.event-warpper .tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}
.event-warpper .tit-util .float-end a {
    color: #333;
}
.event-warpper .event-list {
    margin-top: 15px;
    overflow: hidden;
}
.event-warpper .event-list ul {
    overflow: hidden;
    margin: 0 0 0 -40px;
}
.event-warpper .event-list ul li {
    position: relative;
    float: left;
    width: 22%;
    margin: 0 0 0 40px;
    padding: 0;
}
.event-warpper .event-list ul li a {
    overflow: hidden;
    display: block;
    border: 1px solid #e4e4e4;
    border-radius: 10px;
    min-height: 364px;
}
.event-warpper .event-list ul li a .img {
    width: 100%;
    height: 100%;
    font-size: 0;
    line-height: 0;
    border-bottom: 1px solid #e4e4e4;
    background-color: #eee;
}
.event-warpper .event-list ul li a .img img {
    width: 100%!important;
    height: 290px!important;
}
.event-warpper .event-list p {
    display: block;
    margin: 0;
    padding: 0;
}
.event-warpper .event-list ul li a .tit {
    overflow: hidden;
    height: 60px;
    margin: 0 0 10px 0;
    padding: 20px 17px 0 17px;
    line-height: 1.3;
    font-weight: 700;
    color: #222;
}
.event-warpper .event-list ul li a .date {
    padding: 0 17px 20px 17px;
    font-size: .8667em;
    line-height: 1.1;
    color: #666;
}
.inner-wrap {
    width: auto;
    margin: 0 auto;
}
.mt40 {
    margin-top: 40px!important;
}
.board-list-util {
    margin: 30px 0 15px 0;
    text-align: right;
}
.board-list-util .result-count {
    position: relative;
    float: left;
    margin: 0;
    padding-top: 15px;
    line-height: 1.1;
    vertical-align: top;
}
.board-search {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    width: 230px;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.board-search .btn-search-input {
    position: absolute;
    right: 1px;
    top: 1px;
}
.btn-search-input {
    overflow: hidden;
    width: 30px;
    height: 32px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
    text-indent: -9999px;
    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-search-input.png) no-repeat center;
}
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}

button {
    cursor: pointer;
    letter-spacing: -.5px;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
button, select {
    text-transform: none;
}
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
}
.input-text {
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    vertical-align: middle;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-size: 1em;
}
.board-list-util .result-count b {
    color: #01738b;
}
.event-list ul li.no-list {
    width: 100%;
    padding: 50px 0;
    text-align: center;
    border-top: 1px solid #555;
    border-bottom: 1px solid #e4e4e4;
}
</style>


<div class="sub_visual">
    <h3>이벤트</h3>
    <h6>event</h6>
</div>
<div class="event-warpper" style="width: 1300px; margin: 0 auto;">
<!-- 	<div class="container"> -->
		<h2 class="event-title">진행중인 이벤트 </h2>
		<div class="tab-list fixed">
			<ul class="nav nav-tabs">
				<li class="nav-item active"><a href="<%=request.getContextPath() %>/event/main.do">전체</a></li>
				<li class="nav-item"><a href="<%=request.getContextPath() %>/event/movie.do">영화</a></li>
				<li class="nav-item"><a href="<%=request.getContextPath() %>/event/theater.do">극장</a></li>
				<li class="nav-item"><a href="<%=request.getContextPath() %>/event/stage.do">시사회/무대인사</a></li>
			</ul>
		</div>
		<div class="tab-content">
			<div class="tab-pane fade show active" id="main">
				<div class="tit-util">
					<h3 class="tit">영화</h3>
					<div class="float-end">
						<a href="<%=request.getContextPath() %>/event/movie.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
					</div>
				</div>
				  <div class="event-list">
					<ul>
						<c:forEach items="${movieEventList }" var="movieEvent">
							<li>
								<a href="<%=request.getContextPath()%>/event/eventDetail.do?event_no=${movieEvent.event_no}" data-no="13565" data-netfunnel="N" class="eventBtn" title="${movieEvent.event_title} 상세보기">
									<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img"> <img src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${movieEvent.event_thum_path}&item_cd=${movieEvent.event_no}&type=eventThumb" alt="${movieEvent.event_title}" onerror="noImg(this);"></p>
									<p class="tit">
										${movieEvent.event_title}
									</p>
									<p class="date">
										<fmt:formatDate value="${movieEvent.startdate}" pattern="yyyy-MM-dd"/> ~ 
										<fmt:formatDate value="${movieEvent.enddate}" pattern="yyyy-MM-dd"/>
									</p>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="tit-util">
					<h3 class="tit">극장</h3>
					<div class="float-end">
						<a href="<%=request.getContextPath() %>/event/theater.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
					</div>
				</div>
				<div class="event-list">
					<ul>
						<c:forEach items="${theaterEventList }" var="theaterEvent">
							<li>
								<a href="<%=request.getContextPath()%>/event/eventDetail.do?event_no=${theaterEvent.event_no}" data-no="13565" data-netfunnel="N" class="eventBtn" title="${theaterEvent.event_title} 상세보기">
									<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img"> <img src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${theaterEvent.event_thum_path}&item_cd=${theaterEvent.event_no}&type=eventThumb" alt="${theaterEvent.event_title}" onerror="noImg(this);"></p>
									<p class="tit">
										${theaterEvent.event_title}
									</p>
									<p class="date">
										<fmt:formatDate value="${theaterEvent.startdate}" pattern="yyyy-MM-dd"/> ~ 
										<fmt:formatDate value="${theaterEvent.enddate}" pattern="yyyy-MM-dd"/>
									</p>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="tit-util">
					<h3 class="tit">시사회/무대인사</h3>
					<div class="float-end">
						<a href="<%=request.getContextPath() %>/event/stage.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
					</div>
				</div>
				<div class="event-list">
					<ul>
						<c:forEach items="${stageEventList }" var="stageEvent">
							<li>
								<a href="<%=request.getContextPath()%>/event/eventDetail.do?event_no=${stageEvent.event_no}" data-no="13565" data-netfunnel="N" class="eventBtn" title="${stageEvent.event_title} 상세보기">
									<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img"> <img src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${stageEvent.event_thum_path}&item_cd=${stageEvent.event_no}&type=eventThumb" alt="${stageEvent.event_title}" onerror="noImg(this);"></p>
									<p class="tit">
										${stageEvent.event_title}
									</p>
									<p class="date">
										<fmt:formatDate value="${stageEvent.startdate}" pattern="yyyy-MM-dd"/> ~ 
										<fmt:formatDate value="${stageEvent.enddate}" pattern="yyyy-MM-dd"/>
									</p>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
<!-- 	</div> -->
</div>
<%@ include file="../include/footer.jsp" %>