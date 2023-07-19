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
.photo_them{position:relative;margin-top:20px;width:100%;height:250px;background:#eee;}
.them_img, .result_box{position:absolute;top:0;left:0;width:100%;height:100%;}
.result_box{background:#fff;}
.them_img img, .result_box img{display:block;margin:0 auto;height:100%;}
#complete{display:block;margin-top:20px;padding:15px 0;width:100%;text-align:center;color:#fff;text-decoration: none;background-color: steelblue;}


</style>
<div class="modal fade" id="photo-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="photo_box">
	   	 	<input type="file" name="photoBtn" accept="image/jpeg, image/png" capture="camera" id="photoBtn"><label for="photoBtn">사진 첨부하기</label>
		      <div class="photo_them">
			    <div class="them_img">
			    	<img id="image" src="">
			    </div>
 			 </div>
	   	 	</div>
	   	 	 <a href="javascript:void(0);" id="complete">업로드</a>
	    </div>
	</div>
</div>

<script>
var cropper;
// 사진 업로드 버튼
$('#photoBtn').on('change', function(){
    $('.them_img').empty().append('<img id="image" src="">');
    var image = $('#image');
    var imgFile = $('#photoBtn').val();
    var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
	
    // 이미지가 확장자 확인 후 노출
    if(imgFile.match(fileForm)) {
    	var reader = new FileReader(); 
    	reader.onload = function(event) { 
    		image.attr("src", event.target.result);
    		cropper = image.cropper( {
    			dragMode: 'move',
    			viewMode:1,
    			aspectRatio: 1,
    			autoCropArea:0.9,
    			minCropBoxWidth:200,
   				restore: false,
                guides: false,
                center: false,
                highlight: false,
                cropBoxMovable: false,
                cropBoxResizable: false,
                toggleDragModeOnDblclick: false
            });
        }; 
    	reader.readAsDataURL(event.target.files[0]);
    } else{
    	alert("이미지 파일(jpg, png형식의 파일)만 올려주세요");
    	$('#photoBtn').focus();
    	return; 
    }
});

$('#complete').on('click', function(){
	$('.them_img').append('<div class="result_box"><img id="result" src=""></div>');
	var image = $('#image');
	var result = $('#result');
	var canvas;
// 	if($('input[type="file"]').val() != ""){
// 	canvas = image.cropper('getCroppedCanvas',{
// 		width:200,
// 		height:200
// 	});
// 	result.attr('src',canvas.toDataURL("image/jpg"));

// 	canvas.toBlob(function (blob) {
// 		var formData = new FormData();

// 		$.ajax('보낼곳 url', {
//        		method: 'POST',
//             data: formData,
//             processData: false,
//             contentType: false,
//             success: function () {
//             	alert('업로드 성공');
//             },
//             error: function () {
//             	alert('업로드 실패');
//             	$('.result_box').remove()
//             },
// 		});
// 	})
//   }else{
//       alert('사진을 업로드 해주세요');
//       $('input[type="file"]').focus();
//       return;
//   }
});
</script>