<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
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
		        <div class="board-header pb-3" style="justify-content: space-between;">
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
						<input type="text" name="keyword" id="keyword" value="${cri.keyword }" placeholder="제목,내용,작성자이름" style="border: 2px solid #4aa8d8;">
						<button class="bc_dw_blue"id="searchBtn" onclick="searchList_go(1);"><i class="bi bi-search"></i></button>
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
		            			<td>
			            			<a href="qnaAdminDetail.do?que_no=${qna.que_no }"><b>${qna.que_title }</b></a>
			            			<jsp:useBean id="now" class="java.util.Date"/>
		            				<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate" />
		            				<fmt:formatDate value="${qna.regdate }" pattern="yyyyMMdd" var="regDate" />
		            				<c:if test="${nowDate - regDate < 3 }">
		            					<img src="https://ssl.nexon.com/s2/game/closers/site_renewal2020/common/ico/ico_new.png" alt="new" class="ico new">
		            				</c:if>
		            			</td>
		            			<td>${qna.writer_name }</td>
		            			<td>${qna.gb_mem eq 'Y' ? '회원' : '비회원' }</td>
		            			<td><fmt:formatDate value='${qna.regdate}' pattern='yyyy-MM-dd'/></td>
		            			<td>${empty qna.ans_content ? '<b style="color:#4aa8d8;">답변대기</b>' : '답변완료' }</td>
		            		</tr>
		            	</c:forEach>
						</tbody>
		            </table>
		        </div>
	        </div>
	        <div class="col-md-1"></div>
        </div>
		<div class="paginationDiv">
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</div>
</div>
<script>
window.onload = function(){
	let searchFormUrl = "qnaAdminMain.do";
	
	$('#searchType').on('change', function(){
		$('input[name="keyword"]').val('');
		searchList_go(1);
	});
	
	$('#searchType2').on('change', function(){
		$('input[name="keyword"]').val('');
		searchList_go(1);
	});
}	
</script>
<%@ include file="thrAdminFooter.jsp"%>