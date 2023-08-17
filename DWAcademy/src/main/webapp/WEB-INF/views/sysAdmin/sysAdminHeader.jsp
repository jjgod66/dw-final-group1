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
		<!-- datepicker.css -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/css/jquery-ui.min.css" />
		
		<!-- jquery 3.7.0 -->
		<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
		<!-- bootstrap 5.2.3 -->
		<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
		<!-- datepicker -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/i18n/jquery.ui.datepicker-ko.min.js"></script>
		<!-- chart.js  -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
		</style>
		
	</head>
	
	<body>
	<%@ include file="../include/admin_NoteModal.jsp" %>
		<header id="hd">
			<div id="hd_wrap">
				<div style="padding : 0.5rem;" class="text-center">
					<a href="<%=request.getContextPath() %>/sysAdmin/main.do"><img src="<%=request.getContextPath()%>/resources/img/logo.png"></a>
				</div>
				<div id="tnb">
					<ul>
						<li><a href="<%=request.getContextPath() %>/sysAdmin/main.do">ADMIN HOME</a></li>
						<li><a href="javascript:window.open('<%=request.getContextPath() %>/main.do', '_blank');">DWCinema HOME</a></li>
						<li id="tnb_logout"><a href="<%=request.getContextPath()%>/common/logout.do">LOGOUT</a></li>
						<li id="tnb_note" style="padding-left: 0.5rem; border: none; font-size: xx-large; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#note_Modal">
							<i class="bi bi-envelope"></i><span class="new_note_alert text-center">${sessionScope.unreadedNoteCnt == 0 ? '' : sessionScope.unreadedNoteCnt}</span>
						</li>
					</ul>
				</div>
	
				<nav id="gnb">
					<ul style="text-align: -webkit-center;">
						<li class="gnb_1dli dropdown dropdown-menu">지점관리 
							<div class="dropdown-content">
								<a href="<%= request.getContextPath() %>/sysAdmin/theaterAdminMain.do" class="gnb_1da">지점 목록 </a>
								<a href="<%= request.getContextPath() %>/sysAdmin/theaterRegistForm.do" class="gnb_1da">지점 등록 </a>
							</div>
						</li>
						<li class="gnb_1dli dropdown dropdown-menu" >영화관리 
							<div class="dropdown-content">
								<a href="<%= request.getContextPath() %>/sysAdmin/movieAdminMain.do" class="gnb_1da">영화리스트</a>
								<a href="<%= request.getContextPath() %>/sysAdmin/movieRegistForm.do" class="gnb_1da">영화등록</a>
								<a href="<%= request.getContextPath() %>/sysAdmin/movieAdminStatistics.do" class="gnb_1da">영화통계</a>
							</div>
						</li>
						<li class="gnb_1dli dropdown dropdown-menu">고객관리 
						<div class="dropdown-content">
							<a href="<%= request.getContextPath() %>/sysAdmin/noticeAdminMain.do" class="gnb_1da">공지사항</a>
							<a href="<%= request.getContextPath() %>/sysAdmin/faqAdminMain.do" class="gnb_1da">FAQ</a>
							<a href="<%= request.getContextPath() %>/sysAdmin/qnaAdminMain.do" class="gnb_1da">1:1문의</a>
							<a href="<%= request.getContextPath() %>/sysAdmin/memberAdminMain.do" class="gnb_1da">회원목록 </a>
							</div>
						</li>
						<li class="gnb_1dli dropdown dropdown-menu">이벤트관리 
						<div class="dropdown-content">
							<a href="<%= request.getContextPath() %>/sysAdmin/eventAdminMain.do" class="gnb_1da">진행중인 이벤트 </a>
							<a href="<%= request.getContextPath() %>/sysAdmin/eventAdminPastMain.do" class="gnb_1da">지난 이벤트 </a>
							<a href="<%= request.getContextPath() %>/sysAdmin/eventAdminDetail.do?type=create" class="gnb_1da">이벤트 등록  </a>
							</div>
						</li>
						<li class="gnb_1dli dropdown dropdown-menu">스토어관리 
						<div class="dropdown-content">
							<a href="<%= request.getContextPath() %>/sysAdmin/storeAdminMain.do?CategoryIdx=1" class="gnb_1da">기프트카드</a>
							<a href="<%= request.getContextPath() %>/sysAdmin/storeAdminMain.do?CategoryIdx=2" class="gnb_1da">팝콘/스낵/음료</a>
							<a href="<%= request.getContextPath() %>/sysAdmin/storeAdminProductRegistForm.do" class="gnb_1da">상품등록</a>
							</div>
						</li>
					</ul>
				</nav> 
			</div>
		</header>
<%@ include file="../include/admin_NoteModal_js.jsp" %>			