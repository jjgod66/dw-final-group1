<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  cursor: pointer;
}


.q img{margin-top: 18px;
    margin-left: 28px;
    position: absolute;
    justify-content: center;
    align-items: center;
    width: 43px;}
    
    .finder__icon:after {
    width: 10px;
    height: 10px;
    background-color: #292929;
    border: 3px solid #f6f5f0;
    top: 50%;
    position: absolute;
    transform: translateY(-50%);
    left: 0px;
    right: 0;
    margin: auto;
    border-radius: 50%;
}
.board-search {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    width: 230px;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
}

.input-text {
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    vertical-align: middle;
}
.board-search .btn-search-input {
    position: absolute;
    right: 1px;
    top: 1px;
}
.btn-search-input {
    overflow: hidden;
    width: 30px;
    height: 32px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
    text-indent: -9999px;
    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-search-input.png) no-repeat center;
}

</style>
<div class="sub_visual">
    <h3>자주 묻는 질문</h3>
    <h6>support faq</h6>
</div>
<%@ include file="sideMenu.jsp" %>
<div id="wrapper">
	<nav class="menu-navbar">
	  <ul class="menu-list">
	    <li><a data-faq_div="전체">전체</a></li>
	    <li><a data-faq_div="영화예매">영화예매</a></li>
	    <li><a data-faq_div="할인혜택">할인혜택</a></li>
	    <li><a data-faq_div="결제수단">결제수단</a></li>
	    <li><a data-faq_div="멤버쉽">멤버쉽</a></li>
<!-- 	  </ul> -->
<!-- 	  <ul class="menu-list"> -->
	    <li><a data-faq_div="VIP">VIP</a></li>
	    <li><a data-faq_div="극장">극장</a></li>
<!-- 	    <li><a href="#">특별관 </a></li> -->
	    <li><a data-faq_div="스토어">스토어</a></li>
	    <li><a data-faq_div="홈페이지">홈페이지</a></li>
	  </ul>
	</nav>
	<div style="display: none">
		<select name="searchType">
			<option value="전체">전체</option>
			<option value="영화예매">영화예매</option>
			<option value="할인혜택">할인혜택</option>
			<option value="결제수단">결제수단</option>
			<option value="멤버쉽">멤버쉽</option>
			<option value="VIP">VIP</option>
			<option value="극장">극장</option>
			<option value="스토어">스토어</option>
			<option value="홈페이지">홈페이지</option>
		</select>
	</div>
	<!-- rja검색기능  -->
<!-- 	 <div class="finder" style="margin-right: 70px;"> -->
<!--       <div class="finder__outer"> -->
<!--         <div class="finder__inner"> -->
<!--           <div class="finder__icon" ref="icon"></div> -->
<!--           <input class="finder__input" type="text" name="q" /> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
	
	<div style="width: 80%; margin: 0 auto;">
		<div class="board-search" style="">
			<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" name="keyword" value="${pageMaker.cri.keyword }">
			<button type="button" class="btn-search-input" id="eventSearchBtn">검색</button>
		</div>
	</div>
	
	<ul class="faq_list" id="faqAllBox">
		<c:if test="${empty faqList }">
			<div class="" style="padding-bottom: 10px; margin: auto;">
				<div style="text-align: center; padding: 50px;">조회된 내역이 없습니다.</div>
			</div>
		</c:if>
		<c:forEach items="${faqList }" var="faq">
			<li data-faq_no="${faq.faq_no }">
				<div class="q">
					<img src="/resources/img/faq.png">
					<span class="sp">[${faq.faq_div }]</span>
					<a href="#faq_1">${faq.faq_title }</a>
				</div>
				<div class="a" id="faq_1">
						<p>
							${faq.faq_content }
						</p>
				</div>
			</li>
		</c:forEach>
	</ul>
<c:if test="${empty faqList }">
	<div class="mt-5 mb-5 paginationdiv" style="display: none">
		<%@ include file="../common/pagination.jsp" %>
	</div>
</c:if>
<c:if test="${!empty faqList }">
	<div class="mt-5 mb-5 paginationdiv">
		<%@ include file="../common/pagination.jsp" %>
	</div>
</c:if>

</div>

<script>
	$(function() {
		$(".faq_list .q").on("click",function(){
			$(".faq_list li").not($(this).parents("li")).removeClass("open");
			$(this).parents("li").toggleClass("open");
			return false;
		});
		
		$("#eventSearchBtn").on('click', function(){
			searchList_go(1);
		});
		
		$(".menu-list li a").on('click', function(){
			let faq_div = $(this).text();
			console.log(faq_div);
			$('select[name="searchType"]').val(faq_div);
			searchList_go(1);
		})
	});
let searchFormUrl = 'faq.do';

let searchT = '${pageMaker.cri.searchType}';
$('select[name="searchType"]').val(searchT);
$('.menu-list li a[data-faq_div="' + searchT + '"]').css("background-color", "#f0f0f0");

let no = '${faq_no}';
console.log(no);
if(no != 0){
	$('.faq_list li[data-faq_no="' + no + '"]').addClass("open");
	 var offset = $('.open').offset();
     $('html, body').animate({scrollTop : offset.top - 200}, 400);
}

</script>


<%@ include file="../include/footer.jsp" %>