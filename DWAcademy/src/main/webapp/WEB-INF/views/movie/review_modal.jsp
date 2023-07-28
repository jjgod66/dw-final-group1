<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
HTML CSSResult Skip Results Iframe
EDIT ON
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
       .rate { display: inline-block;border: 0;margin-right: 15px;}
.rate > input {display: none;}
.rate > label {float: right;color: #ddd}
.rate > label:before {display: inline-block;font-size: 1rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } 
.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  }

#review-modal .modal-content{
    border-radius: 0.7rem;
}
#review-modal .modal-header img{
    width: 100px;
}
#review-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#review-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#review-modal .modal-footer{
    border-top: none;
}
#review-modal button:active{
    outline: none;
}
#review-modal button:focus{
   outline: none;
}
#review-modal .modal-body{
    text-align: center;
}
#review-modal form{
    padding: 3vh;
}
#review-modal input {
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
#review-modal .input-group {
    margin-bottom: 1rem;
}
#review-modal .input--style-3 {
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
#review-modal .btn {
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
#review-modal .btn--naver {
    background-color: #27d34a !important;
    background-image: url(https://vendor-cdn.imweb.me/images/naver_login2x.png);
    background-size: 16px;
    background-position: 15px 50%;
    background-repeat: no-repeat;
    border-color: #27d34a !important;
    color: #fff !important;
    font-size: 12px;
    padding: 0;
}
#review-modal .btn--kakao {
    background-color: #ffeb00 !important;
    background-image: url(https://vendor-cdn.imweb.me/images/kakao_icon.png);
    background-size: 20px;
    background-position: 12px 49%;
    background-repeat: no-repeat;
    border-color: #ffeb00 !important ;
    color: #333 !important;
    font-size: 12px;
    padding: 0;
}
#review-modal .btn--login {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
#review-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#review-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#review-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#review-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#review-modal .col{
      padding: 2vh 10px 4vh;
}
#review-modal .new{
      padding-bottom: 0;
}
#review-modal .btn-primary{
      width:40%;
      margin:30%
}
#review-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="review-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5>영화 "${movieView.movie.movie_name }"</h5><h5>어떠셨나요?</h5>
                <form method="POST" id="reviewRegistForm">
                <div class="input-group">
	                <div style="display: flex;">
	                    <fieldset class="rate" id="rate" style="">
	                                <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
	                                <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
	                                <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
	                                <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
	                                <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
	                                <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
	                                <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
	                                <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
	                                <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
	                                <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
	
	                     </fieldset>
	                </div>
                </div>
                <div class="input-group">
                    <textarea class="form-control" style="width: 85%; height: 200px; resize: none;" placeholder="리뷰를 남겨주세요." id="reviewtext" name="review_content"></textarea>
					<p style="text-align: right; width: 100%;">
			            <span id="writecount">0</span>
			            <span>/50 자</span>
		            </p>
                </div>
                <div class="p-t-10" style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;" id="regDiv">
	                    <button class="btn btn-regist" type="button" data-target="#" style="float: right;" id="reiveRegistBtn">등록</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto; display: none" id="updDiv">
	                    <button class="btn btn-regist" type="button" data-target="#" style="float: right;" id="reiveUpdateBtn">수정</button>
	                </div>
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" data-target="#" style="float: left;" id="reiveCancelBtn">취소</button>
	                </div>
                </div>
                <input name="review_rating" type="hidden">
                <input name="movie_cd" type="hidden" value="${movieView.movie.movie_cd }">
                <input name="review_no" type="hidden" value="0">
                </form>
            </div>
        </div>
    </div>
</div>

<script>

$(function() {
	
	$('#reiveUpdateBtn').on('click', function(){
		if($('input[name="rating"]:checked').length == 0){
			$('#alertContent').text("별점을 선택해주세요.");
			$('#alert-modal').modal('show');
			return;
    	}
    	if($('#reviewtext').val().length < 1){
    		$('#alertContent').text("내용을 작성해주세요.");
			$('#alert-modal').modal('show');
			return;
    	}
    	$('input[name="review_rating"]').val($('input[name="rating"]:checked').val());
		
		$('#reviewRegistForm').prop('action', '<%=request.getContextPath()%>/movie/reviewUpdate.do');
		$('#reviewRegistForm').submit();
	})
	
    $('#reviewtext').on('keyup', function() {
        $('#writecount').html($(this).val().length);
 
        if($(this).val().length > 50) {
            $(this).val($(this).val().substring(0, 50));
            $('#writecount').html("50");
        }
    });
    
//     $('input[name="rating"]').on('change', function(){
//     	console.log($('input[name="rating"]:checked'));
//     	console.log($('input[name="rating"]:checked').val());
//     	console.log($('input[name="rating"]:checked').length);
//     })
    
    $('#reiveRegistBtn').on('click', function(){
    	if($('input[name="rating"]:checked').length == 0){
    		$('#alertContent').text("별점을 선택해주세요.");
			$('#alert-modal').modal('show');
			return;
    	}
    	if($('#reviewtext').val().length < 1){
    		$('#alertContent').text("내용을 작성해주세요.");
			$('#alert-modal').modal('show');
			return;
    	}
    	$('input[name="review_rating"]').val($('input[name="rating"]:checked').val());
    	$('#reviewRegistForm').prop('action', '<%=request.getContextPath()%>/movie/reviewRegist.do');
    	$('#reviewRegistForm').submit();
    	
    })
    
    $('#reiveCancelBtn').on('click', function(){
    	$('#review-modal').modal("hide");
    })
});

</script>