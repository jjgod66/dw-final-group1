<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.dw.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/boxoffice.css">
<style>
.board-search {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    width: 230px;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
}
.board-search .btn-search-input {
    position: absolute;
    right: 1px;
    top: 1px;
}

.btn-search-input {
    overflow: hidden;
    width: 30px;
    height: 32px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
    text-indent: -9999px;
    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-search-input.png) no-repeat center;
}
select {
    overflow: hidden;
    height: 34px;
    border: 1px solid #d8d9db;
}

.btn-mp-write{
	color : #fff;
	background-color: #4aa8d8;
	padding : 10px;
	border : solid 1px #4aa8d8;
	border-radius: 0.375rem;
}
.btn-mp-write:hover{
	color : #4aa8d8;
	background-color: #fff;
}

#mpCard:hover{
	cursor: pointer;
}
/* .post-lank-box { */
/* 	width: 100%; */
/* 	height: 331px; */
/* 	padding: 29px 0 0 0; */
/* 	background: */
/* 		url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-post-top.png) */
/* 		no-repeat center 0 */
/* } */

.post-lank-box p {
	margin: 0;
	padding: 0
}

.post-lank-box .inner-wrap {
	position: relative
}

.post-lank-box .post-lank {
	float: left;
	height: 194px;
	margin: 0 0 0 -58px
}

.post-lank-box .post-lank li {
	position: relative;
	float: left;
	margin-left: 58px
}

.post-lank-box .post-lank li a {
	display: block;
	width: 135px;
	height: 194px
}

.post-lank-box .post-lank li a .img img {
	width: 135px !important;
	height: 194px !important
}

.post-lank-box .post-lank li a .lank {
	position: absolute;
	top: 10px;
	left: 10px;
	z-index: 3;
	font-size: 1.6em;
	line-height: 1em;
	color: #fff;
	font-family: Roboto;
	font-weight: 300;
	font-style: italic
}

.post-lank-box .post-lank li a .post-count {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 2;
	width: 135px;
	height: 194px;
	padding-top: 73px;
	background-color: rgba(0, 0, 0, .6);
	text-align: center
}

.post-lank-box .post-lank li a .post-count .tit {
	font-size: .8667em;
	line-height: 1.1;
	color: #fff
}

.post-lank-box .post-lank li a .post-count .count {
	font-size: 2.1333em;
	font-family: Roboto;
	color: #fff;
	font-weight: 300
}

.post-lank-box .post-lank li a:hover .lank {
	left: -10000px
}

.post-lank-box .post-lank li a:hover .post-count {
	left: -10000px
}

.post-lank-box .mypost-box {
	position: relative;
	float: left;
	width: 135px;
	height: 194px;
	margin: 0 0 0 58px
}

.post-lank-box .mypost-box .lank {
	position: absolute;
	top: 10px;
	left: 10px;
	z-index: 3;
	font-size: 1.6em;
	line-height: 1em;
	color: #fed143;
	font-family: Roboto;
	font-weight: 300;
	font-style: italic
}

.post-lank-box .mypost-box .post-count {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 2;
	width: 135px;
	height: 194px;
	padding-top: 73px;
	background-color: rgba(0, 0, 0, .6);
	text-align: center
}

.post-lank-box .mypost-box .post-count .tit {
	font-size: .8667em;
	line-height: 1.1;
	color: #fff
}

.post-lank-box .mypost-box .post-count .count {
	font-size: 2.1333em;
	color: #fff
}

.post-lank-box .mypost-box .post-count a.txt-login {
	display: inline-block;
	padding: 10px 0 0 0;
	color: #fff;
	border-bottom: 1px solid #fff;
	text-decoration: none
}

.post-lank-box .mypost-box .before {
	width: 100%;
	height: 100%;
	background:
		url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-post-no-login.png)
		no-repeat 0 0
}

.post-lank-box .mypost-box .after {
	width: 100%;
	height: 100%;
	background:
		url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-post-no-login.png)
		no-repeat 0 0
}

.post-lank-box .mypost-box .after a {
	display: block;
	width: 135px;
	height: 100%
}

.post-lank-box .mypost-box .after a .img img {
	width: 135px !important;
	height: 194px !important
}

.post-lank-box .mypost-box .after .txt-info {
	position: absolute;
	left: -10000px;
	top: 0;
	bottom: 0;
	width: 100%;
	padding: 80px 0 0 0;
	text-align: center;
	color: #fff;
	background-color: rgba(0, 0, 0, .6)
}

.post-lank-box .mypost-box .after:hover .lank {
	left: -10000px
}

.post-lank-box .mypost-box .after:hover .post-count {
	left: -10000px
}

.post-lank-box .mypost-box .after:hover .txt-info {
	left: 0
}

.post-lank-box .add-post {
	position: absolute;
	right: 0;
	top: 0
}

.post-lank-box .add-post .button {
	width: 123px;
	padding: 0
}

.postLankMoive:hover .lankcount{
	display: none;
}
.postLankMoive:hover{
	cursor: pointer;
}

</style>
<%@ include file="moviepost_modal.jsp" %>
<%@ include file="moviepost_view_modal.jsp" %>
<%@ include file="login_service_modal.jsp" %>
<%@ include file="moviepost_update_modal.jsp" %>
<%@ include file="mpost_report_modal.jsp" %>
<%@ include file="mpost_delete_modal.jsp" %>
<%@ include file="reply_report_modal.jsp" %>
<%@ include file="reply_delete_modal.jsp" %>
<%@ include file="alert_modal.jsp" %>
<%
	mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		Map member = (Map) session.getAttribute("loginUser");
		mem_cd = (String)member.get("CD");
	}
%>
<c:set var="cri" value="${pageMaker.cri }" />
<div class="sub_visual">
    <h3>무비포스트</h3>
    <h6>Movie Post</h6>
</div>
<div class="sub_visual" style="background-color: white; padding-top: 50px; height: 300px; padding-left: 100px;">
    <div class="row" style="width: 1300px; margin: 0 auto;">
    	<c:forEach items="${top5Moive }" var="movie">
	    	<div class="col-2 postLankMoive" style="position: relative; margin-right: 20px;" data-movie_name="${movie.MOVIE_NAME }">
	    		<div style="width: 180px; height: 250px; position: absolute;" >
	    			<img
								src="<%=request.getContextPath() %>/common/getPicture.do?name=${movie.MOVIE_MAINPIC_PATH}&item_cd=${movie.MOVIE_CD}&type=moviePoster"
								onerror="noImg(this)" alt="${movie.MOVIE_NAME }" style="width: 100%; height: 100%;">
	    		</div>
	    		<div style="width: 180px; height: 250px; position: absolute; background-color:rgba(0, 0, 0, 0.5); color : white;" class="lankcount">
	    			<p class="lank" style="text-align: left; font-size: 30px;">&nbsp;${movie.RNUM }</p>
	
						<div class="post-count">
							<p class="tit" style="font-size: 20px;">POST</p>
							<p class="count" style="font-size: 30px;">${movie.WRITECNT }</p>
						</div>
	    		</div>
	    	</div>
    	</c:forEach>
    </div>
</div>
<div style="width: 100%;">
	<div style="padding: 30px;">
		<div style="width: 1300px; margin: 0 auto;">
			<div style="width: 95%; margin: 0 auto;">
				<div style="margin: 20px 10px 10px 0px; float: left"><input id="moviepostModalBtn" type="button" class="btn-mp-write" value="무비포스트 작성"></div>
				<div style="margin: 20px 0px 10px 10px; float: right; display: flex;">
					<div style="margin: 10px;">
						<span>
							<select name="searchType" id="searchType" onchange="javascript:searchList_go(1);">
											<option value="regdate" ${cri.searchType eq 'regdate' ? 'selected' : '' }>최신순 </option>
											<option value="like" ${cri.searchType eq 'like' ? 'selected' : '' }>공감순 </option>
							</select>
						</span>
					</div>
					<div id="boardSearch" class="inner-wrap" style="margin: 10px;">
						<div class="board-list-util mt0">
							<div class="board-search">
								<input type="text" title="영화 제목을 입력해 주세요." placeholder="영화 제목을 입력해 주세요." name="keyword"
									class="input-text" id="search" value="${cri.keyword }">
								<button type="button" class="btn-search-input" id="searchBtn">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="moviepost_container" style="width: 1300px; margin: 0 auto; display: flex;">
			<c:if test="${empty moviePostList}">
				<div class="" style="padding-bottom: 10px; margin: auto;">
					<div style="text-align: center;">등록된 무비포스트가 없습니다.</div>
				</div>
			</c:if>
			<div class="" style="padding-bottom: 10px;">
				<div class="row">
					<c:forEach items="${moviePostList }" var="mp">
		        		<div class="col-3 post" style="height: 400px; width: 325px;">
		        			<div id="mpCard" class="card" style="margin: 20px; height: 90%;" data-mpost_no="${mp.MPOST_NO }">
		        				<div class="card-body" style="height: 45%; background-image: url('<%=request.getContextPath() %>/common/getPicture.do?name=${mp.MOVIE_PIC_PATH}&item_cd=${mp.MOVIE_CD}&type=movieImg');  background-repeat : no-repeat; background-size : cover;"></div>
		        				<div class="card-body" style="height: 55%;">
		        					<div>
		        						<p style="font-size: small;">
				        					<c:set var="mem_id_post" value="${mp.MEM_ID}" />
									    	${fn:substring(mem_id_post,0,3) }**
							    		</p>
							    	</div>
		        					<br>
		        					<div>${mp.MOVIE_NAME }</div>
		        					<div><p style="font-size: small;">${mp.MPOST_CONTENT }</p></div>
		        					<br>
		        					<div><p style="font-size: x-small;"><fmt:formatDate value="${mp.REGDATE }" pattern="yyyy-MM-dd HH:mm"/> <br><br></p></div>
		        					<div>
		        						<i class="fa-regular fa-thumbs-up">&nbsp;<span id="mpost_like_cnt">${mp.LIKECNT }</span></i>
		        						&nbsp;&nbsp;&nbsp;&nbsp;
		        						<i class="fa-regular fa-message">&nbsp;<span id="mpost_reply_cnt">${mp.REPLYCNT }</span></i>
		        					</div>
		        				</div>
		        			</div>
		        		</div>
	        		</c:forEach>
	        	</div>
	      	</div>
     	</div>
     	<c:if test="${empty moviePostList }">
	     	<div class="mt-5 mb-5 paginationdiv" style="display: none;">
				<%@ include file="../common/pagination.jsp" %>
			</div>
     	</c:if>
     	<c:if test="${!empty moviePostList }">
	     	<div class="mt-5 mb-5 paginationdiv">
				<%@ include file="../common/pagination.jsp" %>
			</div>
     	</c:if>
    </div>
</div>
<script>
let searchFormUrl = "moviePost.do";
mem_cd = "<%=mem_cd%>";
$(function(){
	
	$('.postLankMoive').on('click', function(){
		let movie_name = $(this).data('movie_name');
		$('input[name="keyword"]').val(movie_name);
		searchList_go(1);
	})
	
	$('.moviepost_container').on('click', '#mpCard', function(){
		let mpost_no = $(this).data("mpost_no");
		
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/moviePostView.do',
			method : 'post',
			data : {'mpost_no' : mpost_no},
			success : function(res){
				console.log(res);
				showPost(res);
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
	
	$('#searchBtn').on('click', function(){
		searchList_go(1);
	})
	
	$('#moviepostModalBtn').on('click', function(){
		if(mem_cd == null || mem_cd == ""){
			alert("로그인이 필요한 서비스입니다.");
// 			$('#login-service-modal').modal("show");
			return;
		}
		$('#moviepost-modal').modal("show");
		
	
	})
// 		$.ajax({
<%-- 			url : "<%=request.getContextPath()%>/movie/watchYN.do", --%>
// 			method : 'post',
// 			data : {"movie_cd" : movie_cd},
// 			success : function(res){
// 				console.log(res);
// 				if(res == "non"){
// 					alert("무비포스트는 관람 후 작성 가능합니다.");SELECT COUNT(*)
// 					return;
// 				}else if(res == "write"){
// 					alert("무비포스트는 영화 당 한 개만 작성 가능합니다.");
// 					return;
// 				}
// 			},
// 			error : function(err){
// 				alert(err);
// 			}
// 		})
	
})

function showPost(res){
	if(res.mpost.MEM_CD == mem_cd){
		$('#mpReportBtn').css('display', 'none');
		$('#mpUpdateBtn').css('display', 'inline');
		$('#mpDeleteBtn').css('display', 'inline');
	}else{
		$('#mpReportBtn').css('display', '');
		$('#mpDeleteBtn').css('display', 'none');
		$('#mpUpdateBtn').css('display', 'none');
		
	}
	$('#mpMoiveName').text(res.mpost.MOVIE_NAME);
	$('#mpWriterId').text(res.mpost.MEM_ID.substring(0,3) + '**');
	let date = new Date(res.mpost.REGDATE);
	let yyyy = date.getFullYear();
	let mm = date.getMonth()+1;
	mm = mm >= 10 ? mm : '0'+mm;	// 10 보다 작으면 0을 앞에 붙여주기 ex) 3 > 03
	let dd = date.getDate();
	dd = dd >= 10 ? dd : '0'+dd;	// 10 보다 작으면 9을 앞에 붙여주기 ex) 9 > 09
	let regdate =  yyyy+'-'+mm+'-'+dd;	
	$('#mpWritedate').text(regdate);
	$('#mpContent').text(res.mpost.MPOST_CONTENT);
	$('#mpReportBtn').data('mpost_no', res.mpost.MPOST_NO);
	$('#mpUpdateBtn').data('mpost_no', res.mpost.MPOST_NO);
	$('#mpDeleteBtn').data('mpost_no', res.mpost.MPOST_NO);
	if(res.mpost.MEM_PIC_PATH != null && res.mpost.MEM_PIC_PATH != ''){
		$('#mpWriteMemPic').prop('src', '<%=request.getContextPath() %>/common/getPicture.do?name=' + res.mpost.MEM_PIC_PATH + '&item_cd=' + res.mpost.MEM_CD + '&type=memberPic');
	}else{
		$('#mpWriteMemPic').prop('src', '<%=request.getContextPath()%>/resources/img/defaultprofile.png');
	}
	let mpbackImg = "<%=request.getContextPath() %>/common/getPicture.do?name=" + res.mpost.MOVIE_PIC_PATH + "&item_cd=" + res.mpost.MOVIE_CD + "&type=movieImg";
	$('#thismpPic').css('background-image', 'url(' + mpbackImg + ')');
	$('#moviepost-view-modal').modal("show");
	$('#mpLikeCnt').text(res.mpost.LIKECNT);
	let rcnt = 0;
	if(res.mpost.REPLYCNT > 0){
		rcnt = res.mpost.REPLYCNT;
	}
	$('#thismpreplycnt').text(rcnt);
	
	if(res.likeYN == 'Y'){
		$('#mpLikeBtn').removeClass('fa-regular');
		$('#mpLikeBtn').addClass('fa-solid');
		$('#mpLikeBtn').prop('id', 'mpLikeCanBtn');
	}else{
		$('#mpLikeCanBtn').removeClass('fa-solid');
		$('#mpLikeCanBtn').addClass('fa-regular');
		$('#mpLikeCanBtn').prop('id', 'mpLikeBtn');
		
	}
	let replyShow = '';
	for(let i = 0; i < res.mpostReplyList.length; i++){
		replyShow += '<div style="display: flex; border-bottom: solid 1px #ced4da;" class="oneReply">';
		replyShow += '<div style="margin: 10px;">';
		if(res.mpostReplyList[i].MEM_PIC_PATH != null && res.mpostReplyList[i].MEM_PIC_PATH != ''){
			replyShow += '<img src="<%=request.getContextPath() %>/common/getPicture.do?name=' + res.mpostReplyList[i].MEM_PIC_PATH + '&item_cd=' + res.mpostReplyList[i].MEM_CD + '&type=memberPic" class="mr-3 rounded-pill" style="width: 60px; height: 60px; margin: 10px;">';
		}else{
			replyShow += '<img src="<%=request.getContextPath()%>/resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 60px; height: 60px; margin: 10px;">';
		}
		replyShow += '</div>';
		replyShow += '<div style="width: 85%;">';
		replyShow += '<div class="h50" style="display: flex; align-items: flex-end; margin-bottom: 5px;">';
		replyShow += '<div class="w50" style="text-align: left;" id="replyWriterId">';
		replyShow += res.mpostReplyList[i].MEM_ID.substring(0,3) + '**';
		replyShow += '</div>';
		replyShow += '<div class="w50" style="text-align: right; color: gray;" id="replyWritedate">';
		let redate = new Date(res.mpostReplyList[i].REGDATE);
		let ryyyy = redate.getFullYear();
		let rmm = redate.getMonth()+1;
		rmm = rmm >= 10 ? rmm : '0'+rmm;	// 10 보다 작으면 0을 앞에 붙여주기 ex) 3 > 03
		let rdd = redate.getDate();
		rdd = rdd >= 10 ? rdd : '0'+rdd;	// 10 보다 작으면 9을 앞에 붙여주기 ex) 9 > 09
		let reregdate =  ryyyy+'-'+rmm+'-'+rdd;	
		
		replyShow += reregdate;
		replyShow += '</div>';
		replyShow += '</div>';
		replyShow += '<div class="h50" style="display: flex;">';
		replyShow += '<div class="w80" style="text-align: left;" id="thisReplyContent">' + res.mpostReplyList[i].REPLY_CONTENT + '</div>';
		if(mem_cd == res.mpostReplyList[i].MEM_CD){
			replyShow += '<div class="w20 reUD" style="text-align: right;">'
			replyShow += '<div id="replyUpdateBtn" data-reply_no="' + res.mpostReplyList[i].REPLY_NO + '" style="display: inline; margin-right: 10px;">수정</div>';
			replyShow += '<div id="replyDeleteBtn" data-reply_no="' + res.mpostReplyList[i].REPLY_NO + '" style="display: inline; margin-right: 10px;">삭제</div>';
			replyShow += '</div>'
		}else{
			replyShow += '<div class="w20" style="text-align: right;" id="replyReportBtn" data-reply_no="' + res.mpostReplyList[i].REPLY_NO + '">신고</div>';
		}
		replyShow += '</div>';
		replyShow += '</div>';
		replyShow += '</div>';
		
			
			
	}
	$('.reply-div').html(replyShow);
}

</script>
<%@ include file="../include/footer.jsp" %>