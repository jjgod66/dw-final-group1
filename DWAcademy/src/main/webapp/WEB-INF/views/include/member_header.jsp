<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member.css">
</head>
<body>
<div class="member-wrapper">
    <div class="container">
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