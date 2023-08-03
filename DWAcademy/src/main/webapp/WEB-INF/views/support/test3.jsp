<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - GSAP Homepage Demo 4</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<style type="text/css">
 html, body, div {
  width:100%;
  height:100%;
  max-height:880px;
  overflow:hidden;
  position:absolute;
} 
#mainn {
  width:100%;
  height:100%;
  max-height:880px;
  overflow:hidden;
  position:absolute;
}
.textContainer {
  display:none;
  top: 0;
  left: 100%;
  width: 513px;
  padding: 100px;
  background-color: rgba(255, 255, 255, 0.9);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  transform: translateX(-100%);
}

.textContainer.active {
display: block;
}
#non{pointer-events:none;}
</style>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="main">
  <div class="mainBoxes fs">
  </div>
  
  <div class="textContainer">
    <h1 class="movieTitle">Movie Title</h1>
    <p class="movieDescription">Movie description goes here.</p>
    	<button class="btn btn-4 hover-border-10">
		   	<a href="#">
		    <span style="color: black;">예매하기</span></a>
	  	</button>
        <button class="btn btn-4 hover-border-10">
		   	<a href="#">
		    <span style="color: black;">상세보기</span></a>
	  	</button>
  </div>
  
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/zepto/1.2.0/zepto.min.js'></script>
<script  src="<%=request.getContextPath()%>/resources/js/main.js"></script>

</body>
</html>