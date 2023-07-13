<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="thrAdminHeader.jsp" %>
<% 
String movieCd = request.getParameter("movieCd");
if (movieCd == null) {
    movieCd = "";
}
%>
  <style>
    table {
      border-collapse: collapse;
      text-align: center;
    }
    th {
      width: 50px;
      height: 50px;
      border: 1px solid black;
    }
    tr {
      width: 50px;
      height: 50px;
      border: 1px solid black;
    }
    td {
   	  width: 80px;
      height: 30px;
      border: 1px solid black;
      /* padding: 30px; */
    }
    .colored {
      background-color: #C8D7FF;
    }
  </style>
  
  <section class="content-header">
	<div class="breadcrumb">
		<span>HOME</span> <i class="bi bi-chevron-compact-right" style="padding-top: 0.1rem; align-self: center;"></i> 상영영화관리 &gt 영화리스트  
	</div>
  </section>

   <div class="schedule-slider">
                    <div class="swiper-container">
                        <div class="swiper-wrapper" id="swiper-wrapper">
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>

	<table>
		<tr>
			<c:forEach items="${allScreenList }" var="movie">
				<td>${movie.movie_name}</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${allScreenList }" var="movie">
				<td>${movie.movie_length} 분</td>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${allStart }" var="start">
				<td>${start.startdate}</td>
			</c:forEach>
		</tr>
	</table>



	<br><br><br><br><br><br>
  <table id="timeTable">
    <tr>
    	<th>시간</th>
    	<td>07시</td>
    	<td>08시</td>
    	<td>09시</td>
    	<td>10시</td>
    	<td>11시</td>
    	<td>12시</td>
    	<td>13시</td>
    	<td>14시</td>
    	<td>15시</td>
    	<td>16시</td>
    	<td>17시</td>
    	<td>18시</td>
    	<td>19시</td>
    	<td>20시</td>
    	<td>21시</td>
    	<td>22시</td>
    	<td>23시</td>
    	<td>00시</td>
    	<td>01시</td>
    	<td>02시</td>
    </tr>
	<tr>
		<th>1관</th>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
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
	<tr>
		<th>2관</th>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
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
	<tr>
		<th>3관</th>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
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
	<tr>
		<th>4관</th>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
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
  
  <button onclick="colorCell()">상영영화 추가하기</button>
  
  <script>
    function colorCell() {
      var cells = document.querySelectorAll("#timeTable td ");
      cells.forEach(function(cell) {
        cell.addEventListener("click", function() {
          this.classList.toggle("colored");
        });
      });
    }

    window.onload = function() {
      generateTimeTable();
    };
    
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

    // 현재 시간 가져오기
    var currentTime = new Date();

    // 현재 날짜 가져오기 (년-월-일 형식)
    var currentDateString = new Date().toISOString().split("T")[0];
  </script>


<%@include file="thrAdminFooter.jsp" %>
