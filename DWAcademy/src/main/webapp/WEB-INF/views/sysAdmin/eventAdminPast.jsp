<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sysAdminHeader.jsp" %>
    
   <style>
 .breadcrumb {
    padding: 0 0 0 25px;
    color: #000;
    line-height: 34px;
    border-bottom: 1px solid #e9e9e9;
    text-align: left;
}
.breadcrumb span {
    font-weight: 400;
}

 </style>
 <div class="breadcrumb">
	<span>HOME</span>&nbsp  &gt 이벤트관리 &gt 지난 이벤트 
</div>   
    
    
<%@ include file="../event/eventPast2.jsp" %>
    
    
    
    
<%@ include file="sysAdminFooter.jsp"%>