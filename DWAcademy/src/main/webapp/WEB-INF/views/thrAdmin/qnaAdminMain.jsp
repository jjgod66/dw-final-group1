<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<style>
#wrapper {
    background-color: #fff;
    z-index: 5;
    min-width: 1210px;
    zoom: 1;
}
#content {
	max-width: 80rem;
	margin : 2rem auto 2rem auto;
    padding-bottom: 100px;
    border: 1px solid #ccc;
}
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
.btn_ssmall, .btn_small, .btn_lsmall, .btn_medium, .btn_large {
    background: #333;
    border: 1px solid #333;
    color: #fff !important;
}
.btn_medium {
    padding: 8px 15px;
    font-size: 13px;
    line-height: 1.444;
    font-weight: 600;
}
</style>
<c:set var="cri" value="${pageMaker.cri }" />
<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
		        <div class="board-header" style="justify-content: space-between;">
					<div class="searchSelect">
						<select id="searchType" name="searchType">
							<option value="a" ${cri.searchType eq '' || cri.searchType eq 'a' ? 'selected' : ''}>전체</option>
							<option value="b" ${cri.searchType eq 'b' ? 'selected' : ''}>일반문의</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected' : ''}>제안</option>
							<option value="d" ${cri.searchType eq 'd' ? 'selected' : ''}>칭찬</option>
							<option value="e" ${cri.searchType eq 'e' ? 'selected' : ''}>불만</option>
						</select>
						<select id="searchType2" name="searchType2">
							<option value="a" ${cri.searchType2 eq '' || cri.searchType2 eq 'a'? 'selected' : ''}>답변상태</option>
							<option value="b" ${cri.searchType2 eq 'b' ? 'selected' : ''}>답변대기</option>
							<option value="c" ${cri.searchType2 eq 'c' ? 'selected' : ''}>답변완료</option>
						</select>
					</div>
					<div class="searchKeyword">
						<input type="text" name="keyword" id="keyword" value="${cri.keyword }" placeholder="제목,내용,작성자이름">
						<button id="searchBtn" onclick="searchList_go(1);"><i class="bi bi-search"></i></button>
					</div>
		        </div>
		        <div class="board-body">
		            <table class="table table-border text-center">
		                <tr>
							<th width="15%">유형</th>			                
							<th>제목</th>			                
							<th width="15%">이름</th>			                
							<th width="10%">회원여부</th>			                
							<th width="15%">문의날짜</th>			                
							<th width="10%">답변상태</th>			                
		                </tr>
						<tbody>
		    			<c:if test="${empty qnaList }">
							<tr>
								<th colspan="6">작성 글이 없습니다.</th>
							</tr>
						</c:if>
		            	<c:forEach items="${ qnaList}" var="qna">
		            		<tr>
		            			<td>${qna.que_type }</td>
		            			<td><a href="qnaAdminDetail.do?que_no=${qna.que_no }">${qna.que_title }</a></td>
		            			<td>${qna.writer_name }</td>
		            			<td>${qna.gb_mem eq 'Y' ? '회원' : '비회원' }</td>
		            			<td><fmt:formatDate value='${qna.regdate}' pattern='yyyy-MM-dd'/></td>
		            			<td>${empty qna.ans_content ? '답변대기' : '답변완료' }</td>
		            		</tr>
		            	</c:forEach>
						</tbody>
		            </table>
		        </div>
	        </div>
	        <div class="col-md-1"></div>
        </div>
	</div>
	<div class="mt-5 mb-5">
		<%@ include file="../common/pagination.jsp" %>
	</div>
</div>
<script>
	let searchFormUrl = "qnaAdminMain.do";
	
	$('#searchType').on('change', function(){
		$('input[name="keyword"]').val('');
		searchList_go(1);
	});
	
	$('#searchType2').on('change', function(){
		$('input[name="keyword"]').val('');
		searchList_go(1);
	});
	
	
</script>
<%@ include file="thrAdminFooter.jsp"%>