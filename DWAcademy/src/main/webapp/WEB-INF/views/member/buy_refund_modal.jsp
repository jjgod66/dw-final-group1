<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#buy-refund-modal .modal-content{
    border-radius: 0.7rem;
}
#buy-refund-modal .modal-header img{
    width: 100px;
}
#buy-refund-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#buy-refund-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#buy-refund-modal .modal-footer{
    border-top: none;
}
#buy-refund-modal button:active{
    outline: none;
}
#buy-refund-modal button:focus{
   outline: none;
}
#buy-refund-modal .modal-body{
    text-align: center;
}
#buy-refund-modal form{
    padding: 3vh;
}
#buy-refund-modal input {
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
#buy-refund-modal .input-group {
    margin-bottom: 1rem;
}
#buy-refund-modal .input--style-3 {
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
#buy-refund-modal .btn {
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


#buy-refund-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#buy-refund-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border: 1px solid #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
    
}

#buy-refund-modal .btn-primary{
      width:40%;
      margin:30%
}
#buy-refund-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="buy-refund-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 70%; height: 130px; margin: 0 auto;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5 id="refundModalTitle" style="margin-bottom: 10px;">결제를 취소하시겠습니까?</h5>
            	<p>(같이 결제한 상품들도 함께 취소됩니다.)</p>
                 <div style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" style="float: right;" id="buyrefundChk">확인</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" style="float: left;" id="buyrefundModalCancel">취소</button>
	                </div>
                </div>
                <input name="merchant_uid" type="hidden" id="buyrefundHiddenMUID">
            </div>
        </div>
    </div>
</div>

<script>

$(function(){
	$('#buyrefundModalCancel').on('click', function(){
		$('#buy-buy-refund-modal').modal('hide');
	})
	
	$('#buyrefundChk').on('click', function(){
		let merchant_uid = $('#buyrefundHiddenMUID').val();
		$('#buy-buy-refund-modal').modal('hide');
		resRefund(merchant_uid);
		
	})
	
})

</script>