<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp"%>

<style>
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
.memberTable th {
	background-color: #808080;
	color: white;
	text-align : center;
}
.table-striped th {
	text-align : center;
}
#content h2 {
	margin: 30px 0 0 0;
	position: static;
	letter-spacing: 0;
	padding: 0;
}
.tbl_frm01 {
	margin : 0;
}
.tbl_frm01 td{
	text-align : center;
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
				<h2 class="mb-2">회원 정보</h2>
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
												<img alt="...." src="/common/getPicture.do?name=${MEM_PIC_PATH }&item_cd=${MEM_CD}&type=memberPic" class="profileImg">
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
								<col class="w80">
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
									<tr><th scope="row" colspan="5">작성 글이 없습니다.</th></tr>
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
									<tr><th scope="row" colspan="4">작성 글이 없습니다.</th></tr>
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