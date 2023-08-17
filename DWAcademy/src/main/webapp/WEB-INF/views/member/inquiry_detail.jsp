<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<%@ include file="../include/member_header.jsp" %>
<%@ include file="que_delete_modal.jsp" %>
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
    .attachDown:hover{
    	cursor: pointer;
    	text-decoration: underline;
    }
</style>
<!-- <div id="wrapper"> -->

	<div class="container" style="margin-top:50px; min-height: 800px;">
        <div class="modal1" id="same">		
	      	<div class="modal-wrap">
			     <div class="post-detail">
				    <div class="post-info">
				        <h2 class="post-title">${qna.que_title }</h2>
				    </div>
<!-- 				        <span id="b">1 </span> -->
				        <span id="b">${qna.thr_name } </span>
				        <span id="b">${qna.que_type } </span>
				        <span id="b"><fmt:formatDate value="${qna.regdate }" pattern="yyyy-MM-dd"/> </span>
				        <c:if test="${!empty attach }">
					        <span id="b">첨부파일</span>
					        <span id="b" class="attachDown" onclick="location.href='<%=request.getContextPath()%>/common/getFile.do?ano=${attach.attach_no}'">${attach_name }</span>
				        </c:if>
				
				    <div class="post-content" >
				        <p>
				            ${qna.que_content }
				        </p>
				    </div>
				</div>
					      		
	      	</div>	
      	</div>	
      	<c:if test="${!empty answer }">
      	<div id="im" style="margin: 10px 0;">
      		<i class="fa-solid fa-arrow-down-long" style="font-size: 30px;"></i>
<!-- 	        <img src="/resources/img/arrow.png" id="img"> -->
        </div>
        <div class="modal1" id="same">		
	      	<div class="modal-wrap">
			     <div class="post-detail">
				        <span id="b">관리자</span>
				        <span id="b"><fmt:formatDate value="${answer.regdate }" pattern="yyyy-MM-dd"/></span>
				
				    <div class="post-content" >
				        <p>
				            ${answer.ans_content }
				        </p>
				    </div>
				</div>
					      		
	      	</div>			          		
      	</div>	
      	</c:if>
      	<div class="post-buttons">
	        <button class="previous-button btn-secondary" id="qdelBtn">삭제</button>
	        <button class="next-button btn-secondary" onclick="history.go(-1)">뒤로가기</button>
	    </div>
    </div>
	
<!-- </div> -->

<script>
$(function(){
	$('#qdelBtn').on('click', function(){
		$('#que-delete-modal').modal('show');
	})
	
})
</script>

<%@ include file="../include/member_footer.jsp" %>