<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>

#photo-modal .modal-content{
    border-radius: 0.7rem;
}
#photo-modal .modal-header img{
    width: 100px;
}
#photo-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#photo-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#photo-modal .modal-footer{
    border-top: none;
}
#photo-modal button:active{
    outline: none;
}
#photo-modal button:focus{
   outline: none;
}
#photo-modal .modal-body{
    text-align: center;
}
#photo-modal form{
    padding: 3vh;
}
#photo-modal input {
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
#photo-modal .input-group {
    margin-bottom: 1rem;
}
#photo-modal .input--style-3 {
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
#photo-modal .btn {
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


#photo-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#photo-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 70%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}

#photo-modal .btn-primary{
      width:40%;
      margin:30%
}
#photo-modal .btn:focus{
    box-shadow: none;
    outline: none;
}

.photo_box{margin:0 auto ;max-width:500px;} 
.photo_them{position:relative;margin-top:20px;width:100%;height:500px;}
.them_img, .result_box{position:absolute;top:0;left:0;width:100%;height:100%;}
.result_box{background:#fff;}
.them_img img, .result_box img{display:block;margin:0 auto;height:100%;}
#complete{display:block;margin-top:20px;padding:15px 0;width:100%;text-align:center;color:#fff;text-decoration: none;background-color: steelblue;}


</style>
    
<div class="modal fade" id="photo-modal">
	<div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
			<div class="photo_them">
			    <div class="them_img">
<!-- 			    	<img id="image" src=""> -->
			    </div>
			</div>
			<button>올리기</button>
			<button>취소</button>
		</div>
	</div>
</div>

<script>



//사진 업로드 버튼
// $('#inputfile').on('change', function(){

//  $('.them_img').empty().append('<img id="image" src="">');
//  var image = $('#image');
//  var imgFile = $('#inputfile').val();
//  var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
	
//  // 이미지가 확장자 확인 후 노출
//  	var reader = new FileReader(); 
//  	reader.onload = function(event) { 
//  		image.attr("src", event.target.result);
//  		cropper = image.cropper( {
//  			dragMode: 'move',
//  			viewMode:1,
//  			aspectRatio: 1,
//  			autoCropArea:0.9,
//  			minCropBoxWidth:200,
// 				restore: false,
//              guides: false,
//              center: false,
//              highlight: false,
//              cropBoxMovable: false,
//              cropBoxResizable: false,
//              toggleDragModeOnDblclick: false
//          });
//      }; 
//  	reader.readAsDataURL(event.target.files[0]);
// });
</script>