<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/seatbooking.css">
<div class="sub_visual">
 	<h3>예매하기</h3>
    <h6>ticket reservation</h6>
</div>
<select id="movie" hidden>
    <option value="14000"></option>
</select>
<div class="seatbooking-wrapper">
    <div class="container">
        <div class="select-table">
            <div class="seat-count" style="min-height: 52px">
                <div class="cell">
                    <p class="txt">성인</p>
                    <div class="count"><button type="button" class="down" title="성인 좌석 선택 감소" id="adultdown">-</button>
                    <div class="number"><button type="button" class="now" title="성인 현재 좌석 선택 수" ticketgrpcd="TKA" id="adultcount">0</button>
                        <ul class="num-choice">
                            <li><button type="button" class="btn">0</button></li>
                        </ul>
                    </div>
                    <button type="button" class="up" title="성인 좌석 선택 증가" id="adultup">+</button>
                    </div>
                </div>
                <div class="cell">
                    <p class="txt">청소년</p>
                    <div class="count"><button type="button" class="down" title="청소년 좌석 선택 감소" id="teendown">-</button>
                    <div class="number"><button type="button" class="now" title="청소년 현재 좌석 선택 수" ticketgrpcd="TKA" id="teencount">0</button>
                        <ul class="num-choice">
                            <li><button type="button" class="btn">0</button></li>
                        </ul>
                    </div>
                    <button type="button" class="up" title="청소년 좌석 선택 증가" id="teenup">+</button>
                    </div>
                </div>
                <div class="cell">
                    <p class="txt">우대</p>
                    <div class="count"><button type="button" class="down" title="우대 좌석 선택 감소" id="preferdown">-</button>
                    <div class="number"><button type="button" class="now" title="우대 현재 좌석 선택 수" ticketgrpcd="TKA" id="prefercount">0</button>
                        <ul class="num-choice">
                            <li><button type="button" class="btn">0</button></li>
                        </ul>
                    </div>
                    <button type="button" class="up" title="우대 좌석 선택 증가" id="preferup">+</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="seatbooking-inner">
            <div class="movie-container">
                <ul class="showcase">
                    <li>
                        <div class="seat1" ></div>
                        <small>선택가능</small>
                    </li>
                    <li>
                        <div class="seat1 selected"></div>
                        <small>선택</small>
                    </li>
                    <li>
                        <div class="seat1 occupied"></div>
                        <small>예매완료</small>
                    </li>    
                </ul>
                <div class="movie-inner">
                    <div class="screen">screen</div>
                    <div class="letter"></div>
                    <div class="number"></div>
                    <div class="out-door">
                        <span class="material-icons">
                        logout
                        </span>
                    </div>
                    <div class="in-door">
                        <span class="material-icons">
                          login
                        </span>  
                    </div>
                </div>
            </div>
            <div class="price-table">
                <div class="tit-area">
                    <!--span class="movie-grade small age-all age-15">15세이상관람가</span-->
                    <p class="price-tit">영화제목</p>
                    <p class="price-cate">2D</p>
                </div>
                <div class="info-area">
                    <p class="special">1관</p>
                    <p class="date"><span>2023.06.30</span><em>(금)</em></p>
                    <p class="other-time">22:00~23:59</p>
                    <div class="price-theater-place">
                        <span>남은좌석</span> <span class="remain-seats">0</span>/<span class="all-seats">0</span>
                    </div>
                    <p class="poster">
                        <img src="https://file.cineq.co.kr/i.aspx?movieid=20226411&size=210">
                    </p>
                </div>
                <div class="reserve-number-wrapper">
                    <div class="reserve-number-title">선택된 좌석 수</div>
                    <div class="reserve-number">0</div>
                </div>
                <div class="price-seats-wrapper">
                    <span class="price-seats-title">좌석번호</span>
                    <span class="price-seats"></span>
                </div>
                <div class="ticket-price">
                    <p class="ticket-price-title">최종결제금액</p>
                    <div class="ticket-price">
                      <em id="price">0</em> <span>원</span>
                    </div>
                </div>
                <div class="btn-group">
                    <a href="javaScript:void(0)" class="button" id="pagePrevious" title="이전">이전</a>
                    <a href="javaScript:void(0)" class="button" id="pageNext" title="다음">다음</a>
              </div>
            </div>
        </div>
    </div>
</div>
<form id="reservation" method="post" action="<%=request.getContextPath()%>/reservation/moviePaymentForm.do">
	<input type="hidden" name="adultSeat">
	<input type="hidden" name="teenSeat">
	<input type="hidden" name="preferSeat">
	<input type="hidden" name="totalPrice">
	<input type="hidden" name="screen_cd">
	<input type="hidden" name="selectSeats">
	
</form>
<script>
let totalSeat = 0;
let adultSeat = $('#adultcount').text();
let teenSeat = $('#teencount').text();
let preferSeat = $('#prefercount').text();
$(function(){
	$('#pageNext').on('click', function(){
		$('input[name="selectSeats"]').val(selectedSeatNumbers);
		$('input[name="adultSeat"]').val(adultSeat);
		$('input[name="teenSeat"]').val(teenSeat);
		$('input[name="preferSeat"]').val(preferSeat);
		$('input[name="totalPrice"]').val(totalPrice);
		if(totalSeat != selectedSeatsCount || selectedSeatsCount == 0){
			alert("좌석을 선택해주세요.");
			return;
		}
		$('#reservation').submit();
	})
	
	$('#adultdown').on('click', function(){
		totalSeatCountDown($('#adultcount'));
		adultSeat = $('#adultcount').text();
	})
	$('#adultup').on('click', function(){
		totalSeatCountUp($('#adultcount'));
		adultSeat = $('#adultcount').text();
	})
	$('#teendown').on('click', function(){
		totalSeatCountDown($('#teencount'));
		teenSeat = $('#teencount').text();
	})
	$('#teenup').on('click', function(){
		totalSeatCountUp($('#teencount'));
		teenSeat = $('#teencount').text();
	})
	$('#preferdown').on('click', function(){
		totalSeatCountDown($('#prefercount'));
		preferSeat = $('#prefercount').text();
	})
	$('#preferup').on('click', function(){
		totalSeatCountUp($('#prefercount'));
		preferSeat = $('#prefercount').text();
	})

})

const container = document.querySelector('.movie-inner');
const seats = document.querySelectorAll('.row .seat:not(.occupied)');
const count = document.querySelector('.reserve-number');
const total = document.getElementById('price');
const movieSelect = document.getElementById('movie');
const selectedSeatsDisplay = document.querySelector('.price-seats');

let ticketselect = +movieSelect.value;
let selectedSeatsCount = 0;

//좌석수 down, up버튼 이벤트
function totalSeatCountUp(number){
	let count = number.text();
	if(totalSeat < 8){
		count++;
		totalSeat++;
	}
	number.text(count);
}

function totalSeatCountDown(number){
	let count = number.text();
	if(selectedSeatsCount >= totalSeat && totalSeat > 0){
		alert("선택한 좌석보다 적을 수 없습니다.");
		return;
	}
	if(totalSeat > 0){
		count--;
		totalSeat--;
	}
	number.text(count);
}

let selectedSeatNumbers = '';
// 좌석 수와 총액 업데이트
let totalPrice = 0;
function updateSelectedCount() {
  const selectedSeats = document.querySelectorAll('.row .seat.selected');
  selectedSeatsCount = selectedSeats.length;
  $('.reserve-number').text(selectedSeatsCount);
  // 선택된 좌석 수가 제한인 8를 초과하는지 확인
  if (selectedSeatsCount > 8) {
    const lastSelectedSeat = selectedSeats[selectedSeats.length - 1];
    lastSelectedSeat.classList.remove('selected');
    selectedSeatsCount--;
  }

  //count.innerText = selectedSeatsCount;
  let adultPrice = 0;
  let teenPrice = 0;
  let preferPrice = 0;
  if(selectedSeatsCount > adultSeat){
	  adultPrice = adultSeat*14000;
	  teenPrice = (selectedSeatsCount - adultSeat) < 0 ? 0 : (selectedSeatsCount - adultSeat) * 12000;
	  preferPrice = (selectedSeatsCount - adultSeat - teenSeat) < 0 ? 0 : (selectedSeatsCount - adultSeat - teenSeat) * 6000;
		  
  }else{
	  adultPrice = selectedSeatsCount*14000;
  }

  totalPrice = adultPrice + teenPrice + preferPrice;

  total.innerText = totalPrice;

  // 선택한 좌석의 데이터 표시
  selectedSeatNumbers = Array.from(selectedSeats).map(seat => seat.getAttribute('data-st')).join(', ');
  selectedSeatsDisplay.innerText = selectedSeatsCount > 0 ? selectedSeatNumbers : '';
}

// 영화 선택 이벤트
movieSelect.addEventListener('change', (e) => {
  ticketselect = +e.target.value;
  updateSelectedCount();
});

// 좌석 클릭 이벤트
container.addEventListener('click', (e) => {
  if (
    e.target.classList.contains('seat') &&
    !e.target.classList.contains('occupied')
  ) {
    if (e.target.classList.contains('selected')) {
      e.target.classList.remove('selected');
      selectedSeatsCount--;
    } else {
      // 선택된 좌석 수가 제한인 5 미만인지 확인
      if (selectedSeatsCount < totalSeat) {
        e.target.classList.add('selected');
        selectedSeatsCount++;
      }
    }
  }
  updateSelectedCount();
});

const seatContainer = document.querySelector('.movie-inner');
const letterContainer = document.querySelector('.letter');
const numberContainer = document.querySelector('.number');
const allSeatsContainer = document.querySelector('.all-seats');
const remainSeatsContainer = document.querySelector('.remain-seats');

const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

// 좌석 생성 함수
function createSeat(seatNumber) {
  const seatDiv = document.createElement('div');
  seatDiv.classList.add('seat');
  seatDiv.setAttribute('data-st', seatNumber); // 좌석번호 설정
  return seatDiv;
}

// 스크린 앞에 알파벳 추가
function addAlphabet(rows) {
  for (let i = 0; i < rows; i++) {
    const letterDiv = document.createElement('div');
    letterDiv.textContent = alphabet.charAt(i);
    letterContainer.appendChild(letterDiv);
  }
}

// 열 번호 추가
function addNumbers(columns) {
  for (let i = 0; i < columns; i++) {
    const numberDiv = document.createElement('div');
    numberDiv.textContent = i + 1;
    numberContainer.appendChild(numberDiv);
  }
}

// 초기값으로 행과 열 추가
function addRowsAndColumns(rows, columns) {
  let newRows = Array.from({ length: rows }, () => Array.from({ length: columns }, () => ' '));
  rows = newRows;

  addAlphabet(rows.length); // 알파벳 추가

  let remainSeats = rows.length * columns; // 총 좌석 수

  newRows.forEach((row, rowIndex) => {
    const rowDiv = document.createElement('div');
    rowDiv.classList.add('row');

    row.forEach((seatNumber, seatIndex) => {
      const seatDiv = createSeat(alphabet.charAt(rowIndex) + (seatIndex + 1)); // 좌석에 알파벳과 숫자 출력
      rowDiv.appendChild(seatDiv);
      seatDiv.innerText = seatIndex + 1;

      seatDiv.addEventListener('click', () => {
        if (seatDiv.classList.contains('selected')) {
          remainSeats++; // 좌석 선택 해제 시 remainSeats 증가
        } else if(selectedSeatsCount < totalSeat){
          remainSeats--; // 좌석 선택 시 remainSeats 감소
        }
        remainSeatsContainer.textContent = remainSeats; // remainSeats 출력
      });
    });

    seatContainer.appendChild(rowDiv);
  });

  allSeatsContainer.textContent = remainSeats; // 총 좌석 수 출력
  remainSeatsContainer.textContent = remainSeats; // remainSeats 초기값 출력
}

// 초기값으로 8행 15열 설정
addRowsAndColumns(8, 14);
</script>
<%@include file="../include/footer.jsp" %>