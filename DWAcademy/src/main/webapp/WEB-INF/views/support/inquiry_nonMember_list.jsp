<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
body{font-family: 'IBM Plex Sans KR', sans-serif; background:#eceff4; } #wrapper { margin-left:auto; margin-right:auto; width: 70%; min-height: 500px;}

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
        #num{text-align: center;}
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

 
 #quetitle:hover{
 	text-decoration: underline;
 	cursor: pointer;
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
    <h3>비회원 문의내역  </h3>
    <h6>NonMember inquiry</h6>
</div>
<%@ include file="sideMenu.jsp" %>

<div id="wrapper">

	<!-- rja검색  -->
<!-- 	<div class="finder" style="margin-right: 30px; margin-top: 30px; margin-bottom: 30px;"> -->
<!--       <div class="finder__outer"> -->
<!--         <div class="finder__inner"> -->
<!--           <div class="finder__icon" ref="icon"></div> -->
<!--           <input class="finder__input" type="text" name="q" /> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
	<div style="width: 97%; margin: 20px auto; padding-bottom: 30px;">
		<div class="board-search" style="float: right;">
			<input type="text" title="제목을 입력해 주세요." placeholder="제목을 입력해 주세요." class="input-text" name="keyword" value="${keyword }">
			<button type="button" class="btn-search-input" id="eventSearchBtn">검색</button>
		</div>
	</div>
	<div class="container">
        <table>
        		 <colgroup>
			        <col style="width: 10%;">
			        <col style="width: 10%;">
			        <col style="width: 20%;">
			        <col style="width: 40%;">
			        <col style="width: 10%;">
			        <col style="width: 20%;">
			    </colgroup>
                <tr>
                    <th>번호</th>
                    <th>극장</th>
                    <th>유형</th>
                    <th>제목</th>
                    <th>답변상태</th>
                    <th>등록일</th>
                </tr>
                <c:forEach items="${qnaList }" var="qna" varStatus="status">
	                <tr>
	                	<td id="num"><c:out value="${status.count }"></c:out></td>
	                	<td id="num">${qna.thr_name }</td>
	                	<td id="num">${qna.que_type }</td>
	                	<td id="quetitle" onclick="location.href='<%=request.getContextPath()%>/support/inquiry_nonMember_board.do?que_no=${qna.que_no }'">
	                		${qna.que_title }
						</td>
						<c:if test="${empty qna.ans_content}">
		                	<td id="num">미답변</td>
						</c:if>
						<c:if test="${!empty qna.ans_content}">
		                	<td id="num">답변완료</td>
						</c:if>
	                	<td id="num">
							<fmt:formatDate value="${qna.regdate }" pattern="yyyy-MM-dd"/>
	                	</td>
	                </tr>
                </c:forEach>
        </table>
                <c:if test="${empty qnaList }">
                	<div class="" style="padding-bottom: 10px; margin: auto;">
						<div style="text-align: center; padding: 50px;">조회된 내역이 없습니다.</div>
					</div>
                </c:if>
    </div>
	
</div>
<form id="qnaSearchForm" method="post" action="<%=request.getContextPath()%>/support/inquiry_nonMember_list.do">
	<input type="hidden" name="keyword">
	<input type="hidden" name="writer_name" value="${qnaMem.writer_name }">
	<input type="hidden" name="writer_email" value="${qnaMem.writer_email }">
	<input type="hidden" name="writer_pwd" value="${qnaMem.writer_pwd }">
</form>
<script>
	$(function(){
		$('#eventSearchBtn').on('click', function(){
			let keyword = $('.board-search input[name="keyword"]').val();
			$('#qnaSearchForm input[name="keyword"]').val(keyword);
			
			
			$("#qnaSearchForm").submit();
		})
	})
</script>
<%@ include file="../include/footer.jsp" %>