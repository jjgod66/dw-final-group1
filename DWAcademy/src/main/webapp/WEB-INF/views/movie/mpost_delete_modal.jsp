<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#mpost-delete-modal .modal-content{
    border-radius: 0.7rem;
}
#mpost-delete-modal .modal-header img{
    width: 100px;
}
#mpost-delete-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#mpost-delete-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#mpost-delete-modal .modal-footer{
    border-top: none;
}
#mpost-delete-modal button:active{
    outline: none;
}
#mpost-delete-modal button:focus{
   outline: none;
}
#mpost-delete-modal .modal-body{
    text-align: center;
}
#mpost-delete-modal form{
    padding: 3vh;
}
#mpost-delete-modal input {
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
#mpost-delete-modal .input-group {
    margin-bottom: 1rem;
}
#mpost-delete-modal .input--style-3 {
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
#mpost-delete-modal .btn {
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


#mpost-delete-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#mpost-delete-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}

#mpost-delete-modal .btn-primary{
      width:40%;
      margin:30%
}
#mpost-delete-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="mpost-delete-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 70%; height: 130px; margin: 0 auto;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5 style="margin: 10px;">포스트를 삭제하시겠습니까?</h5>
                 <div style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" style="float: right;" id="mpost-delete-modalYes">확인</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" style="float: left;" id="mpost-delete-modalCan">취소</button>
	                </div>
	                <input type="hidden" id="mpostDelMpostNo">
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	$('#mpost-delete-modalCan').on('click', function(){
		$('#mpost-delete-modal').modal("hide");
	})
	
	$('#mpost-delete-modalYes').on('click', function(){
		$('#mpost-delete-modal').modal("hide");
		let mpost_no = $('#mpostDelMpostNo').val();
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/mpostDelete.do',
			method : 'post',
			data : {'mpost_no' : mpost_no},
			success : function(res){
				$('#moviepost-view-modal').modal("hide");
				location.reload();
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
</script>