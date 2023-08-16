<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/member_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../resources/css/boxoffice.css">
<style>
.movie-sorting{
	float: left;
    padding: 0 0 0 0;
}
.on {
    color: #222;
    font-weight: 700;
}
.input-text{
	position: relative;
    float: right;
    height: 36px;
    margin: 0;
    padding: 0 15px 0 15px;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.movie-search{
	position: relative;
    float: right;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.btn-search-input{
	position: absolute;
    right: 1px;
    top: 1px;
}
.tab-block>ul>a{
	float: left;
	width: 20%;
	padding: 5px 0 5px 0;
	text-align: center;
	border: 1px solid #4aa8d8;
}
.on{
	background-color: #4aa8d8;
}
</style>
<c:set var="cri" value="${pageMaker.cri }"/>
<div class="container" style=" margin-top: 10px">
	<div class="row mb-3" style="width:100%;">
		<div class="tab-block tab-layer">
			<ul>
				<a href="<%=request.getContextPath()%>/member/movieTimeLine.do" class="" ><li>무비타임라인</li></a>
				<a href="<%=request.getContextPath()%>/member/myMoviepost.do" class="on"><li>무비포스트</li></a>
				<a href="<%=request.getContextPath()%>/member/myReview.do" class=""><li>리뷰</li></a>
				<a href="<%=request.getContextPath()%>/member/myLikeMovie.do" class=""><li>좋아요</li></a>
			</ul>
		</div>
	</div>
	<div class="row">
	<p style="float:left;">
		<strong>총 <b class="font-gblue" id="myMoviePostCnt">${totalCount}</b> 건</strong>
	</p>
		<div style="float: right;">
			<div class="movie-sorting" style="margin: 10px;">
				<button type="button" id="newest" class="" data-type="date">최신순</button>
				<button type="button" id="likest"class="" data-type="like">공감순</button>
			</div>
			<div class="movie-search">
				<input type="text" title="영화 제목을 입력해 주세요." placeholder="영화 제목을 입력해 주세요." name="keyword"
					class="input-text" id="search" value="${cri.keyword }">
				<button type="button" class="btn-search-input" id="searchBtn">검색</button>
			</div>
		</div>
	</div>
	<c:if test="${empty mpList}">
		<div class="" style="padding-bottom: 10px; margin: auto;">
			<div style="text-align: center;">등록된 무비포스트가 없습니다.</div>
		</div>
	</c:if>
	<div style="padding-bottom: 10px;">
		<div class="row" style="flex-wrap: nowrap;">
			<c:forEach items="${mpList}" var="mp">
        		<div class="col-md-4 post" style="">
        			<div id="mpCard" class="card h-100" style="margin: 20px;" data-mpost_no="${mp.MPOST_NO }" data-timestamp="${fn:replace(mp.REGDATE, '', 'T')}">
        				<img src="<%=request.getContextPath() %>/common/getPicture.do?name=${mp.MOVIE_PIC_PATH}&item_cd=${mp.MOVIE_CD}&type=movieImg" style="height: 15rem;">
        				<div class="card-body">
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
        						<i class="fa-regular fa-thumbs-up">&nbsp;<span>${mp.LIKECNT }</span></i>
        						&nbsp;&nbsp;&nbsp;&nbsp;
        						<i class="fa-regular fa-message">&nbsp;<span>${mp.REPLYCNT }</span></i>
        					</div>
        				</div>
        			</div>
        		</div>
       		</c:forEach>
       	</div>
    	</div>
    	<div class="mt-5 mb-5 paginationdiv">
		<%@ include file="../common/pagination.jsp" %>
		</div>
</div>
<%@ include file="../movie/moviepost_view_modal.jsp" %>
<script>
let perPageNum = 3;
$('#newest').on('click', function(){
	let posts = $('.post').toArray();
	
	// timestamp를 기준으로 내림차순 정렬
	posts.sort(function(a ,b){
		let timestampA = new Date($(a).find('#mpCard').data('timestamp'));
		let timestampB = new Date($(b).find('#mpCard').data('timestamp'));
		return timestampB - timestampA;
	});
	
	// 정렬된 요소를 부모 요소에 추가
	let container = $('.col-3.post').parent();
	container.empty
	posts.forEach(function(post){
		container.append(post);
	});
});

$('#likest').on('click', function(){
	let posts = $('.post').toArray();
	
	// 공감 수를 기준으로 내림차순 정렬
	posts.sort(function(a ,b){
		let likeCntA = new Date($(a).find('.fa-thumbs-up span').text());
		let likeCntB = new Date($(b).find('.fa-thumbs-up span').text());
		return likeCntB - likeCntA;
	});
	
	// 정렬된 요소를 부모 요소에 추가
	let container = $('.col-3.post').parent();
	container.empty
	posts.forEach(function(post){
		container.append(post);
	});
});



let searchFormUrl = "searchMyMoviepost.do";
$(function(){
	
	$('.container').on('click', '#mpCard', function(){
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
	
	let mplist = '${moviePostList}';
	if(mplist == '[]'){
		$('.paginationdiv').css('display', 'none');
	}
	
	$('#searchBtn').on('click', function(){
		searchList_go(1);
	})
	
	$('#moviepostModalBtn').on('click', function(){
		if(mem_cd == null || mem_cd == ""){
			$('#login-service-modal').modal("show");
			return;
		}
		$('#moviepost-modal').modal("show");
		
	
	})
	
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
		$('#mpWriteMemPic').prop('src', '<%=request.getContextPath() %>/common/getPicture.do?name=' + res.mpost.MEM_PIC_PATH + '&item_cd=$' + res.mpost.MEM_CD + '&type=memberPic');
	}else{
		$('#mpWriteMemPic').prop('src', '../../resources/img/defaultprofile.png');
	}
	let mpbackImg = "<%=request.getContextPath() %>/common/getPicture.do?name=" + res.mpost.MOVIE_PIC_PATH + "&item_cd=" + res.mpost.MOVIE_CD + "&type=movieImg";
	$('#thismpPic').css('background-image', 'url(' + mpbackImg + ')');
	$('#moviepost-view-modal').modal("show");
	$('#mpLikeCnt').text(res.mpost.LIKECNT);
	$('#thismpreplycnt').text(res.mpost.REPLYCNT);
	
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
			replyShow += '<img src="<%=request.getContextPath() %>/common/getPicture.do?name=' + res.mpostReplyList[i].MEM_PIC_PATH + '&item_cd=$' + res.mpostReplyList[i].MEM_CD + '&type=memberPic" class="mr-3 rounded-pill" style="width: 60px; height: 60px; margin: 10px;">';
		}else{
			replyShow += '<img src="../../resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 60px; height: 60px; margin: 10px;">';
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
<%@ include file="../include/member_footer.jsp" %>