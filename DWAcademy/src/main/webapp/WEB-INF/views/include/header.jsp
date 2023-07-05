<%--
DW아카데미 1팀 프로젝트 영화관 미리보기 예제 jsp 메인화면 입니다.
제작자 : 신철헌
제작 시작 일 : 2023년 6월 23일
--%>
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
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${GetTitle }</title>
<link href="<%=request.getContextPath()%>/resources/img/logo_ico.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/scrollbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dwcinema.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/swiper.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/scrollbar.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/swiper.min.js"></script>
</head>
<body>
<style>
#login-modal .modal-content{
    border-radius: 0.7rem;
}
#login-modal .modal-header img{
    width: 100px;
}
#login-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#login-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#login-modal .modal-footer{
    border-top: none;
}
#login-modal button:active{
    outline: none;
}
#login-modal button:focus{
   outline: none;
}
#login-modal .modal-body{
    text-align: center;
}
#login-modal form{
    padding: 3vh;
}
#login-modal input {
    outline: none;
    margin: 0;
    border: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    width: 100%;
    font-size: 14px;
    font-family: inherit;
}
#login-modal .input-group {
    margin-bottom: 1rem;
}
#login-modal .input--style-3 {
    padding: 0.75rem !important;
    outline: none;
    width: 100% !important;
    min-width: unset;
    border: none;
    border-radius: 0;
    box-shadow: none !important;
    background: #f9f9f9;
    border: 1px solid #eee;
}
#login-modal .btn {
    display: inline-block;
    line-height: 42px;
    padding: 0 33px;
    font-family: Poppins;
    cursor: pointer;
    color: #fff;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    transition: all 0.4s ease;
    font-size: 18px;
    width: 100%
}
#login-modal .btn--naver {
    background-color: #27d34a !important;
    background-image: url(https://vendor-cdn.imweb.me/images/naver_login2x.png);
    background-size: 16px;
    background-position: 15px 50%;
    background-repeat: no-repeat;
    border-color: #27d34a !important;
    color: #fff !important;
    font-size: 12px;
    padding: 0;
}
#login-modal .btn--kakao {
    background-color: #ffeb00 !important;
    background-image: url(https://vendor-cdn.imweb.me/images/kakao_icon.png);
    background-size: 20px;
    background-position: 12px 49%;
    background-repeat: no-repeat;
    border-color: #ffeb00 !important ;
    color: #333 !important;
    font-size: 12px;
    padding: 0;
}
#login-modal .btn--login {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
#login-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#login-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#login-modal .col{
      padding: 2vh 10px 4vh;
}
#login-modal .new{
      padding-bottom: 0;
}
#login-modal .btn-primary{
      width:40%;
      margin:30%
}
#login-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="login-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2">회원 로그인</h3>
                <form method="POST">
                <div class="input-group">
                    <input class="input--style-3" type="text" placeholder="회원 아이디" name="text">
                </div>
                <div class="input-group">
                    <input class="input--style-3" type="password" placeholder="비밀번호" name="password">
                </div>
                <div class="p-t-10">
                    <button class="btn btn--login" type="submit" data-target="#">로그인</button>
                </div>
                <p class="title">간편로그인</p>
                <div class="row">
                    <div class="col">
                        <div class="p-t-10"><button class="btn btn--naver" type="submit">네이버로 시작하기</button></div> 
                    </div>
                    <div class="col">
                        <div class="p-t-10"><button class="btn btn--kakao" type="submit">카카오로 시작하기</button></div> 
                    </div>
                </div>
                <p class="extra new">회원이 아니신가요 ? <a href="#"><u>회원가입</u></a></p>
                <p class="extra">로그인 정보가 기억나지 않나요 ? <a href="#"><u>회원정보 찾기</u></a></p>
                </form>
            </div>
        </div>
    </div>
</div>

<header class="header">
    <nav class="gnb">
        <div class="container d-flex flex-wrap">
            <ul class="nav me-auto">
                <li class="nav-item"><a href="#" class="nav-link link-dark px-2">전체메뉴</a></li>
                <li class="nav-item"><a href="#" class="nav-link link-dark px-2">고객센터</a></li>
            </ul>
            <ul class="nav">
                <li class="nav-item"><a href="#" data-bs-toggle="modal" data-bs-target="#login-modal" class="nav-link link-dark px-2">로그인</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/member/join.do" class="nav-link link-dark px-2">회원가입</a></li>
            </ul>
        </div>
    </nav>
    <div class="logo"><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/img/logo.png"></a></div>
    <div class="background" style="height: 260px; display: none; opacity: 0;"></div>
    <div class="container" stlyle="overflow: hidden;">
        <ul class="navbar" role="menubar" id="dwcinema_gnb">
            <li role="menuitem">
                <strong>영화</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="#">전체영화</a></li>
                    <li><a href="#">현재상영작</a></li>
                    <li><a href="#">상영예정작</a></li>
                    <li><a href="<%=request.getContextPath()%>/movie/review.do">영화리뷰</a></li>
                    <li><a href="#">무비포스트</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>예매하기</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/booking/cinema.do">상영시간표</a></li>
                    <li><a href="#">할인안내</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>스토어</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=2">영화관람권</a></li>
                    <li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=3">기프트카드</a></li>
                    <li><a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=4">팝콘/스낵/음료</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>이벤트</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/event/main.do">진행중 이벤트</a></li>
                    <li><a href="#">지난 이벤트</a></li>
                    <li><a href="#">당첨자발표</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>혜택</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/member/membership.do">멤버십 안내</a></li>
                </ul>
            </li>
            <li role="menuitem">
                <strong>고객센터</strong>
                <ul style="opacity: 0; height: 0px;">
                    <li><a href="<%=request.getContextPath()%>/support/notice.do">공지사항</a></li>
                    <li><a href="<%=request.getContextPath()%>/support/faq.do">저주 묻는 질문</a></li>
                    <li><a href="#">1:1 문의</a></li>
                </ul>
            </li>
        </ul>
    </div>
</header>