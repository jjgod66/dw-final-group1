<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>DWCinema [관리자]</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/swiper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
<link href="<%=request.getContextPath()%>/resources/img/logo_ico.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/scrollbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dwcinema.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/swiper.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
 <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<style>
.gnb1 > li:hober{
	ul{display:block;}
}
#hd {
    min-width: 1210px;
    background: #aaaaaa;
}
#hd_wrap {
    z-index: 11;
    position: relative;
    margin: 0 auto;
}
#tnb {
    z-index: 2;
    position: absolute;
    top: 0;
    right: 30px;
    zoom: 1;
}
#tnb ul {
    padding: 0;
    line-height: 50px;
    zoom: 1;
    display: inline-block;
}
#tnb ul li {
    float: left;
    margin: 0 0 0 10px;
    padding: 0 10px 0 0;
    border-right: 1px solid #444;
}
#tnb ul a {
    display: inline-block;
    text-decoration: none;
    color: black;
}
#tnb ul #tnb_logout {
    border-right: 0;
    padding: 0;
}
#tnb ul #tnb_logout a {
    color: #fa2828;
}
#tnb:after {
    display: block;
    visibility: hidden;
    clear: both;
    content: "";
}
#gnb {
    background: #494b50;
}
#gnb h2 {
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    overflow: hidden;
}
#gnb ul, #gnb li {
    overflow: visible !important;
}
#gnb_1dul {
    position: relative;
    margin: 0 16px;
    padding: 0;
    zoom: 1;
}
#gnb ul, #gnb li {
    overflow: visible !important;
}
.gnb_1dli:first-child {
    margin-left: 0 !important;
}
.gnb_1dli {
    position: relative;
    display: table-cell;
    margin: 0 0 0 -1px;
    border: 1px solid #2d3032;
/*     border-top: 0; */
/*     border-bottom: 0; */
    justify-content: center;
}
a.gnb_1da {
    display: block;
    /* height: 34px; */
    padding: 0 10px;
    color: #fff;
    font-size: 17px;
    font-weight: 400;
    text-align: center;
    text-decoration: none;
    line-height: 2.0em;
}
#tnb ul a:focus, #tnb a:hover {
    color: #4aa8d8;
}
#tnb ul a {
    display: inline-block;
    color: black;
    text-decoration: none;
}
#snb {
    float: left;
    width: 204px;
    background: #fff;
    zoom: 1;
}
#snb .snb_header {
    height: 100px;
    text-align: center;
}
#snb .snb_header h2 {
    padding: 18px 0 10px 0;
    font-size: 20px;
    letter-spacing: -1px;
}

#snb .snb_header h2 i {
    height: 36px;
    font-size: 30px;
    color: #888;
    display: block;
}
.fa-truck:before {
    content: "\f0d1";
}
#snb dl {
    margin-bottom: 100px;
}
#snb dt {
    background: #f6f6f6 url(/admin/img/sflex_icon.png) 174px -302px no-repeat;
    border-top: 1px solid #cfcfcf;
    padding: 0 0 0 17px;
    font-size: 12px;
    line-height: 2.8;
    font-weight: 600;
    vertical-align: middle;
    cursor: pointer;
}
#snb dd {
    display: block;
    position: relative;
}

#snb dd a {
    display: block;
    padding: 7px 0 7px 17px;
    text-decoration: none;
    background: #fff;
    color: #555;
    vertical-align: middle;
}
#snb:after {
    display: block;
    visibility: hidden;
    clear: both;
    content: "";
}
nav ul {
	width: 100%;
	background-color: rgba(44, 42, 39 ,0.993);
	list-style-type: none;
	margin: 0;
	padding: 0;
}
 nav ul li {
	display: inline-block;
} 
.dropdown {
	position: relative;
} 
.dropdown-menu {
	color: black;
	font-size: 16px;
	cursor: pointer;
	background-color: #f5f5f5;
	text-align: center;
	--bs-dropdown-border-radius: 0;
 } 
 .dropdown-content{
 	position: absolute;
 	top: 2.5rem;
 	border-radius : 0;
 	background-color:#dcdcdc;
 	min-width: 160px;
 	box-shadow: 0px 8px 16px 0px rgba(0 ,0 ,0 ,0.2);
 } 
 .dropdown-content a {
 	color: black;
 	padding: 12px 16px;
 	text-decoration: none;
 	display: block;
 }
  .dropdown-content{
 	display: none;
 } 
 .dropdown:hover .dropdown-content{
 	display: block;
 }
 .dropdown-content a:hover {
	background-color: #aaaaaa
}
.dropdown-menu:hover:not(.hone){
	background-color: #3c3c3c;
	color: white;
}
.pagination li a{
	color : black;
	background-color : #fafafa;
}
.pagination li.active a {
	background-color : black;
	border : none;
}
</style>
	<header id="hd">
		<div id="hd_wrap" style="background-color : #fafafa;">
			<div style="padding : 0.5rem;" class="text-center">
				<a href="<%=request.getContextPath() %>/thrAdmin/main.do"><img src="<%=request.getContextPath()%>/resources/img/logo.png"></a>
			</div>
			<div id="tnb">
				<ul>
					<li><a href="<%=request.getContextPath() %>/thrAdmin/main.do">ADMIN HOME</a></li>
					<li><a href="<%=request.getContextPath() %>/main.do">DWCinema HOME</a></li>
					<li id="tnb_logout"><a
						href="">LOGOUT</a></li>
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