<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%-- <link rel="stylesheet" href="../../resources/css/boxoffice.css">
<%@ include file="/WEB-INF/views/common/boxoffice.jsp" %> --%>
<!-- 메인슬라이 -->
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css'>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/slider.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/StoreCard.css">
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
    width: 22%;
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



.parallax-container {
  position: relative;
/*   overflow: hidden; */
}
.backRain{
	    background: linear-gradient(45deg, #b0d9ff, transparent);
	padding:1px;
}
.parallax-box {
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
.mainBtn:hover {
  border: 0.125rem solid #005baa;
  color: #005baa;
}
@media screen and (min-width: 1500px){.wrapperEvent{width: 75%; margin: auto;} }

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
                <span class="">개봉일  : <span class="txt_grade movieOpendate"></span>일</span><br>
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
		        <input type="hidden" class="movieRe" value="${movie.reserve == 0 ? 0 : movie.reserve / (movie.all_reserver == 0 ? 1 : movie.all_reserver) * 100}">
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
        $(".movieOpendate").text(movieOpenValue);
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
		        $(".movie-title").text(movieNameValue);
		        $(".movieGrade").text(movieGradeValue);
		        $(".movieLength1").text(movieLengthValue);
		        $(".movieRe1").text(movieReValue);
		        $(".movieCd").attr("href", "/reservation/cinema.do?movie_cd=" + movieCdValue);
		        $(".movieDetail").attr("href", "/movie/viewer.do?movie_cd=" + movieCdValue);
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
			    <h1 class="" style="text-align: center;">새로운 이벤트를 확인해 보세요!  </h1>
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
	  			bottom: 142px;
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
	<p style="position: absolute;
				margin: 230px 0 0 350px;
	  			text-align:center;
                width: 24%;
                font-size: 17px;
                color: #495057;">
      			지금 당신을 위해 준비한 특별한 시간이 찾아왔습니다. 우리의 행사에서는 다채로운 기프트카드와 함께, 신선한 팝콘과 다양한 스낵, 그리고 상큼한 음료를 제공합니다. 이 맛있는 조합으로 특별한 순간을 더욱 풍성하게 만들어보세요! <br>
            <a href="<%=request.getContextPath() %>/store/index.do" class="mainBtn">스토어 바로가기</a>
      </p>
      
      <div class="parallax-box" style="margin-left: 49%; margin-top: 100px; margin-bottom: 100px;">
		  <div style="margin: 0 1%; display: flex; flex-wrap: wrap;">
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


<div style="border: 1px solid black; width: 600px; height: 100px; margin: 0 auto; text-align: center;">무비포스트4개 한줄 </div>
<div style="   margin-left: 35%;
    display: inline-flex;">
<div style="border: 1px solid black; width: 300px; height: 100px; margin: 0 auto; text-align: center;">리뷰 리스트5개</div>
<div style="border: 1px solid black; width: 300px; height: 100px; margin: 0 auto; text-align: center;">혜택 작게4개 두줄</div>
</div>
<div style="   margin-left: 35%;
    display: inline-flex;">
<div style="border: 1px solid black; width: 300px; height: 100px; margin: 0 auto; text-align: center;">r공지사항 리스트3개</div>
<div style="border: 1px solid black; width: 300px; height: 100px; margin: 0 auto; text-align: center;">고객센터</div>
</div>
<p style="text-align: center; padding: 10px;"> 전체 메뉴100% </p>
<p style="text-align: center; padding: 10px;">푸터 </p>








   

<%-- <div class="store-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-6 col-xl-3">
                <a href="<%=request.getContextPath()%>/movie/moviePost.do">
	                <div class="icon">
	                    <img src="/resources/img/community-icon.png">
	                </div>
               		 무비포스트
                </a>
            </div>
            <div class="col-12 col-lg-6 col-xl-3">
                <a href="<%=request.getContextPath()%>/member/membership.do">
	                <div class="icon">
	                    <img src="/resources/img/giftbox-icon.png">
	                </div>
              		  혜택
                </a>
            </div>
            <div class="col-12 col-lg-6 col-xl-3">
                <a href="<%=request.getContextPath()%>/store/index.do?CategoryIdx=1">
	                <div class="icon">
	                    <img src="/resources/img/popcorn-icon.png">
	                </div>
                	스토어
                </a>
            </div>
            <div class="col-12 col-lg-6 col-xl-3">
                <a href="<%=request.getContextPath()%>/support/main.do">
	                <div class="icon">
	                    <img src="/resources/img/chat-support-icon.png">
	                </div>
               		 고객센터
                </a>
            </div>
        </div>
    </div>
</div> --%>


<div class="info-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-7 col-xl-8">
                <div class="notice_title_wrap">
                    <div class="tabBtn_wrap">
                        <h3>공지사항</h3>
                    </div>
                    <a href="<%=request.getContextPath() %>/support/notice.do" class="btn btn-allView">더보기</a>
                </div>
                <div class="notice">
                    <ul>
                    	<c:forEach items="${noticeList }" var="notice">
	                        <li>
	                            <a href="<%=request.getContextPath()%>/support/noticeMini_Detail.do?notice_no=${notice.notice_no }">
	                                <dl>
	                                    <dt>[${notice.notice_thr }] ${notice.notice_title }</dt>
	                                    <dd><fmt:formatDate value="${notice.regdate }" pattern="yyyy-MM-dd"/></dd>
	                                </dl>
	                            </a>
	                        </li>
                    	</c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-12 col-lg-5 col-xl-4">
                <div class="client-wrap">
                    <dl class="client-list">
                        <dt><strong>고객센터</strong></dt>
                        <dd>
                            <strong>042-000-0000</strong>
                            <span>고객센터 운영시간 (평일 09:00~18:00)
                            <p>업무시간 외 자동응답 안내 가능합니다.</p>
                        </span></dd>
                    </dl>
                    <div class="client-btn-wrap">
                        <a href="<%=request.getContextPath()%>/support/faq.do">FAQ</a>
                        <a href="<%=request.getContextPath()%>/support/inquiry.do">1:1 문의</a>
                        <!--<a href="#">분실물 문의</a>//-->
<!--                         <a href="#">대관/단체 문의</a> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>