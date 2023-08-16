<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

#moviepost-update-modal .modal-content{
    border-radius: 0.7rem;
}
#moviepost-update-modal .modal-header img{
    width: 100px;
}
#moviepost-update-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#moviepost-update-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#moviepost-update-modal .modal-footer{
    border-top: none;
}
#moviepost-update-modal button:active{
    outline: none;
}
#moviepost-update-modal button:focus{
   outline: none;
}
#moviepost-update-modal .modal-body{
    text-align: center;
}

#moviepost-update-modal input {
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
#moviepost-update-modal .input-group {
    margin-bottom: 1rem;
}
#moviepost-update-modal .input--style-3 {
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
#moviepost-update-modal .btn {
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


#moviepost-update-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-left: 10px;
    margin-right: 10px;
}
#moviepost-update-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-left: 10px;
    margin-right: 10px;
}
#moviepost-update-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#moviepost-update-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#moviepost-update-modal .col{
      padding: 2vh 10px 4vh;
}
#moviepost-update-modal .new{
      padding-bottom: 0;
}
#moviepost-update-modal .btn-primary{
      width:40%;
      margin:30%
}
#moviepost-update-modal .btn:focus{
    box-shadow: none;
    outline: none;
}

#picture:hover{
	cursor: pointer;
}
#update_movie_name {
    height: 34px;
    border: 1px solid #d8d9db;
    background-color: #d8d9db;
}
</style>
<div class="modal fade" id="moviepost-update-modal" style="--bs-modal-width: 1000px;">
    <div class="modal-dialog modal-dialog-centered">
	    <form id="movieUpdatePostForm" class="modal-content" method="post" action="<%=request.getContextPath()%>/movie/moviePostUpdate.do">
	    	<input type="hidden" name="mpost_no" id="mpostUpdateModalMN">
            <!-- Modal body -->
            <div class="modal-body row">
            	<div class="col-6">
	            	<h3 class="fs-3 text-center my-2"></h3>
	            	<h5>무비포스트 작성</h5>
	                <div class="input-group" style="margin: 20px 0;">
	                	<input type="text" id="update_movie_name" name="movie_name" style="width: 100%; border: solid 1px #ededed;" readonly="readonly">
	                	<input type="hidden" id="update_mpost_movie_cd" name="movie_cd">
	<!-- 	                <div style="display: flex;"> -->
	<!-- 	                </div> -->
	                </div>
	                <div class="pic-group" style="height: 400px; overflow-y: auto; overflow-x: hidden;">
	                <input type="hidden" name="movie_pic_no" value="" id="updateMoviePicNo">
		                <div class="row" id="updatemoviePicGroup">
		              		 <div style="text-align: center; margin-top: 200px;" id="noMovie">
			              		 영화를 선택하세요
		              		 </div>

		                </div>
	                </div>
            	</div>
            	<div class="col-6">
            		<div class="pic" style="height: 300px; border: solid 1px #eee; text-align: center; margin-bottom: 10px;" id="updateselPic">
            			<div id="noPic" style="text-align: center; margin-top: 150px;">사진을 선택하세요.</div>
            		</div>
	                <div class="input-group">
	                    <textarea class="form-control" style="width: 85%; height: 200px; resize: none;" placeholder="내용을 작성해주세요." id="updateposttext" name="mpost_content"></textarea>
						<p style="text-align: right; width: 100%;">
				            <span id="updatewritecount">0</span>
				            <span>/50 자</span>
			            </p>
	                </div>
	                <div class="p-t-10" style="display: flex;">
		                <div style="width: 50%; margin: 0 auto; id="updDiv">
		                    <button class="btn btn-regist" type="button" data-target="#" style="float: right;" id="postUpdateBtn">수정</button>
		                </div>
		                <div style="width: 50%; margin: 0 auto;">
		                    <button class="btn btn-cancel" type="button" data-target="#" style="float: left;" id="updatepostCancelBtn">취소</button>
		                </div>
	                </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>

$(function(){
	$('#postUpdateBtn').on('click', function(){

		if($('#updateposttext').val() == "" || $('#updatewritecount').val() == null){
			$('#alertContent').text("내용을 작성해주세요.")
			$('#alert-modal').modal('show');
			return;
		}
		$('#movieUpdatePostForm').submit();
	})
	
	$('#moviepost-update-modal').on('show.bs.modal', function(e){
			let movie_cd = $('#update_mpost_movie_cd').val();
			$.ajax({
				url : '<%=request.getContextPath()%>/movie/moviePic.do',
				data : {"movie_cd" : movie_cd},
				method : 'post',
				success : function(res){
					console.log(res);
					UpdatemoviePicShow(res);
				},
				error : function(err){
					alert(err.status);
				}
			})
	})
	
	
	
	$('#updateposttext').on('keyup', function() {
        $('#updatewritecount').html($(this).val().length);
 
        if($(this).val().length > 50) {
            $(this).val($(this).val().substring(0, 50));
            $('#updatewritecount').html("50");
        }
    });
	
	

	
	$('#updatepostCancelBtn').on('click', function(){
		$('#moviepost-update-modal').modal('hide');
	})
	
	$('#updatemoviePicGroup').on('click', '#picture', function(){
		let movie_cd = $(this).data("movie_cd");
		let path = $(this).data("path");
		let movie_pic_no = $(this).data("movie_pic_no");
		let show = '<img src="<%=request.getContextPath() %>/common/getPicture.do?name=' + path + '&item_cd=' + movie_cd + '&type=movieImg" style="max-height: 300px; max-width: 464px;">';
		$('#updateselPic').html(show);
		$('#updateMoviePicNo').val(movie_pic_no);
	})
})


function UpdatemoviePicShow(res){
	let movie_cd = $('#update_mpost_movie_cd').val();
	let show = '';
	for(let i = 0; i < res.length; i++){
		let path = res[i].movie_pic_path;
		let movie_cd = res[i].movie_cd;
		let movie_pic_no = res[i].movie_pic_no;
		show += '<div class="col-4" style="margin-bottom: 10px;" id="picture" data-movie_cd="' + movie_cd + '" data-path="' + path + '" data-movie_pic_no="' + movie_pic_no + '">';
		show += '<img src="<%=request.getContextPath() %>/common/getPicture.do?name=' + path + '&item_cd=' + movie_cd + '&type=movieImg" style="width: 100%; height: auto;">'
		show += '</div>'
	}
	$('#updatemoviePicGroup').html(show);
}
</script>