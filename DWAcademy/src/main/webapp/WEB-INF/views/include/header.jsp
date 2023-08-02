<%--
DW아카데미 1팀 프로젝트 영화관 미리보기 예제 jsp 메인화면 입니다.
제작자 : 신철헌
제작 시작 일 : 2023년 6월 23일
--%>
<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.Document" %>
<%
request.setAttribute("GetTitle", "DWCinema");

String mem_cd = "";
if(session.getAttribute("loginUser") != null){
	Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
	mem_cd = (String)member.get("CD");
}
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${GetTitle }</title>
<!-- 검색기능 링크입니 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/finder.css">

<link href="<%=request.getContextPath()%>/resources/img/logo_ico.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/scrollbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dwcinema.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/swiper.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/daterangepicker.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/swiper.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/daterangepicker.js"></script>
</head>
<body>
<!-- Preloader -->

<!-- End Preloader -->
<header class="header poi">
    <nav class="gnb">
        <div class="container d-flex flex-wrap">
            <ul class="nav me-auto">
                <li class="nav-item"><a href="#" class="nav-link link-dark px-2">전체메뉴</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/member/membership.do" class="nav-link link-dark px-2">혜택</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath() %>/support/main.do" class="nav-link link-dark px-2">고객센터</a></li>
            </ul>
            <ul class="nav">
            <c:choose>
                <c:when test="${loginUser == null || loginUser == ''}">
                	<li class="nav-item"><a href="#" data-bs-toggle="modal" data-bs-target="#login-modal" class="nav-link link-dark px-2">로그인</a></li>
	                <li class="nav-item"><a href="#" id="kakaoJoin" data-bs-toggle="modal" data-bs-target="#authentication-modal" class="nav-link link-dark px-2">회원가입</a></li>
                </c:when>
                <c:otherwise>
                	<li class="nav-item"><a href="<%=request.getContextPath() %>/common/logout.do" class="nav-link link-dark px-2">로그아웃</a></li>
                </c:otherwise>
            	</c:choose>
            </ul>
        </div>
    </nav>
    <div class="logo"><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/img/logo.png"></a></div>
    <div class="container">
        <ul class="navbar" role="menubar" id="dwcinema_gnb" style="overflow: hidden;">
            <li role="menuitem">
                <strong>영화</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/movie/allMovie.do">전체영화</a></li>
                    <li><a href="<%=request.getContextPath()%>/movie/screenMovie.do">현재상영작</a></li>
                    <li><a href="<%=request.getContextPath()%>/movie/comingMovie.do">상영예정작</a></li>
                    <li><a href="<%=request.getContextPath()%>/movie/review.do">영화리뷰</a></li>
                    <li><a href="<%=request.getContextPath()%>/movie/moviePost.do">무비포스트</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong><a href="<%=request.getContextPath()%>/theater/main.do">극장</a></strong>
            </li>
            <li role="menuitem">
                <strong><a href="<%=request.getContextPath()%>/reservation/cinema.do">예매</a></strong>
<!--                 <ul style="opacity: 0; height: 0px;"> -->
<%--                     <li><a href="<%=request.getContextPath()%>/reservation/cinema.do">상영시간표</a></li> --%>
<!--                     <li><a href="#">할인안내</a></li> -->
<!--                 </ul> -->
            </li>
            <li role="menuitem" style="width: 280px;">
            </li>
            <li role="menuitem">
                <strong>스토어</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=1">기프트카드</a></li>
                    <li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=2">팝콘/스낵/음료</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>이벤트</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/event/main.do">진행중 이벤트</a></li>
                    <li><a href="<%=request.getContextPath()%>/event/eventPast.do">지난 이벤트</a></li>
<%--                     <li><a href="<%=request.getContextPath()%>/event/prizeWinner.do">당첨자발표</a></li> --%>
                </ul>
            </li>
            <li role="menuitem" style="width: 65px;">
                <a href="<%=request.getContextPath()%>/support/main.do" style="position: absolute; top: 20px; right: 40px; color: #333; font-size: 1.8rem;"><img src="<%=request.getContextPath()%>/resources/img/chat-support-icon.png" style="height: 29px; vertical-align: text-top; margin-top: 7px;"></a>
                <a href="javascript:void(0)" id="myPageMain" style="position: absolute; top: 20px; right: 0; color: #333; font-size: 1.8rem;"><i class="bi bi-person"></i></a>
            </li>
        </ul>
    </div>
</header>
<%@ include file="../include/login_modal.jsp" %>
<%@ include file="../include/join_modal.jsp" %>
<%@ include file="../include/authentication_modal.jsp"%>
<%@ include file="../include/dormantAccount_modal.jsp"%>
<%@ include file="../include/personInfoUtilAgreeAt.jsp"%>
<%@ include file="../booking/login_service_modal.jsp" %>
<form id="joinForm" action="<%=request.getContextPath()%>/member/join.do" method="post">
	<input type="hidden" name="mem_id">
	<input type="hidden" name="mem_name">
	<input type="hidden" name="mem_pwd">
	<input type="hidden" name="mem_bir">
	<input type="hidden" name="mem_email">
	<input type="hidden" name="mem_phone">
	<input type="hidden" name="mem_zipcode">
	<input type="hidden" name="mem_addr">
	<input type="hidden" name="mem_addr_detail">
	<input type="hidden" name="gb_email_alert">
	<input type="hidden" name="gb_sms_alert">
</form>
<script>
$('#myPageMain').on('click', function(){
	if('<%=mem_cd%>' == null || '<%=mem_cd%>' == ""){
		$('#login-service-modal').modal("show");
		return;
	}else{
		location.href="<%=request.getContextPath()%>/member/main.do";
	}
})
function join_go(){
let joinForm = $('#joinForm');
let memberInfo = $('.memberInfo')
	joinForm.find('[name="mem_id"]').val(memberInfo.find('[name=mem_id]').val());
	joinForm.find('[name="mem_name"]').val(memberInfo.find('[name=mem_name]').val());
	joinForm.find('[name="mem_pwd"]').val(memberInfo.find('[name=mem_pwd]').val());
	joinForm.find('[name="mem_bir"]').val(memberInfo.find('[name=mem_bir]').val());
	joinForm.find('[name="mem_email"]').val(memberInfo.find('[name=mem_email]').val());
	joinForm.find('[name="mem_phone"]').val(memberInfo.find('[name=mem_phone]').val());
	joinForm.find('[name="mem_zipcode"]').val(memberInfo.find('[name=mem_zipcode]').val());
	joinForm.find('[name="mem_addr"]').val(memberInfo.find('[name=mem_addr]').val());
	joinForm.find('[name="mem_addr_detail"]').val(memberInfo.find('[name=mem_addr_detail]').val());
	joinForm.find('[name="gb_email_alert"]').val(memberInfo.find('[name=marketEmailRcvAgreeAt1]:checked').val());
	joinForm.find('[name="gb_sms_alert"]').val(memberInfo.find('[name=marketSmsRcvAgreeAt1]:checked').val());


	joinForm.submit();
}

$('#login-modal').on('hidden.bs.modal', function(){
	$(this).find('form')[0].reset();
})
</script>
<div class="background" style="height: 150px; display: none; opacity: 0;"></div>
