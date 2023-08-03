<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../booking/login_service_modal.jsp" %>
    
<script>
	$('#login-service-modal').modal("show");
	if(window.opener){
		window.close();
	}else{
		location.href="<%=request.getContextPath()%>/main.do";
	}
</script>