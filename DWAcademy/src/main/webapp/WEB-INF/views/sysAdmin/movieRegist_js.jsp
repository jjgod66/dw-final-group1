<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	// 상영종료일  제한
	let nowDate = Date.now();
	let timeOff = new Date().getTimezoneOffset()*60000;
	let today = new Date(nowDate-timeOff).toISOString().split("T")[0];
	$('#enddate').attr('min', today);
	$('#opendate').on('change', function(){
		let opendate = $(this).val();
		let mindate;
		if (opendate > today) {
			mindate = opendate;
		} else {
			mindate = today;
		}
		$('#enddate').attr('min', mindate);
		if ($('#enddate').val() < $(this).val()) {
			$('#enddate').val('');
		}
	});
	
	// 포스터버튼 클릭
	$('#posterBtn').on('click', function() {
		$('#movie_mainPic_path').click();
	});

	// 포스터 이미지 프리뷰
	function posterChange_go() {
		let inputImage = $('input#movie_mainPic_path')[0];
		preViewPicture(inputImage, $('div#pictureView'));
		$('input[name="inputPosterName"]').val(inputImage.files[0].name);
	};
	
	// 관련사진 이미지 프리뷰
	$(document).on('change', 'input[name="uploadImg"]', function(){
		let inputImg = $(this)[0];
		preViewPicture(inputImg, $(this).siblings('#imgView'));
	});
	
	// 예고편 동영상 프리뷰
	$(document).on('change', 'input[name="uploadVideo"]', function(){
		console.log($(this)[0].files[0]);
	 	let inputVideo = $(this)[0].files[0];
	 	console.log(inputVideo);
		let videoUrl = URL.createObjectURL(inputVideo);
		$(this).siblings('.vi').attr('src', videoUrl);
	});
	
	$('input[name="genre_cd"]').on('click', function(e){
		let genre_cnt = $('input[name="genre_cd"]:checked').length;
		if (genre_cnt > 3) {
			alert('장르는 3개까지 설정 가능합니다.');
			e.preventDefault();
		}
	});
	
	Attach_action();
	
	// 등록버튼 클릭
	$('#registBtn').on('click', function(){
		
		let form = $('form[role="form"]');
		form.attr({'method' : 'post', 'action' : 'movieRegist.do'});
		if (checkForm() == 1) return;
		
		form.submit();
	});
	
	// 수정버튼 클릭
	$('#modifyBtn').on('click', function(){
		let input = $('<input>').attr({
										'type' : 'hidden',
										'name' : 'movie_cd',
										'value' : '${MOVIE_CD}'
									  });
		$('form[role="form"]').prepend(input);
		let form = $('form[role="form"]');
		form.attr({'method' : 'post', 'action' : 'movieModify.do'});
		if (checkForm() == 1) return;
		
		form.submit();
	});
	
	// 뒤로가기버튼 클릭
	$('#cancelBtn').on('click', function(){
		location.href="<%=request.getContextPath()%>/sysAdmin/movieAdminMain.do";
	});
	
	// 작성폼 확인
	function checkForm(){
		
		if ($('#movie_name').val() == '') {
			alert('영화제목은 필수입력항목입니다.');
			$('#movie_name').focus();
			return 1;
		}
		
		if ($('#movie_director').val() == '') {
			alert('감독은 필수입력항목입니다.');
			$('#movie_director').focus();
			return 1;
		}
		
		if ($('textarea[name="movie_info"]').val() == '') {
			alert('영화소개는 필수입력항목입니다.');
			$('textarea[name="movie_info"]').focus();
			return 1;
		}
		
		if ($('#opendate').val() == '') {
			alert('개봉일은 필수입력항목입니다.');
			$('#opendate').focus();
			return 1;
		}
		
		if ($('#enddate').val() == '') {
			alert('상영종료일은 필수입력항목입니다.');
			$('#enddate').focus();
			return 1;
		}
		
		if ($('#movie_actor').val() == '') {
			alert('출연진은 필수입력항목입니다.');
			$('#movie_actor').focust();
			return 1;
		}
		
		if ($('#inputPosterName').val() == '') {
			alert('메인포스터는 필수입력항목입니다.');
			return 1;
		}
		
		// 러닝타임 숫자자리수 제한
		let ml_length = $('input[name="movie_length"]').val().length;
		if (ml_length > 4 ||  $('input[name="movie_length"]').val() == '') {
			alert("러닝타임을 확인하고 입력해주세요. (분 단위, 양의정수)");
			$('input[name="movie_length"]').focus();
			$('input[name="movie_length"]').click();
			return 1;
		}
		
		// 장르 최소 1개 선택 확인
		let genre_cnt = $('input[name="genre_cd"]:checked').length;
		if (genre_cnt < 1 ) {
			alert("장르가 최소 1개는 선택되어야 합니다.");
			$('input[name="genre_cd"]').focus();
			return 1;
		}
		
		// 더빙타입 최소 1개 선택 확인
		let isdub_cnt = $('input[name="isdub"]:checked').length;
		if (isdub_cnt < 1 ) {
			alert("더빙타입이 최소 1개는 선택되어야 합니다.");
			$('input[name="isdub"]').focus();
			return 1;
		}
		
		// 2d/3d유무 최소 1개 선택 확인
		let is3d_cnt = $('input[name="is3d"]:checked').length;
		if (is3d_cnt < 1 ) {
			alert("2D/3D유무가 최소 1개는 선택되어야 합니다.");
			$('input[name="is3d"]').focus();
			return 1;
		}

	}
	
</script>