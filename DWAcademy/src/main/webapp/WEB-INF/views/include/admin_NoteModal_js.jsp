<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
// 읽지않은 쪽지 수 헤더에서 보여주기
if ('${sessionScope.unreadedNoteCnt}' != 0) {
	$('.new_note_alert').show();
}

// 헤더의 쪽지 아이콘 클릭시
$('#tnb_note').on('click', function(){
	$('.note_tab a[data-tap="tap_received"]').click();
});

// 쪽지 리스트 중 해당 쪽지 마우스오버, 마우스리브 시
$(document).on('mouseover',	'.noteRow', function(){
	$(this).css('background-color', '#d8d9db');
	$(this).find('span.deleteNoteBtn').show();
});
$(document).on('mouseleave', '.noteRow', function(){
	$(this).css('background-color', 'white');
	$(this).find('span.deleteNoteBtn').hide();
});

// 해당 쪽지 삭제버튼 마우스오버, 마우스리브 시
$(document).on('mouseover', '.deleteNoteBtn', function(){
	$(this).css('background-color', 'red');
});
$(document).on('mouseleave', '.deleteNoteBtn', function(){
	$(this).css('background-color', 'black');
});

// 해당 쪽지 삭제버튼 클릭시
$(document).on('click', '.deleteNoteBtn', function(e){
	if (confirm('쪽지를 삭제하시겠습니까?')) {
		let note_no = $(this).closest('.noteRow').attr('data-no');
		let note_type = $(this).closest('.noteRow').attr('data-type');
		let data = {
				note_no : note_no,
				note_type : note_type
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/commonAdmin/deleteNote.do",
			type : "post",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(data){
				console.log(data);
				alert('쪽지가 삭제되었습니다.');
				if (note_type == 'S') {
					showSendedTap(3);
				} else if (note_type == 'R') {
					showReceivedTap(3);
				}
			},
			error : function(err){
				console.log(err);
			}
		});
	}
	e.stopPropagation();
});

// 쪽지 상단 탭 클릭시
$(document).on('click', 'ul.note_tab a', function(){
	
	$('.note_tab a').removeClass('active');
	$(this).addClass('active');
	$('.noteDiv').hide();
	
	if ($(this).attr('data-tap') == 'tap_received') {
		showReceivedTap(0);
		
		
	} else if ($(this).attr('data-tap') == 'tap_sended') {
		showSendedTap(0);
		
	} else if ($(this).attr('data-tap') == 'tap_sending') {
		showSendingTap();
		
	}
});

// 기본 페이지 세팅
let note_page = 1;
let note_page_max = '';

// 받은쪽지 리스트 출력
function showReceivedTap(pageFlow){
	$('.my_received_notes').show();
	if (pageFlow == 0) {
		note_page = 1;
	} else if (pageFlow == 1) {
		note_page = note_page == 1 ? 1 : (note_page-1);
	} else if (pageFlow == 2) {
		if (note_page < note_page_max) {
			note_page = note_page + 1;	
		}
	} else if (pageFlow == 3){
		
	} else {
		note_page = 1;
	}
	
	let data = {
		admin_cd : '${sessionScope.loginUser.CD}',
		page : note_page
	};
	
	$.ajax({
		url : "<%=request.getContextPath()%>/commonAdmin/receivedNoteList.do",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json",
		success : function(data){
			let noteRow = '';
			var note_senddate = '';
			$('.my_received_notes #noteRowList').html('');
			for (note of data.noteList) {
				note_senddate = new Date(note.SENDDATE);
				note_senddate = note_senddate.getFullYear() +'/'+ (note_senddate.getMonth()+1) + '/' + note_senddate.getDate()
							  + '&nbsp;&nbsp;' + note_senddate.getHours() + ':' + note_senddate.getMinutes(); 
			 	noteRow = '<div class="card mb-2 noteRow" data-no="'+note.NOTE_NO+'" data-type="R">'
						+ '<div class="card-body row">'
						+ '<div class="col-md-6"><b>'+note.NOTE_TITLE+'</b>&nbsp;&nbsp;';
				if (note.GB_READ == 'N') {
					noteRow += '<span class="badge text-bg-danger" style="font-size: xx-small;">New</span>';
				}
				noteRow += (
							  '</div>'
							+ '<div class="col-md-3 text-center">'+note.THR_NAME+'</div>'
							+ '<div class="col-md-3 text-center">'+note_senddate+'</div>'
							+ '</div>'
							+ '<span class="deleteNoteBtn" data-type="R"><i class="bi bi-x"></i></span>'
							+ '</div>'
							);
				$('.my_received_notes #noteRowList').append(noteRow);
			}
			
			note_page_max = (data.totalCount % data.perPageNum == 0 ? (data.totalCount / data.perPageNum) : Math.floor(data.totalCount / data.perPageNum + 1));
			
			if (note_page == 1) {
				$('li.prepageBtn').addClass('disabled');
			} else {
				$('li.prepageBtn').removeClass('disabled');
			}
			if (note_page == note_page_max) {
				$(' li.nextpageBtn').addClass('disabled');
			} else {
				$('li.nextpageBtn').removeClass('disabled');
			}
		
		},
		error : function(err){
			console.log(err);
		}
		
	});
	
}

//보낸쪽지 리스트 출력
function showSendedTap(pageFlow){
	$('.my_sended_notes').show();
	if (pageFlow == 0) {
		note_page = 1;
	} else if (pageFlow == 1) {
		note_page = note_page == 1 ? 1 : (note_page-1);
	} else if (pageFlow == 2) {
		if (note_page < note_page_max) {
			note_page = note_page + 1;	
		}
	} else if (pageFlow == 3){
		
	} else {
		note_page = 1;
	}
	
	let data = {
		admin_cd : '${sessionScope.loginUser.CD}',
		page : note_page
	};
	
	$.ajax({
		url : "<%=request.getContextPath()%>/commonAdmin/sendedNoteList.do",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json",
		success : function(data){
			let noteRow = '';
			var note_senddate = '';
			$('.my_sended_notes #noteRowList').html('');
			for (note of data.noteList) {
				note_senddate = new Date(note.SENDDATE);
				note_senddate = note_senddate.getFullYear() +'/'+ (note_senddate.getMonth()+1) + '/' + note_senddate.getDate()
							  + '&nbsp;&nbsp;' + note_senddate.getHours() + ':' + note_senddate.getMinutes(); 
			 	noteRow = '<div class="card mb-2 noteRow" data-no="'+note.NOTE_NO+'" data-type="S">'
						+ '<div class="card-body row">'
						+ '<div class="col-md-6"><b>'+note.NOTE_TITLE+'</b>&nbsp;&nbsp;';
				noteRow += (
							  '</div>'
							+ '<div class="col-md-3 text-center">'+note.THR_NAME+'</div>'
							+ '<div class="col-md-3 text-center">'+note_senddate+'</div>'
							+ '</div>'
							+ '<span class="deleteNoteBtn" data-type="S"><i class="bi bi-x"></i></span>'
							+ '</div>'
							);
				$('.my_sended_notes #noteRowList').append(noteRow);
			}
			
			note_page_max = (data.totalCount % data.perPageNum == 0 ? (data.totalCount / data.perPageNum) : Math.floor(data.totalCount / data.perPageNum + 1));
			
			if (note_page == 1) {
				$('li.prepageBtn').addClass('disabled');
			} else {
				$('li.prepageBtn').removeClass('disabled');
			}
			if (note_page == note_page_max) {
				$(' li.nextpageBtn').addClass('disabled');
			} else {
				$('li.nextpageBtn').removeClass('disabled');
			}
		
		},
		error : function(err){
			console.log(err);
		}
		
	});
	
}

// 쪽지보내기 양식 출력
function showSendingTap(receiver_cd){
	$('.my_sending_notes').show();
	
	let data = '${sessionScope.loginUser.CD}';
	let isSysAdmin = data.substring(0,1);
	
	$.ajax({
		url : "<%=request.getContextPath()%>/commonAdmin/thrNameList.do",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json",
		success : function(data){
			console.log(data);
			$('#selectThr').html('');
			if (isSysAdmin == 'S') {
				$('#selectThr').append($('<option value="allTheater">극장지점전체</option>'));
			}
			for (thr of data) {
				$('#selectThr').append($('<option value="'+thr.ADMIN_CD+'">'+thr.THR_NAME+'</option>'))
			}
			if (receiver_cd != null) {
				$('#selectThr option[value="'+receiver_cd+'"]').prop('selected', true);
			}
		},
		error : function(err){
			console.log(err);
		}
		
	});
}

// 쪽지 보내기 버튼 클릭시
$('#sendNoteBtn').on('click', function(){
	if ($('#write_note_title').val() == '') {
		alert('제목을 입력하세요.');
		return;
	}
	if ($('#write_note_content').val() == '') {
		alert('내용을 입력하세요.');
		return;
	}
	
	let data = {
		note_sender : '${sessionScope.loginUser.CD}',
		note_receiver : $('#selectThr').val(),
		note_title : $('#write_note_title').val(),
		note_content : $('#write_note_content').val(), 
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/commonAdmin/sendNote.do",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json",
		success : function(data){
			alert('쪽지를 보냈습니다.');
			$('#write_note_title').val('');
			$('#write_note_content').val('');
			$('ul.note_tab a[data-tap="tap_received"]').click();
		},
		error : function(err){
			console.log(err);
		}
	});
	
});

// 쪽지 읽기
$(document).on('click', '.noteRow', function(){
	$('.noteDiv').hide();
	$('.note_detail').show();
	let note_no = $(this).attr('data-no'); 
	let note_type = $(this).attr('data-type');
	$('#relativeType').val(note_type);
	let data = {
		note_no : note_no,
		note_type : note_type
	}
	console.log(data);
	$.ajax({
		url : "<%=request.getContextPath()%>/commonAdmin/readNote.do",
			type : "post",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(data){
				console.log(data);
				$('#read_note_title').val(data.NOTE_TITLE);
				$('#read_note_content').val(data.NOTE_CONTENT);
				$('#read_note_relator').val(data.THR_NAME);
				note_senddate = new Date(data.SENDDATE);
				note_senddate = note_senddate.getFullYear() +'/'+ (note_senddate.getMonth()+1) + '/' + note_senddate.getDate()
							  + ' ' + note_senddate.getHours() + ':' + note_senddate.getMinutes();
				$('#read_note_date').val(note_senddate);
				$('#read_note_relator_cd').val(data.NOTE_SENDER);
				if (note_type == 'S') {
					$('#reSendBtn').hide();
				} else if (note_type == 'R') {
					$('#reSendBtn').show();
				}
				console.log(data.UNREADEDCNT);
				if (data.UNREADEDCNT != 0) {
					$('.new_note_alert').show();
				} else {
					$('.new_note_alert').hide();
				}
				$('.new_note_alert').text(data.UNREADEDCNT);
			},
			error : function(err){
				console.log(err);
			}
		});
	});
// 답장버튼 클릭시
$('#reSendBtn').on('click', function(){
	$('.note_detail').hide();
	let receiver_cd = $('#read_note_relator_cd').val();
	showSendingTap(receiver_cd);
});

// 돌아가기 버튼 클릭시
$('#noteListBtn').on('click',function(){
	if ($('#relativeType').val() == 'S') {
		$('.note_detail').hide();
		showSendedTap(3);
	} else if ($('#relativeType').val() == 'R') {
		$('.note_detail').hide();
		showReceivedTap(3);
	}
});
</script>