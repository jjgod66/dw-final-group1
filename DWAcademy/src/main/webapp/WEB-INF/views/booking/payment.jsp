<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/payment.css">
<div class="payment-wrapper">
	<div class="container pt-5 px-5">
		<div class="row">
			<div class="col-md-3">
				<div class="movie_infor">
					<span class="thm"><img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202306/19438_104_1.jpg" alt="엘리멘탈"></span>
					<strong class="tit"><span class="ic_grade gr_all"></span>&nbsp;엘리멘탈(2D자막)</strong>
					<dl class="dlist_infor">
						<dt>일시</dt>
						<dd><strong>2023-07-05 (수) 22:15 ~ 24:14</strong></dd>
						<dt>영화관</dt>
						<dd>가산디지털 5관 - 2D</dd>
						<dt>인원</dt><dd>성인1</dd>
					</dl>
				</div>
			</div>
			<div class="col-md-6">
				<div class="group_discount">
					<h3 class="tit_payment">기프트카드</h3>
					<div class="tab_wrap">
					</div>
				</div>
				<div class="group_discount">
					<h3 class="tit_payment">할인/포인트</h3>
					<div class="tab_wrap">
					</div>
				</div>
				<div class="group_discount">
					<h3 class="tit_payment">결제수단</h3>
					<div class="tab_wrap paylist">
						<div class="paycard card">
						</div>
						<div class="paycard kakaopay">
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card card-payment p-3 text-white mb-3">
					<span>상품 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow">\10000</h2> <span>원</span>
					</div>
					<span>할인 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow">\0</h2> <span>원</span>
					</div>
					<span>결제 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow">\10000</h2> <span>원</span>
					</div>
					<button class="btn btn-success px-3">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>