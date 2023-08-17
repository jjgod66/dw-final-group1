<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
<style>
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
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
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		<div class="store-inner" style="padding: 0;">
		    <div class="container">
		        <div class="lnb" style="padding-top: 0;">
		            <ul>
		                <li<%= CategoryIdx.equals("1") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/sysAdmin/storeAdminMain.do?CategoryIdx=1">기프트카드</a></li>
		                <li<%= CategoryIdx.equals("2") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/sysAdmin/storeAdminMain.do?CategoryIdx=2">팝콘/스낵/음료</a></li>
		            </ul>
		        </div>
		        <div>
		         <button class="bc_dw_black" style="float: right;" id="registProductBtn">상품 등록</button>
		        </div>
		        <div class="mt-5">
		        	<div class="text-end">
				        ** <div style="display: inline-block; width:30px; height: 10px; background-color: #e9ecef;"></div> 비활성화상품
		        	</div>
		        </div>
		        <div class="content_wrap">
		            <div class="row">
		            	<c:forEach items="${productList }" var="product">
		            		 <div class="col-12 col-lg-3 productDiv" style="${product.gb_del == 'Y' ? 'background-color: #e9ecef;' : ''}">
			                    <a href="<%=request.getContextPath()%>/sysAdmin/storeAdminDetail.do?product_cd=${product.product_cd }" class="btn_category_product pt-1">
			                        <span class="com_list_img_wrap" style="width: 185px; height:185px;"><img src="<%=request.getContextPath()%>/common/getPicture.do?name=${product.product_pic_path }&item_cd=${product.product_cd}&type=productImg" style="object-fit: cover; height: 185px;"></span>
			                        <span class="com_list_text_wrap">
			                            <span class="com_list_text_title"><b>${product.product_name }</b></span>
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
		location.href='storeAdminProductRegistForm.do';
	});
</script>
<%@ include file="sysAdminFooter.jsp"%>