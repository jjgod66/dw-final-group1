<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.header {
    position: absolute;
    width: 100%;
    height: 100px;
    line-height: 100px;
    z-index: 1000;
    border-bottom: 1px solid rgba(112,112,112,0.15);
    background-color: transparent;
}
.header:before {
    content: "";
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0);
    z-index: -1;
}
.sub__nav__bg {
    position: absolute;
    top: 95px;
    left: 0;
    width: 100%;
    height: 0px;
    background: #fff;
    z-index: -1;
}
.h100 {
    height: 100%;
}
.cen1200 {
    position: relative;
    width: 90%;
    max-width: 1280px;
    margin: 0 auto;
}
.main__nav__wr {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    text-align: center;
}
.main__nav__wr > .inbox {
    width: 100%;
    margin: 0 auto;
    max-width: 670px;
}
.main__nav__wr > .inbox > ul {
    height: 100%;
}
#hd ul, nav ul, #ft ul {
    margin: 0;
    padding: 0;
    list-style: none;
}
.clearfix:before, .clearfix:after, .dl-horizontal dd:before, .dl-horizontal dd:after, .container:before, .container:after, .container-fluid:before, .container-fluid:after, .row:before, .row:after, .form-horizontal .form-group:before, .form-horizontal .form-group:after, .btn-toolbar:before, .btn-toolbar:after, .btn-group-vertical>.btn-group:before, .btn-group-vertical>.btn-group:after, .nav:before, .nav:after, .navbar:before, .navbar:after, .navbar-header:before, .navbar-header:after, .navbar-collapse:before, .navbar-collapse:after, .pager:before, .pager:after, .panel-body:before, .panel-body:after, .modal-footer:before, .modal-footer:after {
    display: table;
    content: " ";
}
.main__nav__wr > .inbox > ul > li {
    display: inline-block;
    height: 100%;
    vertical-align: top;
}
li {
    list-style: none;
}
ol, li, dl, dt, dd {
    margin: 0;
    padding: 0;
}
@media screen and (max-width: 1280px)
.main__nav__wr > .inbox > ul > li > a {
    font-size: 16px;
    padding: 0 20px;
}
@media screen and (max-width: 1280px)
.main__nav__wr > .inbox > ul > li > a {
    font-size: 16px;
    padding: 0 20px;
}
.main__nav__wr > .inbox > ul > li > a:after {
    content: '';
    display: block;
    position: absolute;
    bottom: -1px;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 2px;
    background-color: var(--main-color02);
    transition: ease-out 0.2s;
}
.sub__nav__wr {
    display: none;
    /* width: 100vw; */
    width: calc(100vw - 9px);
    height: auto;
    overflow: hidden;
    margin-left: calc(-50vw + 50%);
    text-align: center;
    z-index: 1;
    background-color: #fff;
    position: absolute;
    left: 0;
    top: 100px;
    line-height: initial;
    padding: 28px 0;
    border-bottom: 1px solid rgba(112,112,122,0.15);
}
.sub__nav__wr > ul {
    display: flex;
    justify-content: center;
}
.wcen600 {
    position: relative;
    width: 100%;
    max-width: 600px;
    margin: 0 auto;
}
.sub__nav__wr > ul > li {
    margin-right: 54px;
    text-align: left;
}
.sub__nav__wr > ul > li > a {
    display: inline-block;
    font-size: 17px;
    font-weight: 600;
    color: #191919;
    white-space: nowrap;
    text-decoration: unset !important;
    border-bottom: none !important;
}
.sub__nav__wr > ul > li ul {
    margin-top: 18px;
}
.sub__nav__wr > ul > li ul li {
    margin-bottom: 10px;
}
.right__nav__wr {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: 0%;
    text-align: center;
}
.right__nav__wr > ul {
    margin: 0;
}
@media screen and (max-width: 1280px)
.right__nav__wr li {
    font-size: 14px;
}
.right__nav__wr li {
    float: left;
    margin-left: 20px;
    font-size: 15px;
    position: relative;
}
.right__nav__wr li:after {
    content: '';
    display: block;
    width: 1px;
    height: 12px;
    background-color: rgba(255,255,255,.23);
    position: absolute;
    right: -10px;
    top: 50%;
    transform: translateY(-50%);
}

</style>
</head>
<body>
	<header class="header on">
	<div class="sub__nav__bg"></div>
	<div class="cen1200 cen1420 h100">
		<nav class="main__nav__wr hidden1024">
			<div class="inbox">
				<ul class="clearfix">
					<li>
						<a href="/page/page.php?pg=reservation" style="color: rgb(25, 25, 25);">
							예약 / 상담
						</a>
						<div class="sub__nav__wr" style="display: none;">
							<ul class="wcen600">
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=doreservation">예약대기 신청</a>
									<ul>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=doreservation">예약대기 신청</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=checkreservation">예약대기상태 조회</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=reservation">예약 및 상담안내</a></li>
									</ul>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/doctor/list.php">주치의 상담실</a>
									<ul>
										<li><a href="https://www.bundangcheil.com/doctor/list.php?sb_id=1">산부인과</a></li>
										<li><a href="https://infertility.bundangcheil.com/doctor/list.php?sb_id=2" target="_blank">난임 전문 클리닉</a></li>
										<li><a href="https://www.bundangcheil.com/doctor/list.php?sb_id=3">부인과 내시경 수술 전문 클리닉</a></li>
										<li><a href="https://www.bundangcheil.com/doctor/list.php?sb_id=4">유방/갑상선</a></li>
										<li><a href="https://www.bundangcheil.com/doctor/list.php?sb_id=5">소아청소년과</a></li>
										<li><a href="https://www.bundangcheil.com/doctor/list.php?sb_id=6">마취통증의학과</a></li>
									</ul>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=counsel&amp;sca=nurse">간호사 상담실</a>
									<ul>
										<li><a href="https://www.bundangcheil.com/bbs/board.php?bo_table=counsel&amp;sca=nurse">Q&amp;A</a></li>
									</ul>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/bbs/faq.php?fm_id=1">자주하는 질문</a>
									<ul>
										<li><a href="https://www.bundangcheil.com/bbs/faq.php?fm_id=1">FAQ</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<a href="/page/page.php?pg=subject_process" style="color: rgb(25, 25, 25);">
							진료 / 안내
						</a>
						<div class="sub__nav__wr" style="display: none;">
							<ul class="wcen600">
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=subject_anomaly">진료과목</a>
									<ul>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_anomaly">분만전문  전문 클리닉</a></li>
										<li><a href="http://infertility.bundangcheil.com" target="_blank">난임 및 습관성 유산  전문 클리닉</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_laparoscope">부인과 내시경 수술  전문 클리닉</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_breast_thyroid">여성검진 클리닉, 부인과 <span>(유방/갑상선/내과/요실금)</span></a></li>
<!-- 										<li><a href="https://www.bundangcheil.com/bbs/board.php?bo_table=breastfeed">모유수유 커뮤니티</a></li> -->
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_childyoung">소아청소년과</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_day_schedule">요일별 진료시간표 안내</a></li>
									</ul>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=subject_process">진료안내</a>
									<ul>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_process">진료절차 안내</a></li>
										<li><a href="https://www.bundangcheil.com/doctor/list.php">의료진 소개</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_schedule">진료시간표 안내</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_emergency">응급진료 안내</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_hospital">입원/퇴원 안내</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=subject_parking">주차안내</a></li>
									</ul>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=hospital_link">병원연계기관</a>
									<ul>
										<li><a href="https://cafe.naver.com/bundangcheilmom" target="_blank">산후조리원</a></li>
										<li><a href="https://cafe.naver.com/bundangcheilcenter" target="_blank">제일 여성 문화센터</a></li>
										<li><a href="http://www.maternityschool.co.kr/" target="_blank">매터니티 스쿨</a></li>
									</ul>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=certificate">증명서발급 안내</a>
									<ul>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=certificate#sub__certificate__box01">제증명</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=certificate#sub__certificate__box02">차트사본</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=certificate#sub__certificate__box03">구비서류</a></li>
									</ul>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=notice&amp;wr_ca=l">교육프로그램 안내</a>
									<ul>
										<li><a href="https://www.bundangcheil.com/bbs/board.php?bo_table=notice&amp;wr_ca=l">교육프로그램 안내</a></li>
									</ul>
								</li>
								
							</ul>
						</div>
					</li>
					<li>
						<a href="/bbs/board.php?bo_table=thankyou" style="color: rgb(25, 25, 25);">
							소통 / 소식
						</a>
						<div class="sub__nav__wr" style="display: none;">
							<ul class="wcen600">
								<li class="hide">
									<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=womannews">여성뉴스</a>
									<ul>
										<li><a href=""></a></li>
										<li><a href=""></a></li>
										<li><a href=""></a></li>
										<li><a href=""></a></li>
									</ul>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=thankyou">소통마당</a>
									<ul>
										<li><a href="https://www.bundangcheil.com/bbs/board.php?bo_table=thankyou">감사의 편지</a></li>
										<li><a href="https://www.bundangcheil.com/bbs/board.php?bo_table=compliment">칭찬해주세요</a></li>
										<li><a href="https://www.bundangcheil.com/bbs/board.php?bo_table=photo">포토제닉</a></li>
										<li><a href="https://www.bundangcheil.com/page/page.php?pg=customervoice">고객의소리</a></li>
									</ul>
								</li>
								<li>
									<a href="/bbs/board.php?bo_table=notice&amp;wr_ca=m">공지사항</a>
									<ul>
										<li><a href="/bbs/board.php?bo_table=notice&amp;wr_ca=m">최근공지 보기</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<a href="https://www.bundangcheil.com/page/page.php?pg=introduce" style="color: rgb(25, 25, 25);">
							병원소개
						</a>
						<div class="sub__nav__wr" style="display: none;">
							<ul class="wcen600">
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=introduce">병원소개</a>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=specialty">전문병원인증</a>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=subject_hospital_facilities">병원시설안내</a>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=recruit">상시채용</a>
								</li>
								<li>
									<a href="https://www.bundangcheil.com/page/page.php?pg=location">찾아오시는 길</a>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<a href="/page/page.php?pg=certificate" style="color: rgb(25, 25, 25);">
							서류발급
						</a>
					</li>
				</ul>
			</div>
		</nav>

		<div class="right__nav__wr">
			<ul class="clearfix">
									<li class="hidden1024"><a href="https://www.bundangcheil.com/bbs/login.php?url=https%3A%2F%2Fwww.bundangcheil.com%2Fmain.php" style="color: rgb(153, 153, 153);">로그인</a></li>
					<li class="hidden1024 last"><a href="https://www.bundangcheil.com/bbs/register.php" style="color: rgb(153, 153, 153);">회원가입</a></li>

			</ul>
			
		</div>		
	</div>

	<div id="pc_ham__menu__wr">
		<div class="pc__ham__menu__bg"></div>
		<div class="pc__ham__menu">
			<div class="inner__box">
				<ul class="left__wr">
					<li>
						<a href="https://www.bundangcheil.com/page/page.php?pg=reservation" class="title">예약 / 상담</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=doreservation" class="tit tit_s">예약대기 신청</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=doreservation" class="sub__menu">예약대기 신청</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=reservation" class="sub__menu">예약 및 시간표</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=checkreservation" class="sub__menu last">예약대기상태 조회</a>
						<a href="https://www.bundangcheil.com/doctor/list.php" class="tit">주치의 상담실</a>
						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=counsel&amp;sca=nurse" class="tit">간호사 상담실</a>
						<a href="https://www.bundangcheil.com/bbs/faq.php?fm_id=1" class="tit">자주하는 질문</a>
					</li>
					<li>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_process" class="title">진료 / 안내</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_anomaly" class="tit tit_s">진료과목</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_anomaly" class="sub__menu">분만 전문 클리닉</a>
						<a href="http://infertility.bundangcheil.com" class="sub__menu" target="_blank">난임 및 습관성 유산 전문 클리닉</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_laparoscope" class="sub__menu">부인과 내시경 수술 전문 클리닉</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_breast_thyroid" class="sub__menu sub__menu00">여성검진 클리닉, 부인과 <br>(유방/갑상선/내과/요실금)</a>
<!-- 						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=breastfeed" class="sub__menu">모유수유 커뮤니티</a> -->
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_childyoung" class="sub__menu">소아청소년과</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_day_schedule" class="sub__menu last">요일별 진료시간표 안내</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_process" class="tit tit_s">진료안내</a>
						<a href="https://www.bundangcheil.com/doctor/list.php" class="sub__menu">의료진 소개</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_schedule" class="sub__menu">진료시간표 안내</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_emergency" class="sub__menu">응급진료 안내</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_hospital" class="sub__menu">입원/퇴원 안내</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_parking" class="sub__menu last">주차안내</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=hospital_link" class="tit">병원연계기관</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=certificate" class="tit">증명서발급 안내</a>
						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=notice&amp;wr_ca=l" class="tit">교육프로그램 안내</a>
					</li>
					<li>
						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=thankyou" class="title">소통 / 소식</a>
						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=thankyou" class="tit tit_s">소통마당</a>
						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=thankyou" class="sub__menu">감사의 편지</a>
						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=compliment" class="sub__menu">칭찬해주세요</a>
						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=photo" class="sub__menu">포토제닉</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=customervoice" class="sub__menu last">고객의 소리</a>
						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=notice&amp;wr_ca=m" class="tit">공지사항</a>
						<a href="https://www.bundangcheil.com/bbs/board.php?bo_table=womannews" class="tit hide">여성뉴스</a>
					</li>
					<li>
						<a href="https://www.bundangcheil.com/page/page.php?pg=introduce" class="title">병원소개</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=introduce" class="tit">병원소개</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=specialty" class="tit">전문병원인증</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=subject_hospital_facilities" class="tit">병원시설 및 의료기기 안내</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=recruit" class="tit">상시채용</a>
						<a href="https://www.bundangcheil.com/page/page.php?pg=location" class="tit">찾아오시는 길</a>
						<a href="/page/page.php?pg=certificate" class="title last">서류발급</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</header>
<script>
$(function(){
	$('.main__nav__wr > .inbox > ul > li > a').mouseenter(function(){
		$('.sub__nav__wr').fadeOut(200); //모든 하위메뉴를 안보이게처리
		$(this).next().fadeIn(200); //해당 메인메뉴의 동생인 하위메뉴만 보이게 처리
		$("#pc_ham__menu__wr").fadeOut(200);
		$("#pc_ham__menu__wr").removeClass("on");
		


		$(this).parent().mouseleave(function(){
			$(this).find('.sub__nav__wr').fadeOut(200);
		});
	});

	$('.header').mouseleave(function(){
        $('.sub__nav__wr').fadeOut(200);	
    });
});
$(function(){
	let vh = window.innerHeight * 0.01;
	document.documentElement.style.setProperty('--vh', `${vh}px`);
});


$(function(){
	//pc - ham
	$('.ham__btn.pc_ham').toggle(function(e) {
		e.preventDefault();
		$('#pc_ham__menu__wr').addClass("on");
		$('#pc_ham__menu__wr').fadeIn(200);
		$(".right__nav__wr li.ham__btn img").attr("src", "/images/icon_close00.svg");
		$('.main__nav__wr > .inbox').addClass("del");
		$('.main__nav__wr > .inbox').mouseenter(function(){	
			//$('.ham__btn.pc_ham').trigger('click'); 
			//$(".right__nav__wr li.ham__btn img").attr("src", "/images/ham_pc_b.svg");
		});
		
		$(".header").mouseenter(function(){
			$(".header").addClass('on');
			$(".main__nav__wr > .inbox > ul > li > a").css({color:"#191919"});
			$(".right__nav__wr li a").css({color:"#999"});
			$(".header .logo img").attr("src", "/images/logo_c.svg");
			$(".pc_ham img").attr("src", "/images/ham_pc_b.svg");
			$(".right__nav__wr li.ham__btn img").attr("src", "/images/icon_close00.svg");
		}); // li mouseenter
		$(".header").mouseleave(function(){
			if(!$(document).scrollTop() > 0){ // 스크롤이 0일경우 
				$(".header").addClass('on');
				$(".main__nav__wr > .inbox > ul > li > a").css({color:"#191919"});
				$(".right__nav__wr li a").css({color:"#999"});
				$(".header .logo img").attr("src", "/images/logo_c.svg");
				$(".pc_ham img").attr("src", "/images/ham_pc_b.svg");
			$(".right__nav__wr li.ham__btn img").attr("src", "/images/icon_close00.svg");
			}
		}); // li mouseleave

		$(window).scroll(function(event){
			var scTop = $(this).scrollTop();
			
			if( $(window).width() > 1024 ){
				if(scTop > 120){
					// 헤더
					$(".header").addClass('on');
					$(".main__nav__wr > .inbox > ul > li > a").css({color:"#191919"});
					$(".right__nav__wr li a").css({color:"#999"});
					$(".header .logo img").attr("src", "/images/logo_c.svg");
					$(".pc_ham img").attr("src", "/images/ham_pc_b.svg");
					$(".right__nav__wr li.ham__btn img").attr("src", "/images/icon_close00.svg");
					
				} else {
					// 헤더
					$(".header").addClass('on');
					$(".main__nav__wr > .inbox > ul > li > a").css({color:"#191919"});
					$(".right__nav__wr li a").css({color:"#999"});
					$(".header .logo img").attr("src", "/images/logo_c.svg");
					$(".pc_ham img").attr("src", "/images/ham_pc_b.svg");
				
					$(".right__nav__wr li.ham__btn img").attr("src", "/images/icon_close00.svg");

				}
			} 
			
		});

	}, function() {
		$('#pc_ham__menu__wr').removeClass("on");
		$('#pc_ham__menu__wr').fadeOut(200);
		$(".pc_ham img").attr("src", "/images/ham_pc_b.svg");

		$('.main__nav__wr > .inbox').removeClass("del");

		$(".header").mouseenter(function(){
			$(".header").addClass('on');
			$(".main__nav__wr > .inbox > ul > li > a").css({color:"#191919"});
			$(".right__nav__wr li a").css({color:"#999"});
			$(".header .logo img").attr("src", "/images/logo_c.svg");
			$(".pc_ham img").attr("src", "/images/ham_pc_b.svg");
		}); // li mouseenter
		$(".header").mouseleave(function(){
			if(!$(document).scrollTop() > 0){ // 스크롤이 0일경우 
				$(".header").removeClass('on');
				$(".main__nav__wr > .inbox > ul > li > a").css({color:"#ffffff"});
				$(".right__nav__wr li a").css({color:"#ffffff"});
				$(".header .logo img").attr("src", "/images/logo_w.svg");
				$(".pc_ham img").attr("src", "/images/ham_pc_w.svg");

				//$('.ham__btn.pc_ham').trigger('click'); 
			}
		}); // li mouseleave

	});
	
	

	//mo - ham
	$(".ham__btn.mo_ham").click(function(e){
		e.preventDefault();
		$(".ham__menu__wr").fadeIn(200);
	});
	$(".ham__close").click(function(e){
		e.preventDefault();
		$(".ham__menu__wr").fadeOut(200);
	});

	$('.ham__menu__list').children('h3').on('click', function(event){			
		if($(this).next('div').hasClass("ham__sub__menu") === true) {
			event.preventDefault();
			$(this).toggleClass('submenu__open').next('.ham__sub__menu').slideToggle(200).end().parent('.ham__menu__list').siblings('.ham__menu__list').children('h3').removeClass('submenu__open').next('.ham__sub__menu').slideUp(200);
		}
	});
});





</script>
</body>
</html>