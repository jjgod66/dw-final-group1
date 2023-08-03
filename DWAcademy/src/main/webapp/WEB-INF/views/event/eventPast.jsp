<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cri" value="${pageMaker.cri}"/>
<style>
#contents {
    width: 100%;
    margin: 0;
    padding: 40px 0;
}
.inner-wrap {
    width: 100%;
    margin: 0 auto;
}
.font-gblue {
    color: #01738b!important;
}

.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
.mt0 {
    margin-top: 0!important;
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
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
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
.input-text {
    display: inline-block;
    width: 100%;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
.event-list.finish {
    margin: 0;
    border-top: 1px solid #333;
}

.event-list {
    overflow: hidden;
}
.event-list.finish ul {
    margin: 0;
}
.event-list ul {
    overflow: hidden;
    margin: 0 0 0 -40px;
}
.event-list.finish ul li {
    position: relative;
    float: none;
    width: 100%;
    margin: 0;
    padding: 20px 0;
    border-bottom: 1px solid #ebebeb;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.event-list.finish ul li a {
    overflow: hidden;
    display: block;
    position: relative;
    min-height: 100px;
    padding: 0 0 0 130px;
    border: 0;
    border-radius: 0;
}
.event-list.finish ul li a .cate {
    overflow: hidden;
    display: block;
    position: static;
    right: inherit;
    top: inherit;
    z-index: 2;
    height: auto;
    margin: 0;
    padding: 0;
    color: #01738b;
    line-height: 1.5;
    font-size: 1em;
    background-color: transparent;
}
.event-list.finish ul li a .img {
    position: absolute;
    left: 10px;
    top: 0;
    width: 100px;
    height: 100px;
    margin: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
}
.event-list.finish ul li a .img img {
    width: 100%!important;
    height: 100%!important;
}
.event-list.finish ul li a .tit {
    height: auto;
    padding: 5px 0 0 0;
    font-size: 1.2em;
    color: #222;
    line-height: 1.3;
}
.event-list ul li a .tit {
    overflow: hidden;
    height: 60px;
    margin: 0 0 10px 0;
    padding: 20px 17px 0 17px;
    line-height: 1.3;
    font-weight: 700;
    color: #222;
}
.event-list p {
    display: block;
    margin: 0;
    padding: 0;
}
.event-list.finish ul li a .date {
    position: absolute;
    left: 130px;
    bottom: 0;
    padding: 10px 0 0 0;
    font-size: .8667em;
    line-height: 1.1;
}
.event-list ul li a .date {
    padding: 0 17px 20px 17px;
    font-size: .8667em;
    line-height: 1.1;
    color: #666;
}

.winnerBtn {
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
    margin-top: 25px;
}

.winnerBtn:hover{
	 color: #fff;
	background-color: #4aa8d8;
}

/* .btn-more {
    position: relative;
    padding: 40px 0 0 0;
}
.btn-more.v1 .btn {
    border: 1px solid #eaeaea;
}
.btn-more .btn {
    display: block;
    width: 100%;
    margin: 0;
    padding: 0;
    height: 40px;
    border: 0;
    border-bottom: 1px solid #eaeaea;
    background-color: transparent;
    color: #666;
}
.btn-more .btn i {
    margin-left: 6px;
}
.ico-btn-more-arr {
    width: 12px;
    height: 7px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-btn-more-arr.png);
}
.iconset {
    overflow: hidden;
    display: inline-block;
    margin: -1px 0 0 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
    background-position: 0 0;
    background-repeat: no-repeat;
}
<<<<<<< HEAD
=======
 * {
    box-sizing: border-box;
} 
i {
    font-style: italic;
} */


>>>>>>> branch 'main' of https://github.com/jjgod66/dw-final-group2.git
</style>


<div class="sub_visual" >
    <h3>지난 이벤트</h3>
    <h6>end event</h6>
</div>

<div id="contents" class="">
<div class="container">
	<div class="inner-wrap">
		<h2 class="tit">지난 이벤트</h2>
		<ul class="dot-list">
			<!-- 로그인 전 -->
<!-- 			<li class="bi bi-chevron-right">응모하신 이벤트의 당첨 여부는 당첨자발표의 -->
<!-- 				<a href=""><strong class="font-gblue">나의 응모결과 확인</strong></a> 을 통해 확인하실 수 있습니다. -->
<!-- 			</li> -->
			<!--// 로그인 전 -->
		</ul>
	</div>

	<div id="boardSearch" class="inner-wrap" style="">
		<div class="board-list-util mt0">
			<p class="result-count">
				<strong>전체 <b class="font-gblue">${totalCount }</b>건
				</strong>
			</p>
			<div class="board-search">
				<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요."
					class="input-text" value="${pageMaker.cri.keyword }" name="keyword">
				<button type="button" class="btn-search-input" id="search">검색</button>
			</div>
		</div>
	</div>
	
	
	<div id="event-list-wrap">
		<div class="inner-wrap">
			<div class="event-list finish ">
				<input type="hidden" id="totCount" name="totCount" value="10138">
				<c:if test="${empty eventList }">
					<div style="text-align: center; margin: 50px 0;">이벤트가 없습니다.</div>
				</c:if>
				<ul>
					<c:forEach items="${eventList }" var="event">
						<li style="display: flex;">
							<a href="<%=request.getContextPath()%>/event/eventDetail.do?event_no=${event.event_no}" data-no="12857" data-netfunnel="N"
								class="eventBtn" title="${event.event_title } 상세보기" style="width: 90%;">
									<p class="cate">${event.event_div }</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="<%=request.getContextPath() %>/common/getPicture.do?name=${event.event_thum_path}&item_cd=${event.event_no}&type=eventThumb"
											alt="${event.event_title }" onerror="noImg(this);">
									</p>
									<p class="tit">${event.event_title }</p>
									<p class="date">
										<fmt:formatDate value="${event.startdate}" pattern="yyyy-MM-dd"/> ~ 
										<fmt:formatDate value="${event.enddate}" pattern="yyyy-MM-dd"/>
									</p>
							</a>
							<c:if test="${event.winnerdate != null }">
								<input class="winnerBtn" type="button" value="당첨자확인" onclick="location.href='<%=request.getContextPath()%>/event/winnerResult.do?event_no=${event.event_no }'">
							</c:if>
						</li>
					</c:forEach>

				</ul>
			</div>
		</div>
	</div>
	<div class="mt-5 mb-5 paginationdiv">
		<%@ include file="../common/pagination.jsp" %>
	</div>

<%-- 	<%@ include file="/WEB-INF/views/event/eventPagination.jsp" %> --%>

	</div>
</div>


<script>

let searchFormUrl = '<%=request.getContextPath()%>/event/eventPast.do';

$(function(){
	let evlist = '${eventList}';
	if(evlist == '[]'){
		$('.paginationdiv').css('display', 'none');
	}
	
	$('#search').on('click', function(){
		searchList_go(1);
	})
})
</script>
<%@ include file="../include/footer.jsp"%>