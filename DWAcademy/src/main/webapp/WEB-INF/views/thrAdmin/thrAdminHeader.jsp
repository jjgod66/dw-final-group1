<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>DWCinema [관리자]</title>
		
		<!-- logo img -->
		<link href="<%=request.getContextPath()%>/resources/img/logo_ico.png" rel="shortcut icon" type="image/x-icon">
		<!-- bootstrap 5.2.3 -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<!-- summernote-lite -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
		<!-- swiper -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
		<!-- thrAdmin.css -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/admin.css">
		<!-- jquery 3.7.0 -->
		<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
		<!-- bootstrap 5.2.3 -->
		<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
		<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
		ul {
			list-style-type: none; 
		}
		a {
			text-decoration : none;
		}
		.new_note_alert {
			border-radius: 0.3rem;
		    line-height: 1rem;
		    font-size: 0.5rem;
		    position: absolute;
		    width: 1.5rem;
		    height: 1rem;
		    top: 40%;
		    right: -1%;
		    color: white;
		    background-color: red;
		    display: none;
		}
		.noteDiv {
			display: none;
		}
		.my_received_notes {
			display: block;
		}
		.note_tab li {
			cursor: pointer;
		}
		.noteRow {
			cursor: pointer;
		}
		.noteRow:hover {
			background-color: #d8d9db;
		}
		</style>
		
	</head>
	
	<body>
		<!-- Modal -->
		<div class="modal fade" id="note_Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-lg">
		    <div class="modal-content">
		      <div class="modal-header" style="color: white; background-color: #4aa8d8;">
		        <h1 class="modal-title fs-5" id="exampleModalLabel"><b>쪽지함</b></h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		        <div class="mt-2 mx-2">
		        	<ul class="nav nav-tabs note_tab">
					  <li class="nav-item">
					    <a class="nav-link active" data-tap="tap_received">받은 쪽지함</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" data-tap="tap_sended">보낸 쪽지함</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" data-tap="tap_sending">쪽지 보내기</a>
					  </li>
					</ul>
		        </div>
		      <div class="modal-body">
		        <div class="noteDiv my_received_notes">
        			<div class="card-body row mb-2">
        				<div class="col-md-6"><b class="ms-2">제목</b></div>
        				<div class="col-md-3"><b class="ms-2">보낸이</b></div>
        				<div class="col-md-3"><b class="ms-2">보낸날짜</b></div>
        			</div>
		        	<div id="noteRowList">
		        		<div class="card mb-2 noteRow">
		        		</div>
		        	</div>
		        	<div style="display: flex; justify-content: center;">
		        		<nav aria-label="...">
						  <ul class="pagination">
						    <li class="page-item prepageBtn">
						      <a class="page-link" onclick="javascript:showReceivedTap(1);"> <b>&lt;</b> </a>
						    </li>
						    <li class="page-item nextpageBtn">
						      <a class="page-link" onclick="javascript:showReceivedTap(2);"> <b>&gt;</b> </a>
						    </li>
						  </ul>
						</nav>
		        	</div>
		        </div>
		        <div class="noteDiv my_sended_notes">
		        	<div class="card-body row mb-2">
        				<div class="col-md-6"><b class="ms-2">제목</b></div>
        				<div class="col-md-3"><b class="ms-2">받은이</b></div>
        				<div class="col-md-3"><b class="ms-2">보낸날짜</b></div>
        			</div>
		        	<div id="noteRowList">
		        		<div class="card mb-2 noteRow">
		        	</div>
		        	</div>
		        	<div style="display: flex; justify-content: center;">
		        		<nav aria-label="...">
						  <ul class="pagination">
						    <li class="page-item prepageBtn">
						      <a class="page-link" onclick="javascript:showSendedTap(1);"> <b>&lt;</b> </a>
						    </li>
						    <li class="page-item nextpageBtn">
						      <a class="page-link" onclick="javascript:showSendedTap(2);"> <b>&gt;</b> </a>
						    </li>
						  </ul>
						</nav>
		        	</div>
		        </div>
		        <div class="noteDiv my_sending_notes">
		        	<div class="sendNoteForm">
		        		<form id="sendNoteForm">
		        			<div class="mb-3 row">
		        				<div class="col-md-8">
				        			<input type="text" class="form-control" id="write_note_title">
		        				</div>
		        				<div class="col-md-4">
		        					<select id="selectThr" style="margin-top: 0.1rem; width: 100%; height: 90%; border-radius: 0.5rem;">
		        					</select>
		        				</div>
		        			</div>
		        			<div>
		        				<textarea class="form-control" style="resize: none; height:20rem;" id="write_note_content"></textarea>
		        			</div>
		        		</form>
			        		<div class="text-end mt-3">
			        			<button type="button" class="btn btn-primary" id="sendNoteBtn">보내기</button>
			        		</div>
		        	</div>
		        </div>
		        <div class="noteDiv note_detail">
		        	<div>
		        		<div class="mb-3 row">
	        				<div class="col-md-8">
			        			<input type="text" class="form-control" id="read_note_title" value="" readonly>
	        				</div>
	        				<div class="col-md-4">
	        					<input type="text" class="form-control" id="read_note_relator" value="" readonly>
	        				</div>
	        			</div>
	        			<div>
	        				<textarea class="form-control" style="resize: none; height:20rem;" id="read_note_content" readonly></textarea>
	        			</div>
	        			<div class="text-end mt-3">
        					<input type="hidden" id="relativeType">
		        			<button type="button" class="btn btn-primary" id="noteListBtn">목록으로</button>
		        		</div>
		        	</div>
		        </div>
		      </div>
<!-- 		      <div class="modal-footer"> -->
<!-- 		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!-- 		        <button type="button" class="btn btn-primary">Save changes</button> -->
<!-- 		      </div> -->
		    </div>
		  </div>
		</div>
		
		<header id="hd">
			<div id="hd_wrap" style="background-color : #fafafa;">
				<div style="padding : 0.5rem;" class="text-center">
					<a href="<%=request.getContextPath() %>/thrAdmin/main.do"><img src="<%=request.getContextPath()%>/resources/img/logo.png"></a>
				</div>
				<div id="tnb">
					<ul>
						<li><a href="<%=request.getContextPath() %>/thrAdmin/main.do">ADMIN HOME</a></li>
						<li><a href="<%=request.getContextPath() %>/main.do">DWCinema HOME</a></li>
						<li id="tnb_logout"><a href="">LOGOUT</a></li>
						<li id="tnb_note" style="padding-left: 0.5rem; border: none; font-size: xx-large; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#note_Modal">
							<i class="bi bi-envelope"></i><span class="new_note_alert">NEW</span>
						</li>
					</ul>
				</div>
	
				<nav id="gnb">
					<ul style="text-align: -webkit-center;">
						<li class="gnb_1dli dropdown dropdown-menu">지점관리 
							<div class="dropdown-content">
								<a href="<%= request.getContextPath() %>/thrAdmin/theaterAdminMain.do" class="gnb_1da">지점 정보 </a>
							</div>
						</li>
						<li class="gnb_1dli dropdown dropdown-menu" >영화관리 
							<div class="dropdown-content">
								<a href="<%= request.getContextPath() %>/thrAdmin/movieAdminMain.do" class="gnb_1da">영화등록</a>
								<a href="#" class="gnb_1da">영화통계</a>
							</div>
						</li>
						<li class="gnb_1dli dropdown dropdown-menu">고객관리 
						<div class="dropdown-content">
							<a href="<%= request.getContextPath() %>/thrAdmin/noticeAdminMain.do" class="gnb_1da">공지사항</a>
							<a href="<%= request.getContextPath() %>/thrAdmin/qnaAdminMain.do" class="gnb_1da">1:1문의</a>
							</div>
						</li>
						<li class="gnb_1dli dropdown dropdown-menu">이벤트관리 
						<div class="dropdown-content">
							<a href="<%= request.getContextPath() %>/thrAdmin/eventAdminMain.do" class="gnb_1da">진행중인 이벤트 </a>
							<a href="<%= request.getContextPath() %>/thrAdmin/eventAdminPastMain.do" class="gnb_1da">지난 이벤트 </a>
							<a href="<%= request.getContextPath() %>/thrAdmin/eventAdminDetail.do?type=create" class="gnb_1da">이벤트 등록  </a>
							</div>
						</li>
					</ul>
				</nav> 
			</div>
		</header>
		
<script>
	
	$('#tnb_note').on('click', function(){
		$('.note_tab a[data-tap="tap_received"]').click();
	});
	
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
	
	let note_page = 1;
	let note_page_max = '';
	
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
							+ '<div class="col-md-6"><b>'+note.NOTE_TITLE+'</b></div>'
							+ '<div class="col-md-3">'+note.THR_NAME+'</div>'
							+ '<div class="col-md-3">'+note_senddate+'</div>'
							+ '</div></div>';
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
	
	function showSendedTap(pageFlow){
		$('.my_sended_notes').show();
		if (pageFlow == 0) {
			note_page = 1;
		} else if (pageFlow == '1') {
			note_page = note_page == 1 ? 1 : (note_page-1);
		} else if (pageFlow == '2') {
			if (note_page < note_page_max) {
				note_page = note_page + 1;	
			}
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
							+ '<div class="col-md-6"><b>'+note.NOTE_TITLE+'</b></div>'
							+ '<div class="col-md-3">'+note.THR_NAME+'</div>'
							+ '<div class="col-md-3">'+note_senddate+'</div>'
							+ '</div></div>';
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
	
	
	function showSendingTap(){
		$('.my_sending_notes').show();
		
		let data = '${sessionScope.loginUser.CD}';
		
		$.ajax({
			url : "<%=request.getContextPath()%>/commonAdmin/thrNameList.do",
			type : "post",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(data){
				console.log(data);
				$('#selectThr').html('');
				for (thr of data) {
					$('#selectThr').append($('<option value="'+thr.ADMIN_CD+'">'+thr.THR_NAME+'</option>'))
				} 
			},
			error : function(err){
				console.log(err);
			}
			
		});
	}
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
			},
			error : function(err){
				console.log(err);
			}
		});
	});
	
	$('#noteListBtn').on('click',function(){
		if ($('#relativeType').val() == 'S') {
			$('.note_tab a[data-tap="tap_sended"]').click();
		} else if ($('#relativeType').val() == 'R') {
			$('.note_tab a[data-tap="tap_received"]').click();
		}
	});
</script>