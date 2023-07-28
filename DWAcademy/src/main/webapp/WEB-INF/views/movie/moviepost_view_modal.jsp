<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<style>

#moviepost-view-modal .modal-content{
    border-radius: 0.7rem;
}
#moviepost-view-modal .modal-header img{
    width: 100px;
}
#moviepost-view-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#moviepost-view-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#moviepost-view-modal .modal-footer{
    border-top: none;
}
#moviepost-view-modal button:active{
    outline: none;
}
#moviepost-view-modal button:focus{
   outline: none;
}
#moviepost-view-modal .modal-body{
    text-align: center;
}

#moviepost-view-modal input {
    outline: none;
    margin: 0;
    border: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    width: 100%;
    font-size: 14px;
    font-family: inherit;
}
#moviepost-view-modal .input-group {
    margin-bottom: 1rem;
}
#moviepost-view-modal .input--style-3 {
    padding: 0.75rem !important;
    outline: none;
    width: 100% !important;
    min-width: unset;
    border: none;
    border-radius: 0;
    box-shadow: none !important;
    background: #f9f9f9;
    border: 1px solid #eee;
}
#moviepost-view-modal .btn {
    display: inline-block;
    line-height: 42px;
    padding: 0 33px;
    font-family: Poppins;
    cursor: pointer;
    color: #fff;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    transition: all 0.4s ease;
    font-size: 18px;
    width: 100%
}


#moviepost-view-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-left: 10px;
    margin-right: 10px;
}
#moviepost-view-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-left: 10px;
    margin-right: 10px;
}
#moviepost-view-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#moviepost-view-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#moviepost-view-modal .col{
      padding: 2vh 10px 4vh;
}
#moviepost-view-modal .new{
      padding-bottom: 0;
}
#moviepost-view-modal .btn-primary{
      width:40%;
      margin:30%
}
#moviepost-view-modal .btn:focus{
    box-shadow: none;
    outline: none;
}

#picture:hover{
	cursor: pointer;
}

#moviePostViewClose:hover{
	cursor: pointer;
}

.h50{
	height: 50%;
}

.w50{
	width: 50%;
}
.w20{
	width: 20%;
}
.w30{
	width: 30%;
}
.w80{
	width: 80%;
}

#replyUpdateBtn:hover, #mpReportBtn:hover, #mpUpdateBtn:hover, #replyReportBtn:hover, #mpLikeBtn:hover, #mpDeleteBtn:hover, #replyDeleteBtn:hover, #mpLikeCanBtn:hover
,#replyUpdateDoBtn:hover, #replyUpdateCanBtn:hover{
	cursor: pointer;
}
</style>
<div class="modal fade" id="moviepost-view-modal" style="--bs-modal-width: 800px;">
    <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	
	            	<h3 class="fs-3 text-center my-2"></h3>
	            	<h5>무비포스트<span id="moviePostViewClose" style="float: right; font-size: 20px; margin-right: 10px;"><i class="fa-solid fa-x"></i></span></h5>
	                <div class="input-group" style="margin: 20px;">
	                	<h4 id="mpMoiveName"></h4>
	<!-- 	                <div style="display: flex;"> -->
	<!-- 	                </div> -->
	                </div>
	                <div style="display: flex;">
						<img id="mpWriteMemPic" src="../../resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 80px; height: 80px; margin: 20px;">
						<div style="position: relative; width: 100%;">
							<div style="position: absolute; bottom: 20px; width: 100%; text-align: left;">
								<p style="font-size: 20px;" id="mpWriterId"></p>
								<p style="color : gray;" id="mpWritedate"></p>
							</div>
						</div>
	                </div>
            		<div id="thismpPic" class="pic" style="height: 500px; text-align: center; margin-bottom: 10px; background-image: url(''); background-repeat: no-repeat; background-size: contain; background-position: center center;" id="selPic">
            		</div>
	                <div class="input-group" style="margin: 30px 0;">
	                    <p style="margin: 0 auto;" id="mpContent"></p>
	                </div>
	                <div id="lrud">
						<i class="fa-regular fa-thumbs-up" style="font-size: 20px;" id="mpLikeBtn">&nbsp;<span id="mpLikeCnt">0</span></i>
<!-- 						<i class="fa-solid fa-thumbs-up" style="font-size: 20px;" id="mpLikeCanBtn">&nbsp;<span id="mpLikeCnt">0</span></i> -->
						<p style="margin: 10px 0;" id="mpReportBtn">신고</p>
						<div style="margin: 10px 0;">
							<p style="display: none;" id="mpUpdateBtn">수정</p>
							<p style="display: none;" id="mpDeleteBtn">삭제</p>
						</div>
	                </div>
	                <div style="margin: 30px 0; padding: 10px;">
	                	<div style="text-align: left; margin: 10px; font-size: 20px;">댓글(<span id="thismpreplycnt">0</span>)</div>
	                	<div style="display: flex;">
	                		 <textarea class="form-control" style="width: 85%; height: 80px; resize: none;" placeholder="내용을 작성해주세요." id="replytext" name="reply_content"></textarea>
	                		 <div>
	                		 	<input type="button" class="btn btn-regist" value="작성" style="width: 100%; height: 60%" id="replyRegistBtn">
	                		 	<p style="width: 100%; text-align: left; margin-left:10px;">
						            <span id="writereplycount">0</span>
						            <span>/50 자</span>
					            </p>
	                		 </div>
	                	</div>
	                </div>
	                <div class="reply-div">
<!-- 	                	<div style="display: flex; border-bottom: solid 1px #ced4da;"> -->
<!-- 	                		<div style="margin: 10px;"> -->
<!-- 								<img alt="Generic placeholder image" src="../../resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 60px; height: 60px; margin: 10px;"> -->
<!-- 			                </div> -->
<!-- 							<div style="width: 80%;"> -->
<!-- 								<div class="h50" style="display: flex; align-items: flex-end; margin-bottom: 5px;"> -->
<!-- 									<div class="w50" style="text-align: left;" id="replyWriterId"> -->
<!-- 										dsgtad123 -->
<!-- 									</div> -->
<!-- 									<div class="w50" style="text-align: right; color: gray;" id="replyWritedate"> -->
<!-- 										2023-20-50 -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="h50" style="display: flex;"> -->
<!-- 									<div class="w50" style="text-align: left;" id="thisReplyContent">댓글내용</div> -->
<!-- 									<div class="w50"  style="text-align: right;" id="replyReportBtn">신고</div> -->
<!-- 									<div class="w50" style="text-align: right; display: none" id="replyUpdateBtn">수정</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
		              
<!-- 	                	</div> -->
	                </div>
                
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
	
	$('#mpUpdateBtn').on('click', function(){
		let mpost_no = $(this).data('mpost_no');
		$('#moviepost-view-modal').modal("hide");
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/mpostUpdateInfo.do',
			method : 'post',
			data : {'mpost_no' : mpost_no},
			success : function(res){
				console.log(res);
				$('#mpostUpdateModalMN').val(mpost_no);
				$('#updateposttext').text(res.MPOST_CONTENT);
				$('#updatewritecount').text(res.MPOST_CONTENT.length);
				$('#update_movie_name').val(res.MOVIE_NAME);
				$('#update_mpost_movie_cd').val(res.MOVIE_CD);
				let show = '<img src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=' + res.MOVIE_PIC_PATH + '&item_cd=' + res.MOVIE_CD + '&type=movieImg" style="max-height: 300px; max-width: 464px;">';
				$('#updateselPic').html(show);
				$('#updateMoviePicNo').val(res.MOVIE_PIC_NO);
				$('#moviepost-update-modal').modal("show");
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
	$('#mpDeleteBtn').on('click', function(){
		let mpost_no = $(this).data('mpost_no');
		$('#mpostDelMpostNo').val(mpost_no);
		$('#mpost-delete-modal').modal('show');
	})
	
	$('#mpReportBtn').on('click', function(){
		if(mem_cd == '' || mem_cd == null){
			$('#login-service-modal').modal("show");
			return;
		}	
		let mpost_no = $(this).data('mpost_no');
		$('#mpostReportModalInputMN').val(mpost_no);
		$('#mpost-report-modal').modal('show');
	})
	
	$('.reply-div').on('click', '#replyReportBtn', function(){
		if(mem_cd == '' || mem_cd == null){
			$('#login-service-modal').modal("show");
			return;
		}	
		let reply_no = $(this).data('reply_no');
		$('#replyReportModalInputRN').val(reply_no);
		$('#reply-report-modal').modal('show');
		
	})
	
	$('.reply-div').on('click', '#replyDeleteBtn', function(){
		let reply_no = $(this).data('reply_no');
		$("#replyDelReplyNo").val(reply_no);
		$('#reply-delete-modal').modal('show');
		
	})
	
	$('.reply-div').on('click', '#replyUpdateDoBtn', function(){
		let reply_content = $('#replyUpdatetext').val();
		let reply_no = $(this).data('reply_no');
		$(this).parents('.oneReply').find('#thisReplyContent').css('display', '');
		$(this).parents('.oneReply').find('#thisReplyContent').text(reply_content);
		$(this).parents('.oneReply').find('#thisReplyUpdateContent').remove();
		$(this).parents('.oneReply').find('#updatereplycountp').remove();
		$(this).parents('.oneReply').find('#replyUpdateDoBtn').prop('id', 'replyUpdateBtn');
		$(this).parents('.oneReply').find('#replyUpdateCanBtn').text('삭제');
		$(this).parents('.oneReply').find('#replyUpdateCanBtn').prop('id', 'replyDeleteBtn');
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/replyUpdate.do',
			method : 'post',
			data : {'reply_no' : reply_no, 'reply_content' : reply_content},
			success : function(res){
				
			},
			error : function(err){
				alert(err.status);
			}
		})
		
	})
	
	$('.reply-div').on('click', '#replyUpdateCanBtn', function(){
		let reply_no = $(this).data('reply_no');
		$(this).parents('.oneReply').find('#thisReplyContent').css('display', '');
		$(this).parents('.oneReply').find('#thisReplyUpdateContent').remove();
		$(this).parents('.oneReply').find('#updatereplycountp').remove();
		$(this).parents('.oneReply').find('#replyUpdateDoBtn').prop('id', 'replyUpdateBtn');
		$(this).parents('.oneReply').find('#replyUpdateCanBtn').text('삭제');
		$(this).parents('.oneReply').find('#replyUpdateCanBtn').prop('id', 'replyDeleteBtn');
	})
	
	$('.reply-div').on('click', '#replyUpdateBtn', function(){
		let reply_no = $(this).data('reply_no');
		let contentTextarat = '';
		contentTextarat += '<div class="w80" style="text-align: left;" id="thisReplyUpdateContent">';
		contentTextarat += '<textarea class="form-control" style="height: 80%; width: 100%; resize: none;" placeholder="내용을 작성해주세요." id="replyUpdatetext">' + $(this).parents('.oneReply').find('#thisReplyContent').text() + '</textarea>';
		contentTextarat += '</div>';
		$(this).parents('.oneReply').find('#thisReplyContent').css('display', 'none');
		$(this).parents('.oneReply').find('#thisReplyContent').parents('.h50').prepend(contentTextarat);
		let redoshow = '';
		redoshow += '<p style="width: 33%; float: left;" id="updatereplycountp">';
		redoshow += '<span id="updatereplycount">' + $(this).parents('.oneReply').find('#thisReplyContent').text().length + '</span>';
		redoshow += '<span>/50</span>';
		redoshow += '</p>';	
		$(this).parents('.oneReply').find('.reUD').prepend(redoshow)
		$(this).parents('.oneReply').find('#replyUpdateBtn').prop('id', 'replyUpdateDoBtn');
		$(this).parents('.oneReply').find('#replyDeleteBtn').prop('id', 'replyUpdateCanBtn');
		$(this).parents('.oneReply').find('#replyUpdateCanBtn').text('취소');
	})
	
	$('#lrud').on('click', '#mpLikeBtn', function(){
		if(mem_cd == '' || mem_cd == null){
			$('#login-service-modal').modal("show");
			return;
		}	
		let mpost_no = $('#mpReportBtn').data('mpost_no');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/mpLike.do',
			method : 'post',
			data : {'mpost_no' : mpost_no},
			success : function(res){
				console.log(res);
				clickmpLike();
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
	$('#lrud').on('click', '#mpLikeCanBtn', function(){
		let mpost_no = $('#mpReportBtn').data('mpost_no');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/mpLike.do',
			method : 'post',
			data : {'mpost_no' : mpost_no},
			success : function(res){
				console.log(res);
				clickmpLikeCan();
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
	$('#replyRegistBtn').on('click', function(){
		if(mem_cd == null || mem_cd == ""){
			$('#login-service-modal').modal("show");
			return;
		}
		if($('#replytext').val() == "" || $('#replytext').val() == null){
			$('#alertContent').text("내용을 작성해주세요.");
			$('#alert-modal').modal('show');
			return;
		}
		
		let reply_content = $('#replytext').val();
		let mpost_no = $('#mpReportBtn').data('mpost_no');
		
		$('#replytext').val('');
		$('#writereplycount').html("0");
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/moviePostReplyRegist.do',
			method : 'post',
			data : {'reply_content' : reply_content, 'mpost_no' : mpost_no},
			success : function(res){
				console.log(res);
				replyReg(res);
			},
			error : function(err){
				alert(err.status);
			}
		})
		
	})
	
	$('#replytext').on('keyup', function() {
	    $('#writereplycount').html($(this).val().length);
	
	    if($(this).val().length > 50) {
	        $(this).val($(this).val().substring(0, 50));
	        $('#writereplycount').html("50");
	    }
	});
	
	$('.reply-div').on('keyup','#replyUpdatetext', function() {
	    $(this).parents('.oneReply').find('#updatereplycount').html($(this).val().length);
	
	    if($(this).val().length > 50) {
	        $(this).val($(this).val().substring(0, 50));
	        $(this).parents('.oneReply').find('#updatereplycount').html("50");
	    }
	});
	
	$('#moviePostViewClose').on('click', function(){
		$('#moviepost-view-modal').modal("hide");
	})
	
	$('#moviepost-view-modal').on('hidden.bs.modal', function (e) {
		$('#replytext').val('');
		$('#writereplycount').html("0");
// 		location.reload();
	});
})


function clickmpLike(){
	$('#mpLikeCnt').text(parseInt($('#mpLikeCnt').text()) + 1);
	$('#mpLikeBtn').removeClass('fa-regular');
	$('#mpLikeBtn').addClass('fa-solid');
	$('#mpLikeBtn').prop('id', 'mpLikeCanBtn');
	
}
function clickmpLikeCan(){
	$('#mpLikeCnt').text(parseInt($('#mpLikeCnt').text()) - 1);
	$('#mpLikeCanBtn').removeClass('fa-solid');
	$('#mpLikeCanBtn').addClass('fa-regular');
	$('#mpLikeCanBtn').prop('id', 'mpLikeBtn');
	
}

function replyReg(res){
	$('#thismpreplycnt').text(parseInt($('#thismpreplycnt').text()) + 1);
	
	let regShow = '';
	
	regShow += '<div style="display: flex; border-bottom: solid 1px #ced4da;" class="oneReply">';
	regShow += '<div style="margin: 10px;">';
	regShow += '<img src="../../resources/img/defaultprofile.png" class="mr-3 rounded-pill" style="width: 60px; height: 60px; margin: 10px;">';
	regShow += '</div>';
	regShow += '<div style="width: 85%;">';
	regShow += '<div class="h50" style="display: flex; align-items: flex-end; margin-bottom: 5px;">';
	regShow += '<div class="w50" style="text-align: left;" id="replyWriterId">';
	regShow += res.MEM_ID.substring(0,3) + '**';
	regShow += '</div>';
	regShow += '<div class="w50" style="text-align: right; color: gray;" id="replyWritedate">';
	let redate = new Date(res.REGDATE);
	let ryyyy = redate.getFullYear();
	let rmm = redate.getMonth()+1;
	rmm = rmm >= 10 ? rmm : '0'+rmm;	// 10 보다 작으면 0을 앞에 붙여주기 ex) 3 > 03
	let rdd = redate.getDate();
	rdd = rdd >= 10 ? rdd : '0'+rdd;	// 10 보다 작으면 9을 앞에 붙여주기 ex) 9 > 09
	let reregdate =  ryyyy+'-'+rmm+'-'+rdd;	
	
	regShow += reregdate;
	regShow += '</div>';
	regShow += '</div>';
	regShow += '<div class="h50" style="display: flex;">';
	regShow += '<div class="w80" style="text-align: left;" id="thisReplyContent">' + res.REPLY_CONTENT + '</div>';
	regShow += '<div class="w20 reUD" style="text-align: right;">'
	regShow += '<div id="replyUpdateBtn" data-reply_no="' + res.REPLY_NO + '" style="display: inline; margin-right: 10px;">수정</div>';
	regShow += '<div id="replyDeleteBtn" data-reply_no="' + res.REPLY_NO + '" style="display: inline; margin-right: 10px;">삭제</div>';
	regShow += '</div>'
	regShow += '</div>';
	regShow += '</div>';
	regShow += '</div>';
	$('.reply-div').prepend(regShow);
}
</script>