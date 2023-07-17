<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
    <title>Movie Schedule</title>
    <style>
    	table {
    	
      border-collapse: collapse;
      text-align: center;
    }
    th {
    
      width: 50px;
      height: 50px;
      border: 1px solid black;
    }
    tr {
    margin : 0;
    	padding : 0;
      width: 50px;
      height: 50px;
      border: 1px solid black;
    }
    td {
    margin : 0;
    	padding : 0;
   	  width: 80px;
      height: 30px;
      border: 1px solid black;
      /* padding: 30px; */
    }
    
        .cell {
        margin : 0;
    	padding : 0;
            display: inherit;
            width: 10px;
            height: 30px;
             position: relative;
            text-align: center;
            font-size: 12px;
        }
    </style>
	<table>
		<tr>
			<c:forEach items="${allScreenList }" var="movie">
				<td>${movie.movie_name}</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${allScreenList }" var="movie">
				<td>${movie.movie_length} 분</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${allStart }" var="start">
				<td>${start.startdate}</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${allRe }" var="Re">
				<td>${Re.RE}</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${allRe }" var="Re">
				<td>${Re.SCREEN_CD}</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${allRe }" var="Re">
				<td>${Re.THR_NAME}</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${allRe }" var="Re">
				<td>${Re.STARTTIME}</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${allRe }" var="Re">
				<td>${Re.ENDTIME}</td>
			</c:forEach>
		</tr>
	</table>
    
    <br>
    
    <table>
    <tr>
    	<th>시간</th>
    	<td>07시</td>
    	<td>08시</td>
    	<td>09시</td>
    	<td>10시</td>
    	<td>11시</td>
    	<td>12시</td>
    	<td>13시</td>
    	<td>14시</td>
    	<td>15시</td>
    	<td>16시</td>
    	<td>17시</td>
    	<td>18시</td>
    	<td>19시</td>
    	<td>20시</td>
    	<td>21시</td>
    	<td>22시</td>
    	<td>23시</td>
    	<td>00시</td>
    	<td>01시</td>
    	<td>02시</td>
    </tr>
	<tr>
		<th>1관</th>
		<td colspan="21" id="timeWrap">
		      
    	</td>
	</tr>
  </table>
    
   <script>
   window.onload = function() {
	   
	   // 데이터베이스에서 영화 시작 시간과 종료 시간을 가져옵니다.
	   
	   /* let list = new Array(); */
	   let list = ${allRe};
	   for(let a = 0; a<2; a++){
		   var startTime = list[a].STARTTIME; // 예시: "08:00"
		   var endTime = list[a].ENDTIME; // 예시: "09:49"
	   // 영화 시작 시간과 종료 시간에서 시간과 분을 추출합니다.
	   var startHour = parseInt(startTime.substring(0, 2));
	   var startMinute = parseInt(startTime.substring(3, 5));
	   var endHour = parseInt(endTime.substring(0, 2));
	   var endMinute = parseInt(endTime.substring(3, 5));
		
	   // timeWrap 요소를 가져옵니다.
	   var timeWrap = document.getElementById('timeWrap');

	   // 1200개의 span 요소를 생성하고 배경색을 적용합니다.
	   for (let i = 0; i < 1200; i++) {
	     var span = document.createElement("span");
	     span.classList.add("cell");
	     let start = startHour * 60 + startMinute - 420; //60
	     let end = endHour * 60 + endMinute - 420; //169
		     for (j=start; j<=end; j++){
		  	 $('#timeWrap span:nth-child('+j+')').css('background-color', 'red');
		     timeWrap.appendChild(span);
	  		 }  
	   }
	   }
	 };


    </script>
</head>
<body>
</body>
</html>
