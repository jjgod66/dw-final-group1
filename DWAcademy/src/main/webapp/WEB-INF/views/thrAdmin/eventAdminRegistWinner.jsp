<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp" %>
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
.btn_small {
    padding: 2px 8px;
    font-size: 11px;
    line-height: 1.555;
    font-weight: normal !important;
    border-radius : 0.3rem;
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
			<form role="form" method="post">
				<div class="card-header">
					${event.event_title } / 당첨자 발표 ${empty wb ? '작성' : '게시글 조회' }
				</div>
				<div class="card-body">
					<input type="hidden" name="event_no" value="${event.event_no }">
					<c:choose>
						<c:when test="${empty wb}">
							<textarea name="winner_content" id="winner_content" class="summernote form-control"></textarea>
						</c:when>
						<c:otherwise>
							<div class="winner_content">${wb.winner_content} </div>
							<div class="hideDiv" style="display: none;">
								<textarea name="winner_content" id="winner_content" class="summernote">${wb.winner_content}</textarea>
							</div>
						</c:otherwise>
					</c:choose>
				</div>			
			</form>
				<div class="card-footer">
					<c:choose>
						<c:when test="${empty wb}">
							<button type="button" id="registWinnerBtn" class="bc_dw_blue">등록</button>
						</c:when>
						<c:otherwise>
							<button type="button" id="modifyToggleWinnerBtn" class="bc_dw_blue">수정</button>
							<button type="button" id="modifyWinnerBtn" class="bc_dw_blue hideDiv" style="display: none;">수정완료</button>
							<button type="button" id="deleteWinnerBtn" class="bc_dw_orange hideDiv" style="display: none;">삭제</button>
						</c:otherwise>
					</c:choose>
					
					<button type="button" id="cancelBtn" class="bc_dw_black">뒤로가기</button>
				</div>
		</div>
		
		
	</div>
</div>

<script>
	$('#registWinnerBtn').on('click', function(){
		let registForm = $('form[role="form"]');
		registForm.attr('action', 'eventAdminWinnerRegist.do');
		registForm.submit();
	});
	
	$('#modifyToggleWinnerBtn').on('click', function(){
		$('.winner_content').remove();
		$('#modifyToggleWinnerBtn').remove();
		$('.hideDiv').show();
	});
	
	$('#modifyWinnerBtn').on('click', function(){
		let modifyForm = $('form[role="form"]');
		modifyForm.attr('action', 'eventAdminWinnerModify.do');
		modifyForm.submit();
	})
	
	$('#deleteWinnerBtn').on('click', function(){
		if(confirm('정말 해당 글을 삭제하시겠습니까?')) {
			let deleteForm = $('form[role="form"]');
			deleteForm.attr('action', 'eventAdminWinnerDelete.do');
			deleteForm.submit();
		}
	});
	
	$('#cancelBtn').on('click', function(){
		location.href='<%=request.getContextPath()%>/thrAdmin/eventAdminPastMain.do';
	});

window.onload = function(){
	summernote();

	function summernote () {
		$('.summernote').summernote({
			lang: 'ko-KR',
			height: 600,
			disableResizeEditor : true,
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
				],
			callbacks : {
				onImageUpload : function(files, editor, welEditable){
					if ($('.note-editable img').length >= 0) {
						alert('이미지 첨부는 불가능합니다.');
						return;
					}
				}
			}
		});
	}
}	
</script>
<%@ include file="thrAdminFooter.jsp" %>