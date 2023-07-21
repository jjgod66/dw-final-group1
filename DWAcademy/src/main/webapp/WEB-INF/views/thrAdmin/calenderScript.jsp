
<script>
function showDetailedInfo(date) {
	  alert('test');
	}
// 변수지정
const calendarDiv = document.getElementById('calendar');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');

let currentDate = new Date();

//현재날짜 함수
function updateCalendar() {
	
	 
	
  calendarDiv.innerHTML = '';
  // 7일로 만듬
  for (let i = 0; i < 7; i++) {
    const dateItem = document.createElement('div');
    dateItem.classList.add('date-item');

    // 몇월몇일로 만듬
    const options = { month: 'long', day: 'numeric' };
    dateItem.textContent = currentDate.toLocaleDateString(undefined, options);

    calendarDiv.appendChild(dateItem);
    currentDate.setDate(currentDate.getDate() + 1);
  }
  //날짜클릭기능
  const dateItems = document.getElementsByClassName('date-item');
  for (let i = 0; i < dateItems.length; i++) {
    dateItems[i].addEventListener('click', () => {
      showDetailedInfo(currentDate);
    });
    dateItems[i].style.cursor = 'pointer';
  }
  currentDate.setDate(currentDate.getDate() - 7);
}


updateCalendar();
//이전 다음 버튼 기능정의
prevBtn.addEventListener('click', () => {
  currentDate.setDate(currentDate.getDate() - 7);
  updateCalendar();
});

nextBtn.addEventListener('click', () => {
  currentDate.setDate(currentDate.getDate() + 7);
  updateCalendar();
});

</script>