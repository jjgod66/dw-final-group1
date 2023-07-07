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
});