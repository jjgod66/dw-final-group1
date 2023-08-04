<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link rel="stylesheet" href="../../resources/css/boxoffice.css">
<%@ include file="/WEB-INF/views/common/boxoffice.jsp" %>
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
    margin: 0 0 0 40px;
    padding: 0;
}
.event-list ul li a {
    overflow: hidden;
    display: block;
    border: 1px solid #e4e4e4;
    border-radius: 10px;
    min-height: 364px;
}
.event-list ul li a .img {
    width: 100%;
    height: 100%;
    font-size: 0;
    line-height: 0;
    border-bottom: 1px solid #e4e4e4;
    background-color: #eee;
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
</style>
<p style="text-align: center;">수정전</p> 
<p style="text-align: center;">수정전</p> 
<p style="text-align: center;">수정전</p> 
<p style="text-align: center;">수정전</p> 
<p style="text-align: center;">ㅇ헤더 ㅇ \</p> 
<p style="text-align: center;">1.메인 슬라이더 </p> 
<p style="text-align: center;">2. 이벤트 게시글 </p> 
<p style="text-align: center;">3. 고객센터 게시글 </p> 
<p style="text-align: center;">4. 혜택 </p> 
<p style="text-align: center;">5. 각 아이콘 </p> 
<p style="text-align: center;">ㅇ 푸터ㅇ</p> 
<p style="text-align: center;">수정전</p> 
<p style="text-align: center;">수정전</p> 
< <div class="boxoffice">
    <div class="container">
        <div class="movieChartBeScreen_btn_wrap">
            <div class="tabBtn_wrap">
                <h3><a class="active" id="btnMovie">박스오피스</a></h3>
<!--                 <h3><a href="#none" id="btnReserMovie">상영예정작</a></h3> -->
            </div>
            <a href="<%=request.getContextPath() %>/movie/allMovie.do" class="btn btn-allView">전체보기</a>
        </div>
        <ol>
            <div class="schedule-slider">
                <div class="swiper-container">
                    <div class="swiper-wrapper" id="swiper-wrapper">
                    	<c:forEach items="${movieList }" var="movie">
	                     <li class="swiper-slide">
	                            <div class="item_poster">
	                                <div class="thumb_item">
	                                    <div class="poster_movie" style="background: url('<%=request.getContextPath() %>/common/getPicture.do?name=${movie.movie_mainpic_path}&item_cd=${movie.movie_cd }&type=moviePoster') no-repeat center /cover">

	                                        <span class="rank_num">${movie.movie_grade}</span>
	                                        <span class="txt_tag">${movie.movie_grade}</span>

	                                        <div class="movieChart_btn_wrap">
	                                            <a href="/movie/viewer.do?movie_cd=${movie.movie_cd}" class="btn_movieChart_detail">상세보기</a>
	                                            <a href="/reservation/cinema.do?movie_cd=${movie.movie_cd}" class="btn_movieChart_ticketing">예매하기</a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="thumb_cont">
	                                    <strong class="tit_item">
	                                        <c:if test="${movie.movie_grade eq '전체 관람가'}"><img src="../../resources/img/moviegrade/ALL.png" style="width: 8%; height: 8%;"></c:if>
	                                        <c:if test="${movie.movie_grade eq '12세 관람가'}"><img src="../../resources/img/moviegrade/12.png" style="width: 8%; height: 8%;"></c:if>
	                                        <c:if test="${movie.movie_grade eq '15세 관람가'}"><img src="../../resources/img/moviegrade/15.png" style="width: 8%; height: 8%;"></c:if>
	                                        <c:if test="${movie.movie_grade eq '청소년 관람불가'}"><img src="../../resources/img/moviegrade/18.png" style="width: 8%; height: 8%;"></c:if><a href="<%=request.getContextPath()%>/movie/viewer.do?movie_cd=${movie.movie_cd}" class="link_txt" data-tiara-layer="moviename"> ${movie.movie_name}</a>
	                                    </strong>
	                                    <span class="txt_append">
	                                        <span class="info_txt">상영시간<span class="txt_grade">${movie.movie_length}</span>분</span>
	                                        <span class="info_txt">예매율<span class="txt_num">${movie.reserve == 0 ? 0 : movie.reserve / movie.all_reserver * 100}</span>%</span>
	                                    </span>
	                                    <span class="txt_info">
	                                        개봉일<span class="txt_num"><fmt:formatDate value="${movie.opendate}" pattern="yyyy-MM-dd"/></span>
	                                    </span>
	                                </div>
	                            </div>
	                        </li>
                    	</c:forEach>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </ol>
    </div>
</div> 
<script>
// Swiper 인스턴스 생성
var swiper = new Swiper('.swiper-container', {
  // 설정 옵션
  slidesPerView: 5
});
// 이전 버튼 클릭 이벤트 처리
var prevButton = document.querySelector('.swiper-button-prev');
prevButton.addEventListener('click', function() {
  swiper.slidePrev();
});

// 다음 버튼 클릭 이벤트 처리
var nextButton = document.querySelector('.swiper-button-next');
nextButton.addEventListener('click', function() {
  swiper.slideNext();
});
    
// 슬라이드 이동 시 버튼 활성화 여부 변경
swiper.on('slideChange', function() {
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
});
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