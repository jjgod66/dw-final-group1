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
<link href="../../../resources/img/logo_ico.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="../../../resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../resources/css/scrollbar.css">
<link rel="stylesheet" href="../../../resources/css/member.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="../../../resources/js/jquery-3.7.0.min.js"></script>
<script src="../../../resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/scrollbar.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/js/swiper.min.js"></script>
</head>
<body>