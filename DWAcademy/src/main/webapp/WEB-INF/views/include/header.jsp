<%--
DW아카데미 1팀 프로젝트 영화관 미리보기 예제 jsp 메인화면 입니다.
제작자 : 신철헌
제작 시작 일 : 2023년 6월 23일
--%>
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
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${GetTitle }</title>
<link href="/resources/img/logo_ico.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/scrollbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dwcinema.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/swiper.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/swiper.min.js"></script>
</head>
<body>
<header class="header">
    <nav class="gnb">
        <div class="container d-flex flex-wrap">
            <ul class="nav me-auto">
                <li class="nav-item"><a href="#" class="nav-link link-dark px-2">전체메뉴</a></li>
                <li class="nav-item"><a href="#" class="nav-link link-dark px-2">고객센터</a></li>
            </ul>
            <ul class="nav">
                <li class="nav-item"><a href="<%=request.getContextPath()%>/member/login.do" class="nav-link link-dark px-2">로그인</a></li>
                <li class="nav-item"><a href="#" class="nav-link link-dark px-2">회원가입</a></li>
            </ul>
        </div>
    </nav>
    <div class="logo"><a href="<%=request.getContextPath()%>/"><img src="/resources/img/logo.png"></a></div>
    <div class="background" style="height: 220px; display: none; opacity: 0;"></div>
    <div class="container" stlyle="overflow: hidden;">
        <ul class="navbar" role="menubar" id="dwcinema_gnb">
            <li role="menuitem">
                <strong>커뮤니티</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">영화리뷰</a></li>
                    <li><a href="#">무비포스트</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>영화</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="#">전채영화</a></li>
                    <li><a href="#">현재상영작</a></li>
                    <li><a href="#">상영예정작</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>예매하기</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/booking/cinema.do">상영시간표</a></li>
                    <li><a href="#">할인안내</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>스토어</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=2">영화관람권</a></li>
                    <li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=3">기프트카드</a></li>
                    <li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=4">팝콘/스낵/음료</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>이벤트</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="#">진행중 이벤트</a></li>
                    <li><a href="#">지난 이벤트</a></li>
                    <li><a href="#">당첨자발표</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>혜택</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="membership.jsp">멤버십 안내</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>고객센터</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">저주 묻는 질문</a></li>
                    <li><a href="#">1:1 문의</a></li>
                </ul>
            </li>
        </ul>
    </div>
</header>