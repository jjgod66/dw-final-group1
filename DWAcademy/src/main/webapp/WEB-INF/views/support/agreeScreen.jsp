<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
 <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<style>
body{font-family: 'IBM Plex Sans KR', sans-serif; background:#f8f9fa;}
#wrapper {margin-left:auto;margin-right:auto;width: 60%; margin-bottom: 100px;}

#contents {
    width: 100%;
    margin: 0;
    padding: 40px 0 0 0;
}
h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
.screen-share .bd-top-box:first-child {
    width: 100%;
    height: auto;
    padding-top: 0;
    border-top: none;
}
.screen-share .bd-top-box:nth-child(odd) {
    float: right;
}
.screen-share .bd-top-box {
    width: 370px;
    height: 206px;
    border-top: 1px solid #eaeaea;
    padding: 20px 0 30px 0;
}
.screen-share .bd-top-box dt .num {
	display: inline-block;
    margin-right: 3px;
    font-size: 1.5em;
    font-family: Roboto;
    color: #329eb1;
    font-weight: 300;
    font-style: italic;
}


dd, dl, dt {
    margin: 0;
    padding: 0;
}dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}dd {
    display: block;
    margin-inline-start: 40px;
}ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
/* ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
} */
.screen-share .bd-top-box:first-child .dot-list li {
    float: left;
    width: 330px;
    color: #444;
}
.dot-list>li {
    position: relative; 
    padding: 0 0 0 8px;
}
.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #503396;
    width: 3px;
    height: 3px;
}
.screen-share .bd-top-box:first-child .dot-list li p {
    color: #666;
    margin: 0;
    padding: 0;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.screen-share .bd-top-box:nth-child(even) {
    float: left; 
}

.screen-share .bd-top-box dt {
    padding: 0 0 20px 0;
    font-size: 1.3333em;
    padding-bottom: 10px;
}
.screen-share .bd-top-box dt .num {
    display: inline-block;
    margin-right: 3px;
    font-size: 1.5em;
    font-family: Roboto;
    color: #329eb1;
    font-weight: 300;
    font-style: italic;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #503396;
    width: 3px;
    height: 3px;
}

</style>
<div class="sub_visual">
    <h3>개인정보처리방침</h3>
</div>
<%@ include file="sideMenu.jsp" %>
<div id="wrapper">
	<div id="contents">
				<h2 class="tit">스크린 수 배정에 관한 기준</h2>

				<div class="screen-share">
					<dl class="bd-top-box">
						<dt><span class="num">01.</span>영화정보</dt>
						<dd>
							<ul class="dot-list">
								<li>영화<p>작품성과 오락성, 배우, 스토리, 장르, 제작비, 감독과 작가</p></li>
								<li>마케팅<p>메인 타겟, 예고편, 홍보 규모(P&amp;A), 극장 내 광고, 시사회, 무대인사</p></li>
								<li>배급<p>배급규모, 경쟁상황, 배급사, 관객 기대치</p></li>
								<li>예매율<p>사전 예매오픈한 영화일 경우 예매기간 대비 예매량 확인 </p></li>
							</ul>
						</dd>
					</dl>

					<dl class="bd-top-box">
						<dt><span class="num">02.</span>경쟁상황 및 사전 고객 반응 확인</dt>
						<dd>
							<ul class="dot-list">
								<li>차주 상영 예정작 영화 정보 취합 </li>
								<li>TV, 라디오, 인터넷(네이버, 다음), SNS 등 검색</li>
								<li>극장 내 고객 설문조사 자료 확인</li>
								<li>배급 시사 후 관계자 반응 및 언론 반응</li>
							</ul>
						</dd>
					</dl>

					<dl class="bd-top-box">
						<dt><span class="num">03.</span>프로그램 배정 (각 극장)</dt>
						<dd>
							<ul class="dot-list">
								<li>각 영화관 주변 상권파악, 우리 영화관 주요 고객 파악 </li>
								<li>극장 PDP, 예고편 편성표 확인 </li>
								<li>사전시사(회원시사, 유료시사, 영사테스트) 후 관람자 반응 파악 </li>
							</ul>
						</dd>
					</dl>

					<dl class="bd-top-box">
						<dt><span class="num">04.</span>배정 미팅</dt>
						<dd>
							<ul class="dot-list">
								<li>영화별 시사 후기 확인 및 개별 의견 정리, 관련 블로그, 관계자 자료 취합 </li>
								<li>지난주 상영관 배정 반성 &amp; 차주 예상 의견</li>
								<li>개봉작과 현재 상영작에 대한 분위기 및 스크린 배정 확정</li>
							</ul>
						</dd>
					</dl>

					<dl class="bd-top-box">
						<dt><span class="num">05.</span>프로그램 개봉 후</dt>
						<dd>
							<ul class="dot-list">
								<li>영화별 개봉 스코어 및 좌점율 확인 </li>
								<li>현장 고객 반응 확인</li>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
</div>    
<script src="<%=request.getContextPath()%>/resources/js/finder.js"></script>
<footer id="footer" style="float: left;">
    <ul class="nav justify-content-center pt-3">
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">영화관 소개</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">이용약관</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">개인정보처리방침</a></li>
    </ul>
    <div class="footer-info">
        <div>
            <p>대전광역시 중구 선화동</p>
            <p>ARS 042-000-0000</p>
        </div>
        <p>대표자명 홍길동</p>
        <p>· 개인정보보호책임자 홍길동</p>
        <p>· 사업자등록번호 000-00-00000</p>
        <p>· 통신판매업신고번호 2023-대전선화동-0000</p>
        <p class="copy">COPYRIGHT ⓒ DWCINAME, Inc. All rights reserved</p>
    </div>
</footer>
</body>
</html>
