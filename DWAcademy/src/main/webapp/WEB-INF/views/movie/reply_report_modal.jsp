<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#reply-report-modal .modal-content{
    border-radius: 0.7rem;
}
#reply-report-modal .modal-header img{
    width: 100px;
}
#reply-report-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#reply-report-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#reply-report-modal .modal-footer{
    border-top: none;
}
#reply-report-modal button:active{
    outline: none;
}
#reply-report-modal button:focus{
   outline: none;
}
#reply-report-modal .modal-body{
    text-align: center;
}
#reply-report-modal form{
    padding: 3vh;
}
#reply-report-modal input {
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
#reply-report-modal .input-group {
    margin-bottom: 1rem;
}
#reply-report-modal .input--style-3 {
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
#reply-report-modal .btn {
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


#reply-report-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#reply-report-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}

#reply-report-modal .btn-primary{
      width:40%;
      margin:30%
}
#reply-report-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="reply-report-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 80%; height: 180px;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5>해당 댓글에 스포일러 및</h5> <h5>욕설/비방하는 내용이 있습니까?</h5>
                <form action="<%=request.getContextPath()%>/movie/replyReport.do" method="POST" id="replyReportForm">
                 <div style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" style="float: right;" id="replyReport">신고</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" style="float: left;" id="replyReportModalCancel">취소</button>
	                </div>
                </div>
                <input name="reply_no" type="hidden" id="replyReportModalInputRN">
                </form>
            </div>
        </div>
    </div>
</div>

<script>

$(function(){
	$('#replyReportModalCancel').on('click', function(){
		$('#reply-report-modal').modal('hide');
	})
	
	$('#replyReport').on('click', function(){
		$('#reply-report-modal').modal('hide');
		let reply_no = $('#replyReportModalInputRN').val();
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/replyReport.do',
			method : 'post',
			data : {'reply_no' : reply_no},
			success : function(res){
				console.log(res)
				if(res == 'S'){
					$('#alertContent').text("신고가 완료되었습니다.")
					$('#alert-modal').modal('show');
				}else{
					$('#alertContent').text("이미 신고한 댓글입니다.")
					$('#alert-modal').modal('show');
				}
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
})

</script>