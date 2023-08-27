<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="thrAdminHeader.jsp" %>
<style>
#content h2 {
	margin: 30px 0 0 0;
	position: static;
	letter-spacing: 0;
	padding: 0;
}
.movieRow {
	margin : 0.5rem 1rem 0.5rem 1rem;
	cursor: pointer;
}
.dayTableTd {
	cursor: pointer;
}
.dayTableTd:hover {
	background-color: #e9ecef;
	color: black;
}
th.selectedDate {
	background-color: #4aa8d8;
	color: white;
}
.screenBox {
	position : absolute;
	display : inline-block;
	margin : 0;
	height: 100%;
	line-height : 35px;
	text-align : center;
	border : 1px solid #4aa8d8;
	background-color : #e9ecef;
	cursor : pointer;
}
.modifyBox {
	background-color: #4aa8d8;
}
.nameBox {
	white-space:nowrap;
	overflow: hidden;
}
.addedBox {
	background-color : #ffe4b5;
}
.selected {
	background-color : #ffe4b5;
}
.cantBeAdded {
	background-color: #ef4836;
}
.hided {
	display : none;
}
.bi {
	cursor: pointer;
}
.bi:hover {
	color: #4aa8d8;
}
#content h2 {
	margin: 30px 0 0;
	position: relative;
	font-size: 16px;
	font-weight: 600;
	letter-spacing: -1px;
	line-height: 1em;
	padding: 0 0 10px 10px;
}

#content h2:before {
	display: inline-block;
	position: absolute;
	left: 0;
	top: 0;
	width: 4px;
	height: 16px;
	background: #1a4e99;
	content: '';
}
</style>
<c:set var="cri" value="${pageMaker.cri }" />
<%@ include file="movieAdminMain_Modal.jsp" %>
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
		<div class="row mx-3 my-2">
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
						<div class="card card-body movieRow unselected" style="height: 5rem;">
							<div class="row" style="align-items: center;">
								<div class="col-md-2 movieRowPic"><img src="<%=request.getContextPath() %>/common/getPicture.do?name=${movie.MOVIE_MAINPIC_PATH}&item_cd=${movie.MOVIE_CD}&type=moviePoster" style="width:2rem; height:3rem; overflow: hidden;"></div>
								<div class="col-md-4 movieRowCd">${movie.MOVIE_CD }</div>
								<div class="col-md-6 movieRowName">${movie.MOVIE_NAME }</div>
								<input type="hidden" class="movieRowDates" value="<fmt:formatDate value='${movie.OPENDATE }' pattern='yyyy-MM-dd'/> ~ <fmt:formatDate value='${movie.ENDDATE }' pattern='yyyy-MM-dd'/>">
								<input type="hidden" class="movieLength" value="${movie.MOVIE_LENGTH }">
								<input type="hidden" class="movieType" value="${movie.MOVIE_TYPE_CD }">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-6">
				<div>
					<h2>영화 상세 정보</h2>
				</div>
				<div style="height: 20rem; ">
					<table class="table table-bordered mt-3 text-center" style="height:75%; vertical-align: middle;">
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
					<table class="table table-bordered text-center" style="height: 20%; vertical-align: middle;">
						<tr>
							<th style="width:20%;">상영관</th>
							<td style="width:30%;">
								<select id="startHouse" style="width:5rem;">
									<c:forEach items="${houseList }" var="house">
										<option value="${house.HOUSE_NO }">${house.HOUSE_NAME }</option>
									</c:forEach>
								</select>
							</td>
							<th style="width:20%;">상영타입<br>(자막,3D)</th>
							<td style="width:30%;">
								<div class="row" id="movieTypeTd">
								</div>
							</td>
						</tr>
						<tr>
							<th>상영시작시간</th>
							<td>
								<select id="startHour">
									<c:forEach var="i" begin="7" end="26">
											<c:choose>
											<c:when test="${i < 10 }">
												<option value="0${i }">
												0${i }시
												</option>
											</c:when>
											<c:when test="${i > 24 }">
												<option value="${i }">
												0${i - 24 }시
												</option>
											</c:when>
											<c:otherwise>
												<option value="${i }">
												${i }시
												</option>
											</c:otherwise>											
											</c:choose>
									
									</c:forEach>
								</select>
								<select id="startMinute">
									<c:forEach var="i" begin="0" end="5">
										<option value="${i }0">${i }0분</option>
									</c:forEach>
								</select>
							</td>
							<th>상영종료시간</th>
							<td id="endTimeTd"></td>
						</tr>
					</table>
					<div class="text-center">
						<button type="button" class="bc_dw_blue" id="addNewScreenBtn" style=" border: none; padding: 0.3rem 0.8rem;">등록</button>
						<button type="button" class="bc_dw_blue" id="modifyScreenBtn" style="display:none; border: none; padding: 0.3rem 0.8rem;">수정</button>
						<button type="button" class="bc_dw_orange" id="deleteScreenBtn" style="display:none; border: none; padding: 0.3rem 0.8rem;">삭제</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row mx-3 mt-5">
			<div class="col-md-12">
				<div class="mb-3">
					<h2>상영시간표</h2>
				</div>
				<div style="overflow: auto; white-space: nowrap;">
					<table class="table table-bordered" style="width:2000px; overflow: hidden;">
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
				</div>
			</div>
		</div>
		
	</div>
</div>
<input type="hidden" class="screen_cd">
<form role="form" method="post" style="display: none;" id="submitForm">
	<input type="hidden" name="movie_cd" value="">
	<input type="hidden" name="startdate" value="">
	<input type="hidden" name="movie_type_cd" value="" id="movieTypeCd">
	<input type="hidden" name="house_no" value="0">
	<input type="hidden" name="screen_cd" value="">
</form>

<%@ include file="movieAdminMain_js.jsp"%>
<%@ include file="thrAdminFooter.jsp"%>