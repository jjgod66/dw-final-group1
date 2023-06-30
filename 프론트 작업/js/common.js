$(document).ready(function() {
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
      $(".background").css("display", "none")
      $("#dwcinema_gnb").css("overflow", "hidden");
      $("#dwcinema_gnb > li > ul").css("opacity", "0");
    });
});