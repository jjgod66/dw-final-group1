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
		</style>
		
	</head>
	
	<body>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
		  Launch demo modal
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="note_Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">쪽지함</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		        <div class="mt-2 mx-2">
		        	<ul class="nav nav-tabs note_tab">
					  <li class="nav-item">
					    <a class="nav-link active" id="tap_received">받은 쪽지함</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="tap_sended">보낸 쪽지함</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="tap_sending">쪽지 보내기</a>
					  </li>
					</ul>
		        </div>
		      <div class="modal-body">
		        <div class="noteDiv my_received_notes">받은쪽지함입니다.</div>
		        <div class="noteDiv my_sended_notes">보낸쪽지함입니다.</div>
		        <div class="noteDiv my_sending_notes">쪽지 작성폼입니다.</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
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
						<li style="padding-left: 0.5rem; border: none; font-size: xx-large; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#note_Modal">
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
			$('.note_tab a').on('click', function(){
				if ($(this))
			})
		</script>