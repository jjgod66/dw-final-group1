<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <li<%= CategoryIdx.equals("1") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=1">영화관람권</a></li>
                <li<%= CategoryIdx.equals("2") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=2">기프트카드</a></li>
                <li<%= CategoryIdx.equals("3") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=3">팝콘/스낵/음료</a></li>
            </ul>
        </div>
        <div class="content_wrap">
            <div class="row">
                <div class="col-12 col-lg-3">
                    <a href="/store/detail.do" class="btn_category_product">
                        <span class="com_list_img_wrap"><img src="<%=request.getContextPath()%>/resources/img/store/ERDC5wGVMC0YZPIRUsuuaJuAGRyqeDjC_280.png"></span>
                        <span class="com_list_text_wrap">
                            <span class="com_list_text_title">더블콤보</span>
                            <span class="com_list_text_name">팝콘(R) 2 + 탄산음료(R) 2</span>
                            <span class="com_list_sale_price_wrap">
                                <span class="store_deatail_source_price">13,000</span>
                            </span>
                        </span>
                    </a>
                </div>
                <div class="col-12 col-lg-3">
                    <a href="/store/detail.do" class="btn_category_product">
                        <span class="com_list_img_wrap"><img src="<%=request.getContextPath()%>/resources/img/store/qB1IVqlOLCV7hOOEAJp4J9iG3J5oVWjv_280.png"></span>
                        <span class="com_list_text_wrap">
                            <span class="com_list_text_title">러브콤보</span>
                            <span class="com_list_text_name">팝콘(L) 1 + 탄산음료(R) 2</span>
                            <span class="com_list_sale_price_wrap">
                                <span class="store_deatail_source_price">10,000</span>
                            </span>
                        </span>
                    </a>
                </div>
                <div class="col-12 col-lg-3">
                    <a href="/store/detail.do" class="btn_category_product">
                        <span class="com_list_img_wrap"><img src="<%=request.getContextPath()%>/resources/img/store/15464115505070.jpg"></span>
                        <span class="com_list_text_wrap">
                            <span class="com_list_text_title">칠리치즈핫도그</span>
                            <span class="com_list_text_name">칠리치즈핫도그</span>
                            <span class="com_list_sale_price_wrap">
                                <span class="store_deatail_source_price">5,000</span>
                            </span>
                        </span>
                    </a>
                </div>
                <div class="col-12 col-lg-3">
                    <a href="/store/detail.do" class="btn_category_product">
                        <span class="com_list_img_wrap"><img src="<%=request.getContextPath()%>/resources/img/store/15464120861130.jpg"></span>
                        <span class="com_list_text_wrap">
                            <span class="com_list_text_title">플레인핫도그</span>
                            <span class="com_list_text_name">플레인핫도그</span>
                            <span class="com_list_sale_price_wrap">
                                <span class="store_deatail_source_price">4,500</span>
                            </span>
                        </span>
                    </a>
                </div>
                <div class="col-12 col-lg-3">
                    <a href="/store/detail.do" class="btn_category_product">
                        <span class="com_list_img_wrap"><img src="<%=request.getContextPath()%>/resources/img/store/16751302793100.jpg"></span>
                        <span class="com_list_text_wrap">
                            <span class="com_list_text_title">칠리치즈나쵸</span>
                            <span class="com_list_text_name">칠리치즈나쵸</span>
                            <span class="com_list_sale_price_wrap">
                                <span class="store_deatail_source_price">4,900</span>
                            </span>
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>