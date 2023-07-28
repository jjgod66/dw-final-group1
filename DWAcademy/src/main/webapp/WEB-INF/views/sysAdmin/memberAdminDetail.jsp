<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp"%>
<style>
#wrapper {
	background-color: #fff;
	z-index: 5;
	min-width: 1210px;
	zoom: 1;
}

#snb {
	float: left;
	width: 204px;
	background: #fff;
	zoom: 1;
}

#snb .snb_header {
	height: 100px;
	text-align: center;
}

#snb .snb_header h2 {
	padding: 18px 0 10px 0;
	font-size: 20px;
	letter-spacing: -1px;
}

#snb .snb_header h2 i {
	height: 36px;
	font-size: 30px;
	color: #888;
	display: block;
}

.fa-truck:before {
	content: "\f0d1";
}

#snb dl {
	margin-bottom: 100px;
}

#snb dt {
	background: #f6f6f6 url(/admin/img/sflex_icon.png) 174px -302px
		no-repeat;
	border-top: 1px solid #cfcfcf;
	padding: 0 0 0 17px;
	font-size: 12px;
	line-height: 2.8;
	font-weight: 600;
	vertical-align: middle;
	cursor: pointer;
}

#snb dd {
	display: block;
	position: relative;
}



#snb dd a {
	display: block;
	padding: 7px 0 7px 17px;
	text-decoration: none;
	background: #fff;
	color: #555;
	vertical-align: middle;
}

#snb:after {
	display: block;
	visibility: hidden;
	clear: both;
	content: "";
}

#content {
	max-width: 80rem;
	margin : 2rem auto 2rem auto;
    padding-bottom: 100px;
    border: 1px solid #ccc;
}
.breadcrumb {
	padding: 0 0 0 25px;
	color: #000;
	line-height: 34px;
	border-bottom: 1px solid #e9e9e9;
	text-align: left;
}

.breadcrumb span {
	font-weight: 400;
}

.breadcrumb .ionicons {
	margin: 0 7px 1px;
	vertical-align: middle;
}

.ion-ios-arrow-right:before {
	content: "\f3d3";
}

.s_wrap {
	margin: 30px 25px;
}

#content h1 {
	margin: 0 0 20px;
	padding-bottom: 15px;
	border-bottom: 1px solid #888;
	font-size: 20px;
	line-height: 1em;
	letter-spacing: -1px;
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

form {
	margin: 0;
}

input, textarea {
	box-sizing: border-box;
	border-radius: 0;
	background: none;
}

.tbl_frm01 {
	border-top: 1px solid #888;
}

.tbl_frm01 table {
	width: 100%;
}

.w100 {
	width: 100px !important;
}

.tbl_frm01 th {
	font-weight: 600;
}

.tbl_frm01 th, .tbl_frm01 td {
	padding: 8px 14px;
	height: 23px;
	border-bottom: 1px solid #e4e5e7;
	text-align: left;
	vertical-align: middle;
}

select {
	font-size: 12px;
	height: 23px;
	padding: 1px;
	border: 1px solid #ccc;
	background: #fff;
}

.frm_input {
	padding: 0 4px 1px 4px;
	font-size: 12px;
	font-weight: normal;
	border: 1px solid #ddd;
	background-color: #fff;
	border-radius: 0;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
}

.sound_only {
	display: inline-block !important;
	position: absolute;
	top: 0;
	left: 0;
	margin: 0 !important;
	padding: 0 !important;
	font-size: 0;
	line-height: 0;
	border: 0 !important;
	overflow: hidden !important;
}

.btn_group {
	position: static !important;
	margin: 0;
	padding: 0;
}

.btn_group .btn_small:first-child {
	margin-left: 0 !important;
}

/* .white, .white:active {
	background: #fff;
	border: 1px solid #ccc;
	color: #181c1f !important;
} */

.btn_small {
	padding: 2px 8px;
	font-size: 11px;
	line-height: 1.555;
	font-weight: normal !important;
}

.btn_confirm {
	margin-top: 20px;
	text-align: center;
}

.btn_confirm a, .btn_confirm input, .btn_confirm button {
	margin: 0 1.5px;
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

.grey {
	background: #888;
	border: 1px solid #888;
	color: #fff !important;
}

.local_ov {
	margin: 0;
	padding: 10px;
	border-top: 1px solid #aeaeae;
}

.mart30 {
	margin-top: 30px !important;
}

.fc_red {
	color: #ec0e03 !important;
}

.local_frm01 {
	border-top: 1px solid #ececec;
}

.local_frm01, .local_frm02 {
	overflow: hidden;
	margin: 0;
	padding: 7px 10px;
	background: #fcfcfc;
}

.bx-white {
	background: #fff;
	border: 1px solid #ccc;
	color: #222 !important;
}

.btn_lsmall {
	padding: 3px 10px;
	font-size: 12px;
	line-height: 1.666;
	font-weight: normal !important;
}

.tbl_head01 {
	border-top: 1px solid #aeaeae;
	border-bottom: 1px solid #e4e5e7;
}

.tbl_head01 table {
	width: 100%;
}

.w50 {
	width: 50px !important;
}

.w80 {
	width: 80px !important;
}

.w100 {
	width: 100px !important;
}

.w130 {
	width: 130px !important;
}
.w130 {
	width: 140px !important;
}

.w300 {
	width: 300px !important;
}

thead, tfoot {
	font-size: 12px;
	line-height: 1em;
	vertical-align: baseline;
}

.tbl_head01 th {
	padding: 8px 10px;
	line-height: 1em;
	font-weight: 600;
	background: #f1f1f1;
}

.list0 {
	background-color: #ffffff !important;
}

.tbl_head01 td {
	height: 22px;
	padding: 8px 8px;
	line-height: 1.6em;
	border-top: 1px solid #e4e5e7;
}

.tbl_head01 th, .tbl_head01 td {
	border-left: 1px solid #e4e5e7;
	text-align: center;
	vertical-align: middle;
}
.btn_large {
    padding: 10px 21px;
    font-size: 15px;
    line-height: 1.222;
    font-weight: 600;
}
#snb dd.active a {
    font-weight: 600;
    color: #fa2828 !important;
    background: #eeeeee !important;
}
.tablef th {
	text-align : center;
}
.tablef td {
	text-align : center;
}
.imgDiv {
	width: 80px;
	height: 80px;
	border-radius : 70%;
	overflow: hidden;
}
.profileImg {
	width : 100%;
	height : 100%;
	object-fit : cover;
}
.moreBtn {
	cursor: pointer;
}
.memberTable th {
	background-color: #808080;
	color: white;
	
} 
</style>
<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		
		<div class="s_wrap">
				<h2>회원 정보</h2>
				<div class="tbl_frm01">
					<table class="tablef memberTable">
						<colgroup>
							<col class="w150">
							<col>
							<col class="w150">
							<col>
							<col class="w150">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>프로필이미지</th>
								<td>
									<c:choose>
										<c:when test="${empty MEM_PIC_PATH }">
											등록된 프로필사진이 없습니다.
										</c:when>
										<c:otherwise>
											<div class="imgDiv" style="margin: auto;">
												<img alt="...." src="getPicture.do?name=${MEM_PIC_PATH }&item_cd=${MEM_CD}&type=memberPic" class="profileImg">
											</div>
										</c:otherwise>
									</c:choose>
								</td>
								<th scope="row">회원코드</th>
								<td>${MEM_CD }</td>
								<th scope="row">회원아이디</th>
								<td>${MEM_ID }</td>
							</tr>
							<tr>
								<th scope="row">회원이름</th>
								<td>${MEM_NAME }</td>
								<th scope="row">생년월일</th>
								<td><fmt:formatDate value="${MEM_BIR }" pattern="yyyy-MM-dd" /></td>
								<th scope="row">전화번호</th>
								<td>${MEM_PHONE }</td>
							</tr>
							
							<tr>
								<th scope="row">이메일</th>
								<td>${MEM_EMAIL }</td>
								<th scope="row">주소</th>
								<td colspan="3">${MEM_ADDR } ${MEM_ADDR_DETAIL }</td>
							</tr>
							<tr>
								<th scope="row">가입일자</th>
								<td><fmt:formatDate value="${REGDATE }" pattern="yyyy-MM-dd" /></td>
								<th scope="row">마지막로그인날짜</th>
								<td><fmt:formatDate value="${LASTLOGINDATE }" pattern="yyyy-MM-dd" /></td>
								<th scope="row">휴면여부</th>
								<td>${GB_SLEEP }</td>
							</tr>
							<tr>
								<th scope="row">무비포스트<br>신고 누적 횟수</th>
								<td>${MPR_CNT }</td>
								<th scope="row">무비포스트 댓글<br>신고 누적 횟수</th>
								<td>${MRR_CNT }</td>
								<th scope="row">관람평<br>신고 누적 횟수</th>
								<td>${RVR_CNT }</td>
							</tr>
							<tr>
								<th scope="row">블랙여부</th>
								<td>${GB_BAN }</td>
								<th scope="row">정지날짜</th>
								<td>${empty STOPDATE ? '-' : STOPDATE }</td>
								<th scope="row">SMS 알림여부</th>
								<td>${GB_SMS_ALERT }</td>
							</tr>
							<tr>
								<th scope="row">삭제여부</th>
								<td>${GB_DEL }</td>
								<th scope="row">삭제날짜</th>
								<td>${empty DELDATE ? '-' : DELDATE }</td>
								<th scope="row">이메일 알림여부</th>
								<td>${GB_EMAIL_ALERT }</td>
							</tr>
							<tr>
								<th scope="row">선호장르</th>
								<td colspan="2">${GENRE_LIKE }</td>
								<th scope="row">선호영화관</th>
								<td colspan="2">${THR_LIKE }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col">
						<h2 style="display: inline-block;">영화관람내역</h2>
						<div style="display: inline-block; margin-top: 30px; float: right;" id="moreWatchedMovieBtn" class="moreBtn">더보기></div>
					</div>
					<div class="col">
						<h2 style="display: inline-block;">관람평</h2>
						<div style="display: inline-block; margin-top: 30px; float: right;" id="moreReviewBtn" class="moreBtn">더보기></div>
					</div>
				</div>
				<div class="tbl_frm01 row">
					<div class="col-md-6">
						<h3></h3>
						<table class="tablef table table-striped mt-2">
							<colgroup>
								<col>
								<col class="w150">
								<col class="w100">
								<col class="w130">
							</colgroup>
							<thead class="table-dark">
									<tr>
										<th>영화제목</th>
										<th>관람권</th>
										<th>결제금액</th>
										<th>관람일자</th>
									</tr>								
							</thead>
							<tbody>
								<c:if test="${empty watchedMovieList}">
									<tr><th scope="row" colspan="4">관람 영화내역이 없습니다.</th></tr>
								</c:if>
								<c:forEach items="${watchedMovieList}" var="movie">
									<tr>
										<th scope="row">${movie.MOVIE_NAME }</th>
										<td>${movie.MEMLIST }</td>
										<td><fmt:formatNumber value="${movie.PAID_AMOUNT }" pattern="#,###" />원</td>
										<td><fmt:formatDate value="${movie.STARTDATE }" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-md-6">
						<h3></h3>
						<table class="tablef table table-striped mt-2">
							<colgroup>
								<col>
								<col class="w50">
								<col class="w80">
								<col class="w80">
								<col class="w130">
							</colgroup>
								<thead class="table-dark">
									<tr>
										<th>영화제목</th>
										<th>평점</th>
										<th>공감수</th>
										<th>신고수</th>
										<th>작성일자</th>
									</tr>
								</thead>								
							<tbody>
								<c:if test="${empty reviewList}">
									<tr><th scope="row" colspan="4">작성 글이 없습니다.</th></tr>
								</c:if>
								<c:forEach items="${reviewList}" var="review">
									<tr>
										<th scope="row">${review.MOVIE_NAME }</th>
										<td><span class="badge" style="background-color : #4aa8d8;">${review.REVIEW_RATING }</span></td>
										<td><b>${review.LIKECNT }</b></td>
										<td><b style="color : red;">${review.REPORTCNT }</b></td>
										<td><fmt:formatDate value="${review.REGDATE }" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h2 style="display: inline-block;">무비포스트</h2>
						<div style="display: inline-block; margin-top: 30px; float: right;" id="moreMpBtn" class="moreBtn">더보기></div>
					</div>
					<div class="col-md-6">
						<h2 style="display: inline-block;">무비포스트 댓글</h2>
						<div style="display: inline-block; margin-top: 30px; float: right;" id="moreMpReplyBtn" class="moreBtn">더보기></div>
					</div>
				</div>
				<div class="tbl_frm01 row">
					<div class="col-md-6">
						<h3></h3>
						<table class="tablef table table-striped mt-2">
							<colgroup>
								<col>
								<col class="w80">
								<col class="w80">
								<col class="w130">
							</colgroup>
							<thead class="table-dark">
									<tr>
										<th>영화제목</th>
										<th>공감수</th>
										<th>신고수</th>
										<th>작성일자</th>
									</tr>			
							</thead>					
							<tbody>
								<c:if test="${empty mpList}">
									<tr><th scope="row" colspan="3">작성 글이 없습니다.</th></tr>
								</c:if>
								<c:forEach items="${mpList}" var="mp">
									<tr>
										<th scope="row">${mp.MOVIE_NAME }</th>
										<td><b>${mp.LIKECNT }</b></td>
										<td><b style="color : red;">${mp.REPORTCNT }</b></td>
										<td><fmt:formatDate value="${mp.REGDATE }" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-md-6">
						<h3></h3>
						<table class="tablef table table-striped mt-2">
							<colgroup>
								<col>
								<col class="w80">
								<col class="w130">
							</colgroup>
							<thead class="table-dark">
									<tr>
										<th>영화제목</th>
										<th>신고수</th>
										<th>작성일자</th>
									</tr>				
							</thead>				
							<tbody>
								<c:if test="${empty mpReplyList}">
									<tr><th scope="row" colspan="3">작성 글이 없습니다.</th></tr>
								</c:if>
								<c:forEach items="${mpReplyList}" var="reply">
									<tr>
										<th scope="row">${reply.MOVIE_NAME }</th>
										<td><b style="color : red;">${reply.REPORTCNT }</b></td>
										<td><fmt:formatDate value="${reply.REGDATE }" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn_confirm">
					<c:choose>
						<c:when test="${GB_BAN eq 'Y'}">
							<button type="button" id="cancelBanBtn" class="btn_large" style="border: 1px solid red; background-color: red;">정지해제</button>
						</c:when>
						<c:otherwise>
							<button type="button" id="banBtn" class="btn_large" style="border: 1px solid red; background-color: red;">정지</button>
						</c:otherwise>
					</c:choose>
					<button type="button" id="cancelBtn" class="btn_large">뒤로가기</button>
				</div>
				<input type="hidden" value="" id="thr_y" name="thr_y">
				<input type="hidden" value="" id="thr_x" name="thr_x">
		</div>
	</div>
</div>

<script>
	$('#moreWatchedMovieBtn').on('click', function(){
		let url = 'memberAdminWatchedMovieList.do?mem_cd=${MEM_CD}';
		OpenWindow(url, '회원 관람내역 리스트', 1200, 700);
	});
	
	$('#moreReviewBtn').on('click', function(){
		let url = 'memberAdminReviewList.do?mem_cd=${MEM_CD}';
		OpenWindow(url, '회원 관람평 리스트', 1200, 700);
	});
	
	$('#moreMpBtn').on('click', function(){
		let url = 'memberAdminMoviepostList.do?mem_cd=${MEM_CD}';
		OpenWindow(url, '회원  무비포스트 리스트', 1000, 700);
	});
	
	$('#moreMpReplyBtn').on('click', function(){
		let url = 'memberAdminMoviepostReplyList.do?mem_cd=${MEM_CD}';
		OpenWindow(url, '회원 무비포스트 댓글 리스트', 800, 700);
	});
	
	$('#banBtn').on('click', function(){
		if(confirm('정말 해당 회원을 정지하시겠습니까?')) {
			location.href='memberAdminBan.do?mem_cd=${MEM_CD}';
		}
	});
	
	$('#cancelBanBtn').on('click', function(){
		if(confirm('정말 해당 회원의 정지상태를 해제하시겠습니까?')) {
			location.href='memberAdminCancelBan.do?mem_cd=${MEM_CD}';
		}
	});
	
	$('#cancelBtn').on('click', function(){
		location.href='memberAdminMain.do';
	});
</script>


<%@ include file="sysAdminFooter.jsp"%>