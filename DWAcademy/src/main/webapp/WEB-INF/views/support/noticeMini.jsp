<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel='stylesheet' href='https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/unicons.css'>
  <link rel="dns-prefetch" href="//unpkg.com" />
<link rel="dns-prefetch" href="//cdn.jsdelivr.net" />
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css">
<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>
<style>
		[x-cloak] {
			display: none;
		}
td a {color: inherit;}
		/* input:checked + svg {
			display: block;
		} */
		[type="checkbox"] {
			box-sizing: border-box;
			padding: 0;
		}

		.form-checkbox {
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			-webkit-print-color-adjust: exact;
			color-adjust: exact;
			display: inline-block;
			vertical-align: middle;
			background-origin: border-box;
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			user-select: none;
			flex-shrink: 0;
			color: currentColor;
			background-color: #fff;
			border-color: #e2e8f0;
			border-width: 1px;
			border-radius: 0.25rem;
			height: 1.2em;
    		width: 1.2em;
		}

		.form-checkbox:checked {
			background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='white' xmlns='http://www.w3.org/2000/svg'%3e%3cpath d='M5.707 7.293a1 1 0 0 0-1.414 1.414l2 2a1 1 0 0 0 1.414 0l4-4a1 1 0 0 0-1.414-1.414L7 8.586 5.707 7.293z'/%3e%3c/svg%3e");
			border-color: transparent;
			background-color: currentColor;
			background-size: 100% 100%;
			background-position: center;
			background-repeat: no-repeat;
		}
		
		
		
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700,800,900');
*,
*::before,
*::after {
  box-sizing: border-box;
}

[type="checkbox"]:checked,
[type="checkbox"]:not(:checked){
  position: absolute;
  left: -9999px;
}
		
.oneNotice:hover td{
	text-decoration: underline;
}
.oneNotice:hover{
	cursor: pointer;
}
.board-search {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    width: 230px;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
}

.input-text {
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    vertical-align: middle;
}
.board-search .btn-search-input {
    position: absolute;
    right: 1px;
    top: 1px;
}
.btn-search-input {
    overflow: hidden;
    width: 30px;
    height: 32px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
    text-indent: -9999px;
    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-search-input.png) no-repeat center;
}
select {
    overflow: hidden;
    height: 34px;
    border: 1px solid #d8d9db;
}
</style>

</head>
<body>
<body class="antialiased sans-serif bg-gray-200">
	<div class="container mx-auto py-6 px-4" x-data="datatables()" x-cloak style="width: 90%;">
		<div style="width: 100%; margin: 10px auto; display: flex;">
			<div style="margin-right: 10px;">
				<span>
					<select name="searchType" id="searchType" onchange="javascript:searchList_go(1);">
						<option value="전체" selected>전체 </option>
						<option value="DW시네마" ${searchType eq 'DW시네마' ? 'selected' : '' }>DW시네마공지</option>
						<option value="지점" ${searchType eq '지점' ? 'selected' : '' }>지점공지</option>
					</select>
				</span>
			</div>
			<div class="board-search" style="">
				<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" name="keyword" value="${pageMaker.cri.keyword }">
				<button type="button" class="btn-search-input" id="noticeSearchBtn">검색</button>
			</div>
		</div>
		<div class="overflow-x-auto bg-white rounded-lg shadow  relative">
			<table class="border-collapse table-auto w-full  bg-white table-striped relative">
				<thead>
					<tr class="text-left">
						<template x-for="heading in headings">
							<th class="bg-gray-100 sticky top-0 border-b border-gray-200 px-6 py-2 text-gray-600 font-bold tracking-wider uppercase text-xs"
								x-text="heading.value" :x-ref="heading.key" :class="{ [heading.key]: true }"></th>
						</template>
					</tr>
				</thead>
				<tbody>
	
					<template x-for="user in users" :key="user.userId">

<!-- 						<tr> -->
<!-- 							<td class="border-dashed border-t border-gray-200 userId"> -->
<!-- 								<span class="text-gray-700 px-6 py-3 flex items-center"> -->
<!-- 									<input class="modal-btn" type="checkbox" id="modal-btn" name="modal-btn"/> -->
<!-- 							      	<label for="modal-btn">1 </label> 		 -->
<%-- 							      	<%@ include file="noticeModal.jsp" %> --%>
<!-- 								</span> -->
<!-- 							</td> -->
<!-- 							<td class="border-dashed border-t border-gray-200 firstName"> -->
<!-- 								<span class="text-gray-700 px-6 py-3 flex items-center"> -->
<!-- 									<input class="modal-btn" type="checkbox" id="modal-btn" name="modal-btn"/> -->
<!-- 							      	<label for="modal-btn">서울강남 </label> 	 -->
<%-- 							      	<%@ include file="noticeModal.jsp" %> --%>
<!-- 								</span> -->
<!-- 							</td> -->
<!-- 							<td class="border-dashed border-t border-gray-200 lastName"> -->
<!-- 								<span class="text-gray-700 px-6 py-3 flex items-center"> -->
<!-- 									<input class="modal-btn" type="checkbox" id="modal-btn" name="modal-btn"/> -->
<!-- 							      	<label for="modal-btn">공지 </label> 	 -->
<%-- 							      	<%@ include file="noticeModal.jsp" %> --%>
<!-- 								</span> -->
<!-- 							</td> -->
<!-- 							<td class="border-dashed border-t border-gray-200 emailAddress"> -->
<!-- 								<span class="text-gray-700 px-6 py-3 flex items-center"> -->
<!-- 									<input class="modal-btn" type="checkbox" id="modal-btn" name="modal-btn"/> -->
<!-- 							      	<label for="modal-btn">현금없는 극장 안내 </label> 	 -->
<%-- 							      	<%@ include file="noticeModal.jsp" %>	 --%>
<!-- 								</span> -->
<!-- 							</td> -->
<!-- 							<td class="border-dashed border-t border-gray-200 gender"> -->
<!-- 								<span class="text-gray-700 px-6 py-3 flex items-center"> -->
<!-- 									<input class="modal-btn" type="checkbox" id="modal-btn" name="modal-btn"/> -->
<!-- 							      	<label for="modal-btn">2023년 7월 27일 </label> 	 -->
<%-- 							      	<%@ include file="noticeModal.jsp" %>	 --%>
<!-- 								</span> -->
<!-- 							</td> -->
<!-- 						</tr> -->
						<c:forEach items="${noticeList }" var="notice">
							<tr class="oneNotice" onclick="location.href='<%=request.getContextPath()%>/support/noticeMini_Detail.do?notice_no=${notice.notice_no }'">
								<td class="border-dashed border-t border-gray-200 userId">
									<span class="text-gray-700 px-6 py-3 flex items-center" style="color: inherit;">${notice.notice_no }</span>
								</td>
								<td class="border-dashed border-t border-gray-200 firstName">
									<span class="text-gray-700 px-6 py-3 flex items-center" style="color: inherit;">${notice.notice_thr }</span>
								</td>
								<td class="border-dashed border-t border-gray-200 emailAddress">
									<span class="text-gray-700 px-6 py-3 flex items-center" style="color: inherit;">${notice.notice_title }</span>
								</td>
								<td class="border-dashed border-t border-gray-200 gender">
									<span class="text-gray-700 px-6 py-3 flex items-center"><fmt:formatDate value="${notice.regdate }" pattern="yyyy-MM-dd"/> </span>
								</td>
							</tr>
						</c:forEach>
					</template>
				</tbody>
			</table>
					<c:if test="${empty noticeList }">
						<div style="text-align: center; margin: 50px 0;">공지사항이 없습니다.</div>
					</c:if>
		</div>
	</div>

	<script>
	
	$(function(){
		$('#noticeSearchBtn').on('click', function(){
			searchList_go(1);
		})
	})
	
	let searchFormUrl = 'notice.do';
	let searchT = '${pageMaker.cri.searchType}';
	if(searchT == ''){
		searchT = '전체';
	}
	$('select[name="searchType"]').val(searchT);
	
		function datatables() {
			return {
				headings: [
					{
						'key': '',
						'value': ''
					},
					{
						'key': 'firstName',
						'value': '극장'
					},
// 					{
// 						'key': 'lastName',
// 						'value': '지역'
// 					},
					{
						'key': 'emailAddress',
						'value': '제목'
					},
					{
						'key': 'gender',
						'value': '등록일'
					},
				],
				users: [{
					"userId": 1,
					"firstName": "pleas doNot Touch Me",
					"lastName": "No Touch Me",
					"emailAddress": "No Touch Me",
					"gender": "No Touch Me",
					"phoneNumber": "No Touch Me"
				}],
				selectedRows: [],
				open: false,
				toggleColumn(key) {
					let columns = document.querySelectorAll('.' + key);

					if (this.$refs[key].classList.contains('hidden') && this.$refs[key].classList.contains(key)) {
						columns.forEach(column => {
							column.classList.remove('hidden');
						});
					} else {
						columns.forEach(column => {
							column.classList.add('hidden');
						});
					}
				},
			}
		}
	</script>
</body>
<!-- 끝-->
  
</body>
</html>