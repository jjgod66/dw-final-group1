$(document).ready(function() {
    $(window).on('load', function(event) {
        $('.preloader').delay(500).fadeOut(500);
    });

    if($('.scrollbar-inner').length > 0){
        $('.scrollbar-inner').scrollbar();
    }

    var dwcinema_gnb = $("#dwcinema_gnb");

    // 마우스를 요소 위로 가져갈 때 이벤트 처리
    dwcinema_gnb.on("mouseover", function() {
      // opacity 속성을 1로 변경
      $(".background").css("opacity", "1");
      $(".background").css("display", "block");
      $("#dwcinema_gnb").css("overflow", "");
      $("#dwcinema_gnb > li > ul").css("opacity", "1");
    });

    // 마우스가 요소 밖으로 벗어날 때 이벤트 처리
    $(".background").on("mouseout", function() {
      // opacity 속성을 다시 0으로 변경
      $(".background").css("opacity", "0");
      $(".background").css("display", "none");
      $("#dwcinema_gnb").css("overflow", "hidden");
      $("#dwcinema_gnb > li > ul").css("opacity", "0");
    });

    // 각 버튼에 대해 클릭 이벤트 리스너를 추가합니다.
    $('.btn-schedule button').click(function() {
      // 클릭된 버튼의 data-moviecd 속성 값을 가져옵니다.
      const tablist = $(this).data('tablist');
      const btnMovies = $('.btn-schedule');

      btnMovies.removeClass('active');
      $(this).closest('.btn-schedule').addClass('active');

      const linkUrl  = tablist + ".do";

      // 입력 요소의 value 속성에 값을 할당합니다.
      history.pushState(null, null, linkUrl);
      history.go();
    });
//    $('.js-datepicker').daterangepicker({
//        "singleDatePicker": true,
//        "showDropdowns": true,
//        "autoUpdateInput": false,
//        locale: {
//            format: 'YYYY-MM-DD'
//        },
//    });
//    var myCalendar = $('.js-datepicker');
//    var isClick = 0;
//    $(window).on('click', function() {
//        isClick = 0;
//    });
//    $(myCalendar).on('apply.daterangepicker', function(ev, picker) {
//        isClick = 0;
//        $(this).val(picker.startDate.format('YYYY-MM-DD'));
//    });
//    $('.js-btn-calendar').on('click', function(e) {
//        e.stopPropagation();
//        if (isClick === 1) isClick = 0;
//        else if (isClick === 0) isClick = 1;
//        if (isClick === 1) {
//            myCalendar.focus();
//        }
//    });
//    $(myCalendar).on('click', function(e) {
//        e.stopPropagation();
//        isClick = 1;
//    });
//    $('.daterangepicker').on('click', function(e) {
//        e.stopPropagation();
//    });
//    
});
// 팝업창 띄우기
// 새로운 Window 창을 Open 할 경우 사용되는 함수 (arg : 주소, 창 타이틀, 넓이, 길이)
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes, width=" + WinWidth
			+ ", height=" + WinHeight + ", top=" + wintop + ", left=" 
			+ winleft + ", resizable=yes, status=yes");
	win.focus();
};

// 팝업창 닫기
function CloseWindow(){
	self.opener = self;
	window.close();
};

// 이미지 프리뷰
function preViewPicture(inputImage, target){
	let fileFormat = inputImage.value.substr(inputImage.value.lastIndexOf('.')+1).toUpperCase();	// 확장자 뽑기
	
	// 이미지 확장자 jpg 확인
	if (fileFormat != "JPG" && fileFormat != "JPEG" && fileFormat != "PNG" && fileFormat != "GIF") {
		alert("정해진 이미지 확장자만 가능합니다.");
		return;
	};
	
	// 이미지 파일 용량 체크
	if (inputImage.files[0].size > 1024 * 1024 * 3) {
		alert("사진 용량은 3MB 이하만 가능 합니다.");
		return;
	};
	// 파일명 inputTag에 삽입
	target.next().find('#inputFileName').val(inputImage.files[0].name);
	
	// 미리보기
	if (inputImage.files) {
		let reader = new FileReader();
		
		reader.onload = function(e){
			target.css({
				'background-image' : 'url(' + e.target.result + ')',
				'background-position' : 'center',
				'background-size' : 'cover',
				'background-repeat' : 'no-repeat'
			});
		};
		
		reader.readAsDataURL(inputImage.files[0]);
	}
}

