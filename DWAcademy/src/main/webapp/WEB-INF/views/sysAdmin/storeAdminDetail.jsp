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
		<div class="store-detail" style="padding: 0;">
    <div class="container">
        <div class="lnb" style="padding-top: 0;">
            <ul>
                <li<%= CategoryIdx.equals("1") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/sysAdmin/storeAdminMain.do?CategoryIdx=1">기프트카드</a></li>
                <li<%= CategoryIdx.equals("2") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/sysAdmin/storeAdminMain.do?CategoryIdx=2">팝콘/스낵/음료</a></li>
            </ul>
        </div>
        <div class="content_wrap">
            <div class="pd_img">
                <div class="main_img">
                    <img class="" src="/common/getPicture.do?name=${product.product_pic_path }&item_cd=${product.product_cd }&type=productImg">
                </div>
            </div>
            <div class="pd_detail">
                <table class="pd_table" style="margin-bottom: 1rem;" summary="상품 상세설명에 대한 표입니다">
                <caption>상품 상세내용</caption>
                <colgroup>
                    <col style="width: 30%;">
                    <col style="width: auto;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="row" class="badge_wrap" colspan="2"></th>
                    </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row" class="tit" colspan="2">${product.product_name }</th>
                </tr>
                <tr>
                    <th>가격</th>
                    <td>
                        <span class="txt_price"><fmt:formatNumber value="${product.product_price }" pattern="#,##0" /><em>원</em></span>
                    </td>
                </tr>
                <tr>
                    <th scope="row">구성품</th>
                    <td>${product.product_content }</td>
                </tr>
                <tr>
                    <th scope="row">구매제한</th>
                    <td>제한없음</td>
                </tr>
                <tr>
                    <th scope="row">유효기간</th>
                    <td>구매일로부터 ${product.product_period }일</td>
                </tr>
                </tbody>
                </table>
                <div>
	               	<div class="mb-2" style="font-weight: bold;">이용안내</div>
               		<textarea disabled style="border: none; resize: none; background-color: inherit" cols="46" rows="10">${product.product_info }</textarea>
                </div>
                 <div class="btn_wrap">
                    <button class="btn_col2 ty7" id="modifyProductBtn">수정</button>
                </div>
            </div>
        </div>
    </div>
</div>
<form method="post" id="payForm">
	<input type="hidden" name="product_cd" value="${product.product_cd }">
	<input type="hidden" name="amount">
</form>
	</div>
</div>

<script>
	$(function(){
		$('#modifyProductBtn').on('click', function(){
			location.href="storeAdminProductRegistForm.do?product_cd=${product.product_cd}";
		});
	});
</script>
<%@ include file="sysAdminFooter.jsp" %>