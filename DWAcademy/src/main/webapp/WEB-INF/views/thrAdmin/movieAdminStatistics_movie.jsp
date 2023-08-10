<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="thrAdminHeader.jsp"%>
<style>
#statisticsTable th {
	position: relative;
}

#statisticsTable th span.sortBtn {
	position: absolute;
	right: 3px;
	cursor: pointer;
}
#searchMovieNameSelect {
	width: 100%; 
	height: 20rem; 
	position: absolute; 
 	display: none; 
	top: 36px; 
	border: 1px solid gray; 
	background-color: white;
}
</style>
<c:set var="cri" value="${pageMaker.cri }" />
<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		<div class="mx-2">
			<ul class="nav nav-pills">
			  <li class="nav-item">
			    <a class="nav-link" aria-current="page" href="/thrAdmin/movieAdminStatistics.do" class="bc_dw_blue">일자별</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="/thrAdmin/movieAdminStatistics_movie.do">영화별</a>
			  </li>
			</ul>
			<div id="setSearchTypeDiv mx-2">
				<div class="row">
					<div class="col-md-12 text-center mb-4" >
						<div class="mb-2" style="text-align: -webkit-center;">
							<div class="mb-2" style="position: relative; width: 30%;">
								<input type="text" name="orderType" id="searchMovieName" class="form-control" autocomplete="off" placeholder="영화명을 입력하세요.">
								<div id="searchMovieNameSelect" class="borderRadius" style="overflow: auto">
									
								</div>
							</div>
							<input type="radio" name="howlong" id="day" data-type="dayDiv" ${cri.searchType2 eq 'day' || empty cri.searchType2 ? 'checked' : '' }>
							&nbsp;
							<label for="day">해당 주 일별</label> 
							&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="howlong" id="week" data-type="weekDiv" ${cri.searchType2 eq 'week' ? 'checked' : '' }>
							&nbsp;
							<label for="week">해당 월 주별</label> 
							&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="howlong" id="month" data-type="monthDiv" ${cri.searchType2 eq 'month' ? 'checked' : '' }>
							&nbsp;
							<label for="month">해당 연 월별</label> 
							&nbsp;&nbsp;&nbsp;&nbsp; 
							<select name="searchType" style="display: none;">
								<c:forEach items="${theaterList }" var="thr">
									<option value="${thr.ADMIN_CD }" ${sessionScope.loginUser.CD eq thr.ADMIN_CD ? 'selected' : ''}>${thr.THR_NAME eq 'DW시네마' ? '극장 전체' : thr.THR_NAME}</option>
								</c:forEach>
							</select>
						</div>
						<div class="mb-2 howlongDiv">
							<div id="dayDiv" style="${cri.searchType2 eq 'day' || empty cri.searchType2  ? '' : 'display: none;'}">
								<input type="text" name="dayView" style="width: 8.5rem;" readonly> 
								<input type="date" name="keyword" value="${cri.searchType2 eq 'day' || empty cri.searchType2 ? keyword : '' }">
							</div>
							<div id="weekDiv" style="${cri.searchType2 eq 'week' ? '' : 'display: none;'}">
								<input type="text" name="weekView" style="width: 8.5rem;" readonly> 
								<input type="date" name="keyword" value="${cri.searchType2 eq 'week' ? keyword : '' }">
							</div>
							<div id="monthDiv" style="${cri.searchType2 eq 'month' ? '' : 'display: none;'}">
								<input type="text" name="monthView" value="" style="width: 8.5rem;" readonly> 
								<input type="date" name="keyword" value="${cri.searchType2 eq 'month' ? keyword : '' }">
							</div>
						</div>
						<div class="text-center">
							<button type="button" id="searchBtn" class="bc_dw_black">조회</button>
						</div>
					</div>
					<div class="col-md-6" style="text-align: -webkit-center; ${empty cri.orderType ? 'display: none;' : ''}">
						<div style="width: 100%; hegiht: 400px;">
							<canvas class="sales_movie_chart"></canvas>
						</div>
					</div>
					<div class="col-md-6" style="text-align: -webkit-center; ${empty cri.orderType ? 'display: none;' : ''}">
						<div style="width: 100%; hegiht: 400px;">
							<canvas class="cnt_chart"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div id="searchResultDiv" style="margin-top: 2rem; ${empty cri.orderType ? 'display: none;' : ''}">
				<h3></h3>
				<table class="table table-bordered" id="statisticsTable"
					style="font-size: small;">
					<thead class="table-light text-center">
						<tr>
							<th>일 자 <span class="sortBtn"><i
									class="bi bi-arrow-down-up" onclick="sortTable(0);"></i></span></th>
							<th>관객수 <span class="sortBtn"><i
									class="bi bi-arrow-down-up" onclick="sortTable(1);"></i></span></th>
							<th>상영수 <span class="sortBtn"><i
									class="bi bi-arrow-down-up" onclick="sortTable(2);"></i></span></th>
							<th>매출액<span class="sortBtn"><i
									class="bi bi-arrow-down-up" onclick="sortTable(3);"></i></span></th>
							<th>예매점유율 <span class="sortBtn"><i
									class="bi bi-arrow-down-up" onclick="sortTable(4);"></i></span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dateList }" var="date">
							<tr class="text-end">
								<th class="text-center">${date.DATES }</th>
								<td><fmt:formatNumber value="${date.SEATCNT }" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${date.SCREENCNT }" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${date.SALES_MOVIE }" pattern="#,###" /></td>
								<td>${date.SALES_MOVIE_RATIO != 0 ? (date.SALES_MOVIE_RATIO += '%') : 0}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-end mt-4">
					<h4>관객수 : 해당 일자 관람 관객수</h4>
					<h4>상영수 : 해당 일자 스크린 상영 횟수</h4>
					<h4>매출액 : 해당 일자 예매 매출액</h4>
					<h4>예매 점유율 : 해당 일자 해당 영화 예매 매출액 ÷ 해당 일자 전체 영화 예매 매출 총액</h4>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="display: none;">
	<%@ include file="../common/pagination.jsp"%>
</div>



<script>
let searchFormUrl = "/thrAdmin/movieAdminStatistics_movie.do";

$(function(){
	
	// 영화이름 검색창
	$('#searchMovieName').on('focus', function(){
		$('#searchMovieNameSelect').show();
	});
	$('#searchMovieName').on('blur', function(){
		$('#searchMovieNameSelect').hide();
	});
	
	$('#searchMovieName').on('keyup', function(){
		if ($(this).val().length <= 0 ) return;
		let searchText = $(this).val();
		$.ajax({
			url : "<%=request.getContextPath()%>/commonAdmin/searchMovieName.do",
			type : "post",
			data : JSON.stringify(searchText),
			contentType : "application/json",
			success : function(data) {
				candidateList(data);
			},
			error : function(err) {
				console.log(err);
			}
			
		});
	});
	
	function candidateList(data) {
		$('#searchMovieNameSelect').html('');
		for (movie of data) {
			let inputRow = $('<div class="candidateRow row text-start my-2" style="width:90%; cursor: pointer;">');
			let inputTd1 = $('<div class="col-md-12" style="padding:0;">'+movie.MOVIE_NAME+'</div>');
			let inputTd2 = $('<input type="hidden" value="'+movie.MOVIE_CD+'">');
			inputRow.append(inputTd1).append(inputTd2);
			$('#searchMovieNameSelect').append(inputRow);
		}
	}
	
	$(document).on('mousedown', '.candidateRow',function(){
		$('#searchMovieName').val($(this).find('div').text());
	});
	
	
	
	
	
	
	
	// 가져온 영화목록 chart를 위해 새 배열에 세팅
// 	if (!'${empty dateList}') {
		
	const resultList = new Array();
	<c:forEach items="${dateList}" var="date">
		<c:if test="${date.SALES_DAY ne 0}">
			resultList.push({
				date : "${date.DATES}",
				sales_movie : "${date.SALES_MOVIE}",
				sales_allmovie : "${date.SALES_ALLMOVIE}",
				sales_movie_ratio : "${date.SALES_MOVIE_RATIO}",
				seat_cnt : '${date.SEATCNT}',
				screen_cnt : '${date.SCREENCNT}'
			});
		</c:if>
	</c:forEach>
	
	
	const date_List = resultList.map(function(e){
		return e.date;
	});
	const sales_movie_ratio_List = resultList.map(function(e){
		return e.sales_movie_ratio;
	});
	const seat_cnt_List = resultList.map(function(e){
		return Number(e.seat_cnt);
	});
	const screen_cnt_List = resultList.map(function(e){
		return Number(e.screen_cnt);
	});
	
	function arrayMax(arr) {
		  // 배열의 요소가 무조건 존재할 경우 max = arr[0]로 변경 가능
		  var len = arr.length, max = arr[0];
		  while (len--) {
		    if (arr[len] > max) {
		      max = arr[len];
		    }
		  }
		  return max;
	};
	
	if (resultList.length != 0) {
		const seat_Max = arrayMax(seat_cnt_List);
		var seat_Ceil = 10**(seat_Max.toString().length);
		const screen_Max = arrayMax(screen_cnt_List);
		var screen_Ceil = 10**(screen_Max.toString().length);
	}
	
	const ctx = $('.sales_movie_chart');
	const ctx2 = $('.cnt_chart');
	
	const plugin = {
			  id: 'customCanvasBackgroundColor',
			  beforeDraw: (chart, args, options) => {
			    const {ctx} = chart;
			    ctx.save();
			    ctx.globalCompositeOperation = 'destination-over';
			    ctx.fillStyle = options.color || '#99ffff';
			    ctx.fillRect(0, 0, chart.width, chart.height);
			    ctx.restore();
			  }
	};
	
	let chart_config_sales_movie = {
		    type: 'line',
		    data:  {
		    	labels: date_List,
		    	datasets: [{
		    		label : '해당 일자 전체 대비 매출액 비율(%)',
		    		data: sales_movie_ratio_List,
		    		borderColor: '#36a2eb',
		    		backgroundColor: '#36a2eb',
		    		yAxisID : 'y'
		    	}]
// 					 labels : date_List,
					},
		    options: {
				interaction: {
					intersect: false,
					mode: 'index'
				},
				scales: {
					grace: 10,
					y: {
						type: 'linear',
						suggestedMin: 0,
						suggestedMax: 100,
						ticks: {
							stepSize: 10,
							z: 100,
						},
						display: true,
						position: 'left',
					},
				},
			    plugins: {
				      customCanvasBackgroundColor: {
				    	  color: '#e9ecef',
				      }
			      }
		    },
		    plugins: [plugin],
	}
	
	let chart_config_cnt = {
		    type: 'line',
		    data:  {
		    	labels: date_List,
		    	datasets: [
		    		{
		    		label : '예매수',
		    		data: seat_cnt_List,
		    		borderColor: '#36a2eb',
		    		backgroundColor: '#36a2eb',
		    		yAxisID : 'y'
		    		},
		    		{
		    		label : '스크린수',
		    		data: screen_cnt_List,
		    		borderColor: '#ef4836',
		    		backgroundColor: '#ef4836',
		    		yAxisID : 'y1',
		    		type: 'bar'
		    		}
	    		]
// 					 labels : date_List,
					},
		    options: {
				interaction: {
					intersect: false,
					mode: 'index'
				},
				scales: {
					y: {
// 						grace: '20%',
// 						min: 0,
// 						max:  Math.floor(seat_Ceil),
						suggestedMin: 0,
						suggestedMax:  Math.floor(seat_Ceil),
						type: 'linear',
						ticks: {
							stepSize: Math.floor(seat_Ceil / 10),
							z: 100,
						},
						display: true,
						position: 'left',
					},
					y1: {
// 						grace: '20%',
// 						min: 0,
// 						max: Math.floor(screen_Ceil),
						suggestedMin: 0,
						suggestedMax: Math.floor(screen_Ceil),
						type:'linear',
						ticks: {
							stepSize: Math.floor(screen_Ceil / 10),
							z: 100,
						},
						display: true,
						position: 'right',
						grid: {
							drawOnChartArea: false,
						}
					}
				},
			    plugins: {
				      customCanvasBackgroundColor: {
				    	  color: '#e9ecef',
				      }
			      }
		    },
		    plugins: [plugin],
	}
	

	

	
	new Chart(ctx, chart_config_sales_movie);
	new Chart(ctx2, chart_config_cnt);
// 	}
	
	// date를 'yyyy-MM-dd' 형식으로
	function dateToString(date) {
		return date.getFullYear()+'-'+(date.getMonth()+1<10?'0'+(date.getMonth()+1):date.getMonth()+1)+'-'+(date.getDate()<10?'0'+date.getDate():date.getDate());
	}
	// 주간별일때 input text value값 자동 넣어지게
	function setWeekView(date) {
		function getWeek(date){
			  const currentDate = date.getDate();
			  const firstDay = new Date(date.setDate(1)).getDay();

			  return Math.ceil((currentDate + firstDay) / 7);
		};
		let week = getWeek(date);
		let month = date.getMonth() + 1;
		let year = date.getFullYear();
		$('#dayDiv input[name="dayView"]').val(year +"년 " + month + "월 " + week + "주차");
	}
	
	// 월별일때 input text value값 자동 넣어지게
	function setMonthView(date) {
		let month = date.getMonth() + 1;
		let year = date.getFullYear();
		$('#weekDiv input[name="weekView"]').val(year + "년 " + month + "월");
	}
	
	// 연별일때 input text value값 자동 넣어지게
	function setYearView(date) {
		let year = date.getFullYear();
		$('#monthDiv input[name="monthView"]').val(year + "년 " );
	}
	
	// 초기 세팅
	let today = new Date();
	let today_year = today.getFullYear();
	let today_month = today.getMonth();
	let today_date = today.getDate();
	let yesterday = new Date(today_year, today_month, today_date-1);
	yesterday_toString = dateToString(yesterday);
	$('.howlongDiv input[type="date"]').val('${cri.keyword}');
	$('.howlongDiv input[type="date"]').attr('max', yesterday_toString);
	if ('${cri.keyword}' == '') {
		$('#searchResultDiv h3').text('');	
		setWeekView(new Date(yesterday_toString));
		$('#dayDiv input[name="keyword"]').val(yesterday_toString);
	} else {
		$('#searchResultDiv h3').text('${cri.keyword}');
		if ('${cri.searchType2}' == 'day') {
			setWeekView(new Date('${cri.keyword}'));
			$('#searchResultDiv h3').text('${cri.orderType} - ' + $('#dayDiv input[name="dayView"]').val());
		} else if ('${cri.searchType2}' == 'week') {
			setMonthView(new Date('${cri.keyword}'));
			$('#searchResultDiv h3').text('${cri.orderType} - ' + $('#weekDiv input[name="weekView"]').val());
		} else if ('${cri.searchType2}' == 'month') {
			setYearView(new Date('${cri.keyword}'));
			$('#searchResultDiv h3').text('${cri.orderType} - ' + $('#monthDiv input[name="monthView"]').val());
		}
	}
	if ('${cri.orderType}' != '') {
		$('#searchMovieName').val('${cri.orderType}');
	}
	
	// 검색 날짜 설정 방법 radio 클릭시
	$('input[name="howlong"]').on('click', function(){
		$('div.howlongDiv div').hide();
		$('div#'+$(this).attr('data-type')).show();
		$('.howlongDiv input[name="keyword"]').val(yesterday_toString);
		$('.howlongDiv input[type="text"]').val('');
		if ($(this).attr('data-type') == 'dayDiv') {
			setWeekView(yesterday);
		} else if ($(this).attr('data-type') == 'weekDiv') {
			setMonthView(yesterday);
		} else if ($(this).attr('data-type') == 'monthDiv') {
			setYearView(yesterday);
		} 
	});
	
	// 일별 날짜 설정시
	$('#dayDiv input[name="keyword"]').on('change', function(){
		let date = new Date($(this).val());
		setWeekView(date);
	});

	// 주간별 날짜 설정시
	$('#weekDiv input[name="keyword"]').on('change', function(){
		let date = new Date($(this).val());
		setMonthView(date);
	});
	
	// 월별 날짜 설정시
	$('#monthDiv input[name="keyword"]').on('change', function(){
		let date = new Date($(this).val());
		setYearView(date);
	});
	
	// 조회버튼 클릭시
	$('#searchBtn').on('click', function(){
		if ($('#searchMovieName').val() == '') {
			alert('영화를 선택하세요.');
			return;
		}
		$('form#searchForm input[name="searchType2"]').val($('input[name="howlong"]:checked').attr('id'));
		$('form#searchForm input[name="orderType"]').val($('input[name="orderType"]').val());
		let div = $('input[name="howlong"]:checked').attr('data-type');
		$('.howlongDiv div').not('#'+div).remove();
		searchList_go(1);
	});
	
	
});

// 테이블 정렬버튼
var sortType = 'asc';
function sortTable(cellNum){
    sortType = (sortType === 'asc') ? 'desc':'asc';

    var table = document.getElementById('statisticsTable');
    var rows = table.rows;
    var chkSort = true;
   
    while (chkSort){
        chkSort = false;
        for (var i = 1; i < (rows.length - 1); i++) {
            var row = rows[i];
            if (cellNum == 0) {
	            var fCell = row.cells[cellNum].innerHTML.toLowerCase();
	            var sCell = row.nextElementSibling.cells[cellNum].innerHTML.toLowerCase();
            } else if (cellNum >= 1 ){
	            var fCell = Number(row.cells[cellNum].innerHTML.toLowerCase().replace(',', '').replace('%', ''));
	            var sCell = Number(row.nextElementSibling.cells[cellNum].innerHTML.toLowerCase().replace(',', '').replace('%', ''));
            } else {
	            var fCell = row.cells[cellNum].innerHTML.toLowerCase();
	            var sCell = row.nextElementSibling.cells[cellNum].innerHTML.toLowerCase();
            }
            if ((sortType === 'asc'  && fCell > sCell) || (sortType === 'desc' && fCell < sCell)) {
                row.parentNode.insertBefore(row.nextSibling, row);
                chkSort = true;
            }
        }
       }   
   }
</script>
<%@ include file="thrAdminFooter.jsp"%>