<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#reply-delete-modal .modal-content{
    border-radius: 0.7rem;
}
#reply-delete-modal .modal-header img{
    width: 100px;
}
#reply-delete-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#reply-delete-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#reply-delete-modal .modal-footer{
    border-top: none;
}
#reply-delete-modal button:active{
    outline: none;
}
#reply-delete-modal button:focus{
   outline: none;
}
#reply-delete-modal .modal-body{
    text-align: center;
}
#reply-delete-modal form{
    padding: 3vh;
}
#reply-delete-modal input {
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
#reply-delete-modal .input-group {
    margin-bottom: 1rem;
}
#reply-delete-modal .input--style-3 {
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
#reply-delete-modal .btn {
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


#reply-delete-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#reply-delete-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}

#reply-delete-modal .btn-primary{
      width:40%;
      margin:30%
}
#reply-delete-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="reply-delete-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 70%; height: 130px; margin: 0 auto;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5 style="margin: 10px;">댓글을 삭제하시겠습니까?</h5>
                 <div style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" style="float: right;" id="reply-delete-modalYes">확인</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" style="float: left;" id="reply-delete-modalCan">취소</button>
	                </div>
	                <input type="hidden" id="replyDelReplyNo">
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	$('#reply-delete-modalCan').on('click', function(){
		$('#reply-delete-modal').modal("hide");
	})
	
	$('#reply-delete-modalYes').on('click', function(){
		$('#reply-delete-modal').modal("hide");
		let reply_no = $('#replyDelReplyNo').val();
		$('[data-reply_no="' + reply_no + '"]').parents('.oneReply').remove();
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/replyDelete.do',
			method : 'post',
			data : {'reply_no' : reply_no},
			success : function(res){
				$('#thismpreplycnt').text(parseInt($('#thismpreplycnt').text()) - 1);
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
</script>