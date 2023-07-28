<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#mpost-report-modal .modal-content{
    border-radius: 0.7rem;
}
#mpost-report-modal .modal-header img{
    width: 100px;
}
#mpost-report-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#mpost-report-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#mpost-report-modal .modal-footer{
    border-top: none;
}
#mpost-report-modal button:active{
    outline: none;
}
#mpost-report-modal button:focus{
   outline: none;
}
#mpost-report-modal .modal-body{
    text-align: center;
}
#mpost-report-modal form{
    padding: 3vh;
}
#mpost-report-modal input {
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
#mpost-report-modal .input-group {
    margin-bottom: 1rem;
}
#mpost-report-modal .input--style-3 {
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
#mpost-report-modal .btn {
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


#mpost-report-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#mpost-report-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}

#mpost-report-modal .btn-primary{
      width:40%;
      margin:30%
}
#mpost-report-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="mpost-report-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 80%; height: 180px;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5>해당 포스트에 스포일러 및</h5> <h5>욕설/비방하는 내용이 있습니까?</h5>
                <form action="<%=request.getContextPath()%>/movie/replyReport.do" method="POST" id="mpostReportForm">
                 <div style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" style="float: right;" id="mpostReport">신고</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" style="float: left;" id="mpostReportModalCancel">취소</button>
	                </div>
                </div>
                <input name="mpost_no" type="hidden" id="mpostReportModalInputMN">
                </form>
            </div>
        </div>
    </div>
</div>

<script>

$(function(){
	$('#mpostReportModalCancel').on('click', function(){
		$('#mpost-report-modal').modal('hide');
	})
	
	$('#mpostReport').on('click', function(){
		$('#mpost-report-modal').modal('hide');
		let mpost_no = $('#mpostReportModalInputMN').val();
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/mpostReport.do',
			method : 'post',
			data : {'mpost_no' : mpost_no},
			success : function(res){
				console.log(res)
				if(res == 'S'){
					$('#alertContent').text("신고가 완료되었습니다.")
					$('#alert-modal').modal('show');
				}else{
					$('#alertContent').text("이미 신고한 포스트입니다.")
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