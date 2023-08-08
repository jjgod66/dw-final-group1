<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/member_header.jsp" %>
<style>
.navM {
  --primary-color: #185ee0;
  --secondary-color: #e6eef9;
  display: flex;
  align-items: center;
  justify-content: center;
}
.tabs {
  display: flex;
  position: relative;
  box-shadow: 0 0 1px 0 rgba(#185ee0, 0.15), 0 6px 12px 0 rgba(#185ee0, 0.15);
  padding: 0.75rem;
  border-radius: 99px; 
}
.tabs * {
  z-index: 2;
}
input[type="radio"] {
  display: none;
}

.tabo {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 54px;
  width: 160px;
  font-weight: 500;
  border-radius: 99px; 
  /* cursor: pointer; */
  transition: color 0.15s ease-in;
}

.notification {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 2rem;
  height: 2rem;
  margin-left: 0.75rem;
  border-radius: 50%;
  background-color: var(--secondary-color);
  transition: 0.15s ease-in;
}
input[type="radio"]:checked + label {
  color: var(--primary-color);
}
a[id="radio-1"]:checked + div {
  color: var(--primary-color);
}
input[type="radio"]:checked + label > .notification {
  background-color: var(--primary-color);
  color: #fff;
}
a[id="radio-1"]:checked + div > .notification {
  background-color: var(--primary-color);
  color: #fff;
}
input[id="radio-1"]:checked ~ .glider {
  transform: translateX(0);
}
a[id="radio-1"]:checked ~ .glider {
  transform: translateX(0);
}
input[id="radio-2"]:checked ~ .glider {
  transform: translateX(100%);
}

input[id="radio-3"]:checked ~ .glider {
  transform: translateX(200%);
}

input[id="radio-4"]:checked ~ .glider {
  transform: translateX(300%);
}
input[id="radio-5"]:checked ~ .glider {
  transform: translateX(400%);
}
.glider {
  position: absolute;
  display: flex;
  height: 54px;
  width: 160px;
  background-color: var(--secondary-color);
  z-index: 1;
  border-radius: 99px; 
  transition: 0.25s ease-out;
}

@media (max-width: 700px) {
  .tabs {
    transform: scale(0.6);
  }
}
body{font-family: 'IBM Plex Sans KR', sans-serif; background:#f8f9fa;}
 #wrapper1234 {
 margin-left:auto;
 margin-right:auto;
    width: 90%;
}
</style>
<div id="wrapper1234">
	<div class="navM">
		<div class="tabs">
				<input type="radio" id="radio-1" name="tabs" checked="" onclick="showSection('section1')">
				<label class="tabo" for="radio-1" data-url="/mypage/movieStory?tab=01">무비타임라인<span class="notification">2</span></label>
				<input type="radio" id="radio-2" name="tabs" onclick="showSection('section2')">
				<label class="tabo" for="radio-2" data-url="/mypage/movieStory?tab=02">무비포스트<span class="notification">9</span></label>
				<input type="radio" id="radio-3" name="tabs" onclick="showSection('section3')">
				<label class="tabo" for="radio-3" data-url="/mypage/movieStory?tab=03">리뷰<span class="notification">10</span></label>
				<input type="radio" id="radio-4" name="tabs" onclick="showSection('section4')">
				<label class="tabo" for="radio-4" data-url="/mypage/movieStory?tab=04">좋아요<span class="notification">26</span></label>
				<input type="radio" id="radio-1" name="tabs" >
				<span class="glider"></span>
		</div>
	</div>
	
	<!-- 무비타임라인클릭시 보이는 화면  -->
	<%@ include file="movieTimeLine.jsp" %>
	
	<div id="section2" class="section" style="display: none;">
		<%@ include file="myMoviepost.jsp" %>
	</div>
	
	<div id="section3" class="section" style="display: none;">
	  섹션 3 내용
	</div>
	
	<div id="section4" class="section" style="display: none;">
	  섹션 4 내용
	</div>
</div>
<script>
function showSection(sectionId) {
    // 모든 섹션들을 가져옴
    var sections = document.getElementsByClassName("section");

    // 모든 섹션들을 숨김 처리
    for (var i = 0; i < sections.length; i++) {
      sections[i].style.display = "none";
    }

    // 선택한 섹션만 보이도록 함
    var selectedSection = document.getElementById(sectionId);
    if (selectedSection) {
      selectedSection.style.display = "block";
    }
  }




$(document).ready(function () {
	// 페이지가 로드되면 해시태그에 따라 해당 콘텐츠를 보여주거나 감추는 함수 실행
	handlerHashChange();
	// 예매, 구매 탭을 클릭할 때 해시태그 변경 및 콘텐츠 표시/감추기
	$(".tab-block li").on("click", function (event) {
// 		event.preventDefault();
		var href = $(this).find("a").attr("href");
		history.pushState({}, "", href);
		handlerHashChange();

		// 클릭한 탭 버튼에 클래스를 추가하여 활성화 표시
		$(".tab-block li.on").removeClass("on");
		$(this).addClass("on");
	});

	// 브라우저 뒤로 가기 버튼 클릭 시에도 해시태그에 따라 콘텐츠를 보여주거나 감춤
	$(window).on("popstate", function () {
		handlerHashChange();

		// 뒤로 가기 버튼에 따라 탭 버튼도 변경
		$(".tab-block li.on").removeClass("on");
		var hash = window.location.hash;
		var targetTab = $('a[href="' + hash + '"]').parent();
		targetTab.addClass("on");
	});

	// 해시태그에 따라 콘텐츠를 보여주거나 감추는 함수
	function handlerHashChange() {
		var hash = window.location.hash;
		$(".content-section").hide();
		$(hash).show();
	};
})
</script>
<%@ include file="../include/member_footer.jsp" %>