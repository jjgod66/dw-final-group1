<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/member_header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.main-wrapper {
    margin: 30px 0;
}
.my-magabox-info {
    overflow: hidden;
/*     height: 240px; */
    border-radius: 10px;
/*     background-color: #f3f4f6; */
}
.my-magabox-info .top2 {
    position: relative;
    padding: 40px 0 0 364px;
    height: 170px;
    background-color: #4aa8d8;
}
.my-magabox-info .top2 .mbimg {
    position: absolute;
    top: 43px;
    left: 40px;
    width: 90px;
    height: 90px;
}
.my-magabox-info .top2 .mbimg img {
    width: 100%;
}
.my-magabox-info .top2 .mb_name {
    position: absolute;
    top: 43px;
    left: 150px;
    font-size: 38px;
    line-height: 44px;
    color: #fff;
    font-weight: 300;
}
.my-magabox-info .top2 .mb_name p {
    padding-top: 5px;
    font-size: 38px;
    line-height: 44px;
    letter-spacing: -.01em;
    color: #fff;
    font-weight: 600;
}
.my-magabox-info .top2 .link {
    position: absolute;
    bottom: 30px;
    right: 40px;
    display: flex;
}
.my-magabox-info .top2 .link a {
    display: block;
    font-size: 13px;
    line-height: 15px;
    font-weight: 400;
    color: #333;
    padding: 10px;
    background-color: #f3f4f6;
    border: 1px solid #f3f4f6;
    border-radius: 5px;
}
.my-magabox-info .top2 .totalPoint {
    font-size: 38px;
    line-height: 54px;
    font-weight: 400;
    padding-right: 13px;
    color: #fff;
    display: flex;
    align-items: flex-start;
}
.my-board-list .tit-util {
    margin: 50px 0 10px;
}
.my-board-list .tit-util:after {
    clear: both;
}
.my-board-list .tit-util:after,
.my-board-list .tit-util:before {
    content: '';
    display: block;
}
.my-board-list h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #222;
    line-height: 1.1;
}
.my-board-list .tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}
.my-board-list .tit-util .float-end a {
    color: #333;
}
.my-board-list .my-reserve-history {
    border-top: 1px solid #555;
}
.my-board-list .my-reserve-history ul li {
    position: relative;
    min-height: 140px;
    margin: 0;
    padding: 20px 100px 20px 100px;
    border-bottom: 1px solid #eaeaea;
}
.my-board-list .my-reserve-history ul li.no-result {
    min-height: 0;
    padding: 20px 0;
}
.my-board-list .no-history-reservation {
    display: block;
    height: 160px;
    padding: 0;
    text-align: center;
    line-height: 160px;
    border: 1px solid #ddd;
    border-width: 1px 0;
}
.my-board-list .my-reserve-history ul li.no-result .no-history-reservation {
    border: none;
}
</style>
<div class="main-wrapper">
	<div class="my-magabox-info">
		<div class="top2">
			<div class="mbimg"><img src="https://img.megabox.co.kr/static/pc/images/2023/01/member_WELCOME_2.png" alt="WELCOME"></div>
			<div class="mb_name">안녕하세요!<p>${loginUser.ID }<span>님</span></p></div>
			<div class="link">
				<a href="" title="개인정보수정 페이지로 이동">개인정보수정</a>
			</div>
			<div class="totalPoint"><fmt:formatNumber value="${point }" pattern="#,###"></fmt:formatNumber> P</div>
		</div>
	</div>
	<div class="my-board-list">
		<div class="tit-util">
			<h3 class="tit">나의 예매내역</h3>
			<div class="float-end">
				<a href="<%=request.getContextPath()%>/member/bookinglist.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div class="my-reserve-history">
			<ul>
				<li class="no-result">
					<div class="row" style="padding: 30px; border: 1px solid gray; border-radius: 10px;">
					<c:if test="${empty movieInfoList}">
						예매 내역이 없습니다.
					</c:if>
						<c:forEach items="${movieInfoList}" var="movieInfo">
									<div class="col-2" style="background: url('<%=request.getContextPath() %>/common/getPicture.do?name=${movieInfo.MOVIE_MAINPIC_PATH}&item_cd=${movieInfo.MOVIE_CD}&type=moviePoster') no-repeat left /cover"></div>
									<div class="col-5">
										<span><strong>예매번호 </strong>${movieInfo.MERCHANT_UID}</span>
										<br><br>
										<span><strong>영화명 </strong>${movieInfo.MOVIE_NAME}</span>
										<br><br>
										<span><strong>극장/상영관 </strong>${movieInfo.THR_NAME} / ${movieInfo.HOUSE_NAME}</span>
										<br><br>
										<span><strong>관람일시 </strong>${movieInfo.STARTDATE}</span>
										<br><br>
										<span><strong>결제일시 </strong>${movieInfo.RESDATE}</span>
									</div>
									<div class="col-4">
										<br><br>
										<br><br>
										<span><strong>관람인원 </strong>${movieInfo.MEM_CAT}</span>
										<br><br>
										<span><strong>관람좌석 </strong>${movieInfo.RES_SEAT}</span>
										<br><br>
										<c:if test="${movieInfo.REFUNDDATE eq null}">
											<span><strong>취소일시 </strong> - </span>
										</c:if>
										<c:if test="${movieInfo.REFUNDDATE ne null}">
											<span><strong>취소일시 </strong>${movieInfo.REFUNDDATE}</span>
										</c:if>
									</div>
							</c:forEach>
					</div>
				</li>
			</ul>
		</div>
		<div class="tit-util">
			<h3 class="tit">나의 구매내역</h3>
			<div class="float-end">
				<a href="<%=request.getContextPath()%>/member/buylist.do" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
			</div>
		</div>
		<div class="my-reserve-history">
			<ul>
				<li class="no-result">
					<div class="row">
					<c:if test="${empty buyInfoList}">
						구매 내역이 없습니다.
					</c:if>
			<table style="width : 100%;">
				<tr>
					<th style="width : 20%; text-align : center;">결제일시</th>
					<th style="width : 10%; text-align : center;">구분</th>
					<th style="text-align : center;">상품명</th>
					<th style="width : 10%; text-align : center;">결제금액</th>
					<th style="width : 10%; text-align : center;">상태</th>
				</tr>
		<c:forEach items="${buyInfoList}" var="buyInfo">
				<tr>
					<td style="width : 20%; text-align : center;"><fmt:formatDate value="${buyInfo.BUYDATE}"/></td>
					<td style="width : 10%; text-align : center;">${buyInfo.PRODUCT_DIV}</td>
					<td style="text-align : center;">${buyInfo.PRODUCT_NAME}</td>
					<td style="width : 10%; text-align : center;">${buyInfo.PRODUCT_PRICE}원</td>
					<c:if test="${buyInfo.GB_USE eq 'N'}">
						<td style="width : 10%; text-align : center;">사용가능</td>
					</c:if>
					<c:if test="${buyInfo.GB_USE eq 'Y'}">
						<td style="width : 10%; text-align : center;">사용완료</td>
					</c:if>
					<c:if test="${buyInfo.REFUNDDATE ne null}">
						<td style="width : 10%; text-align : center;">결제취소</td>
					</c:if>
				</tr>
		</c:forEach>
			</table>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<%@ include file="../include/member_footer.jsp" %>