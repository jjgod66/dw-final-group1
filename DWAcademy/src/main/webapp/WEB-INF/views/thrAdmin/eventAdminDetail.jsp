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
select[readonly] {
	background-color: #e9ecef;
	pointer-events: none;
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
		<div class="card mx-3">
			<form role="form" method="post" enctype="multipart/form-data">
			<div class="card-header">
				<c:choose>
					<c:when test="${type eq 'read' }">
						<input type="hidden" value="${event.event_no }" name="event_no">
						<span id="event_title_before">${event.event_title }</span>
					</c:when>
					<c:when test="${type eq 'create' }">
						<span><input type="text" class="form-control" name="event_title" size="80" placeholder="제목을 입력하세요"></span>
					</c:when>
				</c:choose>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when test="${type eq 'read' }">
						<div id="event_content_before" id="event_content_before">${event.event_content }</div>
						<div class="row mb-3 hideDiv" style="display: none;">
							<div class="col-md-3">
								<span>시작날짜</span>
								<span><input type="date" id="startdate" name="startdate" class="form-control" value="<fmt:formatDate value='${event.startdate }' pattern='yyyy-MM-dd'/>" ${empty event.event_no ? '' : 'disabled'}></span>
							</div>
							<div class="col-md-3">
								<span>종료날짜</span>
								<span><input type="date" id="enddate" name="enddate" class="form-control" value="<fmt:formatDate value='${event.enddate }' pattern='yyyy-MM-dd'/>"></span>
							</div>
							<div class="col-md-3">
								<span>이벤트 유형 구분</span>
								<span>
									<select style="height: 38px;" name="event_div" class="form-control" readonly>
										<option value="영화" ${event.event_div eq '영화' ? 'selected' : ''}>영화</option>
										<option value="극장" ${event.event_div eq '극장' ? 'selected' : ''}>극장</option>
										<option value="시사회/무대인사" ${event.event_div eq '시사회/무대인사' ? 'selected' : ''}>시사회/무대인사</option>
								  	</select>
								</span>
							</div>
							<div class="col-md-3">
								<span><button type="button" class="btn_small" id="addThumbBtn">썸네일 이미지 첨부</button></span>
								<span>
									<input type="file" id="event_thum_path" name="event_thum_path" accept=".jpeg, .png, .jpg, .gif" style="display: none;">
									<input type="text" id="thumb_name" class="form-control" value="${event.event_thum_path }" disabled>
									<input type="hidden" id="event_pic_path" name="event_pic_path">
									<input type="hidden" id="oldFileName" name="oldFileName">
									<input type="hidden" id="removeFileName" name="removeFileName">
								</span>
							</div>
						</div>
						<div class="hideDiv" style="display: none;">
							<textarea name="event_content" id="event_content" class="summernote">${event.event_content }</textarea>
						</div>
					</c:when>
					<c:when test="${type eq 'create' }">
						<div class="row mb-3">
							<div class="col-md-3">
								<span>시작날짜</span>
								<span><input type="date" id="startdate" name="startdate" class="form-control"></span>
							</div>
							<div class="col-md-3">
								<span>종료날짜</span>
								<span><input type="date" id="enddate" name="enddate" class="form-control"></span>
							</div>
							<div class="col-md-3">
								<span>이벤트 유형 구분</span>
								<span>
									<select name="event_div" class="form-control" style="height: inherit;" disabled>
										<option value="극장" selected>극장</option>
										<option value="영화">영화</option>
										<option value="시사회/무대인사">시사회/무대인사</option>
								  	</select>
								</span>
							</div>
							<div class="col-md-3">
								<span><button type="button" class="btn_small" id="addThumbBtn">썸네일 이미지 첨부</button></span>
								<span>
									<input type="file" id="event_thum_path" name="event_thum_path" accept=".jpeg, .png, .jpg, .gif" style="display: none;">
									<input type="text" id="thumb_name" class="form-control" disabled>
									<input type="hidden" id="event_pic_path" name="event_pic_path">
									<input type="hidden" id="oldFileName" name="oldFileName">
									<input type="hidden" name="relate_cd" value="${sessionScope.loginUser.CD }">
									<input type="hidden" name="event_div" value="극장">
								</span>
							</div>
						</div>
						<textarea name="event_content" id="event_content" class="summernote form-control"></textarea>
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
						<span style="float: right;">작성일 : <fmt:formatDate value='${event.regdate }' pattern='yyyy-MM-dd'/></span>
					</c:otherwise>
				</c:choose>
				<button class="bc_dw_black" id="cancelBtn" style="color: white; border:none;">뒤로가기</button>
			</div>
		</div>
	</div>
</div>
<script>
let template1 = $('');
	let modifyBoard = $('<div id="displaynone" style="display: none;"><textarea name="event_content" id="event_content" class="summernote">${event.event_content }</textarea></div>');
	// 수정버튼 클릭시
	$('#modifyCertifyBtn').on('click', function(){
		$(this).remove();
		let titleText = $('#event_title_before').text();
		let titleInput = $('<input type="text" id="event_title" name="event_title" class="form-control">').val(titleText);
		$('#event_title_before').html(titleInput);
		
		let content = $('#event_content_before').text();
		$('#event_content_before').remove();
		$('.hideDiv').show();
		
		$('.card-footer').prepend('<button class="bc_dw_blue" id="modifyBtn">수정완료</button>  <button class="bc_dw_orange" id="deleteBtn">삭제하기</button>');
	});
	
	// 등록버튼 클릭시
	$('#registBtn').on('click', function(){
		checkForm();
		if ($('form[role="form"] .is-invalid').length > 0) {
			alert('작성양식을 확인하세요.');
			return;
		}
		let registForm = $('form[role="form"]');
		registForm.attr('action', 'eventAdminRegist.do');
		registForm.submit();
	});
	
	// 수정완료버튼 클릭시
	$('.card-footer').on('click','#modifyBtn', function(){
		checkForm();
		if ($('form[role="form"] .is-invalid').length > 0) {
			alert('작성양식을 확인하세요.');
			return;
		}
		let modifyForm = $('form[role="form"]');
		modifyForm.attr('action', 'eventAdminModify.do');
		modifyForm.submit();
	});
	
	// 삭제버튼 클릭시
	$('.card-footer').on('click','#deleteBtn', function(){
		if(confirm('정말로 해당 글을 삭제하시겠습니까?')){
			let deleteForm = $('form[role="form"]');
			deleteForm.attr('action', 'eventAdminDelete.do');
			deleteForm.submit();
		}
	});
	// 뒤로가기버튼 클릭시
	$('#cancelBtn').on('click', function(){
		let enddate = "<fmt:formatDate value='${event.enddate }' pattern='yyyy-MM-dd hh:mm:ss'/>";
		if (new Date(enddate) >= new Date()) {
			location.href='eventAdminMain.do';
		} else {
			location.href='eventAdminPastMain.do';
		}
	});
	
	// 썸네일추가버튼 클릭시
	$('#addThumbBtn').on('click', function(){
		$('input[name="event_thum_path"]').click();
	});
	$('input[name="event_thum_path"]').on('change', function(){
		if ($('#oldFileName')) {
			$('#removeFileName').val($('#thumb_name').val());
		}
		$('#thumb_name').val($(this)[0].files[0].name);
	});
	
	// 상영종료일  제한
	let nowDate = Date.now();
	let timeOff = new Date().getTimezoneOffset()*60000;
	let today = new Date(nowDate-timeOff).toISOString().split("T")[0];
	$('#enddate').attr('min', today);
	$('#startdate').on('change', function(){
		let opendate = $(this).val();
		let mindate;
		if (opendate > today) {
			mindate = opendate;
		} else {
			mindate = today;
		}
		$('#enddate').attr('min', mindate);
		if ($('#enddate').val() < $(this).val()) {
			$('#enddate').val('');
		}
	});
	
	//is-invalid 설정
	$(document).on('keyup click','input', function(){
		if ($(this).hasClass('is-invalid')) {
			$(this).removeClass('is-invalid');
		}
		if($(this).parents('.form-control')) {
			$(this).parents('.form-control').removeClass('is-invalid');
		}
	});
	$(document).on('keyup', 'div[role="textbox"]',function(){
		if ($(this).html != '' && $('#event_content').hasClass('is-invalid')) {
			$('#event_content').removeClass('is-invalid');
		}
	});
	$('#event_thum_path').on('change', function(){
		console.log('test');
		if ($('#thumb_name').hasClass('is-invalid')) {
			$('#thumb_name').removeClass('is-invalid')
		}
	});
	
window.onload=function(){
	summernote();
	
}
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
					if ($('.note-editable img').length > 0) {
						alert('이미지는 1개만 첨부 가능합니다.');
						return;
					}
					
					for (let i = files.length - 1 ; i > -1; i--) {
						if (files[i].size > 1024 * 1024 * 5) {
							alert("이미지는 5MB 미만이어야 합니다.");
							return;
						};
					};
					
					// 파일 서버로 보내기
					for (let i = files.length -1; i >= 0; i--) {
						sendFile(files[i], this);
					};
				},
				onMediaDelete : function(target){
					if(confirm("삭제하시겠습니까?")){
						deleteFile(target[0].src);
					}
				}
			}
		});
	}
	
	function checkForm() {
		if ($('input[name="event_title"]').val() == '') {
			$('input[name="event_title"]').addClass('is-invalid');
			$('input[name="event_title"]').focus();
			return;
		}
		console.log($('#event_content').val());
		if ($('#event_content').val() == '') {
			$('#event_content').addClass('is-invalid');
			alert('작성내용은 필수입력항목입니다.');
			$('#event_content').focus();
			return;
		}
		if ($('input[name="startdate"]').val() == '') {
			$('input[name="startdate"]').addClass('is-invalid');
			$('input[name="startdate"]').focus();
			return;
		}
		if ($('input[name="enddate"]').val() == '') {
			$('input[name="enddate"]').addClass('is-invalid');
			$('input[name="enddate"]').focus();
			return;
		}
		if ($('input#thumb_name').val() == '') {
			$('input#thumb_name').addClass('is-invalid');
			return;
		}
	}
	
	function sendFile(file, el) {
		let form_data = new FormData();
		form_data.append("file", file);
		$.ajax({
			url : '<%=request.getContextPath() %>/common/uploadTempImg.do',
			type : 'post',
			data : form_data,
			contentType : false,
			processData : false,
			success : function(img_url){
				$(el).summernote('editor.insertImage', img_url);
				
				$('#event_pic_path').val(img_url.split('\$\$',2)[1]);
				$('#oldFileName').val(img_url.split('=',2)[1]);
			},
			error : function(err){
				console.log(err);
			}
			
		});
	}
	
	function deleteFile(src) {
		let splitSrc = src.split("=");
		let fileName = splitSrc[splitSrc.length - 1];
		
		let fileData = {
				fileName : fileName
		}
		
		console.log(fileData);
		console.log(JSON.stringify(fileData));
		
		$.ajax({
			url : "<%=request.getContextPath()%>/common/deleteTempImg.do",
			type : "post",
			data : JSON.stringify(fileData),
			contentType : "application/json",
			success : function(res){
				$('#event_pic_path').val('');
				console.log(res);
			}
		});
	} 
</script>
<%@ include file="thrAdminFooter.jsp" %>