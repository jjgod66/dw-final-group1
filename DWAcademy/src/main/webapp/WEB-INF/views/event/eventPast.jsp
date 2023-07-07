<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cri" value="${pageMaker.cri}"/>
<style>
#contents {
    width: 100%;
    margin: 0;
    padding: 40px 0 0 0;
}
.inner-wrap {
    width: 900px;
    margin: 0 auto;
}
.font-gblue {
    color: #01738b!important;
}

.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
.mt0 {
    margin-top: 0!important;
}
.board-list-util {
    margin: 30px 0 15px 0;
    text-align: right;
}
.board-list-util .result-count {
    position: relative;
    float: left;
    margin: 0;
    padding-top: 15px;
    line-height: 1.1;
    vertical-align: top;
}

<<<<<<< HEAD
=======
* {
    box-sizing: border-box;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
>>>>>>> branch 'main' of https://github.com/jjgod66/dw-final-group2.git
.board-search {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    width: 230px;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
}
.board-search .btn-search-input {
    position: absolute;
    right: 1px;
    top: 1px;
}

.btn-search-input {
    overflow: hidden;
    width: 30px;
    height: 32px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
    text-indent: -9999px;
    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-search-input.png) no-repeat center;
}
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}
button {
    cursor: pointer;
    letter-spacing: -.5px;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
.input-text {
    display: inline-block;
    width: 100%;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
.event-list.finish {
    margin: 0;
    border-top: 1px solid #333;
}

.event-list {
    overflow: hidden;
}
.event-list.finish ul {
    margin: 0;
}
.event-list ul {
    overflow: hidden;
    margin: 0 0 0 -40px;
}
.event-list.finish ul li {
    position: relative;
    float: none;
    width: 100%;
    margin: 0;
    padding: 20px 120px 20px 0;
    border-bottom: 1px solid #ebebeb;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.event-list.finish ul li a {
    overflow: hidden;
    display: block;
    position: relative;
    min-height: 100px;
    padding: 0 0 0 130px;
    border: 0;
    border-radius: 0;
}
.event-list.finish ul li a .cate {
    overflow: hidden;
    display: block;
    position: static;
    right: inherit;
    top: inherit;
    z-index: 2;
    height: auto;
    margin: 0;
    padding: 0;
    color: #01738b;
    line-height: 1.5;
    font-size: 1em;
    background-color: transparent;
}
.event-list.finish ul li a .img {
    position: absolute;
    left: 10px;
    top: 0;
    width: 100px;
    height: 100px;
    margin: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
}
.event-list.finish ul li a .img img {
    width: 100%!important;
    height: 100%!important;
}
.event-list.finish ul li a .tit {
    height: auto;
    padding: 5px 0 0 0;
    font-size: 1.2em;
    color: #222;
    line-height: 1.3;
}
.event-list ul li a .tit {
    overflow: hidden;
    height: 60px;
    margin: 0 0 10px 0;
    padding: 20px 17px 0 17px;
    line-height: 1.3;
    font-weight: 700;
    color: #222;
}
.event-list p {
    display: block;
    margin: 0;
    padding: 0;
}
.event-list.finish ul li a .date {
    position: absolute;
    left: 130px;
    bottom: 0;
    padding: 10px 0 0 0;
    font-size: .8667em;
    line-height: 1.1;
}
.event-list ul li a .date {
    padding: 0 17px 20px 17px;
    font-size: .8667em;
    line-height: 1.1;
    color: #666;
}
/* .btn-more {
    position: relative;
    padding: 40px 0 0 0;
}
.btn-more.v1 .btn {
    border: 1px solid #eaeaea;
}
.btn-more .btn {
    display: block;
    width: 100%;
    margin: 0;
    padding: 0;
    height: 40px;
    border: 0;
    border-bottom: 1px solid #eaeaea;
    background-color: transparent;
    color: #666;
}
.btn-more .btn i {
    margin-left: 6px;
}
.ico-btn-more-arr {
    width: 12px;
    height: 7px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-btn-more-arr.png);
}
.iconset {
    overflow: hidden;
    display: inline-block;
    margin: -1px 0 0 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
    background-position: 0 0;
    background-repeat: no-repeat;
}
<<<<<<< HEAD
=======
 * {
    box-sizing: border-box;
} 
i {
    font-style: italic;
} */


>>>>>>> branch 'main' of https://github.com/jjgod66/dw-final-group2.git
</style>


<div class="sub_visual" >
    <h3>지난 이벤트</h3>
    <h6>movie event</h6>
</div>

<div id="contents" class="">
	<div class="inner-wrap">
		<h2 class="tit">지난 이벤트</h2>
		<ul class="dot-list">
			<!-- 로그인 전 -->
			<li class="bi bi-chevron-right">응모하신 이벤트의 당첨 여부는 당첨자발표의
				<a href=""><strong class="font-gblue">나의 응모결과 확인</strong></a> 을 통해 확인하실 수 있습니다.
			</li>
			<!--// 로그인 전 -->
		</ul>
	</div>

	<div id="boardSearch" class="inner-wrap" style="">
		<div class="board-list-util mt0">
			<p class="result-count">
				<strong>전체 <b class="font-gblue">20</b>건
				</strong>
			</p>
			<div class="board-search">
				<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요."
					class="input-text" value="${cri.keyword }">
				<button type="button" class="btn-search-input" onclick="searchList_go()">검색</button>
			</div>
		</div>
	</div>
	
	
	<div id="event-list-wrap">
		<div class="inner-wrap">
			<div class="event-list finish ">
				<input type="hidden" id="totCount" name="totCount" value="10138">
				<ul>
					<li><a href="#" data-no="12857" data-netfunnel="N"
						class="eventBtn" title="[수도권동부] <스즈메의 문단속> 개봉 기념 컵홀더 증정 상세보기">
							<p class="cate">극장</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/03/10/ykLrzRBYeDDSTdjahHNUvWNPrOTVv3s4.jpg"
									alt="[수도권동부] <스즈메의 문단속> 개봉 기념 컵홀더 증정" onerror="noImg(this);">
							</p>
							<p class="tit">[수도권동부] &lt;스즈메의 문단속&gt; 개봉 기념 컵홀더 증정</p>
							<p class="date">2023.03.10 ~ 2024.03.10</p>
					</a></li>
					<li><a href="#" data-no="12411" data-netfunnel="N"
						class="eventBtn" title="[대구이시아] 라운지 이용권 런칭! 상세보기">
							<p class="cate">극장</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2022/12/27/IwOFR5fvobJmrVwYXm4M8cqjdwQj0LoO.jpg"
									alt="[대구이시아] 라운지 이용권 런칭!" onerror="noImg(this);">
							</p>
							<p class="tit">[대구이시아] 라운지 이용권 런칭!</p>
							<p class="date">2022.12.15 ~ 2023.12.31</p>
					</a></li>
					<li><a href="#" data-no="13193" data-netfunnel="N"
						class="eventBtn" title="[대전] 꽝 없는 추억의뽑기 도전 상세보기">
							<p class="cate">극장</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/04/28/NfvExHLEpeZt5CkL6Vebn4kA77m6C0r0.jpg"
									alt="[대전] 꽝 없는 추억의뽑기 도전" onerror="noImg(this);">
							</p>

							<p class="tit">[대전] 꽝 없는 추억의뽑기 도전</p>

							<p class="date">2023.04.29 ~ 2023.07.30</p>
					</a></li>


					<li><a href="#" data-no="13496" data-netfunnel="N"
						class="eventBtn" title="<스파이더맨: 어크로스 더 유니버스> 굿즈패키지 출시 상세보기">

							<p class="cate">메가Pick</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/16/Qz45m9eNO0QsxDecSNJy0IuddtujoyFZ.jpg"
									alt="<스파이더맨: 어크로스 더 유니버스> 굿즈패키지 출시" onerror="noImg(this);">
							</p>

							<p class="tit">&lt;스파이더맨: 어크로스 더 유니버스&gt; 굿즈패키지 출시</p>

							<p class="date">2023.06.16 ~ 2023.07.15</p>
					</a></li>

					<li><a href="#" data-no="12907" data-netfunnel="N"
						class="eventBtn" title="[시네 마인드 런] 강연 안내 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/03/16/7AlRSMCK2h3NfxrZ1ldw59wwwU611pIJ.jpg"
									alt="[시네 마인드 런] 강연 안내" onerror="noImg(this);">
							</p>

							<p class="tit">[시네 마인드 런] 강연 안내</p>

							<p class="date">2023.06.08 ~ 2023.07.06</p>
					</a></li>


					<li><a href="#" data-no="13500" data-netfunnel="N"
						class="eventBtn" title="[시네 마인드 런] 여섯 번째 강연: 행복으로 가는 길 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/16/ycudb5v4EgOjqt6Pn55hKchWYSmSVkOt.jpg"
									alt="[시네 마인드 런] 여섯 번째 강연: 행복으로 가는 길" onerror="noImg(this);">
							</p>

							<p class="tit">[시네 마인드 런] 여섯 번째 강연: 행복으로 가는 길</p>

							<p class="date">2023.07.06 ~ 2023.07.06</p>
					</a></li>


					<li><a href="#" data-no="13613" data-netfunnel="N"
						class="eventBtn" title="[악마들] 선착순 빵원티켓 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/07/04/zTwekRfpvXXE1Ay8xbjza5VUkcxBrA4W.jpg"
									alt="[악마들] 선착순 빵원티켓" onerror="noImg(this);">
							</p>

							<p class="tit">[악마들] 선착순 빵원티켓</p>

							<p class="date">2023.07.05 ~ 2023.07.06</p>
					</a></li>


					


					<li><a href="#" data-no="13586" data-netfunnel="N"
						class="eventBtn" title="[보 이즈 어프레이드] 선착순 빵원티켓 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/29/IR5QVPsVS1hYgIrhxhMLCruCcmDdvFUc.jpg"
									alt="[보 이즈 어프레이드] 선착순 빵원티켓" onerror="noImg(this);">
							</p>

							<p class="tit">[보 이즈 어프레이드] 선착순 빵원티켓</p>

							<p class="date">2023.07.03 ~ 2023.07.04</p>
					</a></li>


					<li><a href="#" data-no="13587" data-netfunnel="N"
						class="eventBtn" title="[풍재기시] 선착순 빵원티켓 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/29/4ZuId8BsomtCCyNg3D2uEMLuGss9wMmw.jpg"
									alt="[풍재기시] 선착순 빵원티켓" onerror="noImg(this);">
							</p>

							<p class="tit">[풍재기시] 선착순 빵원티켓</p>

							<p class="date">2023.07.03 ~ 2023.07.04</p>
					</a></li>


					<li><a href="#" data-no="13523" data-netfunnel="N"
						class="eventBtn" title="<귀공자> 2주차 무대인사 상세보기">

							<p class="cate">시사회/무대인사</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/21/Cd9O7OTaiQfhcsNMBik0lI4cZMSE0Nw2.jpg"
									alt="<귀공자> 2주차 무대인사" onerror="noImg(this);">
							</p>

							<p class="tit">&lt;귀공자&gt; 2주차 무대인사</p>

							<p class="date">2023.06.28 ~ 2023.07.02</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="inner-wrap">
			<div class="event-list finish ">
				<input type="hidden" id="totCount" name="totCount" value="10138">
				<ul>
					<li><a href="#" data-no="13590" data-netfunnel="N"
						class="eventBtn" title="[스파이더맨: 어크로스 더 유니버스] 선착순 빵원티켓 상세보기">
							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/29/nXioMEit4ZcfpWadtYaDzVnD2mCnWgyR.jpg"
									alt="[스파이더맨: 어크로스 더 유니버스] 선착순 빵원티켓" onerror="noImg(this);">
							</p>
							<p class="tit">[스파이더맨: 어크로스 더 유니버스] 선착순 빵원티켓</p>
							<p class="date">2023.06.30 ~ 2023.07.01</p>
					</a></li>
				</ul>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/event/eventPagination.jsp" %>

</div>



<%@ include file="../include/footer.jsp"%>