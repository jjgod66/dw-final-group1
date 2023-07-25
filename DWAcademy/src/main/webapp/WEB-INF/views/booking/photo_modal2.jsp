<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.css" integrity="sha512-C4k/QrN4udgZnXStNFS5osxdhVECWyhMsK1pnlk+LkC7yJGCqoYxW4mH3/ZXLweODyzolwdWSqmmadudSHMRLA==" crossorigin="anonymous" referrerpolicy="no-referrer" />    
<!-- <link rel="stylesheet" type="text/css" href="https://fengyuanchen.github.io/cropperjs/css/cropper.css"> -->
<!-- <script src="https://fengyuanchen.github.io/cropper/js/cropper.js"></script> -->
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
/*     color: #fff; */
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
    width: 49%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#photo-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 49%;
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

.p-t-10{
	margin-top: 10px; 
}

.photo_box{margin:0 auto ;max-width:500px;} 
.photo_them{position:relative;margin-top:20px;width:100%;height:500px;}
.them_img, .result_box{position:absolute;top:0;left:0;width:100%;height:100%;}
.result_box{background:#fff;}
.them_img img, .result_box img{display:block;margin:0 auto;height:100%;}
#complete{display:block;margin-top:20px;padding:15px 0;width:100%;text-align:center;color:#fff;text-decoration: none;background-color: steelblue;}


</style>
    
<div class="modal fade" id="photo-modal">
	<div class="modal-dialog modal-dialog-centered" style="max-width: 800px;">
        <div class="modal-content">
			<div class="photo_them">
			    <div class="them_img">
<!-- 			    	<img id="image" src="" style="width:100%;"> -->
			    </div>
			</div>
			 <div class="p-t-10" style="display: flex;">
				<button class="btn btn-regist" id="crop">자르기</button>
				<button class="btn btn-regist" id="success" style="display:none">완료</button>
				<button class="btn btn-cancel" id="modalCancel">취소</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.js" integrity="sha512-LjPH94gotDTvKhoxqvR5xR2Nur8vO5RKelQmG52jlZo7SwI5WLYwDInPn1n8H9tR0zYqTqfNxWszUEy93cHHwg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

$(function(){
	var cropper;
	$('#crop').on('click', function(){
		$(this).css('display', 'none');
		$('#success').css('display', '');
		
		let image = $('#image');
		cropper = image.cropper( {
			dragMode: 'move',
			viewMode:1,
			aspectRatio: 0.647,
			minCropBoxWidth:200,
        });
		
    })
    
    $('#modalCancel').on('click', function(){
    	$('.them_img').html('');
    	$('#inputfile').val('');
    	$('#photo-modal').modal('hide');
    	$('#crop').css('display', '');
		$('#success').css('display', 'none');
    	
    })
    
    
    $('#success').on('click', function(){
    	var image = $('#image');
    	var result = $('#result');
    	var canvas;
    	if($('input[type="file"]').val() != ""){
    	canvas = image.cropper('getCroppedCanvas');
    	result.css('background-image','url(' + canvas.toDataURL("image/jpg") + ')');

    	canvas.toBlob(function (blob) {
    		var formData = new FormData();
			
    		formData.append('croppedImage', blob);
    		$.ajax({
    			url : '<%=request.getContextPath()%>/photoTicket/uploadImg.do',
           		method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (res) {
                	console.log(res);
                	$('#photo-modal').modal('hide');
                	$('.them_img').html('');
                	$('#inputfile').val('');
                	$('#imgupbtn').css('display', 'none');
                	$('#crop').css('display', '');
            		$('#success').css('display', 'none');
            		$('input[name="frontPic"]').val(res);
                },
                error: function (err) {
                	alert(err.status);
                },
    		});
    	})
      }else{
          alert('사진을 업로드 해주세요');
          $('input[type="file"]').focus();
          return;
      }
    	
//     	cropper.getCroppedCanvas();
//     	console.log(cropper.getCroppedCanvas());
    	
//     	cropper.getCroppedCanvas().toBlob(function (blob){
//     		//HTMLCanvasElement를 return 받아서 blob파일로 변환해준다
//     		  const formData = new FormData();

//    			  formData.append('croppedImage', blob/*, 'example.png' , 0.7*/);
//     			//새로운 formData를 생성해서 앞에서 변경해준 blob파일을 삽입한다.(이름 지정 가능, 맨뒤 매개변수는 화질 설정)
//     		  // jQuery.ajax이용해서 서버에 업로드
//     		  $.ajax({
<%--     			url : '<%=request.getContextPath()%>/photoTicket/uploadImg.do', --%>
//     		    method: 'POST',
//     		    data: formData,//앞에서 생성한 formData
//     		  	processData : false,	// data 파라미터 강제 string 변환 방지
//     		    contentType : false,	// application/x-www-form-urlencoded; 방지
//     		    success : function(res) {
//     		      console.log(res);
//     		    },
//     		    error : function(err) {
//     		      alert(err.status);
//     		    },
//     		  });
//     		}/*, 'image/png' */);//서버에 저장 형식 사용 가능
    })
    
})



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