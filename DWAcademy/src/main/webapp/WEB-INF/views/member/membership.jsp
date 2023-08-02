<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/membership.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
<div class="sub_visual">
    <h3>멤버십 안내</h3>
    <h6>membership infomation</h6>
</div>
<div class="ms-wrapper">
    <div class="container">
        <div class="membershipCard">
            <div class="tt">DWCINEMA<span>MEMBERSHIP</span></div>
            <div class="tx">DW시네마 멤버십 회원에게만 제공되는 혜택</div>
        </div>
        <h3 class="tit3">DW시네마 멤버십 혜택</h3>
        <div class="membershipBenefit">
            <div class="item">
                <div class="ico"></div>
				<div class="tit">포인트 적립</div>
				<div class="txt">티켓, 스토어 이용 시 등급에 따라 5 ~ 10% 포인트 적립!</div>
			</div>
            <div class="item">
                <div class="ico"></div>
				<div class="tit">포인트 사용</div>
				<div class="txt">원하는 영화도 보고 팝콘도 구매할 수 있는 포인트!</div>
			</div>
            <div class="item">
                <div class="ico"></div>
				<div class="tit">생일 축하 쿠폰</div>
				<div class="txt">회원이라면 누구나 생일 축하 쿠폰을 드려요</div>
			</div>
            <div class="item">
                <div class="ico"></div>
				<div class="tit">각종 쿠폰</div>
				<div class="txt">특별한 날엔 특별한 쿠폰을!</div>
			</div>
<!--             <div class="item"> -->
<!--                 <div class="ico"></div> -->
<!-- 				<div class="tit">혜택 이름</div> -->
<!-- 				<div class="txt">혜택 내용</div> -->
<!-- 			</div> -->
<!--             <div class="item"> -->
<!--                 <div class="ico"></div> -->
<!-- 				<div class="tit">혜택 이름</div> -->
<!-- 				<div class="txt">혜택 내용</div> -->
<!-- 			</div> -->
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>