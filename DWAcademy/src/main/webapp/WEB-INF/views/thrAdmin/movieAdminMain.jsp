<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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
            display: inline-block;
            width: 1px;
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
				<td>${Re.re}</td>
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
	<tr>
		<th>2관</th>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>3관</th>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>4관</th>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
  </table>
    
   <script>
        window.onload = function() {
            var startTime = '  ${start.startdate }'; // Assuming startTime is a string in "HH:mm" format
            var startHour = parseInt(startTime.substring(0, 2));
            var startMinute = parseInt(startTime.substring(3, 5));

            var currentTime = new Date();
            currentTime.setHours(7, 0, 0, 0); // Set initial time to 07:00

            for (var i = 0; i < 1200; i++) {
                var cell = document.createElement("span");
                cell.classList.add("cell");
				
                	if(i >= 100 && i <= 300){
	                    cell.style.backgroundColor = "white"; // Movie has started
	                    cell.style.float = "left";
                	}else{
	                    cell.style.backgroundColor = "red"; // Movie has not started yet
	                    cell.style.float = "left";
                	}
                	

                 document.getElementById('timeWrap').appendChild(cell); 
                currentTime.setMinutes(currentTime.getMinutes() + 1); // Increment time by 1 minute
            }
        };
    </script>
</head>
<body>
</body>
</html>
