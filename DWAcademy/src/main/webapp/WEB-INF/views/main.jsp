<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%-- <link rel="stylesheet" href="../../resources/css/boxoffice.css">
<%@ include file="/WEB-INF/views/common/boxoffice.jsp" %> --%>
<!-- 메인슬라이 -->
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css'>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/slider.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/StoreCard.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainMoviePost.css">
<!-- 페럴 --> 
<style>
.event-list {
    margin-top: 15px;
    overflow: hidden;
}
.event-list ul {
    overflow: hidden;
    margin: 0 0 0 -40px;
}
.event-list ul li {
    position: relative;
    float: left;
    width: 20%;
    margin: 0 -53px 0 71px;
    padding: 0;
}
.event-list ul li a {
    overflow: hidden;
    display: block;
    border: 1px solid #e4e4e4;
    border-radius: 10px;
}
.event-list ul li a .img {
    width: 100%;
    height: 100%;
    font-size: 0;
    line-height: 0;
}
.event-list ul li a .img img {
    width: 100%!important;
    height: 290px!important;
}
.event-list p {
    display: block;
    margin: 0;
    padding: 0;
}
.event-list ul li a .tit {
    overflow: hidden;
    height: 60px;
    margin: 0 0 10px 0;
    padding: 20px 17px 0 17px;
    line-height: 1.3;
    font-weight: 700;
    color: #222;
}
.event-list ul li a .date {
    padding: 0 17px 20px 17px;
    font-size: .8667em;
    line-height: 1.1;
    color: #666;
}



#mainMovieSlider123{
	    background: repeating-linear-gradient(45deg, #282828, #123c64 500px);
}
.s > div span {
    color: #e5e9f0;
}
.s > div h1 {
    background-image: linear-gradient(45deg, #ffffff, #5cbeff);
}
.s1 > div h1 {
	text-align:center;
  text-transform: capitalize;
  letter-spacing: 0.8px;
  font-family: "Roboto", sans-serif;
  font-weight: 900;
  font-size: clamp(1.4375rem, 2.25rem + 0.75vw, 2rem);
  background-color: #005baa;
  background-image: linear-gradient(45deg, #91ccff, #d7cdff);
  background-size: 100%;
  background-repeat: repeat;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-background-clip: text;
  -moz-text-fill-color: transparent;
}
.s2 > div h1 {
	text-align:center;
  text-transform: capitalize;
  letter-spacing: 0.8px;
  font-family: "Roboto", sans-serif;
  font-weight: 900;
  font-size: clamp(1.4375rem, 2.25rem + 0.75vw, 2rem);
  background-color: #005baa;
    background-image: linear-gradient(45deg, #152b3e, #0162ee);
  background-size: 100%;
  background-repeat: repeat;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-background-clip: text;
  -moz-text-fill-color: transparent;
}

.s3 > div h1 {
	padding-top:50px;
	text-align:center;
  text-transform: capitalize;
  letter-spacing: 0.8px;
  font-family: "Roboto", sans-serif;
  font-weight: 900;
  font-size: clamp(1.4375rem, 2.25rem + 0.75vw, 2rem);
  background-color: #005baa;
    background-image: linear-gradient(45deg, #152b3e, #0162ee);
  background-size: 100%;
  background-repeat: repeat;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-background-clip: text;
  -moz-text-fill-color: transparent;
}
.s4 > div h1 {
    width: 600px;
	padding-top:70px;
	text-align:center;
  text-transform: capitalize;
  letter-spacing: 0.8px;
  font-family: "Roboto", sans-serif;
  font-weight: 900;
  font-size: clamp(1.4375rem, 2.25rem + 0.75vw, 2rem);
  background-color: #005baa;
    background-image: linear-gradient(45deg, #152b3e, #0162ee);
  background-size: 100%;
  background-repeat: repeat;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-background-clip: text;
  -moz-text-fill-color: transparent;
}
.parallax-container {
  position: relative;
/*   overflow: hidden; */
}
.backRain{
	    background-size: cover;
	background-image: url("resources/img/food2.jpeg");
/* 	background: linear-gradient(45deg, #b0d9ff, transparent); */
	padding:1px;
}
.parallax-box {
	margin-left: 49%; margin-top: 100px; margin-bottom: 100px;
  text-align:center;
  height: 100%;
  background-size: cover;
  background-position: center;
  transform: translate(-50%, 0);
   transition: transform 1s cubic-bezier(0.2, 0.2, 0.2, 0.9), opacity 2s ease-in-out;
  opacity: 0; /* 초기에는 보이지 않도록 설정 */
}
.parallax-box-R {
  text-align:center;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  transform: translate(-50%, 0);
   transition: transform 1s cubic-bezier(0.2, 0.2, 0.2, 0.5), opacity 2s ease-in-out;
  opacity: 0; /* 초기에는 보이지 않도록 설정 */
}
 .parallax-box-left {
  text-align:center;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  transform: translate(50%, 0);
   transition: transform 1s cubic-bezier(0.2, 0.2, 0.2, 0.5), opacity 2s ease-in-out;
  opacity: 0; /* 초기에는 보이지 않도록 설정 */
} 
 .parallax-box-left1 {
  text-align:center;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  transform: translate(50%, 0);
   transition: transform 1s cubic-bezier(0.2, 0.2, 0.2, 0.5), opacity 2s ease-in-out;
  opacity: 0; /* 초기에는 보이지 않도록 설정 */
} 
.content-box {
	  position: relative;
  overflow: hidden;
    top: 47%;
    left: 56%;
    position: absolute;
  padding: 20px;
  width: 35%;
}
.content-box2 {
	margin-left: 243px;
    margin-top: 120px;
	  position: relative;
  overflow: hidden;
    position: absolute;
  padding: 20px;
  width: 35%;
}
.mainBtn{
	border: 2px solid #c2c2c2;
    margin-top: 2.188rem;
    padding: 0.625rem 1.875rem;
    display: inline-block;
    text-decoration: none;
    text-transform: uppercase;
    font-weight: 500;
    background: #fff;
    border-radius: 3.125rem;
    transition: 0.3s ease-in-out;
    color: black;
}
.mainBtn2{
    margin-right: 20px;
    border: 2px solid #c2c2c2;
    /* margin-top: 2.188rem; */
    padding: 0.325rem 1.275rem;
    display: inline-block;
    text-decoration: none;
    text-transform: uppercase;
    font-weight: 500;
    background: #fff;
    border-radius: 3.125rem;
    transition: 0.3s ease-in-out;
    color: black;
}
.mainBtn:hover {
  border: 0.125rem solid #005baa;
  color: #005baa;
}
.mainBtn2:hover {
  border: 0.125rem solid #005baa;
  color: #005baa;
}
@media screen and (min-width: 1500px){.wrapperEvent{width: 75%; margin: auto;} }
@media screen and (max-width: 1400px){.content-box2{margin-left: 103px;}}
.content-box2-p{
	position: absolute;
	margin: 230px 0 0 350px;
    text-align:center;
    width: 24%;
    font-size: 17px;
    color: #495057;
}
@media screen and (max-width:1400px){.content-box2-p{margin: 230px 0 0 173px; }}
@media screen and (max-width:1400px){.parallax-box{margin-left: 45%; }}
.mainPost{
	flex-wrap: wrap;
	width: 65%;
	margin: 0 auto;
	display: flex;
	
	
}
.mainPostBack{
	    padding-bottom: 90px;
		background-color: #fff;
		background-image: linear-gradient(90deg, transparent 79px, #abced4 79px, #abced4 81px, transparent 81px),
						  linear-gradient(#eee .1em, transparent .1em);
		background-size: 100% 1.2em;
}
.content-box3-p{
	position: absolute;
	margin: 545px 0 0 565px;
    text-align:center;
    font-size: 17px;
    color: #495057;
}
.content-box4-p{
    color: #495057;
}
@media screen and (min-width:800px){.mainPost{width: 94%;   }}
@media screen and (min-width:1500px){.mainPost{width: 65%;   }}
.thrBack { 
	display: flex;
    padding: 0 30% 0 20%;
	height: 431px;
	background: url("/resources/img/thrBack.jpeg");
}
.thrBack > img { padding: 59px;    border-radius: 50%;}
.s4 > p {font-size: 17px;  padding: 0 95px 0 95px;}

@media screen and (min-width:800px ){ .thrBack { padding:0; } }
@media screen and (min-width:1500px ){.thrBack{padding: 0 30% 0 20%;}}
</style>

	<!-- partial:index.partial.html -->
	<div id="mainMovieSlider123">
	<div class="s">
		  <div style="width: 40%">
		    <span class="movieGrade"><!-- 이곳에 등급이 나타납니다  --></span>
		    <h1 class="movie-title" style="text-align: center;"> <!-- 이곳에 영화제목이 나타납니다. --> </h1>
		    <hr style="width: 21.1rem; background: #ffffff;">
		    <p class="movieInfo"></p>
		    <p>
                <span class="">개봉일  : <span class="txt_grade movieOpendate1"></span>일</span><br>
                <span class="">상영시간 : <span class="txt_grade movieLength1"></span>분</span><br>
                <span class="">예매율  : <span class="txt_num movieRe1"></span>%</span>
		    </p>
		    <a href="" class="movieCd">예매하기</a>
		    <a href="" class="movieDetail">상세보기</a>
		  </div>
	  <div class="swiper">
	    <div class="swiper-wrapper">
			<c:forEach items="${movieList }" var="movie">
		      <div class="swiper-slide" style="background: url('<%=request.getContextPath() %>/common/getPicture.do?name=${movie.movie_mainpic_path}&item_cd=${movie.movie_cd }&type=moviePoster') no-repeat center /cover">
		        <input type="hidden" class="movieName" value="${movie.movie_name }">
		        <input type="hidden" class="movieGrade" value="${movie.movie_grade }">
		        <input type="hidden" class="movieLength" value="${movie.movie_length }">
		        <c:set var="res"><fmt:formatNumber pattern=".00" value="${movie.reserve == 0 ? 0 : movie.reserve / (movie.all_reserver == 0 ? 1 : movie.all_reserver) * 100}"/></c:set>
		        <input type="hidden" class="movieRe" value="${res }">
		        <input type="hidden" class="movieCd" value="${movie.movie_cd }">
		        <input type="hidden" class="movieOpendate" value="${movie.opendate }">
		        <%-- <div class="bookBtn">
		          <a href="/reservation/cinema.do?movie_cd=${movie.movie_cd}" target="_blank">예매하기</a>
		        </div> --%>
		      </div>
	      	</c:forEach>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	  </div>
	</div>
	</div>
	<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.4.5/swiper-bundle.min.js'></script>
<script  src="<%=request.getContextPath() %>/resources/js/slider.js"></script>
<script>
  // 문서가 로드되면 실행할 함수 , 한번실행
 $(document).ready(function() {
    var slideElements = $(".swiper-slide");
    slideElements.each(function(index, element) {
      if ($(element).hasClass("swiper-slide-active")) {
        var movieNameValue = $(element).find(".movieName").val();
        var movieGradeValue = $(element).find(".movieGrade").val();
        var movieLengthValue = $(element).find(".movieLength").val();
        var movieCdValue = $(element).find(".movieCd").val();
        var movieReValue = $(element).find(".movieRe").val();
        var datePattern = /^(\d{4}-\d{2}-\d{2})/; //date패턴
        var movieOpenValue = $(element).find(".movieOpendate").val().match(datePattern)[1];
        $(".movie-title").text(movieNameValue);
        $(".movieGrade").text(movieGradeValue);
        $(".movieLength1").text(movieLengthValue);
        $(".movieRe1").text(movieReValue);
        $(".movieCd").attr("href", "/reservation/cinema.do?movie_cd=" + movieCdValue);
        $(".movieDetail").attr("href", "/movie/viewer.do?movie_cd=" + movieCdValue);
        $(".movieOpendate1").text(movieOpenValue);
        return false; 
      }
    });
  });
	//드래그를 하면 해당 포스터의 정보를 리로드 합니다.
  swiper.on('transitionStart', function () {
		    var slideElements = $(".swiper-slide");
		    slideElements.each(function(index, element) {
		      if ($(element).hasClass("swiper-slide-active")) {
		        var movieNameValue = $(element).find(".movieName").val();
		        var movieGradeValue = $(element).find(".movieGrade").val();
		        var movieLengthValue = $(element).find(".movieLength").val();
		        var movieCdValue = $(element).find(".movieCd").val();
		        var movieReValue = $(element).find(".movieRe").val();
		        var datePattern = /^(\d{4}-\d{2}-\d{2})/; //date패턴
		        var movieOpenValue = $(element).find(".movieOpendate").val().match(datePattern)[1];
		        $(".movie-title").text(movieNameValue);
		        $(".movieGrade").text(movieGradeValue);
		        $(".movieLength1").text(movieLengthValue);
		        $(".movieRe1").text(movieReValue);
		        $(".movieCd").attr("href", "/reservation/cinema.do?movie_cd=" + movieCdValue);
		        $(".movieDetail").attr("href", "/movie/viewer.do?movie_cd=" + movieCdValue);
		        $(".movieOpendate1").text(movieOpenValue);
		        return false; 
		      }
		    });
	  });
	
  
</script>
<!-- 스타이벤트배경  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/star.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

<div class="starEvent">
	<div id='stars'></div>
	<div id='stars2'></div>
	<div id='stars3'></div>
	
	<!-- 내용 -->
	<!-- 페럴  -->
<div style="margin-top: 60px; padding-top: 50px; padding-bottom: 80px;" class="wrapperEvent">
	<div class="parallax-container">
	  <div class="parallax-box-left">
		<div class="event-list">
				<ul>
					<c:forEach items="${eventList }" var="event">
						<li>
							<a href="<%=request.getContextPath()%>/event/eventDetail.do?event_no=${event.event_no}" data-netfunnel="N" class="eventBtn">
								<p class="img"> 
									<img src="<%=request.getContextPath() %>/common/getPicture.do?name=${event.event_thum_path}&item_cd=${event.event_no}&type=eventThumb" onerror="noImg(this);">
								</p>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
	   </div>
	     <div class="content-box">
	     	<div class="s1">
	     		<div>
			    <h1 class="" style="text-align: center;">새로운 이벤트를<br>확인해 보세요!</h1>
			    </div>
			</div>
		 </div>
	</div>
	
	<div class="parallax-container" style="padding-top: 30px;">
	  <div class="parallax-box-left1">
		<div class="event-list">
				<ul>
					<c:forEach items="${eventList2 }" var="event">
						<li>
							<a href="<%=request.getContextPath()%>/event/eventDetail.do?event_no=${event.event_no}" data-netfunnel="N" class="eventBtn">
								<p class="img"> 
									<img src="<%=request.getContextPath() %>/common/getPicture.do?name=${event.event_thum_path}&item_cd=${event.event_no}&type=eventThumb" onerror="noImg(this);">
								</p>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
	   </div>
	  <p style="position: absolute;
	  			text-align:center;
	  			bottom: 115px;
                width: 24%;
                left: 62%;
                font-size: 17px;
                color: #adb5bd;">
      			새로운 친구들을 만나고 즐거운 경험을 나눌 수 있는 이벤트에 여러분을 초대합니다. 다양한 활동과 놀이, 그리고 맛있는 음식과 음료를 통해 이번 행사에서 특별한 순간을 만들고 영화와 스토어에서 사용할 수 있는
      			 쿠폰과 티켓에 도전해 보세요.
      			 여러분의 참여로 더욱 빛나는 날을 만들어 보세요! 더 궁금하신 사항은 이미지를 눌러 확인하실수 있습니다. <br>
            <a href="<%=request.getContextPath() %>/event/main.do" class="mainBtn">이벤트 전체보기</a>
      </p>
	</div>
</div>

<script>
const parallaxBoxes = document.querySelectorAll('.parallax-box');
const parallaxBoxesLeft = document.querySelectorAll('.parallax-box-left');
const parallaxBoxesLeft1 = document.querySelectorAll('.parallax-box-left1');
const scrollThreshold = window.innerHeight / 2; // 화면 절반 높이만큼 스크롤 시 나타나게 설정
const scrollThreshold1 = window.innerHeight / 1.2; 

window.addEventListener('scroll', () => {
  parallaxBoxes.forEach((box) => {
    const boxTop = box.getBoundingClientRect().top;
    if (boxTop < scrollThreshold) {
      box.style.transform = 'translate(0)';
      box.style.opacity = 1;
    } else {
      box.style.transform = 'translate(-50%, 0)';
      box.style.opacity = 0;
    }
  });
  
  parallaxBoxesLeft.forEach((box) => {
	    const boxTop = box.getBoundingClientRect().top;
	    if (boxTop < scrollThreshold) {
	      box.style.transform = 'translate(0)';
	      box.style.opacity = 1;
	    } else {
	      box.style.transform = 'translate(50%, 0)';
	      box.style.opacity = 0;
	    }
	  }); 
  
   parallaxBoxesLeft1.forEach((box) => {
	    const boxTop = box.getBoundingClientRect().top;
	    if (boxTop < scrollThreshold1) {
	      box.style.transform = 'translate(0)';
	      box.style.opacity = 1;
	    } else {
	      box.style.transform = 'translate(50%, 0)';
	      box.style.opacity = 0;
	    }
	  }); 
});

$(document).ready(function() {
    var eventListItems = $(".event-list li");
    var idCounter = 0;
    var idPrefix = ["aa", "bb", "cc", "dd"];

    eventListItems.each(function(index, element) {
      var currentIdPrefix = idPrefix[idCounter];
      var itemId = currentIdPrefix;

      $(element).attr("id", itemId);

      idCounter = (idCounter + 1) % idPrefix.length; 
    });
  });
</script>
<!-- 	내용 패럴 끝  -->
</div>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<!-- 스타배경끝 -->









<!-- 이미지카드리스트 시 -->
<div class="backRain">
	<div class="content-box2">
    	<div class="s2">
    		<div>
		    	<h1 class="" style="text-align: center;">특별한 맛과 함께 영화를 즐겨보세요!  </h1>
		    </div>
	    </div>
    </div>
	<p class="content-box2-p" >
      	지금 당신을 위해 준비한 특별한 시간이 찾아왔습니다. 우리의 행사에서는 다채로운 기프트카드와 함께, 신선한 팝콘과 다양한 스낵, 그리고 상큼한 음료를 제공합니다. 이 맛있는 조합으로 특별한 순간을 더욱 풍성하게 만들어보세요! <br>
        <a href="<%=request.getContextPath() %>/store/index.do" class="mainBtn">스토어 바로가기</a>
    </p>
      
      <div class="parallax-box">
		  <div style="margin: 0 1%; display: flex;">
		    <c:forEach items="${productFood}" var="Food" varStatus="loop">
		      <div id="StoreCard" >
		        <div class="wrapper">
		          <div class="card" style="width: 140px;  height: 160px;">
		            <a href="/store/detail.do?product_cd=${Food.product_cd }">
		              <img src="<%=request.getContextPath() %>/common/getPicture.do?name=${Food.product_pic_path}&item_cd=${Food.product_cd}&type=productImg">
		              <small>${Food.product_name}</small>
		            </a>
		          </div>
		        </div>
		      </div>
		      <!-- 각 행의 마지막 요소일 때, 새로운 줄을 시작 -->
		      <c:if test="${loop.index % 4 == 3}">
		        </div><div style="margin: 0 1%; display: flex; flex-wrap: wrap;">
		      </c:if>
		    </c:forEach>
		  </div>
		</div>
		      
<!-- 	<div class="parallax-box" style="display:flex; margin-left: 49%; margin-top: 100px; margin-bottom: 100px;"> -->
<!-- 		<div style="margin: 0 1%; display: flex;"> -->
<%-- 			<c:forEach items="${productFood }" var="Food"> --%>
<!-- 				<div id="StoreCard"> -->
<!-- 				  <div class="wrapper"> -->
<!-- 				    <div class="card"> -->
<!-- 				      <a> -->
<%-- 				        <img src="<%=request.getContextPath() %>/common/getPicture.do?name=${Food.product_pic_path}&item_cd=${Food.product_cd}&type=productImg"> --%>
<%-- 				        <small>${Food.product_name}</small> --%>
<!-- 				      </a> -->
<!-- 				    </div> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div> -->
</div>
<!-- 이미지 카드리스트 끝  -->
<script>
$(document).ready(function() {
	  const parallaxBoxes = $('.parallax-box');
	  const scrollThreshold = $(window).innerHeight() / 1.5; // 화면 절반 높이만큼 스크롤 시 나타나게 설정

	  $(window).on('scroll', function() {
	    parallaxBoxes.each(function() {
	      const boxTop = $(this).offset().top - $(window).scrollTop();
	      if (boxTop < scrollThreshold) {
	        $(this).css({ transform: 'translate(0)', opacity: 1 });
	      } else {
	        $(this).css({ transform: 'translate(-50%, 0)', opacity: 0 });
	      }
	    });
	  });
	});
</script>










<%@ include file="movie/moviepost_modal.jsp" %>
<%@ include file="movie/moviepost_view_modal.jsp" %>
<%@ include file="movie/login_service_modal.jsp" %>
<%@ include file="movie/moviepost_update_modal.jsp" %>
<%@ include file="movie/mpost_report_modal.jsp" %>
<%@ include file="movie/mpost_delete_modal.jsp" %>
<%@ include file="movie/reply_report_modal.jsp" %>
<%@ include file="movie/reply_delete_modal.jsp" %>
<%@ include file="movie/alert_modal.jsp" %>
<%
	mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		Map member = (Map) session.getAttribute("loginUser");
		mem_cd = (String)member.get("CD");
	}
%>






<!-- 영화무비포스트메인  -->
<div class="mainPostBack">
    	<div class="s3">
   		<div style="margin-bottom: 39px;">
	    	<h1 class="" style="text-align: center;"> 다양한 무비포스트들을 확인하세요! </h1>
	    </div>
	    </div>
<div class="mainPost">
	    
  <c:forEach items="${moviePost4 }" var="mp">
	<div class="mainMoviePost" style="cursor: pointer;">
	  <div class="cardPost u-clearfix">
	<!--   	영화 포스터 -->
	    <div id="mpCard" class="card-media" data-mpost_no="${mp.MPOST_NO }">
	      <img src="<%=request.getContextPath() %>/common/getPicture.do?name=${mp.MOVIE_PIC_PATH}&item_cd=${mp.MOVIE_CD}&type=movieImg" class="card-media-img" />
	    </div>
	<!--     영화제목 -->
		    <div class="card-body">
		      <h2 class="card-body-heading">${mp.MOVIE_NAME }</h2>
		      <div class="card-body-options">
		        <div class="card-body-option">
	<!-- 	        아이콘 -->
		          	<div style="display: flex; padding-right: 10px;     align-items: center;">
			          	<svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.1s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"/></svg>
			            <p style="padding: 0px 0 0 5px; font-size: large;">${mp.LIKECNT }</p>
		            </div>
		            <div style="display: flex;     align-items: center;">
		          		<svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M160 368c26.5 0 48 21.5 48 48v16l72.5-54.4c8.3-6.2 18.4-9.6 28.8-9.6H448c8.8 0 16-7.2 16-16V64c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16V352c0 8.8 7.2 16 16 16h96zm48 124l-.2 .2-5.1 3.8-17.1 12.8c-4.8 3.6-11.3 4.2-16.8 1.5s-8.8-8.2-8.8-14.3V474.7v-6.4V468v-4V416H112 64c-35.3 0-64-28.7-64-64V64C0 28.7 28.7 0 64 0H448c35.3 0 64 28.7 64 64V352c0 35.3-28.7 64-64 64H309.3L208 492z"/></svg>
		        	    <p style="padding: 0px 0 0 5px; font-size: large;">${mp.REPLYCNT }</p>
		            </div>
		      </div>
	<!-- 	      아이디 내용 상세보기  -->
		      <div style="padding-top: 10px; color: #495057;"> 
				<p style="font-size: 15px; padding-bottom: 8px;">
			    	<c:set var="mem_id_post" value="${mp.MEM_ID}" />
					${fn:substring(mem_id_post,0,3) }**
		   		</p>
			      <p> ${mp.MPOST_CONTENT }</p>
		   	  </div>
		      
		    </div>
		  </div>
		</div>
	</div>
  </c:forEach>
	
	<script>
let searchFormUrl = "moviePost.do";
mem_cd = "<%=mem_cd%>";
$(function(){
	
	$('.postLankMoive').on('click', function(){
		let movie_name = $(this).data('movie_name');
		$('input[name="keyword"]').val(movie_name);
		searchList_go(1);
	})
	
	$('.mainMoviePost').on('click', '#mpCard', function(){
		let mpost_no = $(this).data("mpost_no");
		
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/moviePostView.do',
			method : 'post',
			data : {'mpost_no' : mpost_no},
			success : function(res){
				console.log(res);
				showPost(res);
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
	let mplist = '${moviePost4}';
	if(mplist == '[]'){
		$('.paginationdiv').css('display', 'none');
	}
	
	$('#searchBtn').on('click', function(){
		searchList_go(1);
	})
	
	$('#moviepostModalBtn').on('click', function(){
		if(mem_cd == null || mem_cd == ""){
			$('#login-service-modal').modal("show");
			return;
		}
		$('#moviepost-modal').modal("show");
		
	
	})
	
})

function showPost(res){
	if(res.mpost.MEM_CD == mem_cd){
		$('#mpReportBtn').css('display', 'none');
		$('#mpUpdateBtn').css('display', 'inline');
		$('#mpDeleteBtn').css('display', 'inline');
	}else{
		$('#mpReportBtn').css('display', '');
		$('#mpDeleteBtn').css('display', 'none');
		$('#mpUpdateBtn').css('display', 'none');
		
	}
	$('#mpMoiveName').text(res.mpost.MOVIE_NAME);
	$('#mpWriterId').text(res.mpost.MEM_ID.substring(0,3) + '**');
	let date = new Date(res.mpost.REGDATE);
	let yyyy = date.getFullYear();
	let mm = date.getMonth()+1;
	mm = mm >= 10 ? mm : '0'+mm;	// 10 보다 작으면 0을 앞에 붙여주기 ex) 3 > 03
	let dd = date.getDate();
	dd = dd >= 10 ? dd : '0'+dd;	// 10 보다 작으면 9을 앞에 붙여주기 ex) 9 > 09
	let regdate =  yyyy+'-'+mm+'-'+dd;	
	$('#mpWritedate').text(regdate);
	$('#mpContent').text(res.mpost.MPOST_CONTENT);
	$('#mpReportBtn').data('mpost_no', res.mpost.MPOST_NO);
	$('#mpUpdateBtn').data('mpost_no', res.mpost.MPOST_NO);
	$('#mpDeleteBtn').data('mpost_no', res.mpost.MPOST_NO);
	if(res.mpost.MEM_PIC_PATH != null && res.mpost.MEM_PIC_PATH != ''){
		$('#mpWriteMemPic').prop('src', '<%=request.getContextPath() %>/common/getPicture.do?name=' + res.mpost.MEM_PIC_PATH + '&item_cd=$' + res.mpost.MEM_CD + '&type=memberPic');
	}else{
		$('#mpWriteMemPic').prop('src', '../../resources/img/defaultprofile.png');
	}
	let mpbackImg = "<%=request.getContextPath() %>/common/getPicture.do?name=" + res.mpost.MOVIE_PIC_PATH + "&item_cd=" + res.mpost.MOVIE_CD + "&type=movieImg";
	$('#thismpPic').css('background-image', 'url(' + mpbackImg + ')');
	$('#moviepost-view-modal').modal("show");
	$('#mpLikeCnt').text(res.mpost.LIKECNT);
	$('#thismpreplycnt').text(res.mpost.REPLYCNT);
	
	if(res.likeYN == 'Y'){
		$('#mpLikeBtn').removeClass('fa-regular');
		$('#mpLikeBtn').addClass('fa-solid');
		$('#mpLikeBtn').prop('id', 'mpLikeCanBtn');
	}else{
		$('#mpLikeCanBtn').removeClass('fa-solid');
		$('#mpLikeCanBtn').addClass('fa-regular');
		$('#mpLikeCanBtn').prop('id', 'mpLikeBtn');
		
	}
	let replyShow = '';
	for(let i = 0; i < res.mpostReplyList.length; i++){
		replyShow += '<div style="display: flex; border-bottom: solid 1px #ced4da;" class="oneReply">';
		replyShow += '<div style="margin: 10px;">';
		if(res.mpostReplyList[i].MEM_PIC_PATH != null && res.mpostReplyList[i].MEM_PIC_PATH != ''){
			replyShow += '<img src="<%=request.getContextPath() %>/common/getPicture.do?name=' + res.mpostReplyList[i].MEM_PIC_PATH + '&item_cd=$' + res.mpostReplyList[i].MEM_CD + '&type=memberPic" class="mr-3 rounded-pill" style="width: 60px; height: 60px; margin: 10px;">';
		}else{
			replyShow += '<img src="../../resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 60px; height: 60px; margin: 10px;">';
		}
		replyShow += '</div>';
		replyShow += '<div style="width: 85%;">';
		replyShow += '<div class="h50" style="display: flex; align-items: flex-end; margin-bottom: 5px;">';
		replyShow += '<div class="w50" style="text-align: left;" id="replyWriterId">';
		replyShow += res.mpostReplyList[i].MEM_ID.substring(0,3) + '**';
		replyShow += '</div>';
		replyShow += '<div class="w50" style="text-align: right; color: gray;" id="replyWritedate">';
		let redate = new Date(res.mpostReplyList[i].REGDATE);
		let ryyyy = redate.getFullYear();
		let rmm = redate.getMonth()+1;
		rmm = rmm >= 10 ? rmm : '0'+rmm;	// 10 보다 작으면 0을 앞에 붙여주기 ex) 3 > 03
		let rdd = redate.getDate();
		rdd = rdd >= 10 ? rdd : '0'+rdd;	// 10 보다 작으면 9을 앞에 붙여주기 ex) 9 > 09
		let reregdate =  ryyyy+'-'+rmm+'-'+rdd;	
		
		replyShow += reregdate;
		replyShow += '</div>';
		replyShow += '</div>';
		replyShow += '<div class="h50" style="display: flex;">';
		replyShow += '<div class="w80" style="text-align: left;" id="thisReplyContent">' + res.mpostReplyList[i].REPLY_CONTENT + '</div>';
		if(mem_cd == res.mpostReplyList[i].MEM_CD){
			replyShow += '<div class="w20 reUD" style="text-align: right;">'
			replyShow += '<div id="replyUpdateBtn" data-reply_no="' + res.mpostReplyList[i].REPLY_NO + '" style="display: inline; margin-right: 10px;">수정</div>';
			replyShow += '<div id="replyDeleteBtn" data-reply_no="' + res.mpostReplyList[i].REPLY_NO + '" style="display: inline; margin-right: 10px;">삭제</div>';
			replyShow += '</div>'
		}else{
			replyShow += '<div class="w20" style="text-align: right;" id="replyReportBtn" data-reply_no="' + res.mpostReplyList[i].REPLY_NO + '">신고</div>';
		}
		replyShow += '</div>';
		replyShow += '</div>';
		replyShow += '</div>';
		
			
			
	}
	$('.reply-div').html(replyShow);
}

</script>
	
	
<!-- 		wj전체보기 버튼  -->
		<p class="content-box3-p" >
       		 <a href="<%=request.getContextPath() %>/movie/moviePost.do" class="mainBtn">전체보기</a>
    	</p>
	
	
</div>
</div>
<!-- a무비포스트 끝  -->


<div class="thrBack">
	<img src="/resources/img/cinema.jpg">
	<div class="s4">
   		<div style="margin-bottom: 39px;">
	    	<h1 class="" style="text-align: center;"> 전국 어디서나 DW시네마와 함께! </h1>
	    </div>
    <p>최고의 영화 감상 경험을 누리세요. DW 시네마의 풍부한 프로그램과 현대적인 시설로 편안하고 특별한 시간을 만들어보세요. 우리와 함께라면 여러분의 영화 시간은 더욱 특별하고 즐거운 순간으로 가득할 것입니다. 상영 중인 영화를 확인하고 가까운 DW 시네마에서 만나보세요!</p>
	<p class="" style="text-align: center;" >
       		 <a href="<%=request.getContextPath() %>/theater/main.do" class="mainBtn">극장찾기</a>
    </p>    
    </div>
</div>
<!-- ####################################################################### -->
<!-- ####################################################################### -->
<!-- ####################################################################### -->
<!-- ####################################################################### -->
<!-- ####################################################################### -->
<!-- ####################################################################### -->
<!-- ####################################################################### -->
<!-- ####################################################################### -->
<!-- ####################################################################### -->
<!-- ####################################################################### -->
<!-- ####################################################################### -->
















<div style="padding: 50px;">
<div class="info-wrapper" style="padding: 50px;">
    <div class="container">
        <div class="row" style="justify-content: center;">
            <div class="col-12 col-lg-6 col-xl-5" style="border-top: 1px solid #b9b9b9;
    margin: 0 45px;">
                <div class="notice_title_wrap">
                    <div class="tabBtn_wrap">
                       <strong style="font-size: 22px;">공지사항</strong>
                    </div>
                    <a href="<%=request.getContextPath() %>/support/notice.do" class="mainBtn2">더보기</a>
                </div>
                <div class="notice">
                    <ul>
                    	<c:forEach items="${noticeList }" var="notice">
	                        <li>
	                            <a href="<%=request.getContextPath()%>/support/noticeMini_Detail.do?notice_no=${notice.notice_no }">
	                                <dl>
	                                    <dt style="font-size: 15px;">[${notice.notice_thr }] ${notice.notice_title }</dt>
	                                    <dd><fmt:formatDate value="${notice.regdate }" pattern="yyyy-MM-dd"/></dd>
	                                </dl>
	                            </a>
	                        </li>
                    	</c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-12 col-lg-6 col-xl-5" style="    border-top: 1px solid #b9b9b9;">
                <div class="notice_title_wrap">
                    <div class="tabBtn_wrap">
                       <strong style="font-size: 22px;">고객센터</strong>
                    </div>
                    <p>
                  	  <a href="<%=request.getContextPath() %>/support/main.do" class="mainBtn2">더보기</a>
                    </p>
                </div>
                <div class="">
                    <dl class="client-list">
                        <dd>
                            <strong>042-257-8349</strong>
                            <span> 운영시간 (평일 09:00~18:00)
                            <p>업무시간 외 자동응답 안내 가능합니다.</p>
                        </span></dd>
                    </dl>
                </div>
                
                	<p style="    margin-top: 20px;">
                  	  <a href="<%=request.getContextPath() %>/support/main.do" class="mainBtn2">
                  	  	<span class="icon"><ion-icon name="hand-left-outline"></ion-icon></span>
                  	  	<span class="title">자주묻는질문</span>
                  	  </a>
                  	  <a href="<%=request.getContextPath()%>/support/inquiry.do" class="mainBtn2">
	                    <span class="icon"><ion-icon name="chatbubbles-outline"></ion-icon></span>
	                    <span class="title">1:1 문의</span>
	                 </a>
	                 <a href="<%=request.getContextPath()%>/support/membership.do" class="mainBtn2">
	                    <span class="icon"><ion-icon name="person-add-outline"></ion-icon></span>
	                    <span class="title">멤버쉽</span>
	                 </a>
                    </p>
                    
                
            </div>
        </div>
    </div>
</div>
</div>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>