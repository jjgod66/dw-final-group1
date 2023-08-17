<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="https://fengyuanchen.github.io/cropperjs/css/cropper.css">
<script src="https://fengyuanchen.github.io/cropper/js/cropper.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>  
<%@ include file="photo_modal2.jsp" %>
<style>
.photocontainer {
    background-color: #fff;
    border-left: 1px solid #F4F4F5;
    border-right: 1px solid #F4F4F5;
    width: 1300px;
    margin-left: auto;
    margin-right: auto;
    height: 600px;
}

.ico-kakaopay {
    background-image: url(<%=request.getContextPath()%>/resources/img/payment_icon_yellow_small.png);
    background-size: 70px;
    background-repeat: no-repeat;
    margin: 0 auto;
	margin-bottom: 5px;
    display: block;
    width: 70px;
    height: 29px;
}

	
</style>
<%
Map member = null;
if(session.getAttribute("loginUser") != null){
	member = (Map) session.getAttribute("loginUser");
	mem_cd = (String)member.get("CD");
}

%>
<div class="sub_visual">
    <h3>포토티켓</h3>
    <h6>photo ticket</h6>
</div>
<div class="wrapper">
	<div style="background-color: #f1f2f7; padding: 15px 0;">
		<div class="photocontainer row">
			<div class="col-9">
				<div style="width: 100%; text-align: center;">
					<h3 style="padding-top: 40px; font-weight: 700;">포토티켓 이미지 편집</h3>
				</div>
				<div class="" style="margin: 40px 0; padding: 0 170px;">
					<div style="float: left; display: inline;">
						<div class="card" style="width: 275px; height: 425px; float: left;">
							<div class="card-body" id="result" style="text-align: center; line-height: 400px; padding: 0px; background-repeat : no-repeat; background-size : cover;">
								<a href="javascript:inputfileclick();" style="font-size: 20px; color: gray; text-decoration: underline; padding: 0px;" id="imgupbtn">이미지업로드</a>
<!-- 								<img style="width: 100%; height: 100%;" src="" id="result"> -->
							</div>
							<input type="file" accept="image/jpeg,image/png,image/jpg" id="inputfile" onchange="setThumbnail(event);" style="display:none;">
						</div>
						<div style="text-align: center;">앞면</div>
					</div>
					<div style="float: right; display: inline;">
						<div class="card" style="width: 275px; height: 425px; float: right; padding: 10px;" id="back">
							<div class="card-body">
								<div class="" style="text-align: center; margin: 10px;"><img src="<%=request.getContextPath()%>/resources/img/logo.png" style="width: 90%;"></div>
								<hr style="width: 100%; color: gray; margin: 30px auto;">
								<h4 style="font-weight: 600;">${dataMap.MOVIE_NAME }</h4>
								<br>
								<p>${dataMap.MOVIE_GRADE } (${dataMap.MOVIE_TYPE_DES})</p>
								<br>
								<p>${dataMap.THR_NAME } &nbsp; ${dataMap.HOUSE_NAME }</p>
								<br>
								<p><fmt:formatDate value="${dataMap.STARTDATE }" pattern="yyyy-MM-dd"/></p>
								<p>${dataMap.starttime } ~ ${dataMap.endtime }</p>
								<hr style="width: 100%; color: gray; margin: 30px auto 10px auto;">
								<div class="row">
								<div class="col-8" style="font-size: 10px; padding-top:20px;">
									상영관 입장은 별도의 
									<br>
									지류티켓으로 가능합니다.
								</div>
								<div class="col-4">
									<img src="<%=request.getContextPath() %>/common/getPicture.do?name=${dataMap.MERCHANT_UID}.png&type=qr" style="width: 100%;">
								</div>
								</div>
							</div>
						</div>
						<div style="text-align: center;">뒷면</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card card-payment p-3 mb-3" style="border-color: #fff; margin-top: 200px;">
					<span>상품 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow">1,000</h2> <span>원</span>
					</div>
					<span>결제 금액</span>
					<div class="d-flex flex-row align-items-end mb-3">
						<h2 class="mb-0 yellow">1,000</h2> <span>원</span>
					</div>
					<button class="btn btn-primary px-3" id="credit" onclick="requestPay('kakaopay');">
					  	<i class="ico-kakaopay"></i>
					  	<span class="paycard-title">카카오페이 결제</span>
					 </button>
					<button class="btn btn-primary px-3" id="credit" onclick="requestPay('html5_inicis');" style="margin-top: 10px;">카드 결제</button>
					<button class="btn btn-success px-3" id="reset" style="float: right; margin-top: 20px;">초기화</button>
				</div>
			</div>
		</div>
	</div>

</div>
<form id="photoForm" method="post" action="<%=request.getContextPath()%>/photoTicket/pay.do">
	<input type="hidden" name="merchant_uid" value="${dataMap.MERCHANT_UID}">
	<input type="hidden" name="front_path">
	<input type="hidden" name="back_path">
	<input type="hidden" name="json">
	<input type="hidden" name="page" value="${page }">
</form>
<script>
const IMP = window.IMP;
IMP.init("imp04352208");


//결제화면 띄우는 메서드

function requestPay(method) { 
	if($('input[name="front_path"]').val() == null || $('input[name="front_path"]').val() == ''){
		alert('사진을 선택해주세요');
		return;
	}
	
	let merchant_uid = new Date().getTime();
	sreenShot($("#back"));
	console.log('back_path : ' + $('input[name="back_path"]').val());
    IMP.request_pay({
        pg: method,
        pay_method: 'card',
        merchant_uid: merchant_uid,
        name: '포토티켓',
        amount: 1000,
        buyer_email: '<%=member.get("EMAIL")%>',
        buyer_name: '<%=member.get("NAME")%>',
        buyer_tel: '<%=member.get("PHONE")%>',
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
			$('input[name="json"]').val(JSON.stringify(rsp));
			console.log('back_path : ' + $('input[name="back_path"]').val());
// 			alert("결제완료");
			$('#photoForm').submit();	
			
        } else {
            console.log(rsp);
            alert('결제가 실패 되었습니다.');

        }
    });
}

function inputfileclick(){
	$('#inputfile').click();
}

function photomodal(){
$('#photo-modal').modal('show');
}

var cropper;

function setThumbnail(event){
	var reader = new FileReader();

    reader.onload = function(event) {
      var img = $('<img>');
      img.prop("src", event.target.result);
      img.css('object-fit', 'cover');
      img.css('margin', '0 auto');
      img.prop('id', 'image');
      $(".them_img").html(img);
    };

    reader.readAsDataURL(event.target.files[0]);
    $('#photo-modal').modal('show');
};

function sreenShot(target) {
	if (target != null && target.length > 0) {
		var t = target[0];
		html2canvas(t).then(function(canvas) {
			var myImg = canvas.toDataURL("image/png");
			myImg = myImg.replace("data:image/png;base64,", "");
			
			canvas.toBlob(function (blob) {
	    		var formData = new FormData();
				
	    		formData.append('croppedImage', blob);
	    		$.ajax({
	    			url : '<%=request.getContextPath()%>/photoTicket/back.do',
	           		method: 'POST',
	                data: formData,
	                processData: false,
	                contentType: false,
	                success: function (res) {
	                	console.log(res);
	                	$('input[name="back_path"]').val(res);
	                },
	                error: function (err) {
	                	alert(err.status);
	                },
	    		});
	    	})
	    	
		});
	}
}
$(function(){
	
	$("#test").on("click", function() {
		sreenShot($("#back"));
	});

	
	
	$('#reset').on('click', function(){
		$('#result').css('background-image', '');
		$('#imgupbtn').css('display', '');
		$('input[name="front_path"]').val('');
	})

})
	
	
</script>
<%@include file="../include/footer.jsp" %>