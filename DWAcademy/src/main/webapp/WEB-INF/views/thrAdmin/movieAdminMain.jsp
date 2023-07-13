<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="thrAdminHeader.jsp"%>

<style>
  /* body 스타일 */
  body {
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }
  /* 드래그 박스의 스타일 */
  #external-events {
    position: fixed;
  	margin-left:200px;
    top: 200px;
    width: 100px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    text-align: left;
  }
  #external-events h4 {
    font-size: 16px;
    margin-top: 0;
    padding-top: 1em;
  }
  #external-events .fc-event {
    margin: 3px 0;
    cursor: move;
  }
 
  #external-events p {
    margin: 1.5em 0;
    font-size: 11px;
    color: #666;
  }
 
  #external-events p input {
    margin: 0;
    vertical-align: middle;
  }
 
  #calendar-wrap {
    /* margin-left: 200px; */
  }
 
  #calendar1 {
    max-width: 50%;
    
    margin: auto auto auto auto;
  }
  #wrap{
  	 margin: auto auto auto auto;
  }
</style>



  <div id='wrap'>
    <!-- 드래그 박스 -->
    <div id='external-events'>
      <h6>상영중인 영화</h6>
      <div id='external-events-list'></div>
    </div>
    <!-- calendar 태그 -->
    <div id='calendar-wrap'>
      <div id='calendar1'></div>
    </div>
  </div>
  <script>
  (function(){
    $(function(){
      // 드래그 박스 취득
      var containerEl = $('#external-events-list')[0];
      // 설정하기
      new FullCalendar.Draggable(containerEl, {
        itemSelector: '.fc-event',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText.trim()
          }
        }
      });
      // 드래그 아이템 추가하기
      for(var i=1; i<=5;i++) {
        var $div = $("<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'></div>");
        $event = $("<div class='fc-event-main'></div>").text("영화 "+i);
        $('#external-events-list').append($div.append($event));
      }
      // calendar element 취득
      var calendarEl = $('#calendar1')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialDate: '2023-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        locale: 'ko', // 한국어 설정
        editable: true, // 수정 가능
/*         monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
        monthNamesShort: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
        dayNames: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
        dayNamesShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], */
        droppable: true,  // 드래그 가능
        drop: function(arg) { // 드래그 엔 드롭 성공시
          // 드래그 박스에서 아이템을 삭제한다.
          arg.draggedEl.parentNode.removeChild(arg.draggedEl);
        }
      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();
</script>
