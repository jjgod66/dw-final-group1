<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%
String CategoryIdx = request.getParameter("CategoryIdx");
if (CategoryIdx == null) {
    CategoryIdx = "";
}
%>
<link rel="stylesheet" href="/css/store.css">
<div class="sub_visual">
    <h3>스토어</h3>
    <h6>movie store</h6>
</div>
<div class="store-detail">
    <div class="container">
        <div class="lnb">
            <h2>스토어</h2>
            <ul>
                <li<%= CategoryIdx.equals("1") ? " class='on'" : "" %>><a href="store.jsp?CategoryIdx=1">영화관람권</a></li>
                <li<%= CategoryIdx.equals("2") ? " class='on'" : "" %>><a href="store.jsp?CategoryIdx=2">기프트카드</a></li>
                <li<%= CategoryIdx.equals("3") ? " class='on'" : "" %>><a href="store.jsp?CategoryIdx=3">팝콘/스낵/음료</a></li>
            </ul>
        </div>
        <div class="content_wrap">
            <div class="pd_img">
                <div class="main_img">
                    <img class="" src="/img/store/15464115505070.jpg">
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
                    <th scope="row" class="tit" colspan="2">상품명</th>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <span class="txt_price">2,800<em>원</em></span>
                    </td>
                </tr>
                <tr>
                    <th scope="row">구성품</th>
                    <td>상품명</td>
                </tr>
                <tr>
                    <th scope="row">구매제한</th>
                    <td>제한없음</td>
                </tr>
                <tr>
                    <th scope="row">유효기간</th>
                    <td>스위트샵 상품권 24 개월</td>
                </tr>
                </tbody>
                </table>
                <div class="bx_num">
                    <button class="btn_mins">삭제</button>
                    <div class="txt_num">1</div>
                    <button class="btn_plus">추가</button>
                </div>
                <div class="txt_price_wrap">
                    총 상품금액<strong class="txt_price_str">2,800<em>원</em></strong>
                </div>
                <div class="btn_wrap">
                    <button class="btn_col2 ty7">선물하기</button>
                    <button class="btn_col1 ty7">구매하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>