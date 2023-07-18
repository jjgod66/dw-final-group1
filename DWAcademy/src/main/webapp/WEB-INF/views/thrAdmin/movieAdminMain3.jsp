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
    
    .cell2{
		  position: absolute;
		  top: 6px;
		  left: 0;
		  width: 231px;
    }
     .cell4{
		  position: absolute;
		  top: 69px;
		  left: 0;
		  width: 573px;
    }
    .cell3{
		  position: relative;
    }
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
	   	width: 62px;
	    height: 30px;
	    border: 1px solid black;
    }
        .cell {
        	margin : 0;
    		padding : 0;
            display: inline-block;
            width: 1px;
            height: 50px;
           /*  position: relative; */
            text-align: center;
            font-size: 12px;
            z-index: 1;
            
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
		<td colspan="21" >
		    <div id="timeWrap" class="cell3">
    		</div>
    	</td>
	</tr>
  </table>
    
   <script>
   window.onload = function() {
	   let list = ${allRe};
	   for(let a = 0; a<2; a++){
		   var startTime = list[a].STARTTIME; // 예시: "08:00"
		   var endTime = list[a].ENDTIME; // 예시: "09:49"
	   var startHour = parseInt(startTime.substring(0, 2));
	   var startMinute = parseInt(startTime.substring(3, 5));
	   var endHour = parseInt(endTime.substring(0, 2));
	   var endMinute = parseInt(endTime.substring(3, 5));
	   var timeWrap = document.getElementById('timeWrap');
	   var firstSpan = null;
// 	   for (let i = 0; i < 1201; i++) {
// 	     var span = document.createElement("span");
// 	     span.classList.add("cell");
// 	     let start = startHour * 60 + startMinute - 420; //60
// 	     let end = endHour * 60 + endMinute - 420; //169
	     
// 	     if(start <= i && i <= end){
// 	    	 span.style.backgroundColor = 'red';
		  	 
// 	    	 if(!firstSpan){
// 				 var div = document.createElement("div");
// 		    	 div.appendChild(span);
// 				 div.classList.add("cell2");
// 	    		 firstSpan = span;
// 			  	 div.textContent = 'qqqqqq';
// 		  	     /* div.textContent = `${list[a].MOVIE_NAME} - ${list[a].MOVIE_LENGTH}`; */
// 			 span.appendChild(div);
// 	    	 }
// 	     }
// 		     timeWrap.appendChild(span);
// 	   }
	   
	   for (let i = 0; i < 1201; i++) {
		     var span = document.createElement("span");
		     span.classList.add("cell");
		     let start = startHour * 60 + startMinute - 420; //60
		     let end = endHour * 60 + endMinute - 420; //169
		     
		     if(start <= i && i <= end){
		    	 span.style.backgroundColor = 'red';
			  	 
		    	 if(!firstSpan){
					 var div = document.createElement("div");
					 var div2 = document.createElement("div");
					 div.classList.add("cell2");
					 div2.classList.add("cell4");
		    		 firstSpan = span;
				  	 div.textContent = '엘리멘탈 8시~9시49분 ';
				  	 div2.textContent = '엘리멘탈2 11시~12시49분 ';
			  	     /* div.textContent = `${list[a].MOVIE_NAME} - ${list[a].MOVIE_LENGTH}`; */
				     timeWrap.appendChild(div);
				     timeWrap.appendChild(div2);
		    	 }
		     }
			     timeWrap.appendChild(span);
		   }
	   }
	 };
    </script>
</head>
<body>
</body>
</html>
