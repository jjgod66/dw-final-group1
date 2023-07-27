<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
 <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<style>
body{font-family: 'IBM Plex Sans KR', sans-serif; background:#f8f9fa;}
 #wrapper {
 
 margin-left:auto;
 margin-right:auto;
    width: 70%;
}
.faq_list {
	width:80%;
	margin-left:auto;
	margin-right:auto;
    margin-top: 15px;
    margin-bottom: 30px;
    font-size: 13px;
    border-top: 1px solid #222;
}
.faq_list li .q {
    position: relative;
    z-index: 5;
}
.faq_list li .q a {
    display: block;
    min-height: 2.8em;
    line-height: 1.6;
    padding: 0.4em 3em 1.6em 6em;
    border-bottom: 1px solid #ddd;
    font-weight: 500;
    font-size: 1.3em;
    line-height: 24px;
    color: #000;
}
.sp{
	padding-left: 6.4rem;
    line-height: 24px;
    color: #000;
}
.faq_list li .a p {
    min-height: 60px;
    padding: 1em 6.2em 1.4em 6.2em;
    border-bottom: 1px solid #ddd;
    background: #EBEBEB;
    font-size: 1.3em;
    line-height: 24px;
    color: #222;
}
.faq_list li .q a:before {
    content: '';
    position: absolute;
    top: 0.5em;
    right: 0;
    width: 3.2em;
    height: 3.2em;
    /* background: url(../images/sub/chevron-down.svg) no-repeat center center; */
    background-size: contain;
    -webkit-transform: rotate(0);
    transform: rotate(0);
    -webkit-transition: all .3s;
    transition: all .3s;
}
.faq_list li .a {
    position: relative;
    margin-top: -1px;
    max-height: 1px;
    overflow: hidden;
    -webkit-transition: all .3s;
    transition: all .3s;
}
.faq_list li.open .a {
    max-height: 999px;
    -webkit-transition: all .3s;
    transition: all .3s;
}
.faq_list li.open .q a:before {
    opacity: 0.6;
    -webkit-transform: rotate(180deg);
    transform: rotate(180deg);
    -webkit-transition: all .3s;
    transition: all .3s;
}
.faq_list li.open .q a {
    border-bottom-color: #f8f8f8;
    background: #F8FAFC;
}




.menu-navbar {
margin-right: auto;
    margin-left: auto;
    width: 80%;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 10px;
}

.menu-list {
margin-right: auto;
    margin-left: auto;
  list-style: none;
  display: flex;
}

.menu-list li {
  margin: 5px;
}

.menu-list li a {
  display: block;
  padding: 8px 17px;
  background-color: #E5E5E5;
  text-decoration: none;
  color: #6B6B6B;
  border-radius: 5px;
}

.menu-list li a:hover {
  background-color: #f0f0f0;
}


.q img{margin-top: 18px;
    margin-left: 28px;
    position: absolute;
    justify-content: center;
    align-items: center;
    width: 43px;}
</style>
<div class="sub_visual">
    <h3>자주 묻는 질문</h3>
    <h6>support faq</h6>
</div>
<%@ include file="sideMenu.jsp" %>
<div id="wrapper">
	<nav class="menu-navbar">
	  <ul class="menu-list">
	    <li><a href="#">전체</a></li>
	    <li><a href="#">영화예매 </a></li>
	    <li><a href="#">할인혜택 </a></li>
	    <li><a href="#">결제수단/관람권 </a></li>
	    <li><a href="#">멤버쉽 </a></li>
	  </ul>
	  <ul class="menu-list">
	    <li><a href="#">VIP </a></li>
	    <li><a href="#">극장</a></li>
	    <li><a href="#">특별관 </a></li>
	    <li><a href="#">스토어</a></li>
	    <li><a href="#">홈페이지/모바일</a></li>
	  </ul>
	</nav>
	<ul class="faq_list" id="faqAllBox">
					<li>
						<div class="q">
							<img src="/resources/img/faq.png">
							<span class="sp">[극장]</span>
							<a href="#faq_1">영화를 예매하고 싶어요. 어떻게 하나요 ? </a>
						</div>
						<div class="a" id="faq_1">
								<p>
									안녕하세요. dw시네마 지점장입니다 .
								<br>비회원으로도 가능합니다. 
								</p>
						</div>
					</li>
				
					<li>
						<div class="q">
							<img src="/resources/img/faq.png">
							<span class="sp">[환불]</span>
							<a href="#faq_1">인터넷 예매시 환불 가능한가요?</a>
						</div>
						
						<div class="a" id="faq_1">
								<p>
									안녕하세요. dw시네마 지점장입니다.
								<br>환불가능합니다. 날짜를 확인해주세요.
								</p>
						</div>
					</li>
					<li>
						<div class="q">
							<img src="/resources/img/faq.png">
							<span class="sp">[환불]</span>
							<a href="#faq_1">길이가 긴 제목의 질문입니다. 길이가 긴 제목의 질문입니다. 길이가 긴 제목의 질문입니다.길이가 긴 제목의 질문입니다.</a>
						</div>
						
						<div class="a" id="faq_1">
								<p>
									안녕하세요. dw시네마 지점장입니다.
								<br>길이가 긴 제목의 질문입니다. 길이가 긴 제목의 질문입니다. 길이가 긴 제목의 질문입니다.길이가 긴 제목의 질문입니다.
								길이가 긴 제목의 질문입니다. 길이가 긴 제목의 질문입니다. 길이가 긴 제목의 질문입니다.길이가 긴 제목의 질문입니다.
								길이가 긴 제목의 질문입니다. 길이가 긴 제목의 질문입니다. 길이가 긴 제목의 질문입니다.길이가 긴 제목의 질문입니다.
								</p>
						</div>
					</li>
			</ul>




</div>
<script>
	$(function() {
		$(".faq_list .q").on("click",function(){
			$(".faq_list li").not($(this).parents("li")).removeClass("open");
			$(this).parents("li").toggleClass("open");
			return false;
		});
	});
</script>
<%@ include file="../include/footer.jsp" %>