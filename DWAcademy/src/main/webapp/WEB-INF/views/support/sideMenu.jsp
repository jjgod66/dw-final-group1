<%@page import="java.util.Map"%>
<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  .sub_visual {
    width: 100%;
    height: 170px;
    text-align: center;
    background: #2b343b;
} 

.navigation {
border-radius:20px;
top:0px;
margin-top:0px;
    position: absolute;
    height: 80%;
    width: 70px;
    background: #2b343b;
    box-shadow: 10px 0 0 #4ba8d8;
    border-left: 4px solid #2b343b;
    overflow-x: hidden;
    transition: width 0.5s;
    z-index: 10;
}


.navigation:hover {
    width: 270px;
}

.navigation ul {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    padding-left: 5px;
    padding-top: 18px;
}

.navigation ul li {
    position: relative;
    list-style: none;
    width: 100%;
    border-top-left-radius: 20px;
    border-bottom-left-radius: 20px;
}

.navigation ul li.active1 {
    background: #4ba8d8;
}

.navigation ul li a {
    position: relative;
    display: block;
    width: 100%;
    display: flex;
    text-decoration: none;
    color: #fff;
}

 .list1 {
    position: relative;
    display: block;
    width: 100%;
    display: flex;
    text-decoration: none;
    color: #fff;
}
.navigation ul li a .title1 {
    position: relative;
    display: block;
    height: 60px;
    line-height: 60px;
    white-space: nowrap;
}
.navigation ul li a .title2 {
    position: relative;
    display: block;
    height: 60px;
    white-space: nowrap;
}

.navigation ul li.active1 a::before {
    content: '';
    position: absolute;
    top: -30px;
    right: 0;
    width: 30px;
    height: 30px;
    background: #2b343b;
    border-radius: 50%;
    box-shadow: 15px 15px 0 #4ba8d8;
}

.navigation ul li.active1 a::after {
    content: '';
    position: absolute;
    bottom: -30px;
    right: 0;
    width: 30px;
    height: 30px;
    background: #2b343b;
    border-radius: 50%;
    box-shadow: 15px -15px 0 #4ba8d8;
}

.navigation ul li a .icon {
    position: relative;
    display: block;
    min-width: 60px;
    height: 60px;
    line-height: 70px;
    text-align: center;
}

.navigation ul li a .icon ion-icon {
    position: relative;
    font-size: 1.5em;
    z-index: 1;
}

.navigation ul li a .title {
    position: relative;
    display: block;
    padding-left: 10px;
    height: 60px;
    line-height: 60px;
    white-space: nowrap;
}
</style>
<%
	mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		Map member = (Map) session.getAttribute("loginUser");
		mem_cd = (String)member.get("CD");
	}
%>    
    
    <div class="navigation">
        <ul>
            <li class="list2 active1">
                <a href="<%=request.getContextPath()%>/support/main.do">
                    <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                    <span class="title">고객센터 홈 </span>
                </a>
            </li>
            <li class="list2">
                <a href="<%=request.getContextPath()%>/support/inquiry_nonMember.do">
                    <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                    <span class="title">비회원 문의내역</span>
                </a>
            </li>
            <li class="list2">
                <a href="<%=request.getContextPath() %>/support/faq.do">
                    <span class="icon"><ion-icon name="hand-left-outline"></ion-icon></span>
                    <span class="title">자주묻는질문</span>
                </a>
            </li>
            <li class="list2">
                <a href="<%=request.getContextPath()%>/support/inquiry.do">
                    <span class="icon"><ion-icon name="chatbubbles-outline"></ion-icon></span>
                    <span class="title">1:1 문의</span>
                </a>
            </li>
            <li class="list2">
                <a href="<%=request.getContextPath()%>/support/notice.do">
                    <span class="icon"><ion-icon name="chatbox-ellipses-outline"></ion-icon></span>
                    <span class="title">공지사항</span>
                </a>
            </li>
            <li class="list2">
                <a href="<%=request.getContextPath()%>/support/agreeUse.do">
                    <span class="icon"><ion-icon name="help-outline"></ion-icon></span>
                    <span class="title">이용약관</span>
                </a>
            </li>
            <li class="list2">
                <a href="<%=request.getContextPath()%>/support/agreeWhere.do">
                    <span class="icon"><ion-icon name="navigate-circle-outline"></ion-icon></span>
                    <span class="title">위치기반서비스이용약관</span>
                </a>
            </li>
            <li class="list2">
                <a href="<%=request.getContextPath()%>/support/agreePrivacy.do">
                    <span class="icon"><ion-icon name="clipboard-outline"></ion-icon></span>
                    <span class="title">개인정보처리방침</span>
                </a>
            </li>
            <li class="list2">
                <a href="<%=request.getContextPath()%>/support/agreeScreen.do">
                    <span class="icon"><ion-icon name="file-tray-full-outline"></ion-icon></span>
                    <span class="title">스크린배정수에관한기준</span>
                </a>
            </li>
            <div style="background: #577284; margin-right: 16px;">
            <li class="list1">
            	<a href="#">
                    <span class="icon" style="color: white;"><ion-icon name="time-outline"></ion-icon></span>
                    <span class="title1" style="color: white;">고객센터 운영시간 : 09~18시</span>
                </a>
            </li>
            <li>
            	<a href="#">
            		 <span class="icon" style="color: white;"><ion-icon name=""></ion-icon></span>
           			 <span class="title2"> 1588-1000 </span>
           		</a>
            </li>
            </div>
        </ul>
    </div>
    
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
    mem_cd = '<%=mem_cd%>';
    
    const list = document.querySelectorAll('.list2');
    function activeLink() {
        list.forEach((item) =>
        item.classList.remove('active1'));
        this.classList.add('active1');
    }
    list.forEach((item) =>
        item.addEventListener('click', activeLink)); 
		
        document.addEventListener('DOMContentLoaded', function() {
        	  const list = document.querySelectorAll('.list2');
        	  const currentURL = window.location.href;
        	  const faq = '/support/faq.do';
        	  const notice = '/support/notice.do';
        	  const notice2 = '/support/noticeMini_Detail.do';
        	  const inquiry = '/support/inquiry.do';
        	  const inquiryNon = '/support/inquiry_nonMember.do';
        	  const inquiryNon1 = '/support/inquiry_nonMember_list.do';
        	  const inquiryNon2 = '/support/inquiry_nonMember_list_login_result.do';
        	  const inquiryNon3 = '/support/inquiry_nonMember_board.do';
        	  const agreeUse = '/support/agreeUse.do';
        	  const agreeWhere = '/support/agreeWhere.do';
        	  const agreePrivacy = '/support/agreePrivacy.do';
        	  const agreeScreen = '/support/agreeScreen.do';
        	  if (currentURL.includes(faq)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[2].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(notice)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[4].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(notice2)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[4].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(inquiry)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[3].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(inquiryNon)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[1].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(inquiryNon1)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[1].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(inquiryNon2)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[1].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(inquiryNon3)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[1].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(agreeUse)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[5].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(agreeWhere)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[6].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(agreePrivacy)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[7].classList.add('active1'); 
        	  }
        	  if (currentURL.includes(agreeScreen)) {
        		  list.forEach((item) => item.classList.remove('active1'));
        	      list[8].classList.add('active1'); 
        	  }
        	  if(mem_cd != ''){
        	    	list[1].style.display = 'none'; 
        	    }
        	});
    
        $(document).ready(function() {
      	  var floatPosition = parseInt($(".navigation").css('top'));
      	  
      	  // 초기 위치 설정
      	  $(".navigation").css("top", "272px");
      	  
      	  // 스크롤 이벤트 핸들러
      	  $(window).scroll(function() {
      	    var currentTop = $(window).scrollTop();
      	    
      	    if (currentTop < 280 ){
      	    	$(".navigation").css({
      	    		"top":"272px",
      	    		"margin-top":"0"
      	    	});
      	    	return;
      	    }
      	    var bannerTop = currentTop + floatPosition + "px";
      	    // 스크롤 값에 따라 .navigation의 위치와 margin-top 변경
      	    $(".navigation").stop().animate({
      	      "top": bannerTop,
      	      "margin-top": "0"
      	    }, 600);
      	  });
      	});
    </script>