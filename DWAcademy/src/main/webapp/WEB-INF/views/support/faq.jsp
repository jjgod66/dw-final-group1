<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/faq.css">
<div class="sub_visual">
    <h3>자주 묻는 질문</h3>
    <h6>support faq</h6>
</div>
<div class="faq-wrapper">
	<div class="container">
		<div class="input-search-area mb-3">
			<div class="form-floating">
				<input type="search" id="searchTxt" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="form-control" value="" maxlength="15">
				<label for="searchTxt">빠른검색</label>
				<button type="button" id="searchBtn" class="btn-search-input">검색</button>
			</div>
			<div class="btn-area">
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>