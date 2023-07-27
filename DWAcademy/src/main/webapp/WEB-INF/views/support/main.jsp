<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/faq.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <style>
body{font-family: 'IBM Plex Sans KR', sans-serif;}



* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

button {
  font-family: 'Roboto', sans-serif;
  color: rgb(85,75,85);
  background-color: rgb(255,255,255);
}
.navigation {
    position: absolute;
    height: 1054px;
    width: 70px;
    background: #2b343b;
    box-shadow: 10px 0 0 #4ba8d8;
    border-left: 4px solid #2b343b;
    overflow-x: hidden;
    transition: width 0.5s;
}

.navigation:hover {
    width: 300px;
}

.navigation ul {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    padding-left: 5px;
    padding-top: 40px;
}

.navigation ul li {
    position: relative;
    list-style: none;
    width: 100%;
    border-top-left-radius: 20px;
    border-bottom-left-radius: 20px;
}

.navigation ul li.active {
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

.navigation ul li.active a::before {
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

.navigation ul li.active a::after {
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
 
 
 
 
 
 
 
 
 
 
 
 
 #wrapper {
    background-color: #fff;
    width: 85%;
}
 .navSide{
 	text-align: center;
 	display: flex;
 	align-items: center;
 	justify-content: center;
 }
 .navSide{
 	font-size: 23px;
 	font-weight: 500;
 	padding-bottom: 10px;
 }
 .centerList {
    display: flex;
    justify-content: center;
    border-top: 1px solid #ccc;
  }
  .centerList a {
  	font-size: 12px;
  }
  .faq, .notice {
    flex: 1;
    min-width: 200px;
    padding: 20px;
    margin: 10px;
 }
  .notice1 {
    flex: 1;
    min-width: 200px;
    margin: 10px;
 }
  .faq h2, .notice h2 {
      border-bottom: 1px solid #ccc;
      padding-bottom: 10px;
      font-size: 20px;
    }
 .faq li, .notice li {
   margin-bottom: 5px;
 }   

    .main-content {
      margin-left: 220px;
      padding: 20px;
    }

    .image-container {
      display: flex;
      justify-content: space-between;
    }

    .image-container img {
      width: 30%;
      cursor: pointer;
      align-items: center;
    }
    .image-container a{
    text-align:center;
    padding: 20px;
    }
    .image-container h2{
    color: black;
    position: relative;
    font-size: 25px;
    font-weight: 600;
    padding-top: 5px;
    }
     .image-container p{
    text-align:left;
    padding: 0 20px 0 20px ;
    color: black;
    }
    

    .faq {
      margin-top: 30px;
    }

    .faq h2 {
      border-bottom: 1px solid #ccc;
      padding-bottom: 10px;
    }

    .faq ul {
      list-style-type: none;
      padding-top: 5px;
      padding-bottom:15px;
     border-bottom: 1px solid #ccc;
    }

    .notice {
      margin-top: 30px;
    }
     .notice1 {
      margin-top: 30px;
    }

    .notice h2 {
      border-bottom: 1px solid #ccc;
      padding-bottom: 10px;
      
    }
    .notice1 h2 {
      border-bottom: 1px solid #ccc;
      padding-bottom: 10px;
      font-size: 20px;
    }

    .notice ul {
      list-style-type: none;
      padding: 5px;
      padding-bottom:15px;
     border-bottom: 1px solid #ccc;
      
    }

    .event {
      margin-top: 30px;
      display: flex;
      justify-content: center;
    }

    .event img {
      width: 48%;
      padding: 10px;
      cursor: pointer;
    }
    
     .more-link {
    text-decoration: none;
  }
  
  
  .sub_visual {
  
    position: relative;
    width: 100%;
    height: 170px;
    text-align: center;
    background: #2b343b;
} 

.btn {
    position: relative;
    display: inline-block;
    width: auto;
    height: auto;
    background-color: transparent;
    border: none;
    cursor: pointer;
    min-width: 150px;
}

.btn span {
    display: inline-block;
    font-size: 14px;
    font-weight: bold;
    letter-spacing: 2px;
    text-transform: uppercase;
    top: 0;
    left: 0;
    width: 100%;
    transition: 0.3s;
}

::before, ::after {
    position: absolute;
    content: "";
}
:active, :hover, :focus {
  outline: 0!important;
  outline-offset: 0;
}
.btn-holder {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  max-width: 1000px;
}
.btn-4 {
    color: rgb(28, 31, 30);
    background-color: rgb(245,245,245);
}
.btn-4::before, .btn-4::after {
    background-color: rgb(54, 56, 55);
    z-index: 2;
}
.btn.hover-border-4::before,
.btn.hover-border-4::after {
  width: 0%; height: 0%;
  opacity: 0;
  transition: width 0.2s linear, height 0.15s 0.2s ease-out, opacity 0s 0.35s;
}
.btn.hover-border-4::before {
  bottom: 0; left: -1px;
  border-top: 1px solid rgb(28, 31, 30);
  border-left: 1px solid rgb(28, 31, 30);
}
.btn.hover-border-4::after {
  top: 0; right: 0;
  border-bottom: 1px solid rgb(28, 31, 30);
  border-right: 1px solid rgb(28, 31, 30);
}
.btn.hover-border-4:hover::before,
.btn.hover-border-4:hover::after {
  width: 100%; height: 99%;
  opacity: 1;
  transition: width 0.2s 0.15s ease-out, height 0.15s ease-in, opacity 0s;   
}

.btn.hover-border-10::before,
.btn.hover-border-10::after {
  left: 0%;
  height: 30%;
  width: 2px;
  transition: height 0.2s 0.35s ease-out;
}
.btn.hover-border-10::before {
  top: 50%;
}
.btn.hover-border-10::after {
  bottom: 50%;
}
.btn.hover-border-10:hover::before {
  height: 50%;
  transition: height 0.2s ease-in;   
}
.btn.hover-border-10:hover::after {
  height: 50%;
  transition: height 0.1s ease-in;   
}

.btn.hover-border-10 span::before,
.btn.hover-border-10 span::after {
  width: 0%; height: 0%;
  background: transparent;
  opacity: 0;
  z-index: 2;
}
.btn.hover-border-10 span::after {
  bottom: 0; left: 0%;
  border-bottom: 2px solid rgb(54, 56, 55);
  transition: width 0.25s ease-in, opacity 0s 0.35s;   
}

.btn.hover-border-10 span:hover::after {
  width: 100%;
  opacity: 1;
  transition: width 0.25s 0.2s ease-out, opacity 0s 0.2s;   
}

.btn.hover-border-10 span::before {
  top: 0%; left: 0%;
  border-top: 2px solid rgb(54, 56, 55);
  border-right: 2px solid rgb(54, 56, 55);
  transition: height 0.15s ease-in, width 0.2s 0.15s linear, opacity 0s 0.35s;   
}
.btn.hover-border-10 span:hover::before {
  width: 98.5%; height: 96%;
  opacity: 1;
  transition: width 0.2s 0.1s linear, height 0.15s 0.3s ease-out, opacity 0s 0.1s;   
}

.ro {
      font-size: 7rem;
      text-align: center;
      color: #fcedd8;
      background: #eceff4;
      font-family: 'Niconne', cursive;
      font-weight: 700;
      text-shadow: 5px 5px 0px #eb452b, 
                  10px 10px 0px #efa032, 
                  15px 15px 0px #46b59b, 
                  20px 20px 0px #017e7f, 
                  25px 25px 0px #052939, 
                  30px 30px 0px #c11a2b, 
                  35px 35px 0px #c11a2b, 
                  40px 40px 0px #c11a2b, 
                  45px 45px 0px #c11a2b;
      height: 200px;
  }

  </style>
   
  
  
		<div class="sub_visual">
		    <h3>고객센터</h3>
		</div>
		
		<%@ include file="sideMenu.jsp" %>


<div id="wrapper">
	<div class="container">	 

	  <div class="main-content">
	    <div class="image-container">
	      <a href="#">
	        <img src="/resources/img/member.png" alt="이미지 1">
	        <h2>멤버쉽</h2>
	        <p>DW시네마의 자세한 멤버쉽 약관을 확인할 수 있습니다. </p>
	      </a>
	      <a href="<%=request.getContextPath()%>/support/inquiry.do">
	        <img src="/resources/img/q.png" alt="이미지 2">
	        <h2>1:1 문의</h2>
	        <p>해결되지 않은 문제가 있나요? 바로 1:1 문의해주세요!</p>
	      </a>
	      <a href="#">
	        <img src="/resources/img/dldyd.png" alt="이미지 3">
	        <h2>이용약관</h2>
	        <p>DW시네마의 이용약관을 확인 하실수 있습니다.</p>
	      </a>
	    </div>
	
	    <!-- 자주묻는 질문 리스트 -->
	    <div class="centerList">
		    <div class="faq">
		      <h2>
		        <span>자주 묻는 질문</span>
		      </h2>
		      <ul>
		        <li>dhks완성  되었습니다. </li>
		        <li>질문 2 - 답변 2</li>
		        <li>질문 3 - 답변 3</li>
		        <li>질문 4 - 답변 4</li>
		        <li>질문 5 - 답변 5</li>
		        <div class="btn-holder">
				  <button class="btn btn-4 hover-border-10">
				   <a href="<%=request.getContextPath()%>/support/faq.do">
				    <span style="color: black;">더보기</span></a>
				  </button>
				</div>
		      </ul>
		    </div>
		
		    <!-- 공지사항 리스트 -->
		    <div class="notice">
		          <h2>
			        <span>공지사항</span>
			      </h2>
		      <ul>
		        <li>여긴 완성 되었습니다. </li>
		        <li>공지 2</li>
		        <li>공지 3</li>
		        <li>공지 4</li>
		        <li>공지 5</li>
		        <div class="btn-holder">
				  <button class="btn btn-4 hover-border-10">
				  	<a href="<%=request.getContextPath()%>/support/notice.do">
				    <span style="color: black;">더보기</span></a>
				  </button>
				</div>
		      </ul>
		    </div>
	    </div>
	
	    <!-- 이벤트 이미지 사진 가로로 2개 -->
	    <div class="notice1">
	    	<h2>
	          <span>이벤트</span>
	        </h2>
	     </div>
	    <div class="event">
	      <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/25/pHWu3B7N4eBD2O1mAxz8lEmOz4GVcum3.jpg" alt="[수원AK플라자] 그랜드 오픈 페스타">
	      <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/24/Pfe3l661h6014JkhWRSGuT0Yj6N48k22.jpg" alt="메가박스 오리지널 티켓 No.85 <밀수>">
	    </div>
   	    <div class="btn-holder">
		  <button class="btn btn-4 hover-border-10">
		    <span>더보기</span>
		  </button>
		</div>
	  </div>
	  
	</div>
</div>



    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
    const list = document.querySelectorAll('.list');
    function activeLink() {
        list.forEach((item) =>
        item.classList.remove('active'));
        this.classList.add('active');
    }

    list.forEach((item) =>
        item.addEventListener('click', activeLink));

    </script>



<%@ include file="../include/footer.jsp" %>