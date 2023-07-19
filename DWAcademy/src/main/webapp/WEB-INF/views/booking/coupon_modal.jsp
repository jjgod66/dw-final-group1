<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

#coupon-modal .modal-content{
    border-radius: 0.7rem;
}
#coupon-modal .modal-header img{
    width: 100px;
}
#coupon-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#coupon-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#coupon-modal .modal-footer{
    border-top: none;
}
#coupon-modal button:active{
    outline: none;
}
#coupon-modal button:focus{
   outline: none;
}
#coupon-modal .modal-body{
    text-align: center;
}
#coupon-modal form{
    padding: 3vh;
}
#coupon-modal input {
    outline: none;
    margin: 0;
    border: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    width: 100%;
    font-size: 14px;
    font-family: inherit;
}
#coupon-modal .input-group {
    margin-bottom: 1rem;
}
#coupon-modal .input--style-3 {
    padding: 0.75rem !important;
    outline: none;
    width: 100% !important;
    min-width: unset;
    border: none;
    border-radius: 0;
    box-shadow: none !important;
    background: #f9f9f9;
    border: 1px solid #eee;
}
#coupon-modal .btn {
    display: inline-block;
    line-height: 42px;
    padding: 0 33px;
    font-family: Poppins;
    cursor: pointer;
    color: #fff;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    transition: all 0.4s ease;
    font-size: 18px;
    width: 100%
}
#coupon-modal .btn--naver {
    background-color: #27d34a !important;
    background-image: url(https://vendor-cdn.imweb.me/images/naver_login2x.png);
    background-size: 16px;
    background-position: 15px 50%;
    background-repeat: no-repeat;
    border-color: #27d34a !important;
    color: #fff !important;
    font-size: 12px;
    padding: 0;
}
#coupon-modal .btn--kakao {
    background-color: #ffeb00 !important;
    background-image: url(https://vendor-cdn.imweb.me/images/kakao_icon.png);
    background-size: 20px;
    background-position: 12px 49%;
    background-repeat: no-repeat;
    border-color: #ffeb00 !important ;
    color: #333 !important;
    font-size: 12px;
    padding: 0;
}
#coupon-modal .btn--login {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
#coupon-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#coupon-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#coupon-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#coupon-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#coupon-modal .col{
      padding: 2vh 10px 4vh;
}
#coupon-modal .new{
      padding-bottom: 0;
}
#coupon-modal .btn-primary{
      width:40%;
      margin:30%
}
#coupon-modal .btn:focus{
    box-shadow: none;
    outline: none;
}

table {
  border-collapse: collapse;
  border: 0;
}
th, td {
  border: 1px solid #aaa;
}
tbody tr:last-child th,
tbody tr:last-child td {
/*   border-bottom: 0; */
}
tbody tr td:last-child {
   border-right: 0; 
}
tbody tr td:first-child {
   border-left: 0; 
}
thead tr th:last-child {
   border-right: 0; 
}
thead tr th:first-child {
   border-left: 0; 
}

 th, td { 
   padding-top: 0.6rem; 
   padding-bottom: 0.6rem; 
/*    min-width: 6rem;  */
 } 


thead th,
tbody th {
  background-color: #f8f8f8;
}
</style>
<div class="modal fade" id="coupon-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5>쿠폰 목록</h5>
                <form method="POST" id="reviewRegistForm">
                <div class="input-group">
	                <div style="display: flex;">
	                    	사용할 쿠폰을 선택해주세요.
	                </div>
                </div>
                <div class="input-group">
	                <div>
                    		<div style="height: 200px; overflow-y: auto;">
	                    	<table>
	                    		<thead>
		                    		<tr style="font-size: 11px;">
		                    			<th style="width: 150px;">쿠폰명</th>
		                    			<th style="width: 80px;">할인액(율)</th>
		                    			<th style="width: 120px;">유효기간</th>
		                    			<th style="width: 50px;">사용</th>
		                    		</tr>
	                    		</thead>
	                    		<tbody>
	                    			<c:forEach items="${couponList }" var="coupon">
			                    		<tr id="${coupon.mem_coupon_no }">
			                    			<td id="couname" style="width: 150px;">${coupon.coupon_name }</td>
			                    			<td id="coudis" style="width: 80px;">${coupon.discount }</td>
			                    			<td style="width: 120px;">~<fmt:formatDate value="${coupon.enddate }" pattern="yyyy-MM-dd"/></td>
			                    			<td style="width: 50px;"><input type="radio" name="couponchk" value="${coupon.mem_coupon_no }"></td>
			                    		</tr>
	                    			
	                    			</c:forEach>
	                    		</tbody>
                    		</table>
                   		</div>
	                </div>
                </div>
                </form>
                
                <div class="p-t-10" style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;" id="regDiv">
	                    <button class="btn btn-regist" type="button" data-target="#" style="float: right;" id="couRegistBtn">적용</button>
	                </div>
	               
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" data-target="#" style="float: left;" id="couCancelBtn">취소</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
	$('#couCancelBtn').on('click', function(){
		$('#coupon-modal').modal("hide");
		$('input[name="couponchk"]').prop("checked", '');
	})
	
	$('#couRegistBtn').on('click', function(){
		let chkcou_no = $('input[name="couponchk"]').val();
		$('#couponInfo').css('display', 'flex');
		let couname = $('input[name="couponchk"]:checked').parents('tr').find('#couname').text();
		let coudis = $('input[name="couponchk"]:checked').parents('tr').find('#coudis').text();
// 		console.log(couname);
		$('#couponname').text(couname);
		
		if(coudis.substr(-1) == '원'){
			$('#coupondis').text(coudis.replace('원', ''));
			$('#disprice').text((parseInt(coudis.replace('원', ''))).toLocaleString());
			$('#totalpp').text((${moviePayment.pricesum } - (coudis.replace('원', ''))).toLocaleString());
			
		}else{
			let disp = ${moviePayment.pricesum } / 100 * coudis.replace('%', '');
			$('#coupondis').text(disp);
			$('#disprice').text(disp.toLocaleString());
			$('#totalpp').text((${moviePayment.pricesum } - disp).toLocaleString());
			
		}
		
		$('#payForm input[name="mem_coupon_no"]').val($('input[name="couponchk"]:checked').parents('tr').prop('id'));
		$('#payForm input[name="discount"]').val(parseInt($('#payForm input[name="discount"]').val()) + parseInt($('#coupondis').text()));
		console.log('폼으로 갈 할인금액 : ' + $('#payForm input[name="discount"]').val());
		console.log('폼으로 갈 쿠폰번호 : ' + $('#payForm input[name="mem_coupon_no"]').val())
		$('.couponbtn').css('display', 'none');
		$('#coupon-modal').modal("hide");
		$('input[name="couponchk"]').prop("checked", '');
	})
	
})

</script>