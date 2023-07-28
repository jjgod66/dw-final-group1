<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

#moviepost-modal .modal-content{
    border-radius: 0.7rem;
}
#moviepost-modal .modal-header img{
    width: 100px;
}
#moviepost-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#moviepost-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#moviepost-modal .modal-footer{
    border-top: none;
}
#moviepost-modal button:active{
    outline: none;
}
#moviepost-modal button:focus{
   outline: none;
}
#moviepost-modal .modal-body{
    text-align: center;
}

#moviepost-modal input {
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
#moviepost-modal .input-group {
    margin-bottom: 1rem;
}
#moviepost-modal .input--style-3 {
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
#moviepost-modal .btn {
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


#moviepost-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-left: 10px;
    margin-right: 10px;
}
#moviepost-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-left: 10px;
    margin-right: 10px;
}
#moviepost-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#moviepost-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#moviepost-modal .col{
      padding: 2vh 10px 4vh;
}
#moviepost-modal .new{
      padding-bottom: 0;
}
#moviepost-modal .btn-primary{
      width:40%;
      margin:30%
}
#moviepost-modal .btn:focus{
    box-shadow: none;
    outline: none;
}

#picture:hover{
	cursor: pointer;
}
</style>
<div class="modal fade" id="moviepost-modal" style="--bs-modal-width: 1000px;">
    <div class="modal-dialog modal-dialog-centered">
	    <form id="moviePostForm" class="modal-content" method="post" action="<%=request.getContextPath()%>/movie/moviePostRegist.do">
            <!-- Modal body -->
            <div class="modal-body row">
            	<div class="col-6">
	            	<h3 class="fs-3 text-center my-2"></h3>
	            	<h5>무비포스트 작성</h5>
	                <div class="input-group" style="margin: 20px 0;">
	                	<select id="movie_select" name="movie_cd" style="width: 100%;">
	                		<c:if test="${empty watchMovie }">
	                			<option>본 영화가 없습니다.</option>
	                		</c:if>
	                		<c:if test="${!empty watchMovie }">
	                			<option value="none">영화 선택</option>
	                		<c:forEach items="${watchMovie }" var="movie">
	                			<option value="${movie.movie_cd }">${movie.movie_name }</option>
	                		</c:forEach>
	                		</c:if>
	                	</select>
	<!-- 	                <div style="display: flex;"> -->
	<!-- 	                </div> -->
	                </div>
	                <div class="pic-group" style="height: 400px; overflow-y: auto; overflow-x: hidden;">
	                <input type="hidden" name="movie_pic_no" value="">
		                <div class="row" id="moviePicGroup">
		              		 <div style="text-align: center; margin-top: 200px;" id="noMovie">
			              		 영화를 선택하세요
		              		 </div>

		                </div>
	                </div>
            	</div>
            	<div class="col-6">
            		<div class="pic" style="height: 300px; border: solid 1px #eee; text-align: center; margin-bottom: 10px;" id="selPic">
            			<div id="noPic" style="text-align: center; margin-top: 150px;">사진을 선택하세요.</div>
            		</div>
	                <div class="input-group">
	                    <textarea class="form-control" style="width: 85%; height: 200px; resize: none;" placeholder="내용을 작성해주세요." id="posttext" name="mpost_content"></textarea>
						<p style="text-align: right; width: 100%;">
				            <span id="writecount">0</span>
				            <span>/50 자</span>
			            </p>
	                </div>
	                <div class="p-t-10" style="display: flex;">
		                <div style="width: 50%; margin: 0 auto;" id="regDiv">
		                    <button class="btn btn-regist" type="button" data-target="#" style="float: right;" id="postRegistBtn">등록</button>
		                </div>
		                <div style="width: 50%; margin: 0 auto;">
		                    <button class="btn btn-cancel" type="button" data-target="#" style="float: left;" id="postCancelBtn">취소</button>
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
		if($('#movie_select').val() == "none"){
			$('#alertContent').text("영화를 선택해주세요.")
			$('#alert-modal').modal('show');
			return;
		}
		if($('input[name="movie_pic_no"]').val() == ""){
			$('#alertContent').text("사진을 선택해주세요.")
			$('#alert-modal').modal('show');
			return;
		}
		if($('#posttext').val() == "" || $('#posttext').val() == null){
			$('#alertContent').text("내용을 작성해주세요.")
			$('#alert-modal').modal('show');
			return;
		}
		$('#moviePostForm').submit();
	})
	
	$('#moviepost-modal').on('show.bs.modal', function(e){
		if($('#movie_select').val() != "none"){
			let movie_cd = $('#movie_select').val();
			$.ajax({
				url : '<%=request.getContextPath()%>/movie/moviePic.do',
				data : {"movie_cd" : movie_cd},
				method : 'post',
				success : function(res){
					console.log(res);
					moviePicShow(res);
				},
				error : function(err){
					alert(err.status);
				}
			})
		}
	})
	
	$('#postRegistBtn').on('click', function(){
		if($('#movie_select').val() == "none"){
			$('#alertContent').text("영화를 선택해주세요.")
			$('#alert-modal').modal('show');
			return;
		}
		if($('input[name="movie_pic_no"]').val() == ""){
			$('#alertContent').text("사진을 선택해주세요.")
			$('#alert-modal').modal('show');
			return;
		}
		if($('#posttext').val() == "" || $('#posttext').val() == null){
			$('#alertContent').text("내용을 작성해주세요.")
			$('#alert-modal').modal('show');
			return;
		}
		$('#moviePostForm').submit();
		
	})
	
	$('#posttext').on('keyup', function() {
        $('#writecount').html($(this).val().length);
 
        if($(this).val().length > 50) {
            $(this).val($(this).val().substring(0, 50));
            $('#writecount').html("50");
        }
    });
	
	$('#moviepost-modal').on('hidden.bs.modal', function (e) {
		$(this).find('#moviePostForm')[0].reset();
		let show = '<div id="noPic" style="text-align: center; margin-top: 150px;">사진을 선택하세요.</div>';
		$('#selPic').html(show);
		let show2 = '<div style="text-align: center; margin-top: 200px;" id="noMovie">영화를 선택하세요</div>';
		$('#moviePicGroup').html(show2);
		 $('#writecount').html("0");
		 $('input[name="movie_pic_no"]').val("");
		 location.reload();
	});
	
	$('#movie_select').on('change', function(){
		let movie_cd = $(this).val();
		if(movie_cd == 'none'){
			let noMo = '<div style="text-align: center; margin-top: 200px;" id="noMovie">영화를 선택하세요</div>';
			$('#moviePicGroup').html(noMo);
			return;
		}
		let show = '<div id="noPic" style="text-align: center; margin-top: 150px;">사진을 선택하세요.</div>';
		$('#selPic').html(show);
		$('input[name="movie_pic_no"]').val("");
		$.ajax({
			url : '<%=request.getContextPath()%>/movie/moviePic.do',
			data : {"movie_cd" : movie_cd},
			method : 'post',
			success : function(res){
				console.log(res);
				moviePicShow(res);
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
	$('#postCancelBtn').on('click', function(){
		$('#moviepost-modal').modal('hide');
	})
	
	$('#moviePicGroup').on('click', '#picture', function(){
		let movie_cd = $(this).data("movie_cd");
		let path = $(this).data("path");
		let movie_pic_no = $(this).data("movie_pic_no");
		let show = '<img src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=' + path + '&item_cd=' + movie_cd + '&type=movieImg" style="max-height: 300px; max-width: 464px;">';
		$('#selPic').html(show);
		$('input[name="movie_pic_no"]').val(movie_pic_no);
	})
})


function moviePicShow(res){
	let movie_cd = $('#movie_select').val();
	let show = '';
	for(let i = 0; i < res.length; i++){
		let path = res[i].movie_pic_path;
		let movie_cd = res[i].movie_cd;
		let movie_pic_no = res[i].movie_pic_no;
		show += '<div class="col-4" style="margin-bottom: 10px;" id="picture" data-movie_cd="' + movie_cd + '" data-path="' + path + '" data-movie_pic_no="' + movie_pic_no + '">';
		show += '<img src="<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=' + path + '&item_cd=' + movie_cd + '&type=movieImg" style="width: 100%; height: auto;">'
		show += '</div>'
	}
	$('#moviePicGroup').html(show);
}
</script>