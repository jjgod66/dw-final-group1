<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">

<style>
body{font-family: 'IBM Plex Sans KR', sans-serif; background:#f8f9fa;}
 #wrapper {
 margin-left:auto;
 margin-right:auto;
    width: 55%;
}
</style>



</head>
<body>
<div class="sub_visual">
    <h3>나의 페이지</h3>
    <h6>my page</h6>
</div>
<%@ include file="../member/sideMenuM.jsp" %>
<div id="wrapper">
    <div class="container">
        <div class="row">
            <div style="width: 100%;">