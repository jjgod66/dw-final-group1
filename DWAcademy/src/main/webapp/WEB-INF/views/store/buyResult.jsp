<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/seatbooking.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/resResult.css">
<!-- <div class="sub_visual"> -->
<!--  	<h3>예매하기</h3> -->
<!--     <h6>ticket reservation</h6> -->
<!-- </div> -->
<div id="contents" style="display: flex; justify-content: center;">
		<!-- inner-wrap -->
		<div class="inner-wrap"style="width: 65%;">
			<!-- quick-reserve -->
			<div class="quick-reserve" >
				<h2 style="color: #4aa8d8; font-size: 1.6em; margin: 30px 50px 30px 50px;"><strong>결제완료</strong> <!-- 예매완료 --></h2>

				<div class="store-payment-finish" style="width: 90%; margin: 0 auto;">
					<div class="list">
                    <div class="img"><img src="<%=request.getContextPath()%>/common/getPicture.do?name=${mapData.PRODUCT_PIC_PATH }&item_cd=${mapData.PRODUCT_CD }&type=productImg" alt="" onerror="noImg(this);"></div>
                    <p class="tit">${mapData.PRODUCT_NAME }</p>
                    <p class="bundle">${mapData.PRODUCT_CONTENT }</p>

                    <div class="cont">
                        <div class="pay">
                            <p>수량 ${mapData.AMOUNT }매</p>
                            <p>
                                <span>총 결제금액</span>
                                <em><fmt:formatNumber value="${mapData.PAID_AMOUNT }" pattern="#,##0"></fmt:formatNumber></em>
		                                <span>원</span>
                            </p>
                        </div>
                    </div>
                </div>
				<!--// movie-infomation-area -->
			</div>
			<!--// reserve-ininfomation-box -->
		</div>
		<!--// reserve-finish -->
		<div style="width: 100%; display: flex; justify-content: center;">
			<div class="btn-group pt30">
<!-- 				<a href="#" class="button large" id="btn_bill_print">결제정보</a> -->
				<a href="<%=request.getContextPath() %>/member/bookinglist.do" class="button large" title="구매내역 페이지로 이동">구매내역 <!-- 예매내역 --></a>
			</div>
		</div>
					<div class="box-border v1 mt10" style="margin: 50px;">
						<ul class="dot-list gray">
							

									<ul class="dash-list">
											<li>미사용분에 한하여 최초 유효기간 이내에만 결제 취소가 가능합니다.</li>
											<li>결제 취소 방법 : 계정 로그인 >  마이페이지 > 예매/구매내역 > 구매취소</li>
									</ul>
								</li>
							
						</ul>
					</div>
				
			</div>
			<!--// quick-reserve -->
		</div>
		<!--// inner-wrap -->
	</div>
	
<%@include file="../include/footer.jsp" %>