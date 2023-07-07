<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
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
h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
ul {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.font-gblue {
    color: #01738b!important;
}

b, strong {
    font-weight: 700;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
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

* {
    box-sizing: border-box;
}
user agent stylesheet
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
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
* {
    box-sizing: border-box;
}
div {
    display: block;
}
.event-list.finish ul {
    margin: 0;
}
.event-list ul {
    overflow: hidden;
    margin: 0 0 0 -40px;
}

ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
* {
    box-sizing: border-box;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
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
a:link {
    color: #444;
    text-decoration: none;
}

a {
    background-color: transparent;
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
p {
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
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
.btn-more {
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
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}
button {
    cursor: pointer;
    letter-spacing: -.5px;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}

button, select {
    text-transform: none;
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
* {
    box-sizing: border-box;
}
user agent stylesheet
i {
    font-style: italic;
}
</style>
<div class="sub_visual">
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
					class="input-text">
				<button type="button" class="btn-search-input">검색</button>
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


					<li><a href="#" data-no="13576" data-netfunnel="N"
						class="eventBtn" title="<에고이스트> 스페셜 GV 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/28/umsyFKZZRk1IztlhcUB1Gmf16qeoaqQu.jpg"
									alt="<에고이스트> 스페셜 GV" onerror="noImg(this);">
							</p>

							<p class="tit">&lt;에고이스트&gt; 스페셜 GV</p>

							<p class="date">2023.07.02 ~ 2023.07.02</p>
					</a></li>


					<li><a href="#" data-no="13525" data-netfunnel="N"
						class="eventBtn"
						title="[부천/송도/광명AK/광명소하/금정AK] 27TH 부천국제판타스틱영화제! 상세보기">

							<p class="cate">극장</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/22/1oxXvY5x0NsmUYtro2sCVVF3Cv4etHIr.jpg"
									alt="[부천/송도/광명AK/광명소하/금정AK] 27TH 부천국제판타스틱영화제!"
									onerror="noImg(this);">
							</p>

							<p class="tit">[부천/송도/광명AK/광명소하/금정AK] 27TH 부천국제판타스틱영화제!</p>

							<p class="date">2023.06.22 ~ 2023.07.02</p>
					</a></li>


					<li><a href="#" data-no="13573" data-netfunnel="N"
						class="eventBtn"
						title="아리 에스터 감독 기획전 &amp; <보 이즈 어프레이드> 프리미어 상영 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/27/JGr2zDq665Yy03WBVkWepPr9YtQeyBwJ.jpg"
									alt="아리 에스터 감독 기획전 &amp; <보 이즈 어프레이드> 프리미어 상영"
									onerror="noImg(this);">
							</p>

							<p class="tit">아리 에스터 감독 기획전 &amp; &lt;보 이즈 어프레이드&gt; 프리미어 상영
							</p>

							<p class="date">2023.06.30 ~ 2023.07.02</p>
					</a></li>


					<li><a href="#" data-no="13522" data-netfunnel="N"
						class="eventBtn" title="<라방> 개봉주 무대인사 상세보기">

							<p class="cate">시사회/무대인사</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/21/KTH9l9EgzTQBsrjPdywGDaqpdp6H6OAi.jpg"
									alt="<라방> 개봉주 무대인사" onerror="noImg(this);">
							</p>

							<p class="tit">&lt;라방&gt; 개봉주 무대인사</p>

							<p class="date">2023.07.01 ~ 2023.07.01</p>
					</a></li>


					<li><a href="#" data-no="13538" data-netfunnel="N"
						class="eventBtn" title="<보 이즈 어프레이드> 메가토크 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/23/a5sgLXc4RPMRkaE1V9M2hqSEXe5aBJ4g.jpg"
									alt="<보 이즈 어프레이드> 메가토크" onerror="noImg(this);">
							</p>

							<p class="tit">&lt;보 이즈 어프레이드&gt; 메가토크</p>

							<p class="date">2023.07.01 ~ 2023.07.01</p>
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

					<li><a href="#" data-no="13412" data-netfunnel="N"
						class="eventBtn" title="[존 크랑코's 발레 3부작] 오네긴 현장 증정 이벤트 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/02/w1KVgQatMaPyIeWXTzYUpfRtRD0ARqEL.jpg"
									alt="[존 크랑코's 발레 3부작] 오네긴 현장 증정 이벤트" onerror="noImg(this);">
							</p>

							<p class="tit">[존 크랑코's 발레 3부작] 오네긴 현장 증정 이벤트</p>

							<p class="date">2023.06.12 ~ 2023.07.01</p>
					</a></li>


					<li><a href="#" data-no="13556" data-netfunnel="N"
						class="eventBtn" title="<엔니오: 더 마에스트로> 메가토크 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/26/d2muVRSjbyD7fhtOAO0r3jQiRACPiUa1.jpg"
									alt="<엔니오: 더 마에스트로> 메가토크" onerror="noImg(this);">
							</p>

							<p class="tit">&lt;엔니오: 더 마에스트로&gt; 메가토크</p>

							<p class="date">2023.06.30 ~ 2023.06.30</p>
					</a></li>


					<li><a href="#" data-no="13448" data-netfunnel="N"
						class="eventBtn" title="<엘리멘탈> 굿즈패키지 출시 상세보기">

							<p class="cate">메가Pick</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/09/6YYcxUjExDDaGmbGZm9CGScX5auFgaVW.jpg"
									alt="<엘리멘탈> 굿즈패키지 출시" onerror="noImg(this);">
							</p>

							<p class="tit">&lt;엘리멘탈&gt; 굿즈패키지 출시</p>

							<p class="date">2023.06.09 ~ 2023.06.30</p>
					</a></li>


					<li><a href="#" data-no="13487" data-netfunnel="N"
						class="eventBtn" title="<자우림, 더 원더랜드> 스페셜 포토북 이벤트 상세보기">

							<p class="cate">영화</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/15/AywPRq8UkWzLPuyL4WTzVII8FPUT35pd.jpg"
									alt="<자우림, 더 원더랜드> 스페셜 포토북 이벤트" onerror="noImg(this);">
							</p>

							<p class="tit">&lt;자우림, 더 원더랜드&gt; 스페셜 포토북 이벤트</p>

							<p class="date">2023.06.17 ~ 2023.06.30</p>
					</a></li>


					<li><a href="#" data-no="13235" data-netfunnel="N"
						class="eventBtn" title="THANK YOU REAL HERO 소방관 우대 할인 상세보기">

							<p class="cate">메가Pick</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/05/04/RRIa4QGWhTq1PZnBGwR36rYJjq9Di175.jpg"
									alt="THANK YOU REAL HERO 소방관 우대 할인" onerror="noImg(this);">
							</p>

							<p class="tit">THANK YOU REAL HERO 소방관 우대 할인</p>

							<p class="date">2023.05.04 ~ 2023.06.30</p>
					</a></li>


					<li><a href="#" data-no="13480" data-netfunnel="N"
						class="eventBtn" title="[KT멤버십X메가박스] 6월 초여름 '달.달.혜택' 프로모션! 상세보기">

							<p class="cate">제휴/할인</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/06/15/OKzJH7N3kYNcEZB89deDFig4NCGRMCry.jpg"
									alt="[KT멤버십X메가박스] 6월 초여름 '달.달.혜택' 프로모션!" onerror="noImg(this);">
							</p>

							<p class="tit">[KT멤버십X메가박스] 6월 초여름 '달.달.혜택' 프로모션!</p>

							<p class="date">2023.06.15 ~ 2023.06.30</p>
					</a></li>


					<li><a href="#" data-no="12904" data-netfunnel="N"
						class="eventBtn" title="[구미강동] 구미강동점도 배달의 민족! 상세보기">

							<p class="cate">극장</p> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img">
								<img
									src="https://img.megabox.co.kr/SharedImg/event/2023/03/16/m6xePC90K3V7dTIKViZKNqi8Yd1DeC6U.jpg"
									alt="[구미강동] 구미강동점도 배달의 민족!" onerror="noImg(this);">
							</p>

							<p class="tit">[구미강동] 구미강동점도 배달의 민족!</p>

							<p class="date">2023.03.16 ~ 2023.06.30</p>
					</a></li>


					
				</ul>
			</div>
		</div>
	</div>


	<div class="btn-more v1" style="">
		<button type="button" class="btn">
			더보기 <i class="iconset ico-btn-more-arr"></i>
		</button>
	</div>

</div>



<%@ include file="../include/footer.jsp"%>