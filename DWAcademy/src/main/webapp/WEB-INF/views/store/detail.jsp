<%@page import="java.util.Map"%>
<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<%
String CategoryIdx = request.getParameter("CategoryIdx");
if (CategoryIdx == null) {
    CategoryIdx = "";
}

mem_cd = "";
if(session.getAttribute("loginUser") != null){
	Map member = (Map) session.getAttribute("loginUser");
	mem_cd = (String)member.get("CD");
}
%>
<%@ include file="login_service_modal.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/store.css">
<div class="sub_visual">
    <h3>스토어</h3>
    <h6>movie store</h6>
</div>
<div class="store-detail">
    <div class="container">
        <div class="lnb">
            <h2>스토어</h2>
            <ul>
                <li<%= CategoryIdx.equals("1") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=1">기프트카드</a></li>
                <li<%= CategoryIdx.equals("2") ? " class='on'" : "" %>><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=2">팝콘/스낵/음료</a></li>
            </ul>
        </div>
        <div class="content_wrap">
            <div class="pd_img">
                <div class="main_img">
                    <img class="" src="<%=request.getContextPath()%>/sysAdmin/getPicture.do?name=${product.product_pic_path }&item_cd=${product.product_cd}&type=productImg">
                </div>
                <div>
                	<div style="font-weight: bold; border-bottom: 1px solid #dee2e6">상품이용안내</div>
                	<textarea disabled style="border: none; resize: none; background-color: inherit" cols="50" rows="10">${product.product_info }</textarea>
                </div>
            </div>
            <div class="pd_detail">
                <table class="pd_table" summary="상품 상세설명에 대한 표입니다">
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
                    <td></td>
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
                <div class="bx_num">
                    <button class="btn_mins">삭제</button>
                    <div class="txt_num">1</div>
                    <button class="btn_plus">추가</button>
                </div>
                <div class="txt_price_wrap">
                    총 상품금액<strong class="txt_price_str"><span class="totalprice">${product.product_price}</span><em>원</em></strong>
                </div>
                <div class="btn_wrap">
                    <button class="btn_col2 ty7" id="gift">선물하기</button>
                    <button class="btn_col1 ty7" id="buy">구매하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<form method="post" id="payForm">
	<input type="hidden" name="product_cd" value="${product.product_cd }">
	<input type="hidden" name="amount">
</form>
<script>
	$(function(){
		let totalprice = 0;
		let amount = $('.txt_num').text();
		let price = ${product.product_price};
		$('.totalprice').text(price.toLocaleString());
		price = ${product.product_price };
		$('.btn_plus').on('click', function(){
			amount++;
			$('.txt_num').text(amount);
			totalprice = amount*price;
			$('.totalprice').text(totalprice.toLocaleString());

		});
		
		$('.btn_mins').on('click', function(){
			if(amount > 1){
				amount--;
				$('.txt_num').text(amount);
				totalprice = amount*price;
				$('.totalprice').text(totalprice.toLocaleString());
			}
		});
		
		$('#buy').on('click', function(){
			if('<%=mem_cd%>' == "" || '<%=mem_cd%>' == null){
				$('#login-service-modal').modal("show");
				return;
			}
			
			$('#payForm').prop('action', 'buyForm.do');
			$('input[name="totalprice"]').val(totalprice.toLocaleString());
			$('input[name="amount"]').val(amount);
			$('#payForm').submit();
		})
		
		$('#gift').on('click', function(){
			if('<%=mem_cd%>' == "" || '<%=mem_cd%>' == null){
				$('#login-service-modal').modal("show");
				return;
			}
			
			$('#payForm').prop('action', 'giftForm.do');
			$('input[name="amount"]').val(amount);
			$('#payForm').submit();
		})
		
		

	})
</script>
<%@ include file="../include/footer.jsp" %>