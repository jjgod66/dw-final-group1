<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp" %>
<%@include file="creditInfo_modal.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/seatbooking.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/resResult.css">
<!-- <div class="sub_visual"> -->
<!--  	<h3>예매하기</h3> -->
<!--     <h6>ticket reservation</h6> -->
<!-- </div> -->
<%
	mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		Map member = (Map) session.getAttribute("loginUser");
		mem_cd = (String)member.get("CD");
	}
	pageContext.setAttribute("mem_cd", mem_cd);
%>
<div id="contents" style="display: flex; justify-content: center;">
		<!-- inner-wrap -->
		<div class="inner-wrap">
			<!-- quick-reserve -->
			<div class="quick-reserve">
				<h2 style="color: #4aa8d8; font-size: 1.6em; margin: 30px 50px 0px 50px;"><strong>예매완료</strong> <!-- 예매완료 --></h2>

				

				<!-- reserve-finish -->
				<div class="reserve-finish">
					<!-- reserve-ininfomation-box -->
					<div class="reserve-ininfomation-box" style="margin: 20px 50px 50px 50px;">
						<div class="movie-poster-area">
							<p>
								티켓 예매번호 <!-- 티켓 예매번호 -->
								<span class="roboto">${merchant_uid }</span>
							</p>
							<img src="<%=request.getContextPath() %>/common/getPicture.do?name=${mapData.MOVIE_MAINPIC_PATH}&item_cd=${mapData.MOVIE_CD}&type=moviePoster" onerror="noImg(this)">
						</div>

						<!-- movie-infomation-area -->
						<div class="movie-infomation-area"">
							<div class="movie-info-top">
								<p class="tit">
									<strong>예매가 완료되었습니다 <!-- 예매가 완료되었습니다 --><i>!</i></strong>
									
<!-- 										<span class="righten"> <i class="iconset ico-circle-point"></i> 고객님의 상영익일 적립예정 포인트는 고객님의 상영익일 적립예정 포인트는 <em>500P</em>입니다. 입니다.</span> -->
									
								</p>
							</div>

							<div class="movie-info-middle">
								<ul class="dot-list gray">
									<li><span>예매영화 <!-- 예매영화 --></span> &nbsp;${mapData.MOVIE_NAME } / ${mapData.MOVIE_TYPE_DES }</li>
									<li><span>관람극장/상영관 <!-- 관람극장/상영관 --></span> &nbsp;${mapData.THR_NAME } / ${mapData.HOUSE_NAME }</li>
									<li><span>관람일시 <!-- 관람일시 --></span> &nbsp;<fmt:formatDate value="${mapData.STARTDATE }" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></li>
									<li><span>관람인원 <!-- 관람인원 --></span> &nbsp;${mapData.mem_cat }</li>
									<li><span>좌석번호 <!-- 좌석번호 --></span> &nbsp;${mapData.res_seats }</li>
									<li>
										<span>결제금액 <!-- 결제정보 --></span>
										<strong class="roboto">${mapData.paid_amount }</strong> 원 <!-- 원 --><br>
										<em></em>
									</li>
								</ul>

								
							</div>
						
								<div class="btn-group pt30">
								<c:set var="mem_cd" value="${pageScope.mem_cd}"/>
								<c:if test="${mem_cd != '' }">
									<a href="<%=request.getContextPath() %>/member/bookinglist.do" class="button large" title="예매내역 페이지로 이동">예매내역 <!-- 예매내역 --></a>
								</c:if>
								<c:if test="${mem_cd == '' }">
									<a href="#" class="button large" title="예매내역 페이지로 이동" data-bs-toggle="modal" data-bs-target="#nonMemLogin_modal">비회원 예매확인 <!-- 예매내역 --></a>
								</c:if>
<!-- 									<a href="#" class="button large" id="btn_credit_info">결제정보</a> -->
								</div>
						</div>
							
					<!--// movie-info-bottom -->
				</div>
				<!--// movie-infomation-area -->
			</div>
			<!--// reserve-ininfomation-box -->
		</div>
		<!--// reserve-finish -->

					<div class="box-border v1 mt10" style="margin: 50px;">
						<ul class="dot-list gray">
							
								<li>
<!-- 									상영안내 상영안내 -->
									<ul class="dash-list">
										
											<li>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</li>
										
											<li>상영시간 20분전까지 취소 가능하며, 캡쳐화면으로는 입장하실 수 없습니다.</li>
											
											<li>포인트는 상영 다음날 일괄 적립됩니다.</li>
										
									</ul>
								</li>
							
						</ul>
					</div>
				
			</div>
			<!--// quick-reserve -->
		</div>
		<!--// inner-wrap -->
	</div>
	
<script>
$(function(){
	$('#btn_credit_info').on('click', function(){
		$('#creditInfo-modal').modal('show');
	})
})
</script>
<%@include file="../include/footer.jsp" %>