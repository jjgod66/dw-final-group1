<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../include/header.jsp" %>
<%
String CategoryIdx = request.getParameter("CategoryIdx");

if (CategoryIdx == null) {
	CategoryIdx = "";
}
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/store.css">
<div class="sub_visual">
    <h3>스토어</h3>
    <h6>movie store</h6>
</div>
<div class="store-inner">
    <div class="container">
        <div class="lnb">
            <h2>스토어</h2>
            <ul>
                <li<%= CategoryIdx.equals("1") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=1">기프트카드</a></li>
                <li<%= CategoryIdx.equals("2") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=2">팝콘/스낵/음료</a></li>
            </ul>
        </div>
        <div class="content_wrap">
            <div class="row">
            	<c:forEach items="${productList }" var="product">
            		 <div class="col-12 col-lg-3">
	                    <a href="/store/detail.do?product_cd=${product.product_cd }" class="btn_category_product">
	                        <span class="com_list_img_wrap"><img src="<%=request.getContextPath()%>/sysAdmin/getPicture.do?name=${product.product_pic_path }&item_cd=${product.product_cd}&type=productImg"></span>
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
<!--             <div class="paginationdiv" style="margin-right: 150px; margin-top: 50px;"> -->
<%-- 			<%@ include file="../common/pagination.jsp" %> --%>
<!-- 			</div> -->
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>