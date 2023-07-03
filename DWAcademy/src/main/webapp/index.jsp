<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/boxoffice.css">
<%@ include file="/WEB-INF/views/common/boxoffice.jsp" %>
<div class="boxoffice">
    <div class="container">
        <div class="movieChartBeScreen_btn_wrap">
            <div class="tabBtn_wrap">
                <h3><a href="#none" class="active" id="btnMovie">박스오피스</a></h3>
                <h3><a href="#none" id="btnReserMovie">상영예정작</a></h3>
            </div>
            <a href="#" class="btn btn-allView">전체보기</a>
        </div>
        <ol>
            <div class="schedule-slider">
                <div class="swiper-container">
                    <div class="swiper-wrapper" id="swiper-wrapper">
<%
    for (int i = 0; i < dailyBoxOfficeList.getLength(); i++) {
%>
<%@include file="/WEB-INF/views/common/boxoffice_list.jsp" %>
                        <li class="swiper-slide">
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie" style="<%=posterImage%>">
                                        <span class="rank_num"><%=rank%></span>
                                        <span class="txt_tag"><%=GradeName%></span>
                                        <div class="movieChart_btn_wrap">
                                            <a href="/movie/viewer.do?movieCd=<%=movieCd%>" class="btn_movieChart_detail">상세보기</a>
                                            <a href="/booking/movie.do?movieCd=<%=movieCd%>" class="btn_movieChart_ticketing">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="movie-view.jsp?movieCd=<%=movieCd%>#view" class="link_txt" data-tiara-layer="moviename"><%=title%></a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">상영시간<span class="txt_grade"><%=showTm%></span>분</span>
                                        <span class="info_txt">예매율<span class="txt_num"><%=audAll%></span></span>
                                    </span>
                                    <span class="txt_info">
                                        개봉일<span class="txt_num"><%=openDt%></span>
                                    </span>
                                </div>
                            </div>
                        </li>
<%
        }
    }
%>
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
            <a href="#" class="btn btn-allView">전체보기</a>
        </div>
        <div class="row">
            <div class="col-12 col-lg-3">
                <div class="card">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">이밴트 배너</text></svg>
                    <div class="card-body">
                        <a href="#">
                            <strong>이밴트 제목</strong>
                            <span>2023.06.29~2023.12.01</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-3">
                <div class="card">
                    <a href="#">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">이밴트 배너</text></svg>
                        <div class="card-body">
                                <strong>이밴트 제목</strong>
                                <span>2023.06.29~2023.12.01</span>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-12 col-lg-3">
                <div class="card">
                    <a href="#">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">이밴트 배너</text></svg>
                        <div class="card-body">
                                <strong>이밴트 제목</strong>
                                <span>2023.06.29~2023.12.01</span>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-12 col-lg-3">
                <div class="card">
                    <a href="#">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"/><text x="50%" y="50%" fill="#dee2e6" dy=".3em">이밴트 배너</text></svg>
                        <div class="card-body">
                                <strong>이밴트 제목</strong>
                                <span>2023.06.29~2023.12.01</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="store-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-6 col-xl-3">
                <div class="icon">
                    <img src="/resources/img/community-icon.png">
                </div>
                <a href="#">커뮤니티</a>
            </div>
            <div class="col-12 col-lg-6 col-xl-3">
                <div class="icon">
                    <img src="/resources/img/giftbox-icon.png">
                </div>
                <a href="#">혜택</a>
            </div>
            <div class="col-12 col-lg-6 col-xl-3">
                <div class="icon">
                    <img src="/resources/img/popcorn-icon.png">
                </div>
                <a href="#">스토어</a>
            </div>
            <div class="col-12 col-lg-6 col-xl-3">
                <div class="icon">
                    <img src="/resources/img/chat-support-icon.png">
                </div>
                <a href="#">고객센터</a>
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
                    <a href="#" class="btn btn-allView">더보기</a>
                </div>
                <div class="notice">
                    <ul>
                        <li>
                            <a href="#">
                                <dl>
                                    <dt>[극장] 디더블유시네마 오픈 되었습니다.</dt>
                                    <dd>2023.06.26</dd>
                                </dl>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <dl>
                                    <dt>[극장] 디더블유시네마 오픈 되었습니다.</dt>
                                    <dd>2023.06.26</dd>
                                </dl>
                            </a>
                        </li>
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
                        <a href="#">FAQ</a>
                        <a href="#">1:1 문의</a>
                        <!--<a href="#">분실물 문의</a>//-->
                        <a href="#">대관/단체 문의</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>