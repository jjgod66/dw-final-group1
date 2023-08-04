<%@page import="java.util.Map"%>
<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/payment.css">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>  
<%@ include file="coupon_modal.jsp" %>

<style>
.couponbtn:hover{
	background-color: #F2F2F2;
}

#pointApplyBtn:hover{
	background-color: #F2F2F2;
}

#couponCanBtn:hover{
 cursor: pointer;
}
</style>


<div class="sub_visual">
  	<h3>예매하기</h3>
    <h6>ticket reservation</h6>
</div>
<div class="payment-wrapper">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-3">
				<div class="movie_infor">
					<span class="thm"><img src="<%=request.getContextPath() %>/common/getPicture.do?name=${mapData.MOVIE_MAINPIC_PATH}&item_cd=${mapData.MOVIE_CD}&type=moviePoster" alt="${mapData.MOVIE_NAME }"></span>
					<strong class="tit"><span class="ic_grade gr_all"></span>&nbsp;${mapData.MOVIE_NAME }
						<c:if test="${mapData.MOVIE_TYPE_DES eq '없음/2D' }">(2D)</c:if>
						<c:if test="${mapData.MOVIE_TYPE_DES ne '없음/2D' }">(${mapData.MOVIE_TYPE_DES })</c:if>

					</strong>
					<dl class="dlist_infor">
						<dt>일시</dt>
						<dd>
						<strong>
						<fmt:formatDate value="${mapData.STARTDATE }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${mapData.STARTDATE }" pattern="HH:mm"/>
				 		~${mapData.endTime }
				 		</strong>
				  	 	</dd>
						<dt>영화관</dt>
						<dd>${mapData.THR_NAME } ${mapData.HOUSE_NAME }</dd>
						<dt>인원</dt>
						<dd>
							${moviePayment.adultSeat > 0 ? '성인 '  : '' } ${moviePayment.adultSeat > 0 ? moviePayment.adultSeat : '' }
							${moviePayment.teenSeat > 0 ? '청소년 '  : '' } ${moviePayment.teenSeat > 0 ? moviePayment.teenSeat : '' }
							${moviePayment.preferSeat > 0 ? '우대 '  : '' } ${moviePayment.preferSeat > 0 ? moviePayment.preferSeat : '' }
						</dd>
						<dt>좌석</dt>
						<dd>${moviePayment.res_seats }</dd>
					</dl>
				</div>
			</div>
			<div class="col-md-6">
				<div class="group_discount">
					<h3 class="tit_payment">결제수단</h3>
					<div class="tab_wrap paylist">
					  <input type="radio" class="btn-check" name="payMethod" id="html5_inicis" autocomplete="off" checked>
					  <label class="btn btn-outline-primary paycard card" for="html5_inicis">
					  	<i class="ico-card bi bi-wallet2"></i>
					  	<span class="paycard-title">카드 결제</span>
					  </label>
					
					  <input type="radio" class="btn-check" name="payMethod" id="kakaopay" autocomplete="off">
					  <label class="btn btn-outline-primary paycard card" for="kakaopay">
					  	<i class="ico-kakaopay"></i>
					  	<span class="paycard-title">카카오페이 결제</span>
					  </label>
					 
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card card-payment p-3 text-white mb-3">
					<span>상품 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow"><fmt:formatNumber value="${moviePayment.pricesum }" pattern="#,##0" /></h2> <span>원</span>
					</div>
					<span>할인 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow" id="disprice">0</h2> <span>원</span>
					</div>
					<span>결제 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow totalPrice" id="totalpp"><fmt:formatNumber value="${moviePayment.pricesum }" pattern="#,##0" /></h2> <span>원</span>
					</div>
					<button class="btn btn-success px-3" id="credit" onclick="requestPay();">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<form id="payForm" action="<%=request.getContextPath()%>/reservation/nonMemPayResultRedirect.do" method="post">
	<input type="hidden" name="adultSeat" value="${moviePayment.adultSeat}">
	<input type="hidden" name="teenSeat" value="${moviePayment.teenSeat}">
	<input type="hidden" name="preferSeat" value="${moviePayment.preferSeat}">
	<input type="hidden" name="screen_cd" value="${mapData.SCREEN_CD }">
	<input type="hidden" name="res_seats" value="${moviePayment.res_seats}">
	<input type="hidden" name="pricesum"  value="${moviePayment.pricesum }">
	<input type="hidden" name="json">

</form>

<script>
const IMP = window.IMP;
IMP.init("imp04352208");


//결제화면 띄우는 메서드
let pay_info = null;
function requestPay() { 
	console.log($('#totalpp').text());
	let totalPrice = $('.totalPrice').text();
	let method = $('input[name="payMethod"]:checked').prop('id');
	let movie_name = '${mapData.MOVIE_NAME}';
	let buyer_name = '${non_mem.non_mem_name}';
	let buyer_tel = '${non_mem.non_mem_phone}';
	let buyer_email = '';
	let price = ($('#totalpp').text()).replace(',', '');
	let merchant_uid = new Date().getTime();

	
    IMP.request_pay({
        pg: method,
        pay_method: 'card',
        merchant_uid: merchant_uid,
        name: movie_name,
        amount: price,
        buyer_email: buyer_email,
        buyer_name: buyer_name,
        buyer_tel: buyer_tel,
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
			$('input[name="json"]').val(JSON.stringify(rsp));
			alert("결제완료");
			$('#payForm').submit();	
			
        } else {
            console.log(rsp);
            pay_info = rsp;
            alert('결제가 실패 되었습니다.');

        }
    });
}

$(function(){

	
	
	
})

//hasPoint 클래스에서 점수를 가져오는 함수
function getHasPoint() {
  var element = document.getElementsByClassName("hasPoint")[0];
  var score = parseInt(element.innerHTML);
  return score;
}

// input 요소를 가져오는 함수
function getCjOnePointInput() {
  var element = document.getElementById("cjOnePointipt");
  return element;
}

// hasPoint 점수 체크 함수
function checkHasPoint() {
  var hasPoint = getHasPoint();
  var cjOnePointInput = getCjOnePointInput();

  if (hasPoint >= 1000) {
    cjOnePointInput.disabled = false;
  } else {
    cjOnePointInput.disabled = true;
  }
}

//cjOnePointipt 값을 확인하여 포인트 체크 하는 함수
$(document).ready( function() {
  $('#cjOnePointipt').keyup(function() {
	var hasPoint = getHasPoint();
	var cjOnePointInput = $(this).val();
    $(this).val($(this).val().replace(/[^0-9]/g,""));
    if (cjOnePointInput > hasPoint)  {
    	alert('보유 포인트 보다 많은값을 입력할 수 없습니다.');
    	$(this).val('');
    }
  })
});

//cjOnePointchk 라벨 클릭 이벤트 처리 함수
function cjOnePointchkClicked() {
  var hasPoint = getHasPoint();
  var cjOnePointInput = getCjOnePointInput();
  var inputValue = parseInt(cjOnePointInput.value);

  if (hasPoint >= 1000 && inputValue <= hasPoint) {
    cjOnePointInput.value = inputValue;
  } else {
    cjOnePointInput.value = hasPoint;
  }
}

// cjOnePointchk 라벨 클릭 이벤트 리스너 등록
var cjOnePointchkLabel = document.getElementById("cjOnePointchk");
cjOnePointchkLabel.addEventListener("click", cjOnePointchkClicked);

// 페이지 로드 시 hasPoint 체크 함수 호출
window.onload = function() {
  checkHasPoint();
};
</script>
<%@ include file="../include/footer.jsp" %>