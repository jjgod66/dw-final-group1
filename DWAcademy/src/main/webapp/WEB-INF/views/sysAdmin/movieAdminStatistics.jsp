<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
<style>
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
			<div id="setSearchTypeDiv mx-2">
				<div class="row">
					<div class="col-md-12 text-center mb-4">
						<div class="mb-2">
							<input type="radio" name="howlong" id="day" data-type="dayDiv" ${cri.searchType2 eq 'day' || empty cri.searchType2 ? 'checked' : '' }>&nbsp;<label for="day">일별</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="howlong" id="week" data-type="weekDiv" ${cri.searchType2 eq 'week' ? 'checked' : '' }>&nbsp;<label for="week">주간별</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="howlong" id="month" data-type="monthDiv" ${cri.searchType2 eq 'month' ? 'checked' : '' }>&nbsp;<label for="month">월별</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="searchType">
								<c:forEach items="${theaterList }" var="thr">
									<option value="${thr.ADMIN_CD }">${thr.THR_NAME eq 'DW시네마' ? '극장 전체' : thr.THR_NAME}</option>
								</c:forEach>
							</select>
						</div>
						<div class="mb-2 howlongDiv">
							<div id="dayDiv">
								<input type="date" name="keyword" value="${cri.searchType2 eq 'day' || empty cri.searchType2 ? keyword : '' }">
							</div>
							<div id="weekDiv" style="display: none;">
								<input type="text" name="weekView" style="width:8.5rem;"readonly>
								<input type="date" name="keyword" value="${cri.searchType2 eq 'week' ? keyword : '' }">
							</div>
							<div id="monthDiv" style="display: none;">
								<input type="text" name="monthView" value=""  style="width:8.5rem;"readonly>
								<input type="date" name="keyword" value="${cri.searchType2 eq 'month' ? keyword : '' }">
							</div>
						</div>
						<div class="text-center">
							<button type="button" id="searchBtn" class="bc_dw_black">조회</button>
						</div>
					</div>
					<div class="col-md-6" style="text-align: -webkit-center;">
						<div style="width:400px; hegiht:400px;">
						  <canvas class="sales_yesterday_chart"></canvas>
						</div>
					</div>
					<div class="col-md-6" style="text-align: -webkit-center;">
						<div style="width:400px; hegiht:400px;">
						  <canvas class="sales_all_chart"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div id="searchResultDiv" style="margin-top: 2rem;">
				<h3>2023년 8월 7일</h3>
				<table class="table table-bordered" style="font-size: small;">
					<thead class="table-light text-center">
						<tr>
							<th>순위</th>
							<th>영화명</th>
							<th>개봉일</th>
							<th>매출액</th>
							<th>매출액점유율</th>
							<th>누적매출액</th>
							<th>관객수</th>
							<th>누적관객수</th>
							<th>누적상영횟수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${movieList }" var="movie">
						<tr class="text-end">
							<c:set var="i" value="${i+1 }" />
							<th class="text-center">${i }</th>
							<td class="text-center">${movie.MOVIE_NAME }</td>
							<td class="text-center"><fmt:formatDate value="${movie.OPENDATE }" pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatNumber value="${movie.SALES_YESTERDAY }" pattern="#,###" /></td>
							<td>${movie.SALES_YESTERDAY / (movie.SALES_ALL_YESTERDAY == 0 ? 1 : movie.SALES_ALL_YESTERDAY)}</td>
							<td><fmt:formatNumber value="${movie.SALES_ALL}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${movie.SEAT_YESTERDAY }" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${movie.SEAT_ALL }" pattern="#,###" /></td>
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
	<%@ include file="../common/pagination.jsp" %>
</div>



<script>
let searchFormUrl = "/sysAdmin/movieAdminStatistics.do";
$(function(){
	
	const movieList = new Array();
	<c:forEach items="${movieList}" var="movie">
		<c:if test="${movie.SALES_YESTERDAY ne 0}">
			movieList.push({
				name : "${movie.MOVIE_NAME}",
				sales_yesterday : "${movie.SALES_YESTERDAY}",
				sales_all : "${movie.SALES_ALL}"
			});
		</c:if>
	</c:forEach>
	
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
	const movieSales_yesterday_List = movieList.map(function(e){
		return e.sales_yesterday
	});
	const movieSales_all_List = movieList.map(function(e){
		return e.sales_all
	});
	
	const ctx = $('.sales_yesterday_chart');
	const ctx2 = $('.sales_all_chart');
	
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
	
	let chart_config_yesterday = {
		    type: 'pie',
		    data:  {
					  labels: movieNameList,
					  datasets: [{
					    label: 'My First Dataset',
					    data: movieSales_yesterday_List,
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
	
	let chart_config_all = {
		    type: 'pie',
		    data:  {
					  labels: movieNameList,
					  datasets: [{
					    label: 'My First Dataset',
					    data: movieSales_all_List,
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
				    	  text: '총 매출액',
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
	
	new Chart(ctx, chart_config_yesterday);
	new Chart(ctx2, chart_config_all);
	
	
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
		$('#weekDiv input[name="weekView"]').val(year +"년 " + month + "월 " + week + "주차");
	}
	
	// 월별일때 input text value값 자동 넣어지게
	function setMonthView(date) {
		let month = date.getMonth() + 1;
		let year = date.getFullYear();
		$('#monthDiv input[name="monthView"]').val(year + "년 " + month + "월");
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
	
	// 검색 날짜 설정 방법 radio 클릭시
	$('input[name="howlong"]').on('click', function(){
		$('div.howlongDiv div').hide();
		$('div#'+$(this).attr('data-type')).show();
		$('.howlongDiv input[name="keyword"]').val(yesterday_toString);
		$('.howlongDiv input[type="text"]').val('');
		if ($(this).attr('data-type') == 'dayDiv') {
			
		} else if ($(this).attr('data-type') == 'weekDiv') {
			setWeekView(yesterday);
		} else if ($(this).attr('data-type') == 'monthDiv') {
			setMonthView(yesterday);
		}
	});
	
	// 일별 날짜 설정시
	$('#dayDiv input[name="keyword"]').on('change', function(){
		console.log($(this).val());
		$('#searchForm input[name="keyword"]').val($(this).val());
	});

	// 주간별 날짜 설정시
	$('#weekDiv input[name="keyword"]').on('change', function(){
		let date = new Date($(this).val());
		setWeekView(date);
	});
	
	// 월별 날짜 설정시
	$('#monthDiv input[name="keyword"]').on('change', function(){
		let date = new Date($(this).val());
		setMonthView(date);
	});
	
	$('#searchBtn').on('click', function(){
		$('form#searchForm input[name="searchType2"]').val($('input[name="howlong"]:checked').attr('id'));
		console.log($('#searchForm input[name="searchType2"]').val());
		let div = $('input[name="howlong"]:checked').attr('data-type');
		$('.howlongDiv div').not('#'+div).remove();
		searchList_go(1);
	});
});
</script>
<%@ include file="sysAdminFooter.jsp" %>