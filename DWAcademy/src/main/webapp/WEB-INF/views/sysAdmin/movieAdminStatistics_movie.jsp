<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="sysAdminHeader.jsp"%>
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
			    <a class="nav-link" aria-current="page" href="/sysAdmin/movieAdminStatistics.do">일자별</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="/sysAdmin/movieAdminStatistics_movie.do">영화별</a>
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
							<select name="searchType">
								<c:forEach items="${theaterList }" var="thr">
									<option value="${thr.ADMIN_CD }">${thr.THR_NAME eq 'DW시네마' ? '극장 전체' : thr.THR_NAME}</option>
								</c:forEach>
							</select>
						</div>
						<div class="mb-2 howlongDiv">
							<div id="dayDiv" style="${cri.searchType2 eq 'day' || cri.searchType2 eq '' ? '' : 'display: none;'}">
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
					<div class="col-md-6" style="text-align: -webkit-center;">
						<div style="width: 400px; hegiht: 400px;">
							<canvas class="sales_day_chart"></canvas>
						</div>
					</div>
					<div class="col-md-6" style="text-align: -webkit-center;">
						<div style="width: 400px; hegiht: 400px;">
							<canvas class="sales_allday_chart"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div id="searchResultDiv" style="margin-top: 2rem;">
				<h3></h3>
				<table class="table table-bordered" id="statisticsTable"
					style="font-size: small;">
					<thead class="table-light text-center">
						<tr>
							<th></th>
							<th>관객수 <span class="sortBtn"><i
									class="bi bi-arrow-down-up" onclick="sortTable(0);"></i></span></th>
							<th>매출액 <span class="sortBtn"><i
									class="bi bi-arrow-down-up" onclick="sortTable(1);"></i></span></th>
							<th>점유율 <span class="sortBtn"><i
									class="bi bi-arrow-down-up" onclick="sortTable(2);"></i></span></th>
							<th>상영수 <span class="sortBtn"><i
									class="bi bi-arrow-down-up" onclick="sortTable(2);"></i></span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${movieList }" var="movie">
							<tr class="text-end">
								<th class="text-center">2000-00-00</th>
								<td><fmt:formatNumber value="${movie.SALES_DAY }" pattern="#,###" /></td>
								<td>${movie.SALES_DAY_RATIO != 0 ? (movie.SALES_DAY_RATIO += '%') : 0}</td>
								<td><fmt:formatNumber value="${movie.SEAT_DAY }" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${movie.SCREENCNT }" pattern="#,###" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div style="display: none;">
	<%@ include file="../common/pagination.jsp"%>
</div>



<script>
let searchFormUrl = "/sysAdmin/movieAdminStatistics_movie.do";

$(function(){
	$('#searchMovieName').on('focus', function(){
		$('#searchMovieNameSelect').show();
	});
	$('#searchMovieName').on('blur', function(){
		$('#searchMovieNameSelect').hide();
	});
	
	$('#searchMovieName').on('keyup', function(){
		if ($(this).val().length <= 0 ) return;
		let searchText = $(this).val();
		console.log(searchText);
		$.ajax({
			url : "<%=request.getContextPath()%>/commonAdmin/searchMovieName.do",
			type : "post",
			data : JSON.stringify(searchText),
			contentType : "application/json",
			success : function(data) {
				console.log(data);
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
		console.log($(this).find('div').text());
		$('#searchMovieName').val($(this).find('div').text());
	});
	
	
	
	
	
	
	
	// 가져온 영화목록 chart를 위해 새 배열에 세팅
	const movieList = new Array();
	<c:forEach items="${movieList}" var="movie">
		<c:if test="${movie.SALES_DAY ne 0}">
			movieList.push({
				name : "${movie.MOVIE_NAME}",
				sales_day : "${movie.SALES_DAY}",
				sales_allday : "${movie.SALES_ALLDAY}"
			});
		</c:if>
	</c:forEach>
	
	// chart 랜덤 색깔 배정
	var strRGBAList = new Array();
	for (let i = 0; i < movieList.length; i++) {
		let RGB_1 = Math.floor(Math.random() * (255 + 1));
		let RGB_2 = Math.floor(Math.random() * (255 + 1));
		let RGB_3 = Math.floor(Math.random() * (255 + 1));
		let strRGBA = 'rgba(' + RGB_1 + ',' + RGB_2 + ',' + RGB_3 + ')';
		strRGBAList.push(strRGBA);
	}
	
	const movieNameList = movieList.map(function(e){
		return e.name
	});
	const movieSales_day_List = movieList.map(function(e){
		return e.sales_day
	});
	const movieSales_allday_List = movieList.map(function(e){
		return e.sales_allday
	});
	
	const ctx = $('.sales_day_chart');
	const ctx2 = $('.sales_allday_chart');
	
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
	
	let chart_config_day = {
		    type: 'pie',
		    data:  {
					  labels: movieNameList,
					  datasets: [{
					    label: 'My First Dataset',
					    data: movieSales_day_List,
					    hoverOffset: 4,
					    backgroundColor: strRGBAList
					  }],
					},
		    options: {
				scales: {
					x: {
						display: false,
				    	grid: {
				    		display: false,
				    		drawTicks: false
			    		}
			    	},
			        y: {
			        	display: false,
			        	beginAtZero: true,
			        	grid: {
			        		display: false,
			        		drawTicks: false
			          }
			        }
			      },
			      plugins: {
			    	  title : {
				    	  display: true,
				    	  text: '매출액',
				    	  font: {
				    		  weight: 'bold',
				    		  size: 18
				    	  },
				    	  padding: 20,
				    	  align: 'center',
				    	  position: 'bottom',
				    	  fullSize: false
				      },
				      customCanvasBackgroundColor: {
				    	  color: '#e9ecef',
				      }
			      }
		    },
		    plugins: [plugin],
	}
	
	let chart_config_allday = {
		    type: 'pie',
		    data:  {
					  labels: movieNameList,
					  datasets: [{
					    label: 'My First Dataset',
					    data: movieSales_allday_List,
					    hoverOffset: 4,
					    backgroundColor: strRGBAList
					  }]
					},
		    options: {
			      scales: {
			    	  x: {
							display: false,
					    	grid: {
					    		display: false,
					    		drawTicks: false
				    		}
				    	},
				        y: {
				        	display: false,
				        	beginAtZero: true,
				        	grid: {
				        		display: false,
				        		drawTicks: false
				          }
				        }
			      },
			      plugins: {
			    	  title : {
				    	  display: true,
				    	  text: '누적 매출액',
				    	  font: {
				    		  weight: 'bold',
				    		  size: 18
				    	  },
				    	  padding: 20,
				    	  align: 'center',
				    	  position: 'bottom',
				    	  fullSize: false
				      },
				      customCanvasBackgroundColor: {
				    	  color: '#e9ecef',
				      }
			      }
		    },
		    plugins: [plugin],
	}
	
	new Chart(ctx, chart_config_day);
	new Chart(ctx2, chart_config_allday);
	
	
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
		$('#searchResultDiv h3').text(yesterday_toString);	
	} else {
		$('#searchResultDiv h3').text('${cri.keyword}');
		if ('${cri.searchType2}' == 'day') {
			setWeekView(new Date('${cri.keyword}'));
			$('#searchResultDiv h3').text($('#dayDiv input[name="dayView"]').val());
		} else if ('${cri.searchType2}' == 'week') {
			setMonthView(new Date('${cri.keyword}'));
			$('#searchResultDiv h3').text($('#weekDiv input[name="weekView"]').val());
		} else if ('${cri.searchType2}' == 'month') {
			setYearView(new Date('${cri.keyword}'));
			$('#searchResultDiv h3').text($('#yearDiv input[name="monthView"]').val());
		}
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
            console.log(row);
            if (cellNum == 0) {
	            var fCell = Number(row.cells[cellNum].innerHTML.toLowerCase());
	            var sCell = Number(row.nextElementSibling.cells[cellNum].innerHTML.toLowerCase());
            } else if (cellNum >= 3 ){
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
<%@ include file="sysAdminFooter.jsp"%>