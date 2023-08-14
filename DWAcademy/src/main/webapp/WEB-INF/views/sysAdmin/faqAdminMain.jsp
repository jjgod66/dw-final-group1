<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%@ include file="sysAdminHeader.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<c:set var="cri" value="${pageMaker.cri }" />
<style>

.td_div > td {
	cursor: pointer;
}
.td_div > td:hover {
	background-color : #D2DBE0;
}
.iconDiv i {
	cursor : pointer;
}
textarea:focus {
	outline: none;
}
#content h2 {
	margin: 5px 0 0 0;
	background-color : white;
/* 	position: static; */
	letter-spacing: 0;
	padding: 0;
}
#content h2:before {
	background-color: white;
}
</style>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
  	<form role="form" method="post">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5 float-start" id="modalTitle"></h1>
        <div style="margin-left: auto;">
        	<select name="faq_div">
        		<option value="영화예매">영화예매</option>
        		<option value="결제수단">결제수단</option>
        		<option value="멤버십">멤버십</option>
        		<option value="스토어">스토어</option>
        		<option value="기프트카드">기프트카드</option>
        		<option value="할인혜택">할인혜택</option>
        		<option value="VIP">VIP</option>
        		<option value="극장">극장</option>
        	</select>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin-left:0;"></button>
      </div>
      <div class="modal-body">
      	<input type="hidden" name="faq_no" value="">
        <input type="text" id="modalFaqTitle" class="mb-3 form-control"  name="faq_title" placeholder="제목을 적어주세요.">
      	<textarea rows="10" cols="80" style="resize: none;" class="form-control" id="modalFaqContent" name="faq_content" placeholder="내용을 적어주세요."></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="bc_dw_blue" id="registBtn">등록</button>
        <button type="button" class="bc_dw_blue" id="modifyBtn">수정</button>
        <button type="button" class="bc_dw_orange" id="deleteBtn">삭제</button>
        <button type="button" class="bc_dw_black" data-bs-dismiss="modal">뒤로가기</button>
      </div>
    </div>
  	</form>
  </div>
</div>

<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
	    <div class="search row mb-3">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-8 text-center">
	    		<span style="font-weight: bold;">빠른검색 </span>
	    		<input type="text" size="50" value="${cri.keyword }" name="keyword">  
	    		<button class="bc_dw_black" id="searchBtn">검색</button>
	    		<button class="bc_dw_black" id="registModalBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">등록</button>
	    		<select style="display: none;" name="searchType" id="searchType">
	    			<option value="all" id="전체" ${cri.searchType eq 'all' ? 'selected' : '' }>all</option>
	    			<option value="reservation" id="영화예매" ${cri.searchType eq 'reservation' ? 'selected' : '' }>reservation</option>
	    			<option value="pay" id="결제수단" ${cri.searchType eq 'pay' ? 'selected' : '' }>pay</option>
	    			<option value="membership" id="멤버십" ${cri.searchType eq 'membership' ? 'selected' : '' }>membership</option>
	    			<option value="store" id="스토어" ${cri.searchType eq 'store' ? 'selected' : '' }>store</option>
	    			<option value="giftcard" id="기프트카드" ${cri.searchType eq 'giftcard' ? 'selected' : '' }>giftcard</option>
	    			<option value="discount" id="할인혜택" ${cri.searchType eq 'discount' ? 'selected' : '' }>discount</option>
	    			<option value="vip" id="VIP" ${cri.searchType eq 'vip' ? 'selected' : '' }>vip</option>
	    			<option value="theater" id="극장" ${cri.searchType eq 'theater' ? 'selected' : '' }>theater</option>
	    		</select>
	    	</div>
	    	<div class="col-md-2"></div>
	    </div>
	    <div class="selectDiv row mb-3">
	    	<div class="col-md-3"></div>
	    	<div class="col-md-6">
	    	<table class="table table-bordered text-center">
				<tr class="td_div">
					<td class="${cri.searchType eq 'all' || cri.searchType eq '' ? 'table-active' : '' }">전체</td>
					<td class="${cri.searchType eq 'reservation' ? 'table-active' : '' }">영화예매</td>
					<td class="${cri.searchType eq 'discount' ? 'table-active' : '' }">할인혜택</td>
				</tr>
				<tr class="td_div">
					<td class="${cri.searchType eq 'pay' ? 'table-active' : '' }">결제수단</td>
					<td class="${cri.searchType eq 'membership' ? 'table-active' : '' }">멤버십</td>
					<td class="${cri.searchType eq 'vip' ? 'table-active' : '' }">VIP</td>
				</tr>
				<tr class="td_div">
					<td class="${cri.searchType eq 'theater' ? 'table-active' : '' }">극장</td>
					<td class="${cri.searchType eq 'store' ? 'table-active' : '' }">스토어</td>
					<td class="${cri.searchType eq 'giftcard' ? 'table-active' : '' }">기프트카드</td>
				</tr>
			</table>
			</div>
	    	<div class="col-md-3"></div>
	    </div>
	    <div class="row">
	    	<div class="col-md-2"></div>
	    	<div class="col-md-8">
	    		<div class="mb-3">전체 <b style="color: red">${pageMaker.totalCount }</b>건 조회</div>
	    		<c:forEach items="${faqList}" var="faq">
		    		<div class="accordion mb-2" id="accordionExample">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingOne">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq${faq.faq_no }" aria-expanded="false" aria-controls="collapseOne">
					        <div style="font-weight: bold;">
						        <p class="faq_div">[${faq.faq_div}]</p>
						        <p class="faq_title">Q. ${faq.faq_title }</p>
						        <input class="faq_no" type="hidden" value="${faq.faq_no }">
					        </div>
					      </button>
					    </h2>
					    <div id="faq${faq.faq_no }" class="accordion-collapse collapse" aria-labelledby="headingOne" >
					      <div class="accordion-body mb-3">
					      	<div>
						        <p class="faq_content"><strong>A. </strong>${fn:replace(faq.faq_content, replaceChar, "<br/>&nbsp;&nbsp;&nbsp;&nbsp;")}</p>
					      	</div>
					      	<div class="float-end iconDiv">
					      		<i class="bi bi-wrench modifyModalBtn" style="color: #0d6efd" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
					      	</div>
					      </div>
					    </div>
					  </div>
					</div>
	    		</c:forEach>
	    	</div>
	    	<div class="col-md-2"></div>
	    </div>
	    <div class="paginationDiv">
	    	<%@ include file="../common/pagination.jsp" %>
	    </div>
    </div>
</div>
<script>
	let searchFormUrl = "faqAdminMain.do";
	// 탭 선택시
	$('.td_div > td').on('click', function(){
		let searchType = $(this).text();
		$('option#'+searchType).prop('selected', true);
		$('input[name="keyword"]').val('');
		searchList_go(1);
	});
	
	// 검색시
	$('#searchBtn').on('click', function(){
		searchList_go(1);
	});
	
	// 수정버튼 클릭시
	 $('.modifyModalBtn').on('click', function(){
		 let faqDiv = $(this).closest('.accordion').find('.faq_div').text().substring(1, $(this).closest('.accordion').find('.faq_div').text().length-1);
		 let faqTitle = $(this).closest('.accordion').find('.faq_title').text().substring(3);
		 let faqContent = $(this).closest('.accordion').find('.faq_content').text().substring(3);
		 let faqNo = $(this).closest('.accordion').find('.faq_no').val();
		 $('select[name="faq_div"] option[value="'+faqDiv+'"]').prop('selected', true);
		 $('#modalFaqTitle').val(faqTitle);
		 $('#modalFaqContent').text(faqContent);
		 $('input[name="faq_no"]').val(faqNo);
		 $('#modalTitle').text('FAQ 수정');
		 $('#registBtn').hide();
		 $('#modifyBtn').show();
		 $('#deleteBtn').show();
		 
	 });
	
	// 모달 안의 수정버튼 클릭시
	$('#modifyBtn').on('click', function(){
		let modifyForm = $('form[role="form"]');
		modifyForm.attr('action', 'faqAdminModify.do');
		modifyForm.submit();
	});
	// 모달 안의 삭제버튼 클릭시
	$('#deleteBtn').on('click', function(){
		let deleteForm = $('form[role="form"]');
		deleteForm.attr('action', 'faqAdminDelete.do');
		deleteForm.submit();
	});
	
	// 등록버튼 클릭시
	$('#registModalBtn').on('click', function(){
		$('#modalTitle').text('FAQ 등록');
		$('#modifyBtn').hide();
		$('#deleteBtn').hide();
	});
	
	// 모달 안의 등록버튼 클릭시
	$('#registBtn').on('click', function(){
		let registForm = $('form[role="form"]');
		registForm.attr('action', 'faqAdminRegist.do');
		registForm.submit();
	});
</script>
<%@ include file="sysAdminFooter.jsp"%>