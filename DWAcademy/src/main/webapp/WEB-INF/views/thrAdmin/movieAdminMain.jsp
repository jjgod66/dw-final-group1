<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<meta charset="UTF-8">


<style>
td{vertical-align: middle;

}
#wls {
    font-weight: 550;
    background: #f1f1f1;
    text-align: center;
}
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
			cursor: pointer;
			transition: background-color 0.2s;
            font-size: 13px;
        }
.cell:hover {
  background-color: #b8e6ff;
}       

table {
		border-color: #dddddd;
		justify-content:center;
		width:80%;
         border-collapse: collapse;
         text-align: center;
    }
/* Modal styles */
.modal {
  display: none; 
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
  color: #333;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.info {
	margin-left:12%;
	margin-right:12%;
  margin-top: 15px;
  margin-bottom: 30px;
    background-color: #f9f9f9;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.info p {
  margin: 5px 0;
}

.info span {
  font-weight: normal;
  color: #555;
}
button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 15px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  font-size: 16px;
}

button:hover {
  background-color: #d0ebff	;
}
.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}



.btn_confirm {
    margin-top: 20px;
    text-align: center;
}
.grey1 {
    background: #dcdcdc;
    border: 1px solid #dcdcdc;
    color: #505050 !important;
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


.calendar-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

#calendar {
  display: flex;
  align-items: center;
  margin: 20px;
}


.date-item {
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  padding: 10px;
  text-align: center;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.date-item:hover {
  background-color: #d0ebff;
}
#nextBtn {
  margin-right: 250px;
}
#prevBtn {
  margin-left: 250px;
}
 .container {
      font-family: Arial, sans-serif;
    }
li {
      padding: 10px;
      margin-bottom: 10px;
      border-radius: 10px;
    }
  .info p {
      margin: 5px;
    }

    .info strong {
      font-weight: bold;
    } 
    


  .poster-container {
   margin-right: 10px;
  position: relative;
   width: 30px;
  height: 50px; /* Adjust the height as needed */
}
 .back{
 	background-size: contain;
 } 

.poster-container:hover .movieChart_btn {
  opacity: 1; /* Show the anchor tag on hover */
}


body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
        }


        .movie-card {
        	display:flex;
        	align-items: center;
            background-color: #fff;
            border-radius: 5px;
            padding: 7px;
            margin-bottom: 6px;
            box-shadow: 0 0.5px 30px rgba(0, 0, 0, 0.1);
            /* 화면의 50% 차지하도록 스타일링 */
            width: 50%;
        }

        .movie-list-container {
            /* 반응형 그리드 스타일링 */
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        /* 화면이 작아질 때 한 줄에 1개씩 표시 */
        @media (max-width: 1400px) {
            .movie-card {
                width: 100%;
            }
        }

  .mar{
  	margin: 0px 100px 0px 87px;
  } 
        
 

</style>



<!-- ##################################################################### -->
<div id="wrapper">
	<div id="content">
		
		<section class="content-header">
			<div class="breadcrumb">
				<span>HOME</span> <i class="bi bi-chevron-compact-right" style="padding-top: 0.1rem; align-self: center;"></i> 상영영화 관리 &gt 영화 목록  
			</div>
		</section>
			<h1><span style="margin-left: 2rem;"> <strong>대전 중앙점 </strong></span></h1>
			
	
	
	
	
		<div class="container">
		  	<h2 class="mt-4">상영 가능한 영화</h2>
		        <div class="mar">
		        <div id="movieList">
					<c:forEach items="${allMovieList }" var="movie">
						<div class="col-md-5">
							<div class="movie-card" >
					     		<div  class="poster-container back" style="background: url('<%=request.getContextPath() %>/thrAdmin/getPicture.do?name=${movie.MOVIE_MAINPIC_PATH}&item_cd=${movie.MOVIE_CD}&type=moviePoster'); repeat;background-size: contain;">
								</div>
									<span>${movie.MOVIE_NAME}</span>
							</div>
					    </div>
				  	</c:forEach>
		        </div>
		        </div>
				
			 <%--  <div class="mt-5 mb-5">
					<%@ include file="../common/pagination.jsp" %>
				</div>  --%>
	

			<!-- 페이징네이션 부분 -->
			<nav aria-label="movie list Nabigation">
  <ul class="pagination justify-content-center m-0" style="background-color: white;">
    <li class="page-item">
      <a class="page-link" href="javascript:loadMovies(1);">
        <i class="bi bi-chevron-double-left"></i>
      </a>
    </li>
    <li class="page-item">
      <a class="page-link" href="javascript:loadMovies(${pageMaker.prev ? pageMaker.cri.getPage() - 1 : -1 });">
        <i class="bi bi-chevron-left"></i>
      </a>
    </li>
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
      <li class="page-item ${pageMaker.cri.page == pageNum ? 'active' : '' }">
        <a class="page-link" href="javascript:loadMovies(${pageNum});">${pageNum}</a>
      </li>
    </c:forEach>
    <li class="page-item">
      <a class="page-link" href="javascript:loadMovies(${pageNo + 1});">
        <i class="bi bi-chevron-right"></i>
      </a>
    </li>
    <li class="page-item">
      <a class="page-link" href="javascript:loadMovies(${realEndPage});">
        <i class="bi bi-chevron-double-right"></i>
      </a>
    </li>
  </ul>
</nav>
	
	
			<div class="">
					<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
					<h2>영화리스트 </h2>
			  <div class="calendar-container">
			    <button id="prevBtn" class="btn btn-link">
				  <i class="material-icons">chevron_left</i>
				</button>
			    <div id="calendar">
			      <!-- Dates will be added dynamically here -->
			    </div>
			    <button id="nextBtn" class="btn btn-link">
				 <i class="material-icons">chevron_right</i>
				</button>
			  </div>
				<%@ include file="calenderScript.jsp" %>
					
			
			
			
			

				<div class="tbl_frm02 table-responsive" style="margin-left:auto;margin-right:auto;">
					<table class="table table-striped">
					  <tr id="wls">
					    <th style="border:1px solid #bfbfbf;">시간</th>
					    <td colspan="6" style="border:1px solid #bfbfbf;">07시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">08시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">09시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">10시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">11시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">12시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">13시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">14시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">15시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">16시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">17시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">18시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">19시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">20시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">21시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">22시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">23시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">00시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">01시</td>
					    <td colspan="6"style="border:1px solid #bfbfbf;">02시</td>
					  </tr>
					  <tr id="timeTable" style="border:1px solid #dddddd;">
					    <th style="border:1px solid #bfbfbf;">1관</th>
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
					<tr id="timeTable2" style="border:1px solid #dddddd;">
					    <th style="border:1px solid #bfbfbf;">2관</th>
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
					<tr id="timeTable3" style="border:1px solid #dddddd;">
					    <th style="border:1px solid #bfbfbf;">3관</th>
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
			</div>
	</div>

	











</div>
</div>
	<div id="myModal" class="modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <h2>영화정보 </h2>
	    <div class="info">
	      <p><strong>영화관 명 :</strong> <span id="thrName"></span> </p>
	      <p><strong>시작 시간 :</strong> <span id="startTime"></span></p>
	      <p><strong>끝나는 시간 :</strong> <span id="endTime"></span></p>
	      <p><strong>영화 제목 :</strong> <span id="movieName"></span></p>
	      <p><strong>상영 길이 :</strong> <span id="movieLength"></span></p>
	      <p><strong>Screen_cd :</strong> <span id="screenCd"></span></p>
	      <p><strong>Movie_cd :</strong> <span id="movieCd"></span></p>
	      <p><strong>상영관 넘버 :</strong> <span id="houseNo"></span></p>
	    </div>
	  </div>
	</div>

<script>
window.onload = function() {
	  let list = ${allRe};
	  for (let a = 0; a < list.length; a++) {
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
        tdList[i].style.backgroundColor = '#d0ebff';

        if (i == start) {
          var div = document.createElement('div');
          div.classList.add("cell");
          div.dataset.screenCd1 = list[a].SCREEN_CD;
          div.textContent = list[a].MOVIE_NAME +'\n'+ list[a].MOVIE_LENGTH + '분\n' +list[a].STARTTIME +'~'+ list[a].ENDTIME;
          tdList[i].appendChild(div);
          
        }
      }
	    // 병합된 셀 설정
	    if (start !== end) {
	      tdList[start].setAttribute('colspan', end - start + 1);
	      for (let i = start + 1; i <= end; i++) {
	    	  tdList[i].style.width = '0';
	          tdList[i].style.display = 'none';
	      }
	    }    
	  }
	};
	
	
	
	
	
	 $(document).ready(function() {
	    let list = ${allRe};
	    $(document).on("click",'.cell', function() {
	      const modal = document.getElementById('myModal');
	      const screenCd1 = $(this).data("screen-cd1");
	      const clickedMovieInfo = list.find(item => item.SCREEN_CD === screenCd1);
	      if (clickedMovieInfo) {
	        $("#thrName").text(clickedMovieInfo.THR_NAME);
	        $("#startTime").text(clickedMovieInfo.STARTTIME);
	        $("#endTime").text(clickedMovieInfo.ENDTIME);
	        $("#movieName").text(clickedMovieInfo.MOVIE_NAME);
	        $("#movieLength").text(clickedMovieInfo.MOVIE_LENGTH);
	        $("#screenCd").text(clickedMovieInfo.SCREEN_CD);
	        $("#movieCd").text(clickedMovieInfo.MOVIE_CD);
	        $("#houseNo").text(clickedMovieInfo.HOUSE_NO);
	        
	        $("#myModal").show();
	      }
	      modal.style.display = 'block';
	    });
	    $(".close").on("click", function() {
	      $("#myModal").hide();
	    });
	  }); 
	
	
	 $(document).ready(function () {
		    var currentPage = 2;

		    loadMovies(currentPage);
		    
		    // 페이징네이션 링크를 클릭할 때마다 해당 페이지의 목록을 가져옴
		    $(document).on("click", ".pagination a", function (e) {
		        e.preventDefault();
		        currentPage = parseInt($(this).attr("data-page"));
		        loadMovies(currentPage);
		        console.log("링크클릭때 currentPage : "+currentPage);
		    });

		    
		    
		    // 페이지 번호에 해당하는 영화 목록을 가져와서 화면에 렌더링하는 함수
		    function loadMovies(pageNo) {
		    	console.log("페이지넘2 : "+pageNo);
		      $.ajax({
		        url: "/loadMovies",
		        data: { pageNo: pageNo },
		        type: "GET",
		        dataType: "json",
		        success: function (data) {
		          var movieList = $("#movieList");
		          movieList.empty();
		          $.each(data, function (index, movie) {
		            var poster = $("<div>")
		              .addClass("poster-container back")
		              .css("background", "url('" + '<%=request.getContextPath() %>/thrAdmin/getPicture.do?name=' + movie.movie_mainpic_path + '&item_cd=' + movie.movie_cd + '&type=moviePoster' + "'); repeat")
		              .css("background-size", "contain");
		            var movieName = $("<span>").text(movie.movie_name);
		            var movieCard = $("<div>").addClass("movie-card").append(poster).append(movieName);
		            var col = $("<div>").addClass("col-md-5").append(movieCard);
		            movieList.append(col);
		          });
		          $(".pagination a").removeClass("active");
		          $(".pagination a[data-page='" + pageNo + "']").addClass("active");
		        },
		        error: function (error) {
		          console.log("Error:", error);
		          console.log("에러부분 "+pageNo);
		        },
		      });
		    }
		  });
	 
	 
	
	  
	/*  let searchFormUrl = "loadMovies.do";  */
	  
</script>

<%@ include file="thrAdminFooter.jsp"%>