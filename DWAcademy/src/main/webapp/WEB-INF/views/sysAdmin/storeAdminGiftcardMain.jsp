<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
<style>
#wrapper {
    background-color: #fff;
    z-index: 5;
    min-width: 1210px;
    zoom: 1;
}
#content {
	max-width: 80rem;
	margin : 2rem auto 2rem auto;
    padding-bottom: 100px;
    border: 1px solid #ccc;
}
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
.btn_ssmall, .btn_small, .btn_lsmall, .btn_medium, .btn_large {
    background: #333;
    border: 1px solid #333;
    color: #fff !important;
}
.btn_medium {
    padding: 8px 15px;
    font-size: 13px;
    line-height: 1.444;
    font-weight: 600;
}
</style>
<%
String CategoryIdx = request.getParameter("CategoryIdx");

if (CategoryIdx == null) {
	CategoryIdx = "";
}
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/store.css">
<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
		</jsp:include>
		<div class="store-inner" style="padding: 0;">
		    <div class="container">
		        <div class="lnb" style="padding-top: 0;">
		            <ul>
		                <li<%= CategoryIdx.equals("1") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/sysAdmin/storeAdminGiftcardMain.do?CategoryIdx=1">기프트카드</a></li>
		                <li<%= CategoryIdx.equals("2") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/sysAdmin/storeAdminGiftcardMain.do?CategoryIdx=2">팝콘/스낵/음료</a></li>
		            </ul>
		        </div>
		        <div>
		        <button class="btn_medium" style="float: right;" id="registProductBtn">상품 등록</button>
		        </div>
		        <div class="content_wrap">
		            <div class="row">
		            	<c:forEach items="${productList }" var="product">
		            		 <div class="col-12 col-lg-3">
			                    <a href="/store/detail.do?product_cd=${product.product_cd }" class="btn_category_product">
			                        <span class="com_list_img_wrap"><img src="<%=request.getContextPath()%>/resources/img/store/${product.product_pic_path}"></span>
			                        <span class="com_list_text_wrap">
			                            <span class="com_list_text_title">${product.product_name }</span>
			                            <span class="com_list_text_name">${product.product_content }</span>
			                            <span class="com_list_sale_price_wrap">
			                                <span class="store_deatail_source_price"><fmt:formatNumber value="${product.product_price }" pattern="#,##0" /></span>
			                            </span>
			                        </span>
			                    </a>
			                </div>
		            	</c:forEach>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>
<script>
	$('#registProductBtn').on('click', function(){
		location.href='storeAdminProductRegist.do';
	});
</script>
<%@ include file="sysAdminFooter.jsp"%>