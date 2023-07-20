<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<meta charset="UTF-8">


<style>
#wrapper {
    background-color: #fff;
    z-index: 5;
    min-width: 1210px;
    zoom: 1;
}
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
.tbl_frm02 {
	width:90%;
   /*  border-top: 1px solid #888; */
}
.s_wrap {
    margin: 30px 25px;
}
#content h2 {
margin: 0px 100px 0px 87px;
    position: relative;
    font-size: 16px;
    font-weight: 600;
    letter-spacing: -1px;
    line-height: 1em;
    padding: 0 0 10px 10px;
}
#content h2:before {
    display: inline-block;
    position: absolute;
    left: 0;
    top: 0;
    width: 4px;
    height: 16px;
    background: #1a4e99;
    content: '';
}
.cell {
			width:70px;
            font-size: 11px;
        }
td{
	/* border: 1px solid black; */
}
tr{height: 40px;}
table {
		justify-content:center;
		width:80%;
		border: 1px solid black;
         border-collapse: collapse;
         text-align: center;
    }
/* Modal styles */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0, 0, 0); /* Fallback color */
  background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 60%;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

#movieInfoList {
  list-style-type: none;
  padding: 0;
}

#movieInfoList li {
  margin-bottom: 10px;
}

.btn_confirm {
    margin-top: 20px;
    text-align: center;
}
.grey {
    background: #888;
    border: 1px solid #888;
    color: #fff !important;
}
.btn_medium {
    padding: 8px 15px;
    font-size: 13px;
    line-height: 1.444;
    font-weight: 600;
}
</style>

<div id="wrapper">
	<div id="content">
		
<section class="content-header">
	<div class="breadcrumb">
		<span>HOME</span> <i class="bi bi-chevron-compact-right" style="padding-top: 0.1rem; align-self: center;"></i> 상영영화 관리 &gt 영화 목록  
	</div>
</section>
	<h1><span style="margin-left: 2rem;"> <strong>대전 중앙점 </strong></span></h1>
<div class="s_wrap">
			<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
			<h2>영화리스트 </h2>

<div class="tbl_frm02" style="margin-left:auto;margin-right:auto;">
<table >
  <tr >
    <th >시간</th>
    <td colspan="6" style="border:1px solid black;">07시</td>
    <td colspan="6"style="border:1px solid black;">08시</td>
    <td colspan="6"style="border:1px solid black;">09시</td>
    <td colspan="6"style="border:1px solid black;">10시</td>
    <td colspan="6"style="border:1px solid black;">11시</td>
    <td colspan="6"style="border:1px solid black;">12시</td>
    <td colspan="6"style="border:1px solid black;">13시</td>
    <td colspan="6"style="border:1px solid black;">14시</td>
    <td colspan="6"style="border:1px solid black;">15시</td>
    <td colspan="6"style="border:1px solid black;">16시</td>
    <td colspan="6"style="border:1px solid black;">17시</td>
    <td colspan="6"style="border:1px solid black;">18시</td>
    <td colspan="6"style="border:1px solid black;">19시</td>
    <td colspan="6"style="border:1px solid black;">20시</td>
    <td colspan="6"style="border:1px solid black;">21시</td>
    <td colspan="6"style="border:1px solid black;">22시</td>
    <td colspan="6"style="border:1px solid black;">23시</td>
    <td colspan="6"style="border:1px solid black;">00시</td>
    <td colspan="6"style="border:1px solid black;">01시</td>
    <td colspan="6"style="border:1px solid black;">02시</td>
  </tr>
  <tr id="timeTable">
    <th style="border:1px solid black;">1관</th>
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
</div>


<!-- <button id="addMovieBtn">영화 수정하기 </button> -->

	<div class="btn_confirm">
		 <input type="button" value="영화수정" id="addMovieBtn" class="btn_medium grey">
	</div>

<!-- The modal -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <ul id="movieInfoList">
      <!-- Movie information will be added dynamically here -->
    </ul>
  </div>
</div>




</div>
</div>
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
	    var tdList = timeTable.getElementsByTagName('td');

	    var start = (startHour * 60 + startMinute - 420) / 10; // 6
	    var end = (endHour * 60 + endMinute - 420) / 10; // 16.9
	    // 배경색 및 영화 정보 추가
 	    for (let i = start; i <= end; i++) {
        tdList[i].style.backgroundColor = '#FFC5D0';

        if (i == start) {
          var div = document.createElement('div');
          div.classList.add("cell");
          div.textContent = list[a].MOVIE_NAME +'\n'+ list[a].MOVIE_LENGTH + '분\n' +list[a].STARTTIME +'~'+ list[a].ENDTIME;
          tdList[i].appendChild(div);
        }
      }
	    // 병합된 셀 설정
	    if (start !== end) {
	      tdList[start].setAttribute('colspan', end - start + 1);
	      for (let i = start + 1; i <= end; i++) {
	    	  tdList[i].style.width = '0';
	          tdList[i+1].style.display = 'none';
	      }
	    }    
	  }
	  // 영화수정하기버튼눌렀을때 
	  function openModal() {
		    
	      movieInfoList.innerHTML = '';
	      let list = ${allRe}; 
	      
	      
		  for (let a = 0; a < 2; a++) {
		      list.forEach(function(movie) {
		        let listItem = document.createElement('li');
		        listItem.textContent = list[a].MOVIE_NAME +'\n'+ list[a].MOVIE_LENGTH +'분'+'\n'+'상영시간: ' +list[a].STARTTIME +'~'+ list[a].ENDTIME;
	      //상영관이름넣기
	      let thrName = document.createElement('div');
	      thrName.textContent = '상영관 이름 : ' + list[a].THR_NAME;
	      movieInfoList.appendChild(thrName);
		        //tnw수정버튼넣기
		          let editButton = document.createElement('button');
		          editButton.textContent = '수정';
		          editButton.classList.add("btn_medium");
		          editButton.addEventListener('click', function() {
		            console.log('movie: ', list[a].MOVIE_NAME);
		          });
		          listItem.appendChild(editButton);
		          movieInfoList.appendChild(listItem);
		      });
		  }
	      modal.style.display = 'block';
	    }

	    const addMovieBtn = document.getElementById('addMovieBtn');
	    const modal = document.getElementById('myModal');
	    const movieInfoList = document.getElementById('movieInfoList');
	   //수정버튼 눌렀을때 
		  addMovieBtn.addEventListener('click', function() {
		    openModal();
		  });

	    modal.addEventListener('click', function(event) {
	      if (event.target === modal || event.target.className === 'close') {
	        modal.style.display = 'none';
	      }
	    });
	  
	  
	  
	  
	  
	};

</script>

<%@ include file="thrAdminFooter.jsp"%>