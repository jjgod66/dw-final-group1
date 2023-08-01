<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl));
	
	// 날짜 선택부분
	let weekPage = 0;
	for (let i = 0; i < 21; i++) {
		let today = new Date();
		let day = new Date(today.setDate(today.getDate() + i));
		let dateFormat = (day.getMonth()+1) + '월 ' + (day.getDate()) + '일';		//M월d일
		let dateFormat2 = (day.getFullYear().toString())	//yyyyMMdd
						+ (day.getMonth()+1 < 10 ? '0' + (day.getMonth()+1) : day.getMonth()+1).toString() 
						+ (day.getDate() < 10 ? '0' + day.getDate() : day.getDate()).toString();
		
		let dayTableTd = $('<th class="dayTableTd" style="display: none;" data-date="'+dateFormat2+'">'+dateFormat+'</th>');
		$('#dayTableRow').append(dayTableTd);
	}
	
	// 현재 날짜 표시
	if ('${today}' != "") {
		$('.dayTableTd[data-date="${today}"]').addClass('selectedDate');
	} else {
		$('.dayTableTd:eq(0)').addClass('selectedDate');
	}
	
	// 날짜 클릭시
	$('.dayTableTd').on('click', function(){
		let data = $(this).attr('data-date');
		location.href="test.do?date="+data;
	})
	
	showWeek(weekPage);
	
	function showWeek(weekPage) {
		$('.dayTableTd').hide();
		for (let i=0; i < 7; i++) {
			$('#dayTableRow .dayTableTd:eq('+ (weekPage*7+i) +')').show();
		}
	}
	
	
	$('#nextWeekBtn').on('click', function(){
		if (weekPage < 2) {
			weekPage++
		} else {
			return;
		}
		showWeek(weekPage);
	});
	$('#prevWeekBtn').on('click', function(){
		if (weekPage > 0) {
			weekPage--
		} else {
			return;
		}
		showWeek(weekPage);
	});
	
	// 원하는 영화 클릭시
	$('.movieRow').on('click', function(){
		$('.selected').removeClass('selected');
		$(this).addClass('selected');
		
		let movieName = $(this).find('.movieRowName').text();
		let movieCd = $(this).find('.movieRowCd').text();
		let movieLength = $(this).find('.movieLength').val();
		let movieDates = $(this).find('.movieRowDates').val();
		let moviePic = $(this).find('.movieRowPic').html();
		let movieType = $(this).find('.movieType').val();
		let movieTypeList = movieType.split(',');
		$('#movieTypeTd').html('');
		console.log(movieTypeList);
		let movieTypeValue= '';
		for (movieType of movieTypeList) {
			if (movieType.includes('더빙/')) {
				movieTypeValue = movieType.replace('더빙/', 'DU');
			} else if (movieType.includes('자막/')) {
				movieTypeValue = movieType.replace('자막/', 'DE');
			} else if (movieType.includes('없음/')) {
				movieTypeValue = movieType.replace('없음/', 'NO');
			}
			$('#movieTypeTd').append($('<div class="col-md-6"><input type="radio" name="movie_type_cd" id="'+movieTypeValue+'" value="'+movieTypeValue+'"><label for="'+movieTypeValue+'">'+movieType+'</label></div>'));
		}
		
		$('#movieRowName').text(movieName);
		$('#movieRowCd').text(movieCd);
		$('#movieLength').text(movieLength+"분");
		$('#movieRowDates').text(movieDates);
		$('#movieRowPic').html(moviePic);
		$('#movieRowPic img').css({'width' : '10rem', 'height' : '14rem'});
		
		showAddedBox(movieLength);
	});
	
	$('#startHour, #startMinute, #startHouse').on('change', function(){
		if ($('div.selected').length > 0 ) {
			let movieLength = $('div.selected').find('.movieLength').val();
			showAddedBox(movieLength);
		} 
	});
	
	// 폼 작성시 상영시간표와 종료시간 프리뷰 
	function showAddedBox(movieLength) {
		if($('.addedBox').length > 0) {
			$('.addedBox').remove();
		}
		let day = '';
		if ($('.selectedDate').length < 1) {
			day = new Date();
		} else {
			day = new Date($('.selectedDate').attr('data-date').substring(0,4), $('.selectedDate').attr('data-date').substring(4,6) - 1, $('.selectedDate').attr('data-date').substring(6));
		}
		let startTime = new Date(day.getFullYear(), day.getMonth(), day.getDate(), Number($('#startHour').val()), Number($('#startMinute').val()));
		let endTime = new Date(day.getFullYear(), day.getMonth(), day.getDate(), Number($('#startHour').val()), Number($('#startMinute').val()) + Number(movieLength));
		console.log(startTime);
		$('#endTimeTd').text(((endTime.getHours()<10?'0'+endTime.getHours():endTime.getHours()) + '시 ') + (endTime.getMinutes() + '분'));
		
		divLength = ( movieLength / (20 * 60)) * 100;
		divLengthRatio = Math.floor(divLength*10) / 10;
		
		divX = (startTime.getTime() - openTime) / (60 * 1000);
		divX = (divX / (60 * 20)) * 100;
		let addedScreenBox = $('<div class="screenBox addedBox">');
		let nameBox = $('<div class="nameBox">');
		addedScreenBox.append(nameBox);
		nameBox.append($('.selected').find('.movieRowName').text());
		addedScreenBox.css({
							 'left' : divX+'%',
							 'width' : divLengthRatio+'%',
						 });
		toolTipDiv = $('<div class="tooltipDiv card card-body"><div class="triangle"></div><div>'+$('.selected').find('.movieRowName').text()+'</div></div>');
		addedScreenBox.append(toolTipDiv);
		$('.timetableRow[data-houseNo="'+ $('#startHouse').val()+'"]').append(addedScreenBox);
		
		checkScreenTimeClash($('#startHouse').val(), startTime, endTime);
	}
	
	// 서버로 가서 추가 가능한 시간인지 체크
	function checkScreenTimeClash(house_no, startTime, endTime) {
		let data = {
				"house_no" : house_no,
				"startTime" : startTime,
				"endTime" : endTime
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/thrAdmin/CheckScreenTimeClash",
			type: "post",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(data) {
				console.log(data);
				if (data > 0) {
					$('.addedBox').addClass('cantBeAdded');
				}
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
	
	// 이미 등록되어있는 상영영화 상세정보 보기
	$(document).on('click', '.alreadyScreenBox',function(){
		let screen_cd = $(this).attr('data-screenCd');
		console.log(screen_cd);
		$.ajax({
			url : "<%=request.getContextPath()%>/thrAdmin/screenDetail",
			type : "post",
			data : JSON.stringify(screen_cd),
			contentType : "application/json",
			success : function(data) {
				screenDetailInfo(data);
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
	
	function screenDetailInfo(map) {
		$('#movieCd_modal').text(map.SCREEN_CD);
		$('#movieName_modal').text(map.MOVIE_NAME);
		$('#houseName_modal').text(map.HOUSE_NAME);
		$('#screenReservCnt_modal').text(map.RESERVCNT + ' / ' + (map.HOUSE_ROW * map.HOUSE_COLUMN));
		$('#movieLength_modal').text(map.MOVIE_LENGTH + '분');
		$('#screenType_modal').text(map.MOVIE_TYPE_DES);
		$('.modalImgDiv img').attr('src', 'getPicture.do?name='+map.MOVIE_MAINPIC_PATH+'&item_cd='+map.MOVIE_CD+'&type=moviePoster');
		$('#seatMapDiv').html('');
		let rowDiv = ''; 
		let seatDiv = '';
		let ratio = 100 / map.HOUSE_COLUMN - 3;
		for (let i = 65; i < (map.HOUSE_ROW+65); i++) {
			rowDiv = $('<div class="row" style="justify-content: center;">');
			for (let j = 1; j < (map.HOUSE_COLUMN+1); j++) {
				seatDiv = $('<div style="display: inline-block; padding: 0; font-size: small; text-align: center; width: '+ratio+'%; height: 1.5rem; margin: 0 0.5rem 0.5rem 0; background-color: #e9ecef;" id="'+String.fromCharCode(i)+j+'seat">'+String.fromCharCode(i)+j+'</div>');
				if (map.SEAT_LIST.includes(String.fromCharCode(i)+j)) {
					seatDiv.css({
									'background-color' : '#4aa8d8',
									'color' : 'white'
								});
				}
				rowDiv.append(seatDiv);
			}
			$('#seatMapDiv').append(rowDiv);
		}
		
		
	}
	
	// 영화 검색시
	$('#searchMovieName').on('keyup', function(){
		let inputText = $(this).val();
		$('.movieRow').hide();
		$('.movieRowCd:contains("'+inputText+'")').closest('.movieRow').show();
		$('.movieRowName:contains("'+inputText+'")').closest('.movieRow').show();
	});
	
	// 상영 등록시
	$('#addNewScreen').on('click', function(){
		
		if ($('.cantBeAdded').length > 0) {
			alert('시간표를 확인하세요.');
			return;
		}
		if ($('.addedBox').length == 0) {
			alert('상영할 영화를 선택하세요.');
			return;
		}
		if ($('input[name="movie_type_cd"]:checked').length < 1) {
			alert('상영타입을 선택하세요.');
			return;
		}
		if (confirm('해당 영화를 상영시간표에 등록하시겠습니까?')) { 		
			$('input[name="movie_cd"]').val($('.selected').find('.movieRowCd').text());
			let day = '';
			if ($('.selectedDate').length < 1) {
				day = new Date();
			} else {
				day = new Date($('.selectedDate').attr('data-date').substring(0,4), $('.selectedDate').attr('data-date').substring(4,6) - 1, $('.selectedDate').attr('data-date').substring(6));
			}
			let startTime = new Date(day.getFullYear(), day.getMonth(), day.getDate(), Number($('#startHour').val()), Number($('#startMinute').val()));
			$('input[name="startdate"]').val(startTime);
			$('input[name="movie_type_cd"]').val($('input[name="movie_type_cd"]').val());
			$('input[name="house_no"]').val($('#startHouse').val());
			let form = $('form[role="form"]');
			form.submit();
		}
	});
	
	///////////////////////////////////////
	var openTime = '';
	console.log('${today}');
	if ('${today}' != '') {
		openTime = new Date('${today}'.substring(0, 4), '${today}'.substring(4, 6) - 1, '${today}'.substring(6));
	} else {
		openTime = new Date();
	}
	openTime = new Date(openTime.getFullYear(), openTime.getMonth(), openTime.getDate(), 7, 0)
	console.log(openTime);
	openTime = openTime.getTime();
	console.log(openTime);
	
	let screenBox = '';
	let divLength = '';
	let divLengthRatio = '';
	let divX = '';
	let toolTipDiv = '';
	let nameBox ='';
	<c:forEach items="${screenList}" var="screen">
		screenBox = $('<div class="screenBox alreadyScreenBox" data-bs-toggle="modal" data-bs-target="#exampleModal" data-screenCd="${screen.SCREEN_CD}">');
		nameBox = $('<div class="nameBox">');
		toolTipDiv = $('<div class="tooltipDiv card card-body"><div class="triangle"></div><div class="tooltipMovieName">${screen.MOVIE_NAME}</div><div><fmt:formatDate value="${screen.STARTDATE}" pattern="kk:mm"/></div></div>')
		screenBox.append(nameBox);
		nameBox.append('${screen.MOVIE_NAME}');
		divLength = ('${screen.MOVIE_LENGTH}' / (20 * 60)) * 100;
		divLengthRatio = Math.floor(divLength*10) / 10;
		divX = (new Date("${screen.STARTDATE}").getTime() - openTime) / (60 * 1000);
		divX = (divX / (60 * 20)) * 100; 

		screenBox.css({
						 'left' : divX+'%',
						 'width' : divLengthRatio+'%',
					 });
		screenBox.append(toolTipDiv);

		$('.timetableRow[data-houseNo="${screen.HOUSE_NO}"]').append(screenBox);
	</c:forEach>
	
	$(document).on('mouseover', '.screenBox', function(){
		$(this).find('.tooltipDiv').show();
		$(this).find('.triangle').show();
	});
	$(document).on('mouseleave', '.screenBox', function(){
		$(this).find('.tooltipDiv').hide();
		$(this).find('.triangle').hide();
	});
</script>