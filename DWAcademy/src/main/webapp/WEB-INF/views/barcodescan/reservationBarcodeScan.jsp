<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<form id="barcodeForm" enctype="multipart/form-data" role="barcodeForm">
	<input type="file" accept="image/jpeg,image/png,image/jpg" name="barcode">
</form>
<p>QR 업로드</p>

<script>
$(function(){
	$('input[name="barcode"]').on('change', function(){
		let form = new FormData($('form[role="barcodeForm"]')[0]);
		$.ajax({
			url : '<%=request.getContextPath()%>/scan/reservationImgUp.do',
			data : form,
			type : "post",
			processData : false,
			contentType : false,
			success : function(data){
				console.log(data);
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
})
</script>
<%@include file="../include/footer.jsp" %>