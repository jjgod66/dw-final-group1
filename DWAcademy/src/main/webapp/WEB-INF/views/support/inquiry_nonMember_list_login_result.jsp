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
body{font-family: 'IBM Plex Sans KR', sans-serif; background:#eceff4; } #wrapper { margin-left:auto; margin-right:auto; width: 70%; min-height: 500px; margin-bottom: 100px;}

        /* .container {
            margin: 0 auto;
            padding: 20px;
            border-radius: 0.5rem;
        } */

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            
        }

        th {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #E0E0E0;
            
        }
        #num{text-align: center;} #num2{text-align: center; color: #2b8a3e;}
         td {
            padding: 12px;
            border-bottom: 1px solid #E0E0E0;
            
        }
		td{background-color: #e9ecef;border-style: dashed;}
        th {
            background-color: #F5F5F5;
            font-weight: 700;
            font-size: .75rem;
            
        }
.post-detail {
			width:80%;
            margin: 46px auto 0px;
    }

    .post-info {
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }

    .post-title {
        font-size: 20px;
    }

    .post-content p {
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 20px;
    }
 
 .modal-wrap p {
  padding: 30px 21px 20px;
}

 #b{border-right: 1px solid #ddd; padding: 5px;}
 #same{background: #e9ecef; border: 1px dashed #E0E0E0;}
 #im{ text-align: center;}#img{width: 30px;}

.post-buttons {
    margin-top: 30px;
    display: flex;
    justify-content: center;
}

     .next-button {
    	background-color: #ced4da;
            color: #636363;
        padding: 10px 10px;
        font-size: 14px;
        border: none;
        border-radius: 99px;
        cursor: pointer;
    }
    
        .previous-button{
    	background-color: #ffc9c9;
            color: #636363;
        padding: 10px 10px;
        font-size: 14px;
        border: none;
        border-radius: 99px;
        cursor: pointer;
    }

     .next-button:hover {
        background-color: #868e96;
        color: #eceff4;
    }
    .previous-button:hover{
        background-color: #ffa8a8;
        color: #757575;
    }
</style>

<div class="sub_visual">
    <h3>비회원 문의내역  </h3>
    <h6>NonMember inquiry</h6>
</div>
<%@ include file="sideMenu.jsp" %>

<div id="wrapper">

	<!-- rja검색  -->
	<div class="finder" style="margin-right: 30px; margin-top: 30px; margin-bottom: 30px;">
      <div class="finder__outer">
        <div class="finder__inner">
          <div class="finder__icon" ref="icon"></div>
          <input class="finder__input" type="text" name="q" />
        </div>
      </div>
    </div>
	
	<div class="container">
        <div class="modal1" id="same">		
	      	<div class="modal-wrap">
			     <div class="post-detail">
				    <div class="post-info">
				        <h2 class="post-title">영화 개봉 날짜 문의 </h2>
				    </div>
				        <span id="b">1 </span>
				        <span id="b">센터 </span>
				        <span id="b">영화정보문의 </span>
				        <span id="b">2023년 7월 28일 </span>
				
				    <div class="post-content" >
				        <p>
				            영화 개봉 언제 해요 알료주세요 !!!!!!!!!!!!!!!!!!!!!!
				        </p>
				    </div>
				</div>
					      		
	      	</div>			          		
      	</div>	
      	<div id="im">
	        <img src="/resources/img/arrow.png" id="img">
        </div>
        <div class="modal1" id="same">		
	      	<div class="modal-wrap">
			     <div class="post-detail">
				        <span id="b">관리자</span>
				        <span id="b">2023년 7월 29일 </span>
				
				    <div class="post-content" >
				        <p>
				            안녕하세요 영화 개봉 일정입니다. 감사합니다.<br>메인 페이지를 참고해주세요.
				        </p>
				    </div>
				</div>
					      		
	      	</div>			          		
      	</div>	
      	<div class="post-buttons">
	        <button class="previous-button btn-secondary">삭제</button>
	        <button class="next-button btn-secondary" onclick="location.href='<%=request.getContextPath()%>/support/inquiry_nonMember_list.do'">목록</button>
	    </div>
    </div>
	
</div>


<%@ include file="../include/footer.jsp" %>