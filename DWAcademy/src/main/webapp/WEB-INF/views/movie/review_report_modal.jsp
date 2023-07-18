<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#review-report-modal .modal-content{
    border-radius: 0.7rem;
}
#review-report-modal .modal-header img{
    width: 100px;
}
#review-report-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#review-report-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#review-report-modal .modal-footer{
    border-top: none;
}
#review-report-modal button:active{
    outline: none;
}
#review-report-modal button:focus{
   outline: none;
}
#review-report-modal .modal-body{
    text-align: center;
}
#review-report-modal form{
    padding: 3vh;
}
#review-report-modal input {
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
#review-report-modal .input-group {
    margin-bottom: 1rem;
}
#review-report-modal .input--style-3 {
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
#review-report-modal .btn {
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


#review-report-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#review-report-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}

#review-report-modal .btn-primary{
      width:40%;
      margin:30%
}
#review-report-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="review-report-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 80%; height: 180px;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5>해당 리뷰에 스포일러 및</h5> <h5>욕설/비방하는 내용이 있습니까?</h5>
                <form action="<%=request.getContextPath()%>/movie/reviewReport.do" method="POST" id="reviewReportForm">
<!--                  <div class="input-group"> -->
<!--                     <h5>해당 리뷰에 스포일러 및</h5> <h5>욕설/비방하는 내용이 있습니까?</h5> -->
<!--                 </div> -->
                 <div style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" style="float: right;" id="reviewReport">신고</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" style="float: left;" id="reviewReportModalCancel">취소</button>
	                </div>
                </div>
                <input name="review_no" type="hidden" id="reviewReportModalInputRN">
                <input name="movie_cd" type="hidden" value="${movieView.movie.movie_cd }">
                </form>
            </div>
        </div>
    </div>
</div>

<script>

$(function(){
	$('#reviewReportModalCancel').on('click', function(){
		$('#review-report-modal').modal('hide');
	})
	
	$('#reviewReport').on('click', function(){
		$('#reviewReportForm').submit();
	})
	
})

</script>