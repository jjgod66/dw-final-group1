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
body{font-family: 'IBM Plex Sans KR', sans-serif; background:#f8f9fa;}#wrapper {margin-left:auto;margin-right:auto;width: 60%;margin-bottom: 100px;}
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
    padding: 40px 10px 30px 10px;
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 20px;
    }

    .post-buttons {
        display: flex;
        justify-content: space-between;
    }

    .previous-button, .next-button {
        padding: 10px 10px;
        font-size: 14px;
        background-color: #e5e9f0;
        color: #495057;
        border: none;
        border-radius: 99px;
        cursor: pointer;
    }

    .previous-button:hover, .next-button:hover {
        background-color: #ced4da;
    }
    
    #b{border-right: 1px solid #ddd; padding: 5px;}
</style>
<div class="sub_visual">
    <h3>공지사항</h3>
    <h6>상세보기</h6>
</div>
<%@ include file="sideMenu.jsp" %>
<div id="wrapper">
	<div class="modal1">		
	      	<div class="modal-wrap">
			     <div class="post-detail">
				    <div class="post-info">
				        <h2 class="post-title">현금 없는 극장 만들기 </h2>
				    </div>
				        <span id="b">서울강남점 </span>
				        <span id="b">공지 </span>
				        <span id="b">2023년 7월 27일 </span>
				
				    <div class="post-content">
				        <p>
				            안녕하세요.<br>
				            서울강남점 지점장입니다. <br>
				            2023년 7월 27일부터 현금 없는 극장만들기 시범 운영에 들어가요.
				            되도록이면 카드이용 부탁드리며 최선을 다하도록 하겠습니다. 감사합니다.
				        </p>
				    </div>
				
				    <div class="post-buttons">
				        <button class="previous-button" onclick="goBack();">목록</button>
				    </div>
				</div>
					      		
	      	</div>			          		
      	</div>	
</div>
<script>
function goBack() {
	window.history.go(-1);
}
</script>
<%@ include file="../include/footer.jsp" %>