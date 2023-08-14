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
		let input = $('<input>').attr({"type" : "file", "name" : "uploadImg", "accept" : ".jpeg, .png, .jpg, .gif"}).css("display", "none");
		let addImgBtn = $('<button type="button" style="background-color: inherit; border:none; color: #4aa8d8;"><i class="bi bi-plus-square imgBtn"></i></button>');
		let imgCol = $('<div style="border:2px solid #4aa8d8;">').addClass('imgCol borderRadius p-1 text-end'); 
		$('.inputImgRow').append($('<div class="col-md-6 gy-2 imgDiv">'));
		$('.inputImgRow > div').last().append(imgCol);
		imgCol.append(input).append(addImgBtn).append("<button type='button' style='background-color: inherit; border: none; color: #ef4836;' id='cancelAddBtn'><i class='bi bi-dash-square'></i></button>").append("<div id='imgView' class='borderRadius' style='border: 1px solid green; height: 18rem; width: 24rem; margin: 0 auto; margin-bottom: 5px; background-position-x : 50%; background-position-y : 50%;'></div>");
	});
	
	$(document).on('click','.imgBtn', function(){
		$(this).closest('button').prev().click();
	});

	$(document).on('click','.videoBtn', function(){
		$(this).closest('button').prev().click();
	});

	
	// 사진 삭제 버튼
	$(document).on('click', 'button#cancelAddBtn',function(){
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
		$(this).closest('div.imgDiv').remove();
	});
	
	// 동영상 추가 버튼
	$('#addVideoBtn').on('click', function(){
		if ($('input[name="uploadVideo"]').length >= 5) {
			alert('동영상 추가는 5개까지만 가능합니다.');
			return;
		}
		let input = $('<input>').attr({"type" : "file", "name" : "uploadVideo", "accept" : "video/mp4,video/mkv, video/x-m4v,video/*"}).css("display", "none");
		let addVideoBtn = $('<button type="button" style="background-color: inherit; border: none; color: #4aa8d8;"><i class="bi bi-plus-square videoBtn"></i></button>');
		let videoCol = $('<div style="border: 2px solid #4aa8d8;">').addClass('videoCol borderRadius p-1 text-end');
		$('.inputVideoRow').append($('<div class="col-md-6 gy-2 videoDiv">'));
		$('.inputVideoRow > div').last().append(videoCol);
		videoCol.append(input).append(addVideoBtn).append("<button type='button' style='background-color: inherit; border: none; color: #ef4836;' id='cancelAddBtn'><i class='bi bi-dash-square'></i></button>").append("<video class='vi borderRadius' style='width: 100%; height: 100%;' controls></video>");
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
		$(this).closest('div.videoDiv').remove();
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
	if ('${MOVIE_MAINPIC_PATH}' != null && '${MOVIE_MAINPIC_PATH}' != '') {
		let imageURL = '/common/getPicture.do?name=${MOVIE_MAINPIC_PATH}&item_cd=${MOVIE_CD}&type=moviePoster';	// 이미지명 가지고 와서 셋팅
	 	$('div#pictureView').css({
									'background-image' : 'url("' + imageURL + '")',
									'background-position' : 'center',
									'background-size' : 'cover',
									'background-repeat' : 'no-repeat'
								});
	}
}


</script>