<%--
DW아카데미 1팀 프로젝트 영화관 미리보기 예제 jsp 메인화면 입니다.
제작자 : 신철헌
제작 시작 일 : 2023년 6월 23일
--%>
<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.Document" %>
<%
request.setAttribute("GetTitle", "DWCinema");

String mem_cd = "";
if(session.getAttribute("loginUser") != null){
	Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
	mem_cd = (String)member.get("CD");
}
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${GetTitle }</title>
<!-- 검색기능 링크입니 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/finder.css">
<!-- vhs폰트입니다. -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">

<link href="<%=request.getContextPath()%>/resources/img/logo_ico.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/scrollbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dwcinema.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/swiper.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/daterangepicker.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/swiper.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/daterangepicker.js"></script>
<style type="text/css">
body{font-family: 'IBM Plex Sans KR', sans-serif; }#wrapper12 {margin-left:auto;margin-right:auto;width: 62%; padding-bottom: 10px; padding-top: 10px; }
@media screen and (min-width: 1000px){#wrapper12{width:90%;} }
@media screen and (min-width: 1500px){#wrapper12{width:62%;} }
#roo{display: flex;}
main{
  position: fixed;
  display: flex;
  top: 0;
}

canvas{
  width: 100%;
  height: 100%;
  margin: auto;
}
#container1{
	background:#F2F2F2;
  top: 0;
  width: 100%;
  justify-content: center;
  align-items: center;
}
    #navbar {
        padding-left: 50%;
      font-size:13px;
      color: #000000;
      align-items: center;
      padding-top: 5px;
    }
	.right-menu {margin-right: 13px;
    float: right;}
    .right-menu a {
      padding-right:10px;
      color: #787878;
      text-decoration: none;
    }
    .ro, .ro1 {
	  align-items: center;
	  float: left;
	}

    ul li{
		list-style: none;
	}
	a {
		text-decoration: none;
		color:#000000;
	}
	#menu {
		color:black;
		font-size: 15px;
		float:right;
		line-height: 40px;
		padding-top:13px;
		text-align: center;
	}
	#menu > ul > li {
		--bs-link-hover-color: #000000;
		float:right;
		width:100px;
		position:relative;
	}
	#menu > ul > li:hover{
		background: #e7f5ff;
	}
    #menu > ul > li > ul {
    	background:#e7f5ff;
    	padding: 0;
		width:100px;
		display:none;
		position: absolute;
		font-size:14px;
	}
    #menu > ul > li:hover > ul {
		display:block;
	}
    #menu > ul > li > ul > li:hover {
		opacity:0.7;
		transition: ease 0.5s;
		background: #d0ebff;
		color: black;
		}
.sub_visual {
    position: initial;
    width: 100%;
    height: 170px;
    text-align: center;
    background: #2b343b;
}
</style>
</head>
<body>
<!-- Preloader -->

<!-- End Preloader -->


<!-- 바뀐헤더입니다.  -->
<div id="container1">
	<div id="wrapper12">
		<div id="roo" class="row">
			<div class="logo col-3"><a href="<%=request.getContextPath()%>/"><img style="margin-top: 15px;" src="<%=request.getContextPath()%>/resources/img/logo.png"></a></div>
			<div class="col-3"></div>
			<div class="col-6">
				<div id="navbar">
				    <div class="right-menu">
				      <a href="<%=request.getContextPath()%>/support/membership.do" >혜택</a>
				      <a href="<%=request.getContextPath() %>/support/main.do" >고객센터</a>
				      <c:choose>
		                <c:when test="${loginUser == null || loginUser == ''}">
		                	<a href="#" data-bs-toggle="modal" data-bs-target="#login-modal" >로그인</a>
			                <a href="#" id="kakaoJoin" data-bs-toggle="modal" data-bs-target="#authentication-modal">회원가입</a>
		                </c:when>
		                <c:otherwise>
		                	<a href="<%=request.getContextPath() %>/common/logout.do" >로그아웃</a>
		                </c:otherwise>
		              </c:choose>
				    </div>
				</div>
		
				<div id="menu">
					<ul>
						<li role="menuitem" style="width: 43px; text-align: left;">
			                <a href="<%=request.getContextPath()%>/member/main.do" id="myPageMain" ><i class="bi bi-person" style="font-size: 26px;"></i></a>
			            </li>
						<li style="z-index: 99;">이벤트
							<ul>
								<li><a href="<%=request.getContextPath()%>/event/main.do">진행중인 이벤트</a></li>
								<li><a href="<%=request.getContextPath()%>/event/eventPast.do">지난 이벤트</a></li>
							</ul>
						</li>
						<li style="z-index: 99;">스토어
							<ul>
								<li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=1">기프트카드</a></li>
								<li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=2">팝콘/스낵/음료</a></li>
							</ul>
						</li>
						<li><a href="<%=request.getContextPath()%>/reservation/cinema.do">예매 </a>
						</li>
						<li><a href="<%=request.getContextPath()%>/theater/main.do">극장</a>
						</li>
						<li style="z-index: 99;">영화
							<ul>
								<li><a href="<%=request.getContextPath()%>/movie/allMovie.do">전체영화 </a></li>
								<li><a href="<%=request.getContextPath()%>/movie/screenMovie.do">현재상영작 </a></li>
								<li><a href="<%=request.getContextPath()%>/movie/comingMovie.do">상영예정작 </a></li>
								<li><a href="<%=request.getContextPath()%>/movie/review.do">영화리뷰  </a></li>
								<li><a href="<%=request.getContextPath()%>/movie/moviePost.do">무비포스트 </a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
	</div>	
</div>
<%@ include file="../include/login_modal.jsp" %>
<%@ include file="../include/join_modal.jsp" %>
<%@ include file="../include/authentication_modal.jsp"%>
<%@ include file="../include/dormantAccount_modal.jsp"%>
<%@ include file="../include/personInfoUtilAgreeAt.jsp"%>
<%@ include file="../booking/login_service_modal.jsp" %>
<%@ include file="../include/nonMember_loginModal.jsp" %>
<form id="joinForm" action="<%=request.getContextPath()%>/member/join.do" method="post">
	<input type="hidden" name="mem_id">
	<input type="hidden" name="mem_name">
	<input type="hidden" name="mem_pwd">
	<input type="hidden" name="mem_bir">
	<input type="hidden" name="mem_email">
	<input type="hidden" name="mem_phone">
	<input type="hidden" name="mem_zipcode">
	<input type="hidden" name="mem_addr">
	<input type="hidden" name="mem_addr_detail">
	<input type="hidden" name="gb_email_alert">
	<input type="hidden" name="gb_sms_alert">
</form>
<script>
let loginNeed = "${loginNeed}";
console.log(loginNeed);
$(document).ready(function(){
	if(loginNeed != ""){
		$('#login-modal').modal('show');
	};
})

function join_go(){
let joinForm = $('#joinForm');
let memberInfo = $('.memberInfo')
	joinForm.find('[name="mem_id"]').val(memberInfo.find('[name=mem_id]').val());
	joinForm.find('[name="mem_name"]').val(memberInfo.find('[name=mem_name]').val());
	joinForm.find('[name="mem_pwd"]').val(memberInfo.find('[name=mem_pwd]').val());
	joinForm.find('[name="mem_bir"]').val(memberInfo.find('[name=mem_bir]').val());
	joinForm.find('[name="mem_email"]').val(memberInfo.find('[name=mem_email]').val());
	joinForm.find('[name="mem_phone"]').val(memberInfo.find('[name=mem_phone]').val());
	joinForm.find('[name="mem_zipcode"]').val(memberInfo.find('[name=mem_zipcode]').val());
	joinForm.find('[name="mem_addr"]').val(memberInfo.find('[name=mem_addr]').val());
	joinForm.find('[name="mem_addr_detail"]').val(memberInfo.find('[name=mem_addr_detail]').val());
	joinForm.find('[name="gb_email_alert"]').val(memberInfo.find('[name=marketEmailRcvAgreeAt1]:checked').val());
	joinForm.find('[name="gb_sms_alert"]').val(memberInfo.find('[name=marketSmsRcvAgreeAt1]:checked').val());


	joinForm.submit();
}

$('#login-modal').on('hidden.bs.modal', function(){
	$(this).find('form')[0].reset();
})
</script>
<div class="background" style="height: 150px; display: none; opacity: 0;"></div>
