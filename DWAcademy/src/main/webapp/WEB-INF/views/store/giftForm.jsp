<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/payment.css">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>    
<div class="sub_visual">
  	<h3>선물하기</h3>
    <h6>gift</h6>
</div>
<div class="payment-wrapper">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-3">
				<div class="movie_infor">
					<span class="thm"><img src="../../resources/img/store/${product.product_pic_path }" alt="${product.product_name }"></span>
					<strong class="tit"><span class="ic_grade gr_all"></span>&nbsp;${product.product_name }</strong>
					<dl class="dlist_infor">
						<dt>상품</dt>
						<dd><strong>${product.product_content }</strong></dd>
<!-- 						<dt>영화관</dt> -->
<!-- 						<dd>가산디지털 5관 - 2D</dd> -->
						<dt>수량</dt>
						<dd>
							${amount }
						</dd>
					</dl>
				</div>
			</div>
			<div class="col-md-6">
				<div class="group_discount">
					<h3 class="tit_payment">받는 사람</h3>
					<div class="tab_wrap">
						<table style="width: 90%; border-collapse: separate; border-spacing: 10px;">
							<tr>
								<th style="width: 20%;"><label for="name">이름</label></th>
								<td><input class="textBox3" type="text" id="toinsertname" style="width: 50%;"></td>
							</tr>
							<tr>
								<th><label for="phone">휴대폰번호</label></th>
								<td><input class="textBox3" type="text" id="toinsertphone" style="width: 50%;"></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th><label for="message">메세지</label></th> -->
<!-- 								<td><input class="textBox3" type="text" id="message"></td> -->
<!-- 							</tr> -->
						</table>
					</div>
				</div>
				<div class="group_discount">
					<h3 class="tit_payment">포인트</h3>
					<div class="tab_wrap">
						<div class="inner_con2">
							<dt><label class="noneInput">보유 포인트</label></dt>
							<dd class="amtValue"><span class="hasPoint">0</span>원</dd>
							
							<dt class="secondTit"><label for="cjOnePointipt">사용할 포인트</label></dt>
							<dd><input class="textBox2" type="text" id="cjOnePointipt" value="0">원</dd>
				
							<dt class="secondTit"><input type="checkbox" class="form-check-input"  id="cjOnePointchk"></dt>
							<dd><label for="cjOnePointchk">모두사용</label></dd>
						</div>
					</div>
				</div>
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
						<h2 class="mb-0 yellow"><fmt:formatNumber value="${product.product_price*amount }" pattern="#,##0" /></h2> <span>원</span>
					</div>
					<span>할인 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow">0</h2> <span>원</span>
					</div>
					<span>결제 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow"><fmt:formatNumber value="${product.product_price*amount }" pattern="#,##0" /></h2> <span>원</span>
					</div>
					<button class="btn btn-success px-3" id="credit" onclick="requestPay();">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<form id="giftForm" action="<%=request.getContextPath()%>/store/giftResult.do" method="post">
	<input type="hidden" name="product_cd" value="${product.product_cd }">
	<input type="hidden" name="amount" value="${amount }">
	<input type="hidden" name="pricesum" value="${product.product_price*amount }">
	<input type="hidden" name="json">
	<input type="hidden" name="toname">
	<input type="hidden" name="tophone">
</form>
<script>
const IMP = window.IMP;
IMP.init("imp04352208");


//결제화면 띄우는 메서드
function requestPay() { 
	let method = $('input[name="payMethod"]:checked').prop('id');
	let toname = $('#toinsertname').val();
	console.log(toname);
	let tophone = $('#toinsertphone').val();
	console.log(tophone);
	$('input[name="toname"]').val(toname);
	$('input[name="tophone"]').val(tophone);
    IMP.request_pay({
        pg: method,
        pay_method: 'card',
        merchant_uid: new Date().getTime(),
        name: '${product.product_name }',
//         amount: '${product.product_price*amount }',
        amount: 100,
        buyer_email: '${member.mem_email}',
        buyer_name: '${member.mem_name}',
        buyer_tel: '${member.mem_phone}',
    }, function (rsp) { // callback
        if (rsp.success) {
        	$('input[name="json"]').val(JSON.stringify(rsp));
            console.log(rsp);
			alert("결제되었습니다.");
            giftForm.submit();
			
        } else {
            console.log(rsp);
            pay_info = rsp;
            alert('결제가 실패 되었습니다.');

        }
    });
}

$(function(){
	$('#credit').on('click', function(){
		
	})
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