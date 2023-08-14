<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
window.onload = function(){

	//////////////////////////////////////////////////////////////////////////////
	
	// 해당날짜 개장시간
	var openTime = '';
	if ('${today}' != '') {
		openTime = new Date('${today}'.substring(0, 4), '${today}'.substring(4, 6) - 1, '${today}'.substring(6));
	} else {
		openTime = new Date();
	}
	
	openTime = new Date(openTime.getFullYear(), openTime.getMonth(), openTime.getDate(), 7, 0)
	openTime = openTime.getTime();
	
	// 오늘날짜 개장시간
	var nowTime = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 7, 0)
	nowTime = nowTime.getTime();
	
	// 해당날짜 - 오늘날짜
	var timeGap = openTime - nowTime;
	
	// 이미 등록된 상영영화 
	let screenBox = '';
	let divLength = '';
	let divLengthRatio = '';
	let divX = '';
	let nameBox ='';
	let addedScreenBox = '';
	<c:forEach items="${screenList}" var="screen">
		screenBox = $('<div class="screenBox alreadyScreenBox" data-screenCd="${screen.SCREEN_CD}">');
		nameBox = $('<div class="nameBox">');
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
		
		$('.timetableRow[data-houseNo="${screen.HOUSE_NO}"]').append(screenBox);
	</c:forEach>
	
	
	// 현재날짜와 일주일 이상 차이난다면 수정가능
	if (timeGap >= 604800000) {
		$('div.alreadyScreenBox').addClass('possibleModify');
	}
	
	if (!$('.alreadyScreenBox').hasClass('possibleModify')) {
		$('.alreadyScreenBox').attr({
										'data-bs-toggle' : 'modal',
										'data-bs-target' : '#exampleModal'
									});
	}
	
	
	//////////////////////////////////////////////////////////////////////
	
	
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
	
	// 해당 날짜목록 보여주기
	if (604800000 <= timeGap && timeGap < 1209600000) {
		weekPage = 1;
	} else if (timeGap >= 1209600000) {
		weekPage = 2;
	}
	
	showWeek(weekPage);
	
	function showWeek(weekPage) {
		$('.dayTableTd').hide();
		for (let i=0; i < 7; i++) {
			$('#dayTableRow .dayTableTd:eq('+ (weekPage*7+i) +')').show();
		}
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
		location.href="movieAdminMain.do?date="+data;
	});
	
	// 다음버튼 클릭시	
	$('#nextWeekBtn').on('click', function(){
		if (weekPage < 2) {
			weekPage++
		} else {
			return;
		}
		showWeek(weekPage);
	});
	
	// 이전버튼 클릭시
	$('#prevWeekBtn').on('click', function(){
		if (weekPage > 0) {
			weekPage--
		} else {
			return;
		}
		showWeek(weekPage);
	});
	
	// 원하는 영화 클릭시
	$(document).on('click', '.unselected',function(){
		$('.selected').addClass('unselected');
		$('.selected').removeClass('selected');
		$(this).addClass('selected');
		$(this).removeClass('unselected');
		
		$('.modifyBox').remove();
		$('.hided').removeClass('hided');
		$('#addNewScreenBtn').show();
		$('#modifyScreenBtn').hide();
		$('#deleteScreenBtn').hide();
		$('#startHouse').children('option:eq(0)').prop('selected', true);
		$('#startHour').children('option:eq(0)').prop('selected', true);
		$('#startMinute').children('option:eq(0)').prop('selected', true);
		
		let movieName = $(this).find('.movieRowName').text();
		let movieCd = $(this).find('.movieRowCd').text();
		let movieLength = $(this).find('.movieLength').val();
		let movieDates = $(this).find('.movieRowDates').val();
		let moviePic = $(this).find('.movieRowPic').html();
		let movieType = $(this).find('.movieType').val();
		
		showDetailBox(movieName, movieCd, movieLength, movieDates, moviePic, movieType);
		
		showAddedBox(movieLength);
	});
	
	$(document).on('click', '.selected',function(){
		$('.addedBox').remove();
		$(this).removeClass('selected');
		$(this).addClass('unselected');
		$('#movieRowName').text('');
		$('#movieRowCd').text('');
		$('#movieRowDates').text('');
		$('#movieLength').text('');
		$('#movieTypeTd').html('');
		$('#movieRowPic').html('');
		$('#startHouse').children('option:eq(0)').prop('selected', true);
		$('#startHour').children('option:eq(0)').prop('selected', true);
		$('#startMinute').children('option:eq(0)').prop('selected', true);
		$('#endTimeTd').text('');
		
	});
	
	// 영화클릭, 또는 기존상영영화 클릭시
	function showDetailBox(movieName, movieCd, movieLength, movieDates, moviePic, movieType, movie_type_des, house_no, startHour, startMinute) {
		
		$('#movieRowName').text(movieName);
		$('#movieRowCd').text(movieCd);
		$('#movieLength').text(movieLength+"분");
		$('#movieRowDates').text(movieDates);
		$('#movieRowPic').html(moviePic);
		$('#movieRowPic img').css({'width' : '10rem', 'height' : '14rem'});
		
		let movieTypeList = movieType.split(',');
		$('#movieTypeTd').html('');

		let movieTypeValue= '';
		for (movieType of movieTypeList) {
			if (movieType.includes('더빙/')) {
				movieTypeValue = movieType.replace('더빙/', 'DU');
			} else if (movieType.includes('자막/')) {
				movieTypeValue = movieType.replace('자막/', 'DE');
			} else if (movieType.includes('없음/')) {
				movieTypeValue = movieType.replace('없음/', 'NO');
			} else {
				movieTypeValue = movieType;
			}
			
			if (movieType.includes('DU')) {
				movieType = movieType.replace('DU', '더빙/');
			} else if (movieType.includes('DE')) {
				movieType = movieType.replace('DE', '자막/');
			} else if (movieType.includes('NO')) {
				movieType = movieType.replace('NO', '없음/');
			}
			
			$('#movieTypeTd').append($('<div class="col-md-6"><input type="radio" name="movie_type_cd" id="'+movieTypeValue+'" value="'+movieTypeValue+'"><label for="'+movieTypeValue+'">'+movieType+'</label></div>'));
		}
		
		if (house_no != null) {
			$('select#startHouse option[value="'+house_no+'"]').prop('selected', true);
		}
		
		if (startHour != null) {
			$('select#startHour option[value="'+startHour+'"]').prop('selected', true);
		}
		
		if (startMinute != null) {
			$('select#startMinute option[value="'+startMinute+'"]').prop('selected', true);
		}
		
		if (movie_type_des != null) {
			$('label:contains('+movie_type_des+')').click();
		}
	}
	
	
	$('#startHour, #startMinute, #startHouse').on('change', function(){
		if ($('div.selected').length > 0 ) {
			let movieLength = $('div.selected').find('.movieLength').val();
			showAddedBox(movieLength);
		} else {
			let movieLength = $('#movieLength').text().split('분')[0];
			showModifyBox(movieLength);
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
		$('#endTimeTd').text(((endTime.getHours()<10?'0'+endTime.getHours():endTime.getHours()) + '시 ') + (endTime.getMinutes() + '분'));
		
		divLength = ( movieLength / (20 * 60)) * 100;
		divLengthRatio = Math.floor(divLength*10) / 10;
		divX = (startTime.getTime() - openTime) / (60 * 1000);
		divX = (divX / (60 * 20)) * 100;
		addedScreenBox = $('<div class="screenBox addedBox">');
		nameBox = $('<div class="nameBox">');
		addedScreenBox.append(nameBox);
		nameBox.append($('.selected').find('.movieRowName').text());
		addedScreenBox.css({
							 'left' : divX+'%',
							 'width' : divLengthRatio+'%',
						 });
		$('.timetableRow[data-houseNo="'+ $('#startHouse').val()+'"]').append(addedScreenBox);
		
		checkScreenTimeClash($('#startHouse').val(), startTime, endTime);
	}
	
	function showModifyBox(movieLength) {
		if($('.addedBox').length > 0) {
			$('.addedBox').remove();
		}
		if($('.modifyBox').length > 0) {
			$('.modifyBox').addClass('hided');
		}
		let day = '';
		if ($('.selectedDate').length < 1) {
			day = new Date();
		} else {
			day = new Date($('.selectedDate').attr('data-date').substring(0,4), $('.selectedDate').attr('data-date').substring(4,6) - 1, $('.selectedDate').attr('data-date').substring(6));
		}
		
		let startTime = new Date(day.getFullYear(), day.getMonth(), day.getDate(), Number($('#startHour').val()), Number($('#startMinute').val()));
		let endTime = new Date(day.getFullYear(), day.getMonth(), day.getDate(), Number($('#startHour').val()), Number($('#startMinute').val()) + Number(movieLength));
		$('#endTimeTd').text(((endTime.getHours()<10?'0'+endTime.getHours():endTime.getHours()) + '시 ') + (endTime.getMinutes() + '분'));
		
		divLength = ( movieLength / (20 * 60)) * 100;
		divLengthRatio = Math.floor(divLength*10) / 10;
		
		divX = (startTime.getTime() - openTime) / (60 * 1000);
		divX = (divX / (60 * 20)) * 100;
		addedScreenBox = $('<div class="screenBox modifyBox">');
		nameBox = $('<div class="nameBox">');
		addedScreenBox.append(nameBox);
		nameBox.append($('#movieRowName').text());
		addedScreenBox.css({
							 'left' : divX+'%',
							 'width' : divLengthRatio+'%',
						 });
		$('.timetableRow[data-houseNo="'+ $('#startHouse').val()+'"]').append(addedScreenBox);
		
		checkScreenTimeClash($('#startHouse').val(), startTime, endTime, $('.screen_cd').val());
		
	}
	
	// 서버로 가서 추가 가능한 시간인지 체크
	function checkScreenTimeClash(house_no, startTime, endTime, screen_cd) {

		if (startTime < new Date()) {
			if ($('.addedBox').length > 0) {
				$('.addedBox').addClass('cantBeAdded');
			} else if ($('.modifyBox').length > 0) {
				$('.modifyBox').addClass('cantBeAdded');
			}
			return;
		}
		
		let data = {
				"house_no" : house_no,
				"startTime" : startTime,
				"endTime" : endTime,
				"screen_cd" : screen_cd
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/thrAdmin/CheckScreenTimeClash",
			type: "post",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(data) {
				if (data > 0) {
					console.log(data);
					if ($('.addedBox').length > 0) {
						$('.addedBox').addClass('cantBeAdded');
					} else if ($('.modifyBox').length > 0) {
						$('.modifyBox').addClass('cantBeAdded');
					}
				}
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

	// 이미 등록되어있는 상영영화 상세정보 보기
	$(document).on('click', '.alreadyScreenBox',function(){
		
		
		let thisBox = $(this);
		let screen_cd = $(this).attr('data-screenCd');
		$.ajax({
			url : "<%=request.getContextPath()%>/thrAdmin/screenDetail",
			type : "post",
			data : JSON.stringify(screen_cd),
			contentType : "application/json",
			success : function(data) {
				if (thisBox.hasClass('possibleModify')) {
					if ($('.modifyBox').length > 0) {
						$('.modifyBox').remove();
						$('.hided').removeClass('hided');
					} 
					console.log(data);
					$(this).addClass('hided');
					$('#addNewScreenBtn').hide();
					$('#modifyScreenBtn').show();	
					$('#deleteScreenBtn').show();
					$('.addedBox').remove();
					$('.selected').addClass('unselected');
					$('.selected').removeClass('selected');
					screenModify(data, thisBox);
				} else {
					if ($('.modifyBox').length > 0) {
						$('.modifyBox').remove();
						$('.hided').removeClass('hided');
					} 
					screenDetailInfo(data);
				}
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
	
	function screenModify(map , thisBox) {
		$('.addedBox').remove();
		$('.selected').removeClass('selected');
		if ($('.modifyBox').length > 0) {
			$('.modifyBox').removeClass('modifyBox');
		}
		
		let movie_opendate = new Date(map.MOVIE_OPENDATE);
		let movie_opendate_year = movie_opendate.getFullYear().toString();		
		let movie_opendate_month = (movie_opendate.getMonth()+1).toString() < 10 ? '0'+(movie_opendate.getMonth()+1).toString() : (movie_opendate.getMonth()+1).toString(); 		
		let movie_opendate_date = movie_opendate.getDate().toString() < 10 ? '0' + movie_opendate.getDate().toString() : movie_opendate.getDate().toString();	
		movie_opendate = movie_opendate_year + '-' + movie_opendate_month + '-' + movie_opendate_date;
		
		let movie_enddate = new Date(map.MOVIE_ENDDATE);
		let movie_enddate_year = movie_enddate.getFullYear().toString();		
		let movie_enddate_month = (movie_enddate.getMonth()+1).toString() < 10 ? '0'+(movie_enddate.getMonth()+1).toString() : (movie_enddate.getMonth()+1).toString(); 		
		let movie_enddate_date = movie_enddate.getDate().toString() < 10 ? '0' + movie_enddate.getDate().toString() : movie_enddate.getDate().toString();	
		movie_enddate = movie_enddate_year + '-' + movie_enddate_month + '-' + movie_enddate_date;
		
		let movieDates = movie_opendate + ' ~ ' + movie_enddate;
		let moviePic = $('<img src="/common/getPicture.do?name='+map.MOVIE_MAINPIC_PATH+'&item_cd='+map.MOVIE_CD+'&type=moviePoster" style="width: 10rem; height: 14rem; overflow: hidden;">');
		
		let startdate = new Date(map.STARTDATE);
		let enddate = new Date(startdate.getFullYear(), startdate.getMonth(), startdate.getDate(), startdate.getHours(), startdate.getMinutes() + map.MOVIE_LENGTH);
		let startHour = startdate.getHours() < 10 ? '0'+startdate.getHours() : startdate.getHours();
		let startMinute = startdate.getMinutes() < 10 ? '0'+startdate.getMinutes() : startdate.getMinutes();
		$('.screen_cd').val(map.SCREEN_CD);
		
		showDetailBox(map.MOVIE_NAME, map.MOVIE_CD, map.MOVIE_LENGTH, movieDates, moviePic, map.MOVIE_TYPE_LIST, map.MOVIE_TYPE_DES, map.HOUSE_NO, startHour, startMinute);
		showModifyBox(map.MOVIE_LENGTH);
	}
	
	function screenDetailInfo(map) {
		console.log(map);
		$('#movieCd_modal').text(map.SCREEN_CD);
		$('#movieName_modal').text(map.MOVIE_NAME);
		$('#houseName_modal').text(map.HOUSE_NAME);
		$('#screenReservCnt_modal').text(map.RESERVCNT + ' / ' + (map.HOUSE_ROW * map.HOUSE_COLUMN));
		$('#movieLength_modal').text(map.MOVIE_LENGTH + '분');
		let startdate = new Date(map.STARTDATE);
		startdate = startdate.getFullYear() + "-" 
				  + (startdate.getMonth()+1 < 10 ? '0'+(startdate.getMonth()+1) : startdate.getMonth()+1) + '-'
				  + (startdate.getDate() < 10 ? '0'+startdate.getDate() : startdate.getDate()) + ' '
				  + (startdate.getHours() < 10 ? '0'+startdate.getHours() : startdate.getHours()) + ':'
				  + (startdate.getMinutes() < 10 ? '0'+startdate.getMinutes() : startdate.getMinutes());
		let enddate = new Date(map.ENDDATE);
		enddate = enddate.getFullYear() + "-" 
				  + (enddate.getMonth()+1 < 10 ? '0'+(enddate.getMonth()+1) : enddate.getMonth()+1) + '-'
				  + (enddate.getDate() < 10 ? '0'+enddate.getDate() : enddate.getDate()) + ' '
				  + (enddate.getHours() < 10 ? '0'+enddate.getHours() : enddate.getHours()) + ':'
				  + (enddate.getMinutes() < 10 ? '0'+enddate.getMinutes() : enddate.getMinutes());
		$('#startTime_modal').text(startdate);
		$('#endTime_modal').text(enddate);
		$('#screenType_modal').text(map.MOVIE_TYPE_DES);
		$('.modalImgDiv img').attr('src', '/common/getPicture.do?name='+map.MOVIE_MAINPIC_PATH+'&item_cd='+map.MOVIE_CD+'&type=moviePoster');
		$('#seatMapDiv').html('');
		let rowDiv = ''; 
		let seatDiv = '';
		let ratio = 100 / map.HOUSE_COLUMN - 3;
		for (let i = 65; i < (map.HOUSE_ROW+65); i++){
			rowDiv = $('<div class="row" style="justify-content: center;">');
			for (let j = 1; j < (map.HOUSE_COLUMN+1); j++)  {
				seatDiv = $('<div style="display: inline-block; padding: 0; font-size: x-small; text-align: center; width: '+ratio+'%; height: 1rem; margin: 0 0.5rem 0.5rem 0; background-color: #e9ecef;" id="'+String.fromCharCode(i)+j+'seat">'+String.fromCharCode(i)+j+'</div>');
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
	
	// 선택 해제
	$(document).on('click', '.modifyBox',function(){
		$(this).remove();
		$('.hided').removeClass('hided');
		$('#addNewScreenBtn').show();
		$('#modifyScreenBtn').hide();
		$('#deleteScreenBtn').hide();
	});
	
	// 영화 검색시
	$('#searchMovieName').on('keyup', function(){
		let inputText = $(this).val();
		$('.movieRow').hide();
		$('.movieRowCd:contains("'+inputText+'")').closest('.movieRow').show();
		$('.movieRowName:contains("'+inputText+'")').closest('.movieRow').show();
	});
	
	// 상영 등록시
	$('#addNewScreenBtn').on('click', function(){
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
			$('#movieTypeCd').val($('input[name="movie_type_cd"]:checked').val());
			$('input[name="house_no"]').val($('#startHouse').val());
			let form = $('form[role="form"]');
			form.attr('action', 'addNewScreen');
			form.submit();
		}
	});
	
	// 상영영화 수정시
	$('#modifyScreenBtn').on('click', function(){
		if ($('.cantBeAdded').length > 0) {
			alert('시간표를 확인하세요.');
			return;
		}
		if ($('.modifyBox').length == 0) {
			alert('수정할 영화를 선택하세요.');
			return;
		}
		if ($('input[name="movie_type_cd"]:checked').length < 1) {
			alert('상영타입을 선택하세요.');
			return;
		}
		if (confirm('해당 상영영화를 수정하시겠습니까?')) { 		
			$('input[name="screen_cd"]').val($('.screen_cd').val());
			let day = '';
			if ($('.selectedDate').length < 1) {
				day = new Date();
			} else {
				day = new Date($('.selectedDate').attr('data-date').substring(0,4), $('.selectedDate').attr('data-date').substring(4,6) - 1, $('.selectedDate').attr('data-date').substring(6));
			}
			let startTime = new Date(day.getFullYear(), day.getMonth(), day.getDate(), Number($('#startHour').val()), Number($('#startMinute').val()));
			$('input[name="startdate"]').val(startTime);
			$('#movieTypeCd').val($('input[name="movie_type_cd"]:checked').val());
			$('input[name="house_no"]').val($('#startHouse').val());
			let form = $('form[role="form"]');
			form.attr('action', 'screenModify');
			form.submit();
		}
	});
	
	// 상영영화 삭제시
	$('#deleteScreenBtn').on('click', function(){
		if (confirm('해당 상영영화를 정말로 삭제하시겠습니까?')) { 		
			$('input[name="screen_cd"]').val($('.screen_cd').val());
			
			let day = '';
			if ($('.selectedDate').length < 1) {
				day = new Date();
			} else {
				day = new Date($('.selectedDate').attr('data-date').substring(0,4), $('.selectedDate').attr('data-date').substring(4,6) - 1, $('.selectedDate').attr('data-date').substring(6));
			}
			let startTime = new Date(day.getFullYear(), day.getMonth(), day.getDate(), Number($('#startHour').val()), Number($('#startMinute').val()));
			$('input[name="startdate"]').val(startTime);
			let form = $('form[role="form"]');
			form.attr('action', 'screenDelete');
			form.submit();
		}
	});
}
</script>