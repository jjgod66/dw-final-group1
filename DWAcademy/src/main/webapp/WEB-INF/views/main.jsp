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
  background-image: linear-gradient(45deg, #005baa, #000000);
  background-size: 100%;
  background-repeat: repeat;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-background-clip: text;
  -moz-text-fill-color: transparent;
}




.parallax-container {
  position: relative;
  overflow: hidden;
}

.parallax-box {
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
    top: 77%;
    left: 56%;
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

   <!-- 페럴  -->
<div style="margin-top: 60px;">
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
	  			bottom: 111px;
                width: 24%;
                left: 62%;
                font-size: 17px;">
      새로운 친구들을 만나고 즐거운 경험을 나눌 수 있는 이벤트에 여러분을 초대합니다. 다양한 활동과 놀이, 그리고 맛있는 음식과 음료를 통해 이번 행사에서 특별한 순간을 만들어보세요. 여러분의 참여로 더욱 빛나는 날을 만들어요!<br>
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


<p style="text-align: center;">수정전</p> 
<p style="text-align: center;">ㅇ헤더 ㅇ \</p> 
<p style="text-align: center;">1.메인 슬라이더 </p> 
<p style="text-align: center;">2. 이벤트 게시글 </p> 
<p style="text-align: center;">3. 고객센터 게시글 </p> 
<p style="text-align: center;">4. 혜택 </p> 
<p style="text-align: center;">5. 각 아이콘 </p> 
<p style="text-align: center;">ㅇ 푸터ㅇ</p> 
<p style="text-align: center;">수정전</p> 
 
<script>
    
// 슬라이드 이동 시 버튼 활성화 여부 변경
/* swiper.on('slideChange', function() {
  if (swiper.isBeginning) {
    prevButton.classList.add('swiper-button-disabled');
  } else {
    prevButton.classList.remove('swiper-button-disabled');
  }

  if (swiper.isEnd) {
    nextButton.classList.add('swiper-button-disabled');
  } else {
    nextButton.classList.remove('swiper-button-disabled');
  }
}); */
</script>
<div class="event-wrapper">
    <div class="container">
        <div class="event_title_wrap">
            <div class="tabBtn_wrap">
                <h3>EVENT</h3>
            </div>
            <a href="<%=request.getContextPath() %>/event/main.do" class="btn btn-allView">전체보기</a>
        </div>
        <div class="event-list">
			<ul>
				<c:forEach items="${eventList }" var="event">
					<li>
						<a href="<%=request.getContextPath()%>/event/eventDetail.do?event_no=${event.event_no}" data-netfunnel="N" class="eventBtn">
							<p class="img"> <img src="<%=request.getContextPath() %>/common/getPicture.do?name=${event.event_thum_path}&item_cd=${event.event_no}&type=eventThumb" onerror="noImg(this);"></p>
							<p class="tit">
								${event.event_title }
							</p>
							<p class="date">
							<fmt:formatDate value="${event.startdate }" pattern="yyyy-MM-dd"/> ~ 
							<fmt:formatDate value="${event.enddate }" pattern="yyyy-MM-dd"/>
							</p>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
    </div>
</div> 
<div class="store-wrapper">
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
</div>
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