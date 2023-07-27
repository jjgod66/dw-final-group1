<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="thrAdminHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
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
  position: relative;
   width: 150px;
  height: 250px; /* Adjust the height as needed */
}
 .back{
 	background-size: contain;
 } 

.poster-container:hover .movieChart_btn {
  opacity: 1; /* Show the anchor tag on hover */
}



   
        
 * {
  box-sizing: border-box;
}

/* hide scrollbar */
::-webkit-scrollbar {
  width: 1px;
  height: 1px;
}

::-webkit-scrollbar-button {
  width: 1px;
  height: 1px;
}
.external {
	margin-bottom:60px;
	background-color:#f1f3f5;
	width:80%;
	margin-left:auto;
	margin-right:auto;
  overflow: hidden;
  height: 60vh;
}

.horizontal-scroll-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 60vh;
  transform: rotate(-90deg) translate3d(0,-100vh,0);
  transform-origin: right top;
  overflow-y: auto;
  overflow-x: hidden;
  padding: 0;
  height: 180vw;
  perspective: 10px;
  transform-style: preserve-3d;
  padding-bottom: 10rem;
}
.img-wrapper {
  transform: rotate(90deg);
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 40vh;
  transform-origin: 50% 50%;
  transform: rotate(90deg) translateZ(.1px) scale(0.9) translateX(0px) translateY(-3vh);
  transition: 1s;
}

.img-wrapper:hover {
 min-height: 65vh;
}

.slower {
  transform: rotate(90deg) translateZ(-.2px) scale(1.1) translateX(0%) translateY(-10vh);
}

.slower2 {
  transform: rotate(90deg) translateZ(-.3px) scale(1.3) translateX(0%) translateY(2vh);
}


.img1 {
  color: inherit;
  font-weight: 500;
  
}

.img-wrapper .img1 {
  overflow: hidden;
  display: block;
  padding: 1vh ;
  background: #efecdb;
  box-shadow: 15px 30px 30px 0px #5f2f1182;
}

 .img1 {
  max-width: 45vh;
  max-height: 50vh;
  transition: .5s;
  vertical-align: top;
  filter: saturate(30%) sepia(40%) hue-rotate(5deg);
}
.img1:hover {
	cursor:pointer;
  filter: none;
}
p {
  margin: 0;
}


</style>
<div id="wrapper">
	<div id="content">
		
<section class="content-header">
	<div class="breadcrumb">
		<span>HOME</span> <i class="bi bi-chevron-compact-right" style="padding-top: 0.1rem; align-self: center;"></i> 관리자 홈
	</div>
</section>
	<h1><span style="margin-left: 2rem;"> <strong>대전 중앙점 </strong></span></h1>
	
	
	
<div class="container">
  	<h2 class="mt-4">상영 가능한 영화</h2>
	<div class="external">
	  <div class="horizontal-scroll-wrapper">
		<div class="img-wrapper slower slower2">
		</div>		
			<c:forEach items="${allScreenList }" var="movie">
				<div class="img-wrapper slower slower2">
			     	<div onclick="handlePosterClick()" class="poster-container back img1" style="background: url('<%=request.getContextPath() %>/thrAdmin/getPicture.do?name=${movie.movie_mainpic_path}&item_cd=${movie.movie_cd}&type=moviePoster'); repeat;background-size: contain;"></div>
			    </div>
		  	</c:forEach>
	    <div class="img-wrapper slower slower2">
		</div>	
		<div class="img-wrapper slower slower2">
		</div>
		<div class="img-wrapper slower slower2">
		</div>
		<div class="img-wrapper slower slower2">
		</div>
	  </div>
	</div>
  
</div>
</div>
</div>
<script>
function handlePosterClick() {
    alert("포스터를 클릭했습니다!");
}
</script>
<%@ include file="thrAdminFooter.jsp"%>