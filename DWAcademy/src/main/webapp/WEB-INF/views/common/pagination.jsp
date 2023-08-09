<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav aria-label="member list Nabigation">
	<ul class="pagination justify-content-center m-0">
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(1);">
				<i class="bi bi-chevron-double-left"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(${pageMaker.prev ? pageMaker.cri.getPage() - 1 : -1 });">
				<i class="bi bi-chevron-left"></i>
			</a>
		</li>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
			<li class="page-item ${pageMaker.cri.page == pageNum ? 'active' : '' }">
				<a class="page-link" href="javascript:searchList_go(${pageNum });">${pageNum }</a>
			</li>
		</c:forEach>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(${pageMaker.next ? pageMaker.cri.getPage() +1 : -1 });">
				<i class="bi bi-chevron-right"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(${pageMaker.realEndPage });">
				<i class="bi bi-chevron-double-right"></i>
			</a>
		</li>
	</ul>
</nav>



<form id="searchForm">
	<input type="hidden" name="page">
	<input type="hidden" name="perPageNum">
	<input type="hidden" name="searchType">
	<input type="hidden" name="searchType2">
	<input type="hidden" name="adminType">
	<input type="hidden" name="orderType">
	<input type="hidden" name="keyword">
	<input type="hidden" name="monthKeyword">
</form>
<script>
	if (${not empty sessionScope.admin_cd}) {
		$('#searchForm').find('[name="adminType"]').val('${sessionScope.admin_cd}');
	}
	
	function searchList_go(page, url) {
		if (page < 1) {
			return;
		}
		
		let perPageNum = 10;
		if ($('select[name="perPageNum"]').val()) {
			perPageNum = $('select[name="perPageNum"]').val();
		}
		let searchForm = $('#searchForm');
		searchForm.find('[name="page"]').val(page);
		searchForm.find('[name="perPageNum"]').val(perPageNum);
		searchForm.find('[name="searchType"]').val($('select[name="searchType"]').val());
		if ($('select[name="searchType2"]').length) {
			searchForm.find('[name="searchType2"]').val($('select[name="searchType2"]').val());
		}
		if ($('select[name="orderType"]').length) {
			searchForm.find('[name="orderType"]').val($('select[name="orderType"]').val());
		}
		searchForm.find('[name="keyword"]').val($('input[name="keyword"]').val());
		searchForm.find('[name="monthKeyword"]').val($('select[name="monthKeyword"]').val());
		searchForm.attr("method", "post");
		if (url) {
			searchForm.attr("action", url);
		} else {
			searchForm.attr("action", searchFormUrl);
		}
		searchForm.submit();
	}
</script>