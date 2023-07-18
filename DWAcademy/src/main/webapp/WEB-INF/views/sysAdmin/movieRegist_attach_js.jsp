<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function Attach_action(){
	
	// 사진 추가 버튼
	$('#addImgBtn').on('click', function(){
		if ($('input[name="uploadImg"]').length >= 10) {
			alert('사진 추가는 10장까지만 가능합니다.');
			return;
		}
		let input = $('<input>').attr({"type" : "file", "name" : "uploadImg", "accept" : ".jpeg, .png, .jpg, .gif"}).css("display", "inline");
		let imgCol = $('<div>').addClass('col-md-3 imgCol');
		$('.inputImgRow').append(imgCol);
		imgCol.append(input).append("<button class='btn btn-outline-danger btn-sm' type='button' id='cancelAddBtn'>X</button>").append("<div id='imgView'	style='border: 1px solid green; height: 12rem; width: 10rem; margin: 0 auto; margin-bottom: 5px;'></div>");
	});
	
	// 사진 삭제 버튼
	$('.imgInput').on('click', '#cancelAddBtn',function(){
		if($(this).closest('div.imgCol').hasClass('alreadyImg')) {
			let pno = $(this).siblings('#imgName').val();
			console.log(pno);
			let input = $('<input>').attr({
				'type' : 'hidden',
				'name' : 'deleteImg',
				'value' : pno
			  });
			$('form[role="form"]').prepend(input);
		}
		$(this).closest('div.imgCol').remove();
	});
	
	// 동영상 추가 버튼
	$('#addVideoBtn').on('click', function(){
		if ($('input[name="uploadVideo"]').length >= 5) {
			alert('동영상 추가는 5개까지만 가능합니다.');
			return;
		}
		let input = $('<input>').attr({"type" : "file", "name" : "uploadVideo", "accept" : "video/mp4,video/mkv, video/x-m4v,video/*"}).css("display", "inline");
		let videoCol = $('<div>').addClass('col-md-6 videoCol');
		$('.inputVideoRow').append(videoCol);
		videoCol.append(input).append("<button class='btn btn-outline-danger btn-sm' type='button' id='cancelAddBtn'>X</button>").append("<video class='vi' style='width: 100%; height: 100%;' controls></video>");
	});
	
	// 동영상 삭제 버튼
	$('.videoInput').on('click', '#cancelAddBtn',function(){
		if($(this).closest('div.videoCol').hasClass('alreadyVideo')) {
			let pno = $(this).siblings('#videoName').val();
			console.log(pno);
			let input = $('<input>').attr({
				'type' : 'hidden',
				'name' : 'deleteVideo',
				'value' : pno	
			  });
			$('form[role="form"]').prepend(input);
		}
		$(this).closest('div.videoCol').remove();
	});

	
	// 파일 용량 체크
	$('.fileInput').on('change', 'input[type="file"]', function(){
		if(this.files[0].size > 1024*1024*40) {
			alert("파일 용량이 40MB를 초과하였습니다.");
			this.value="";
			$(this).focus();
			return;
		}
	});
	
	// 수정일때 기본 포스터
	let imageURL = 'getPicture.do?name=${MOVIE_MAINPIC_PATH}&movie_cd=${MOVIE_CD}&type=p';	// 이미지명 가지고 와서 셋팅
 	$('div#pictureView').css({
								'background-image' : 'url("' + imageURL + '")',
								'background-position' : 'center',
								'background-size' : 'cover',
								'background-repeat' : 'no-repeat'
							});
}


</script>