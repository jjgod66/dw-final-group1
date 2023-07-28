<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#alert-modal .modal-content{
    border-radius: 0.7rem;
}
#alert-modal .modal-header img{
    width: 100px;
}
#alert-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#alert-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#alert-modal .modal-footer{
    border-top: none;
}
#alert-modal button:active{
    outline: none;
}
#alert-modal button:focus{
   outline: none;
}
#alert-modal .modal-body{
    text-align: center;
}
#alert-modal form{
    padding: 3vh;
}
#alert-modal input {
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
#alert-modal .input-group {
    margin-bottom: 1rem;
}
#alert-modal .input--style-3 {
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
#alert-modal .btn {
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


#alert-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#alert-modal .btn-regist:hover {
    background: #fff;
    color: #4aa8d8;
}

</style>
<div class="modal fade" id="alert-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 70%; height: 130px; margin: 0 auto;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5 id="alertContent">이미 신고한 댓글입니다.</h5>
                 <div style="display: flex; margin-top:20px;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-regist" type="button" id="alert-modalCan">확인</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	$('#alert-modalCan').on('click', function(){
		$('#alert-modal').modal("hide");
	})
</script>