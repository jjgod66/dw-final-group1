<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/membership.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
<style>
.pattern {
  background: #D6EAF8;
  background-image: radial-gradient(white 20%, transparent 0), radial-gradient(white 20%, transparent 0);
  background-position: 0 0, 10px 10px;
  background-size: 20px 20px;
}
</style>
<div class="sub_visual">
    <h3>멤버십 안내</h3>
    <h6>membership infomation</h6>
</div>
<div class="ms-wrapper">
        <div class="membershipCard pattern">
            <div class="tt">DWCINEMA<span>MEMBERSHIP</span></div>
            <div class="tx">DW시네마 멤버십 회원에게만 제공되는 혜택</div>
        </div>
    <div class="container">
        <h1 class="tit3"><b>DW시네마 멤버십 혜택</b></h1>
        <div class="membershipBenefit">
            <div class="item" style="box-shadow: 4px 4px 20px rgba(0,0,0,0.4);">
                <div class="ico" style="top: 10px; left: 30px;"><i class="bi bi-p-circle" style="font-size: 8rem;"></i></div>
				<div class="tit">포인트 적립</div>
				<div class="txt">티켓, 스토어 이용 시 등급에 따라 5 ~ 10% 포인트 적립!</div>
			</div>
            <div class="item" style="box-shadow: 4px 4px 20px rgba(0,0,0,0.4);">
                <div class="ico" style="top: 10px; left: 30px;"><i class="bi bi-bag-check" style="font-size: 8rem;"></i></div>
				<div class="tit">포인트 사용</div>
				<div class="txt">원하는 영화도 보고 팝콘도 구매할 수 있는 포인트!</div>
			</div>
            <div class="item" style="box-shadow: 4px 4px 20px rgba(0,0,0,0.4);">
                <div class="ico" style="top: 10px; left: 30px;"><i class="bi bi-calendar-heart" style="font-size: 8rem;"></i></div>
				<div class="tit">생일 축하 쿠폰</div>
				<div class="txt">1년에 단 하루뿐인 생일!<br>저희 멤버쉽의 회원이라면 누구에게나 생일 축하 쿠폰을 드려요</div>
			</div>
            <div class="item" style="box-shadow: 4px 4px 20px rgba(0,0,0,0.4);">
                <div class="ico" style="top: 10px; left: 30px;"><i class="bi bi-ticket-perforated" style="font-size: 8rem;"></i></div>
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