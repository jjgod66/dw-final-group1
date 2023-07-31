<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp" %>
<style>
#wrapper {
    background-color: #fff;
    z-index: 5;
    min-width: 1210px;
    zoom: 1;
}
#content {
	max-width: 80rem;
	margin : 2rem auto 2rem auto;
    padding-bottom: 100px;
    border: 1px solid #ccc;
}
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
.btn_ssmall, .btn_small, .btn_lsmall, .btn_medium, .btn_large {
    background: #333;
    border: 1px solid #333;
    color: #fff !important;
}
.btn_medium {
    padding: 8px 15px;
    font-size: 13px;
    line-height: 1.444;
    font-weight: 600;
}
.eventTypeHeader .typeName {
	font-size : 1.5rem;
	font-weight : bold;
}
.moreBtn {
	cursor: pointer;
}
.movieRow {
	margin : 0.5rem 1rem 0.5rem 1rem;
	cursor: pointer;
}
.dayTableTd {
	cursor: pointer;
}
th.selected {
	background-color: #4aa8d8;
	color: white;
}
.tooltipDiv {
 	display: none;
	position: relative;
	width: 100%;
	max-width: 10rem;
	margin: auto;
	height: 5rem;
	top: 0.6rem;
	background-color : #4aa8d8;
	color : white;
}
.triangle {
	position: absolute;
 	display : none; 
	width: 0;
	height: 0;
	border-top : 0.5rem solid transparent;
	border-left : 0.5rem solid transparent;
	border-right : 0.5rem solid transparent;
	border-bottom : 0.5rem solid #4aa8d8;
	top : -0.95rem;
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
		<div class="row mx-3 text-center mb-3">
			<div class="col text-end" style="font-size: 2rem;">
				<i class="bi bi-caret-left-square" id="prevWeekBtn"></i>
			</div>
			<div class="col-md-10">
				<table class="table table-bordered" id="dayTable" style="width: 100%;">
					<tr id="dayTableRow">
					</tr>
				</table>
			</div>
			<div class="col text-start" style="font-size: 2rem;">
				<i class="bi bi-caret-right-square" id="nextWeekBtn"></i>
			</div>
		</div>
		<div class="row mx-3">
			<div class="col-md-6">
				<div class="mb-2">
					<h2>상영 가능 영화</h2>
				</div>
				<div class="mb-2 ms-3" style="display: inline-block; width:90%;">
					<input type="text" class="form-control" id="searchMovieName">
				</div>
				<div style="display: inline-block"><i class="bi bi-search" style="font-size: 1.5rem;" id="searchMovieNameBtn"></i></div>
				
				<div class="movieRowList" style="height: 20rem; overflow: auto; border: 1px solid #4aa8d8">
					<c:forEach items="${movieList }" var="movie">
						<div class="card card-body movieRow" style="height: 5rem;">
							<div class="row" style="align-items: center;">
								<div class="col-md-2 movieRowPic"><img src="getPicture.do?name=${movie.MOVIE_MAINPIC_PATH}&item_cd=${movie.MOVIE_CD}&type=moviePoster" style="width:2rem; height:3rem; overflow: hidden;"></div>
								<div class="col-md-4 movieRowCd">${movie.MOVIE_CD }</div>
								<div class="col-md-6 movieRowName">${movie.MOVIE_NAME }</div>
								<input type="hidden" class="movieRowDates" value="<fmt:formatDate value='${movie.OPENDATE }' pattern='yyyy-MM-dd'/> ~ <fmt:formatDate value='${movie.ENDDATE }' pattern='yyyy-MM-dd'/>">
								<input type="hidden" class="movieLength" value="${movie.MOVIE_LENGTH }">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-6">
				<div class="mb-5">
					<h2>영화 상세 정보</h2>
				</div>
				<div style="height: 20rem; ">
					<table class="table table-bordered mt-3 text-center" style="height:90%; vertical-align: middle;">
						<tr>
							<td rowspan="4" style="width:30%" id="movieRowPic"> </td>
							<th style="width:20%;">영화명</th>
							<td id="movieRowName"> </td>
						</tr>
						<tr>
							<th>영화코드</th>
							<td id="movieRowCd"> </td>
						</tr>
						<tr>
							<th>상영기간</th>
							<td id="movieRowDates"> </td>
						<tr>
							<th>러닝타임</th>
							<td id="movieLength"> </td>
						</tr>						
					</table>
				</div>
			</div>
		</div>
		<div class="row mx-3 mt-3">
			<div class="col-md-12">
				<div>
					<h2>상영시간표</h2>
				</div>
				<div style="overflow: auto; white-space: nowrap;">
					<table class="table table-bordered" style="width:2000px;">
						<tr>
							<th>시간</th>
							<th>07:00</th>
							<th>08:00</th>
							<th>09:00</th>
							<th>10:00</th>
							<th>11:00</th>
							<th>12:00</th>
							<th>13:00</th>
							<th>14:00</th>
							<th>15:00</th>
							<th>16:00</th>
							<th>17:00</th>
							<th>18:00</th>
							<th>19:00</th>
							<th>20:00</th>
							<th>21:00</th>
							<th>22:00</th>
							<th>23:00</th>
							<th>24:00</th>
							<th>01:00</th>
							<th>02:00</th>
						</tr>
						<c:forEach items="${houseList}" var="house">
							<tr>
								<th>${house.HOUSE_NAME }</th>
								<td class="timetableRow" colspan="20" data-houseNO="${house.HOUSE_NO }" style="position: relative; padding: 0;"></td>
							</tr>
						</c:forEach>
					</table>
					<button data-bs-toggle="popover" data-bs-title="Popover title" data-bs-content="And here's some amazing content. It's very engaging. Right?">button</button>
				</div>
			</div>
		</div>
		
	</div>
</div>
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
		$('.dayTableTd[data-date="${today}"]').addClass('selected');
	} else {
		$('.dayTableTd:eq(0)').addClass('selected');
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
		let movieName = $(this).find('.movieRowName').text();
		let movieCd = $(this).find('.movieRowCd').text();
		let movieLength = $(this).find('.movieLength').val() + "분";
		let movieDates = $(this).find('.movieRowDates').val();
		let moviePic = $(this).find('.movieRowPic').html();
		
		$('#movieRowName').text(movieName);
		$('#movieRowCd').text(movieCd);
		$('#movieLength').text(movieLength);
		$('#movieRowDates').text(movieDates);
		$('#movieRowPic').html(moviePic);
		$('#movieRowPic img').css({'width' : '10rem', 'height' : '14rem'});
	});
	
	// 영화 검색시
	$('#searchMovieName').on('keyup', function(){
		let inputText = $(this).val();
		$('.movieRow').hide();
		$('.movieRowCd:contains("'+inputText+'")').closest('.movieRow').show();
		$('.movieRowName:contains("'+inputText+'")').closest('.movieRow').show();
	});
	
	var openTime = new Date();
	openTime = new Date(openTime.getFullYear(), openTime.getMonth(), openTime.getDate(), 7, 0)
	openTime = openTime.getTime();
	
	let testDiv = '';
	let divLength = '';
	let divLengthRatio = '';
	let divX = '';
	let toolTipDiv = '';
	<c:forEach items="${screenList}" var="screen">
		testDiv = $('<div class="screenBox">');
		toolTipDiv = $('<div class="tooltipDiv card card-body"><div class="triangle"></div><div>${screen.MOVIE_NAME}</div><div><fmt:formatDate value="${screen.STARTDATE}" pattern="kk:mm"/></div></div>')
		testDiv.append('${screen.MOVIE_NAME}');
		divLength = ('${screen.MOVIE_LENGTH}' / (20 * 60)) * 100;
		divLengthRatio = Math.floor(divLength*10) / 10;
		divX = (new Date("${screen.STARTDATE}").getTime() - openTime) / (60 * 1000);
		divX = (divX / (60 * 20)) * 100; 
		console.log(divX);
		testDiv.css({'position' : 'absolute',
					 'display' : 'inline-block',
					 'margin' : '0',
					 'left' : divX+'%',
					 'width' : divLengthRatio+'%',
					 'height': '100%',
					 'line-height' : '35px',
					 'text-align' : 'center',
					 'border' : '1px solid #4aa8d8',
					 'background-color' : '#e9ecef',
					 'cursor' : 'pointer'
					 });
		testDiv.append(toolTipDiv);

		$('.timetableRow[data-houseNo="${screen.HOUSE_NO}"]').append(testDiv);
	</c:forEach>
	
	$('.screenBox').on('mouseover mouseleave', function(){
		$(this).find('.tooltipDiv').toggle();
		$(this).find('.triangle').toggle();
	});
</script>
<%@ include file="thrAdminFooter.jsp"%>