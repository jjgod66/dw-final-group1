<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%
String movieCd = request.getParameter("movieCd");
if (movieCd == null) {
    movieCd = "";
}
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/schedule.css">
<div class="sub_visual">
    <h3>예매하기</h3>
    <h6>ticket reservation</h6>
</div>
<div class="container">
    <div class="schedule-tab">
        <ul>
            <li class="btn-schedule active"><button type="button" class="tab_tit" style="width: 50%; left: 0%;" data-tablist="cinema"><span>영화관별 상영시간표</span></button></li>
            <li class="btn-schedule"><button type="button" class="tab_tit" style="width: 50%; left: 50%;" data-tablist="movie"><span>영화별 상영시간표</span></button></li>
        </ul>
    </div>
</div>
<div class="main-schedule" id="movie-schedule">
    <div class="container">
        <form class="reservationForm" method="get">
        <input type="hidden" name="movieCd" value="<%=movieCd%>">
        <input type="hidden" name="movieDay" value="">
        <input type="hidden" name="movieTime" value="">
        <div class="cinema-select">
            <div class="group_top"><h4 class="tit">영화관 선택</h4></div>
            <div class="inner">
                <ul class="cinema-list">
                    <li class="cinema-click active">
                        <a href="javascript:;">서울 <em>(1)</em></a>
                        <div class="depth2">
                            <ul>
                                <li class=""><a href="#all">전체</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="cinema-click">
                        <a href="javascript:;">대전 <em>(1)</em></a>
                        <div class="depth2">
                            <ul>
                                <li class=""><a href="#all">전체</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="cinema-calendar">
            <div class="group_top"><h4 class="tit">상영시간표</h4></div>
                <div class="schedule-slider">
                    <div class="swiper-container">
                        <div class="swiper-wrapper" id="swiper-wrapper">
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <div class="mvTimeLine">
                    <div class="bx_notice" style="display: none;"><p>영화를 선택해주세요.</p></div>
                    <div class="timelist" style="display: block;">
                        <div class="time_select_tit"><span class="movieIcon etc ageAll">All</span><strong>엘리멘탈</strong></div>
                        <div class="row" id="movie-list-1">
                        </div>
                        <div class="time_select_tit"><span class="movieIcon etc age15">15</span><strong>범죄도시3</strong></div>
                        <div class="row" id="movie-list-2">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
<script>
// 요일 한글로 변환 함수
function getKoreanDayOfWeek(dayOfWeek) {
  const days = ['일', '월', '화', '수', '목', '금', '토'];
  return days[dayOfWeek];
}

// 현재 날짜 가져오기
var currentDate = new Date();

// 14일 후의 날짜 계산
var endDate = new Date();
endDate.setDate(currentDate.getDate() + 14);

// 날짜 리스트 생성
var dateList = [];

while (currentDate <= endDate) {
  var day = currentDate.getDate();
  var dayOfWeek = currentDate.getDay();

  // 요일을 한글로 변환
  var koreanDayOfWeek = getKoreanDayOfWeek(dayOfWeek);

  // 클래스 추가 여부 확인
  var isDisabled = currentDate > new Date(new Date().getTime() + 5 * 24 * 60 * 60 * 1000) ? 'disabled' : '';
  var isActive = currentDate.toDateString() === new Date().toDateString() && !isDisabled ? 'active' : '';

  // 태그 생성
  var tag = '<div class="swiper-slide" style="width: 113.75px; margin-right: 10px;">' +
                '<a href="#" class="btnDay ' + isDisabled + ' ' + isActive + '" data-dt="' + currentDate.toISOString().split('T')[0] + '">' +
                    '<div class="time">' +
                        '<strong>' + day + '</strong>' +
                        '<p>' + koreanDayOfWeek + '</p>' +
                    '</div>' +
                '</a>' +
            '</div>';

  // 태그를 리스트에 추가
  dateList.push(tag);

  // 다음 날짜로 이동
  currentDate.setDate(currentDate.getDate() + 1);
}

// 날짜 태그를 swiper-wrapper에 추가
var wrapperElement = document.getElementById('swiper-wrapper');
wrapperElement.innerHTML = dateList.join('');

// .btnMovie 클래스를 가진 모든 버튼 엘리먼트를 선택합니다.
const btnMovies = document.querySelectorAll('.btnMovie');

// 입력 요소를 선택합니다.
const movieCdInput = document.querySelector('input[name="movieCd"]');

// 각 버튼에 대해 클릭 이벤트 리스너를 추가합니다.
$('.cinema-click').click(function(event) {
  // 클릭된 버튼의 data-moviecd 속성 값을 가져옵니다.

  $('.cinema-click').removeClass('active');
  $(this).addClass('active');

});

// btnDay 클래스 클릭 이벤트 처리
var btnDayList = document.getElementsByClassName('btnDay');
for (var i = 0; i < btnDayList.length; i++) {
  btnDayList[i].addEventListener('click', function(e) {
    e.preventDefault();

    // 현재 disabled 클래스가 적용된 버튼 확인
    var isDisabled = this.classList.contains('disabled');

    if (isDisabled) {
      return; // disabled 버튼이면 이벤트 종료
    }

    // 현재 active 클래스가 적용된 버튼 확인
    var currentActive = document.querySelector('.btnDay.active');

    // 현재 active 클래스 제거
    if (currentActive) {
      currentActive.classList.remove('active');
    }

    // 클릭한 버튼에 active 클래스 추가
    this.classList.add('active');

    // 선택된 날짜에 해당하는 데이터 가져오기
    var selectedDate = this.dataset.dt;

    // 데이터를 갖고 있는 input 요소 가져오기
    var movieDay = document.querySelector('input[name="movieDay"]');
    if (movieDay) {
      // 선택된 날짜 값을 input 요소의 value로 설정
      movieDay.value = selectedDate;
    }

    // 각 극장에 대한 예매 시간 생성
    for (var theaterNumber = 1; theaterNumber <= 4; theaterNumber++) {
      createMovieTimes(theaterNumber, selectedDate);
    }
  });
}

// Swiper 인스턴스 생성
var swiper = new Swiper('.swiper-container', {
  // 설정 옵션
  slidesPerView: 10
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
// 예매 시간 데이터
var movieTimes = [
	  { time: "10:00", duration: "1시간 40분", totalSeats: 112, remainingSeats: 112, date: "2023-07-07" },
	  { time: "13:30", duration: "2시간 10분", totalSeats: 112, remainingSeats: 112, date: "2023-07-07" },
	  { time: "16:20", duration: "1시간 50분", totalSeats: 112, remainingSeats: 112, date: "2023-07-07" },
	  { time: "19:00", duration: "2시간 30분", totalSeats: 112, remainingSeats: 112, date: "2023-07-07" },
	  { time: "10:00", duration: "1시간 40분", totalSeats: 112, remainingSeats: 112, date: "2023-07-08" },
	  { time: "13:30", duration: "2시간 10분", totalSeats: 112, remainingSeats: 112, date: "2023-07-08" },
	  { time: "16:20", duration: "1시간 50분", totalSeats: 112, remainingSeats: 112, date: "2023-07-08" },
	  { time: "19:00", duration: "2시간 30분", totalSeats: 112, remainingSeats: 112, date: "2023-07-08" },
	  { time: "10:00", duration: "1시간 40분", totalSeats: 112, remainingSeats: 112, date: "2023-07-09" },
	  { time: "13:30", duration: "2시간 10분", totalSeats: 112, remainingSeats: 112, date: "2023-07-09" },
	  { time: "16:20", duration: "1시간 50분", totalSeats: 112, remainingSeats: 112, date: "2023-07-09" },
	  { time: "19:00", duration: "2시간 30분", totalSeats: 112, remainingSeats: 112, date: "2023-07-09" }
];

// 현재 시간 가져오기
var currentTime = new Date();

// 현재 날짜 가져오기 (년-월-일 형식)
var currentDateString = new Date().toISOString().split("T")[0];

// 각 극장의 예매 시간을 생성하는 함수
function createMovieTimes(theaterNumber, selectedDate) {
  var container = document.getElementById("movie-list-" + theaterNumber);

  // 기존에 표시된 예매 시간 삭제
  container.innerHTML = "";

  // 예매 시간 데이터를 반복하여 HTML 요소를 생성
  for (var i = 0; i < movieTimes.length; i++) {
    var movieTime = movieTimes[i];

    // 예매 시간의 날짜와 선택한 날짜가 일치하는지 확인
    if (movieTime.date !== selectedDate) {
      continue;
    }

    // 예매 시간을 Date 객체로 변환
    var reservationTime = new Date(movieTime.date + "T" + movieTime.time);

    // 예매 시간이 현재 시간 이전인 경우 건너뜀
    if (reservationTime < currentTime) {
      continue;
    }

    var colDiv = document.createElement("div");
    colDiv.className = "col-12 col-lg-3";

    var button = document.createElement("button");
    button.type = "button";
    button.className = "btnTime";
    button.dataset.cd = ("0" + (i + 1)).slice(-2);
    button.dataset.seq = theaterNumber;
    button.dataset.tm = movieTime.time;
    button.dataset.dt = movieTime.date;

    // 버튼 클릭 이벤트 추가
    button.addEventListener("click", function(event) {

      // 입력 요소를 선택합니다.
      const movieTimeInput = document.querySelector('input[name="movieTime"]');

      var movieDayInput = document.querySelector('input[name="movieDay"]');
      var movieDayValue = movieDayInput.value;
      if (movieDayValue.trim() === '') {
        alert('날짜를 선택 후 시간을 선택해 주세요.');
        return;
      }

      location.href = '/booking/detail.do';

      var clickedButton = event.target;

      // 버튼에 저장된 날짜 가져오기
      var buttonDate = clickedButton.dataset.dt;

      // 클릭된 버튼의 data-moviecd 속성 값을 가져옵니다.
      const movieTime = button.getAttribute('data-tm');

      // 입력 요소의 value 속성에 값을 할당합니다.
      movieTimeInput.value = movieTime;
    });

    var loc = document.createElement("div");
    loc.className = "loc";
    loc.textContent = theaterNumber + "관/2D";

    var info = document.createElement("div");
    info.className = "info";

    var time = document.createElement("p");
    time.className = "time";
    time.textContent = movieTime.time;

    var duration = document.createElement("span");
    duration.textContent = "~" + movieTime.duration;
    time.appendChild(duration);

    var num = document.createElement("p");
    num.className = "num";
    num.innerHTML = movieTime.remainingSeats + "/<span>" + movieTime.totalSeats + "석</span>";

    info.appendChild(time);
    info.appendChild(num);

    button.appendChild(loc);
    button.appendChild(info);

    colDiv.appendChild(button);
    container.appendChild(colDiv);
  }
}

// 초기 페이지 로드 시 오늘 날짜로 예매 시간 생성
for (var theaterNumber = 1; theaterNumber <= 4; theaterNumber++) {
  createMovieTimes(theaterNumber, currentDateString);
}

// 예매하기 버튼 이벤트 추가
var reservationbtn = document.querySelector(".reservationForm");
reservationbtn.addEventListener("submit", function(event) {
  event.preventDefault(); // 기본 동작을 방지합니다.

  var movieCdInput = document.querySelector('input[name="movieCd"]');
  var movieCdValue = movieCdInput.value;
  var movieDayInput = document.querySelector('input[name="movieDay"]');
  var movieDayValue = movieDayInput.value;
  var movieTimeInput = document.querySelector('input[name="movieTime"]');
  var movieTimeValue = movieTimeInput.value;

  if (movieCdValue.trim() === '' || movieDayInput.trim() === '' || movieTimeValue.trim() === '') {
    alert('값이 존재 하지않습니다.\n상영 시간 까지 다 선택후 다시 시도 해 주세요.');
    return;
  }
});
</script>
<%@ include file="../include/footer.jsp" %>