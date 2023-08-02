<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>

<script>
	$(function(){
		let merchant_uid = '${giftInfo.merchant_uid }';
		let toname = '${giftInfo.toname }';
		let tophone = ${giftInfo.tophone };
		let product_name = '${giftInfo.product_name }'; 
		let mem_name = '${giftInfo.mem_name }';
		let product_period = ${giftInfo.product_period };
		$.ajax({
			url : "<%=request.getContextPath()%>/SMS/sendGift.do",
			method : 'post',
			data : {
				"merchant_uid" : merchant_uid,
				"toname" : toname,
				"tophone" : tophone,
				"product_name" : product_name,
				"mem_name" : mem_name,
				"product_period" : product_period
			},
			success : function(res){
				console.log(res);
				alert("선물이 완료되었습니다.");
				location.href="<%=request.getContextPath()%>/store/giftSuccess.do?merchant_uid=" + merchant_uid;
			},
			error : function(err){
				alert(err.status)
			}
		})
	})
</script>

<!-- </head> -->
<!-- <body> -->
<%-- <form action="<%=request.getContextPath()%>/sms/sendGift.do" method="post" id="giftSms"> --%>
<%-- 	<input type="hidden" name="toname" value="${giftInfo.toname }"> --%>
<%-- 	<input type="hidden" name="tophone" value="${giftInfo.tophone }"> --%>
<%-- 	<input type="hidden" name="product_name" value="${giftInfo.product_name }"> --%>
<%-- 	<input type="hidden" name="merchant_uid" value="${giftInfo.merchant_uid }"> --%>
<%-- 	<input type="hidden" name="mem_name" value="${giftInfo.mem_name }"> --%>
<%-- 	<input type="hidden" name="product_period" value="${giftInfo.product_period }"> --%>
<!-- </form> -->
<!-- </body> -->
<!-- </html> -->