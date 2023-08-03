<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#photoTicket-refund-modal .modal-content{
    border-radius: 0.7rem;
}
#photoTicket-refund-modal .modal-header img{
    width: 100px;
}
#photoTicket-refund-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#photoTicket-refund-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#photoTicket-refund-modal .modal-footer{
    border-top: none;
}
#photoTicket-refund-modal button:active{
    outline: none;
}
#photoTicket-refund-modal button:focus{
   outline: none;
}
#photoTicket-refund-modal .modal-body{
    text-align: center;
}
#photoTicket-refund-modal form{
    padding: 3vh;
}
#photoTicket-refund-modal input {
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
#photoTicket-refund-modal .input-group {
    margin-bottom: 1rem;
}
#photoTicket-refund-modal .input--style-3 {
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
#photoTicket-refund-modal .btn {
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


#photoTicket-refund-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#photoTicket-refund-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border: 1px solid #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
    
}

#photoTicket-refund-modal .btn-primary{
      width:40%;
      margin:30%
}
#photoTicket-refund-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="photoTicket-refund-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 70%; height: 130px; margin: 0 auto;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5 id="refundModalTitle" style="margin-bottom: 10px;">결제를 취소하시겠습니까?</h5>
                 <div style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" style="float: right;" id="ptrefundChk">확인</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" style="float: left;" id="ptrefundModalCancel">취소</button>
	                </div>
                </div>
                <input name="merchant_uid" type="hidden" id="ptrefundHiddenMUID">
            </div>
        </div>
    </div>
</div>

<script>

$(function(){
	$('#ptrefundModalCancel').on('click', function(){
		$('#photoTicket-refund-modal').modal('hide');
	})
	
	$('#ptrefundChk').on('click', function(){
		let merchant_uid = $('#ptrefundHiddenMUID').val();
		$('#photoTicket-refund-modal').modal('hide');
		ptRefund(merchant_uid);
		
	})
	
})

</script>