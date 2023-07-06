<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
request.setAttribute("GetTitle", "DWCinema");
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${GetTitle }</title>
<link href="/img/logo_ico.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/scrollbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/scrollbar.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/js/swiper.min.js"></script>
</head>
<body>
<div class="member-wrapper">
    <div class="row">
        <div class="col-12 col-md-2">
            <div class="card card1 p-3">
                <div class="image d-flex flex-row align-items-center mt-3"><img src="<%=request.getContextPath()%>/resources/img/my_icon.png" height="50" width="50" style="filter: brightness(0) invert(1);"/> <span>마이페이지</span></div>
                <hr class="hline" />
                <div class="d-flex flex-column align-items-center">
                    <button class="btn mt-3"><span>예매/구매내역</span></button>
                    <button class="btn mt-3"><span>보유 쿠폰 내역</span></button>
                    <button class="btn mt-3"><span>나의 무비스토리</span></button>
                    <button class="btn mt-3"><span>나의 문의내역</span></button>
                    <span class="other mt-4">멤버십 포인트</span>
                    <button class="btn mt-3"><span>포인트 이용내역</span></button>
                    <span class="other mt-4">회원 정보</span>
                    <button class="btn mt-3"><span>개인정보 수정</span></button>
                    <button class="btn mt-3"><span>선택정보 수정</span></button>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-10">