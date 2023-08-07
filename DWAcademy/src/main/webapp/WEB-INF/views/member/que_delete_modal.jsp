<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#que-delete-modal .modal-content{
    border-radius: 0.7rem;
}
#que-delete-modal .modal-header img{
    width: 100px;
}
#que-delete-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#que-delete-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#que-delete-modal .modal-footer{
    border-top: none;
}
#que-delete-modal button:active{
    outline: none;
}
#que-delete-modal button:focus{
   outline: none;
}
#que-delete-modal .modal-body{
    text-align: center;
}
#que-delete-modal form{
    padding: 3vh;
}
#que-delete-modal input {
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
#que-delete-modal .input-group {
    margin-bottom: 1rem;
}
#que-delete-modal .input--style-3 {
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
#que-delete-modal .btn {
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


#que-delete-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#que-delete-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}

#que-delete-modal .btn-primary{
      width:40%;
      margin:30%
}
#que-delete-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="que-delete-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 70%; height: 130px; margin: 0 auto;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5 style="margin: 10px;">문의를 삭제하시겠습니까?</h5>
                 <div style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" style="float: right;" id="que-delete-modalYes">확인</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" style="float: left;" id="que-delete-modalCan">취소</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	$('#que-delete-modalCan').on('click', function(){
		$('#que-delete-modal').modal("hide");
	})
	
	$('#que-delete-modalYes').on('click', function(){
		$('#que-delete-modal').modal("hide");
		let que_no = '${qna.que_no }';
			
		$.ajax({
			url : '<%=request.getContextPath()%>/support/qnaDel.do',
			method : 'post',
			data : {'que_no' : que_no},
			success : function(res){
				console.log(res);
				alert("삭제되었습니다.");
				history.go(-2);
// 				location.reload();
			},
			error : function(err){
				alert(err.status);
			}
		})
		
	})
	
</script>