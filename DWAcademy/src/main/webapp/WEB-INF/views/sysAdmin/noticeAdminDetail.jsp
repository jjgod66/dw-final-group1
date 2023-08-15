<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
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
textarea:focus {
	outline: none;
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
			<form name="form" method="post">
			<div class="card-header">
				<c:choose>
					<c:when test="${type eq 'read' }">
						<input type="hidden" value="${notice.notice_no }" name="notice_no">
						<span id="notice_title_before">${notice.notice_title }</span>
						<span style="float: right;">작성일 : <fmt:formatDate value='${notice.regdate }' pattern='yyyy-MM-dd'/></span>
					</c:when>
					<c:when test="${type eq 'create' }">
						<span><input type="text" name="notice_title" size="80" placeholder="제목을 입력하세요" style="border: none;"></span>
					</c:when>
				</c:choose>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when test="${type eq 'read' }">
						<div id="notice_content_before" id="notice_content_before">${notice.notice_content }</div>
						<div id="hideDiv" style="display: none;">
							<textarea name="notice_content" id="notice_content" class="summernote">${notice.notice_content }</textarea>
						</div>
					</c:when>
					<c:when test="${type eq 'create' }">
						<textarea name="notice_content" id="notice_content" class="summernote"></textarea>
					</c:when>
				</c:choose>
			</div>
			</form>
			<div class="card-footer">
				<c:choose>
					<c:when test="${type eq 'create' }">
						<button class="bc_dw_blue" id="registBtn">등록</button>
					</c:when>
					<c:otherwise>
						<button class="bc_dw_blue" id="modifyCertifyBtn">수정</button>
					</c:otherwise>
				</c:choose>
				<button class="bc_dw_black" id="cancelBtn">뒤로가기</button>
			</div>
		</div>
	</div>
</div>
<script>
window.onload = function(){
	let modifyBoard = $('<div id="displaynone" style="display: none;"><textarea name="notice_content" id="notice_content" class="summernote">${notice.notice_content }</textarea></div>');
	// 수정버튼 클릭시
	$('#modifyCertifyBtn').on('click', function(){
		$(this).remove();
		let titleText = $('#notice_title_before').text();
		let titleInput = $('<input type="text" name="notice_title" size="80">').val(titleText);
		$('#notice_title_before').html(titleInput);
		
		let content = $('#notice_content_before').text();
		$('#notice_content_before').remove();
		$('#hideDiv').show();
		
		$('.card-footer').prepend('<button class="bc_dw_blue" id="modifyBtn">수정완료</button>  <button class="bc_dw_orange" id="deleteBtn">삭제하기</button>');
	});
	
	// 등록버튼 클릭시
	$('#registBtn').on('click', function(){
		let registForm = $('form[name="form"]');
		registForm.attr('action', 'noticeAdminRegist.do');
		registForm.submit();
	});
	
	// 수정버튼 클릭시
	$('.card-footer').on('click','#modifyBtn', function(){
		let modifyForm = $('form[name="form"]');
		modifyForm.attr('action', 'noticeAdminModify.do');
		modifyForm.submit();
	});
	
	// 삭제버튼 클릭시
	$('.card-footer').on('click','#deleteBtn', function(){
		if(confirm('정말로 해당 글을 삭제하시겠습니까?')){
			let deleteForm = $('form[name="form"]');
			deleteForm.attr('action', 'noticeAdminDelete.do');
			deleteForm.submit();
		}
	});
	// 뒤로가기버튼 클릭시
	$('#cancelBtn').on('click', function(){
		location.href='noticeAdminMain.do';
	});
	

	// summernote
	summernote();
	function summernote () {
		$('.summernote').summernote({
			lang: 'ko-KR',
			height: 300,
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			toolbar: [
		// 		[groupName, [list of button]]
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				['color', ['forecolor','color']],
				['table', ['table']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				]
		});
	}
}
</script>
<%@ include file="sysAdminFooter.jsp" %>