<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
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
<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		<div class="card" style="margin : 0 0.5rem;">
			<div class="card-header">
				<span id="qna_title"><b>[${qna.que_type}]</b> ${qna.que_title }</span>
				<span id="qna_regdate" style="float: right;"><fmt:formatDate value='${qna.regdate }' pattern='yyyy-MM-dd' /></span>
			</div>
			<div class="card-body" style="border-bottom : 1px solid #dee2e6">
				<div id="qna_content">
					${qna.que_content }
				</div>
				<div id="qna_attach" class="float-end" style="${empty attach ? 'display: none;' : ''}">
					첨부파일 : <span style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/common/getFile.do?ano=${attach.attach_no }';">${attach.attach_path}</span>
				</div>
			</div>
			<div class="card-body">
				<div id="answer">
					<div id="admin" class="mb-2" style="font-weight: bold; font-size: 1.5rem; border-bottom : 1px solid #dee2e6">DWCinema</div>
					<c:choose>
						<c:when test="${not empty ans }">
							<div id="answer_content" class="mt-3">
								${fn:replace(ans.ans_content, replaceChar, "<br/>")}
							</div>
							<div id="modifyFormDiv" style="display: none;">
								<form role="modifyform" method="post" action="answerModify.do">
									<input type="hidden" name="que_no" value="${qna.que_no }">
									<textarea id="ans_content" name="ans_content" class="form-control" rows="5" style="resize: none;" placeholder="답변을 입력하세요.">${ans.ans_content }</textarea>
								</form>
							</div>
						</c:when>
						<c:otherwise>
							<form role="registform" method="post" action="answerRegist.do">
								<input type="hidden" name="que_no" value="${qna.que_no }">
								<textarea id="ans_content" name="ans_content" class="form-control" rows="5" style="resize: none;" placeholder="답변을 입력하세요."></textarea>
							</form>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<div class="card-footer">
				<c:choose>
						<c:when test="${empty ans }">
							<button class="bc_dw_blue" id="registAnsBtn">답변등록</button>
						</c:when>
						<c:otherwise>
							<button class="bc_dw_blue" id="modifyAnsToogleBtn">답변수정</button>
						</c:otherwise>
				</c:choose>
				<button class="bc_dw_black" id="cancelBtn">뒤로가기</button>
			</div>
		</div>
	</div>
</div>
<script>
window.onload = function(){
	
	// 답변등록버튼 클릭시
	$('#registAnsBtn').on('click', function(){
		let registAnsForm = $('form[role="registform"]');
		registAnsForm.submit();
	});
	
	// 답변수정버튼 클릭시
	$('#modifyAnsToogleBtn').on('click', function(){
		$('#modifyFormDiv').show();
		$('#answer_content').hide();
		$('.card-footer').prepend($('<button class="bc_dw_blue" id="modifyBtn">수정완료</button>'));
		$(this).remove();
	});

	// 수정완료버튼 클릭시
	$('.card-footer').on('click', '#modifyBtn', function(){
		let modifyForm = $('form[role="modifyform"]');
		modifyForm.submit();
	});
	
	// 뒤로가기버튼 클릭시
	$('#cancelBtn').on('click', function(){
		location.href='/sysAdmin/qnaAdminMain.do';
	});
	
}
	
</script>
<script>

</script>
<%@ include file="sysAdminFooter.jsp" %>