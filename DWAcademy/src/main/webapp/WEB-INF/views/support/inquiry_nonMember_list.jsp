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
                <tr>
                	<td id="num">1</td>
                	<td id="num">센터</td>
                	<td id="num">영화정보문의</td>
                	<td>
                		<span class="text-gray-700 px-6 py-3 flex items-center">
							<input class="modal-btn" type="checkbox" id="modal-btn" name="modal-btn"/>
					      	<label for="modal-btn">영화 개봉 날짜 문의  </label> 	
					      	<%@ include file="inquiry_nonMember_list_login.jsp" %>
						</span>
					</td>
                	<td id="num">미답변</td>
                	<td id="num">2023.07.28</td>
                </tr>
                 <tr>
                	<td id="num">2</td>
                	<td id="num">센터</td>
                	<td id="num">영화정보문의</td>
                	<td>제목이 긴 제목입니다.제목이 긴 제목입니다.제목이 긴 제목입니다.</td>
                	<td id="num">미답변</td>
                	<td id="num">2023.07.28</td>
                </tr>
                 <tr>
                	<td id="num">3</td>
                	<td id="num">센터</td>
                	<td id="num">영화정보문의</td>
                	<td>제목</td>
                	<td id="num">미답변</td>
                	<td id="num">2023.07.28</td>
                </tr>
        </table>
    </div>
	
</div>


<%@ include file="../include/footer.jsp" %>