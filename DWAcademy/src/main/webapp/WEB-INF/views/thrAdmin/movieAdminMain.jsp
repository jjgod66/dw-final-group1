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
    
    .table {
         /* width: -webkit-fill-available; */
         border-collapse: collapse;
         text-align: center;
    }
    .table:after {
    	display: block;
    	content: "";
    	clear: both;
    	
    }
    ul {
      list-style: none;
      margin : 0;
      padding : 0;
      border: 1px solid black;
    }
    li {
        float: left;
   		margin : 0;
    	padding : 4px;
    	width: 50px;
	    height: 50px;
	    border: 1px solid black; 
    }
    ul#timeTable li {
    	width: 8px;
    	padding: 4px 0;
    }
    ul#timeTable li.room {
    	width: 50px;
    	padding: 4px;
    }
    ul#timeTable li.red {
    	background-color: red;
    	border-left: 0;
    	border-right: 0;
    	width: 10px;
    }
    ul#timeTable li.red:first-child {
    	border-right: 0;
    	width: 9px;
    }
       .cell {
            font-size: 12px;
        }
        .addcell {
        	width: calc(100% - 1297px) !important;
        }
    </style>

    <div class="table">
    <ul>
    	<li>시간</li>
    	<li>07시</li>
    	<li>08시</li>
    	<li>09시</li>
    	<li>10시</li>
    	<li>11시</li>
    	<li>12시</li>
    	<li>13시</li>
    	<li>14시</li>
    	<li>15시</li>
    	<li>16시</li>
    	<li>17시</li>
    	<li>18시</li>
    	<li>19시</li>
    	<li>20시</li>
    	<li>21시</li>
    	<li>22시</li>
    	<li>23시</li>
    	<li>00시</li>
    	<li>01시</li>
    	<li>02시</li>
    </ul>
    </div>
    <div class="table">
	<ul id="timeTable">
		<li class="room">1관</li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
  </div>
    
   <script>
   window.onload = function() {
	   let list = ${allRe};
	   for (let a = 0; a < 2; a++) {
	     var startTime = list[a].STARTTIME; // 예시: "08:00"
	     var endTime = list[a].ENDTIME; // 예시: "09:49"
	     var startHour = parseInt(startTime.substring(0, 2));
	     var startMinute = parseInt(startTime.substring(3, 5));
	     var endHour = parseInt(endTime.substring(0, 2));
	     var endMinute = parseInt(endTime.substring(3, 5));

	     var timeTable = document.getElementById('timeTable');
	     var tdList = timeTable.getElementsByTagName('li');

	     var start = (startHour * 60 + startMinute - 420)/10 +1; // 6
	     var end = (endHour * 60 + endMinute - 420)/10+1; // 16.9

	     for (let i = start; i <= end; i++) {
	       tdList[i].classList.add("red");
	       var div = document.createElement('div');
	       div.classList.add("cell")
	       div.textContent =list[a].MOVIE_NAME +list[a].MOVIE_LENGTH +'분'+ list[a].STARTTIME + '-' + list[a].ENDTIME; 
	       tdList[i].appendChild(div);
	     }
	     
	       if (start !== end) {
	         tdList[start].classList.add("addcell");
	         for (let i = start + 1; i <= end; i++) {
	           tdList[i].style.display = 'none';
	         }
	       }
	   }
	 };

    </script>
</head>
<body>
</body>
</html>
