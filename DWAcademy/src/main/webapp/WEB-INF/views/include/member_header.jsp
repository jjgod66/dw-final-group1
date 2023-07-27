<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member.css">
</head>
<body>
<div class="sub_visual">
    <h3>나의 페이지</h3>
    <h6>my page</h6>
</div>
<div class="member-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-3">
                <div class="card card1 p-3">
                    <div class="sidebar-nav d-flex flex-column align-items-center">
                        <ul id="sidebarnav">
                            <li><a href="<%=request.getContextPath()%>/member/bookinglist.do" class="btn mt-3"><span>예매/구매내역</span></a></li>
                            <li><a href="<%=request.getContextPath()%>/member/discount-coupon.do" class="btn mt-3"><span>보유 쿠폰 내역</span></a></li>
                            <li><a href="<%=request.getContextPath()%>/member/moviestory.do" class="btn mt-3"><span>나의 무비스토리</span></a></li>
                            <li><a href="<%=request.getContextPath()%>/member/myinquiry.do" class="btn mt-3"><span>나의 문의내역</span></a></li>
                            <li><span class="other mt-4">멤버십 포인트</span></li>
                            <li><a href="<%=request.getContextPath()%>/member/point-list.do" class="btn mt-3"><span>포인트 이용내역</span></a></li>
                            <li><span class="other mt-4">회원 정보</span></li>
                            <li><a href="<%=request.getContextPath()%>/member/PrivacyInfo.do" class="btn mt-3"><span>개인정보 수정</span></a></li>
                            <li><a href="<%=request.getContextPath()%>/member/additionalinfo.do" class="btn mt-3"><span>선택정보 수정</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-9">