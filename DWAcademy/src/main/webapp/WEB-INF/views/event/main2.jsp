<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../include/header.jsp" %> --%>
<% 
// https://getbootstrap.kr/docs/5.2/components/card 
%>
<style>

.event-warpper {
}
.event-warpper h2.event-title {
	padding: 40px 0px 40px 0px
}
.event-warpper .tab-list {
    position: static;
    width: 100%;
    background-color: rgba(255,255,255);
}
.event-warpper .tab-list:after {
    clear: both;
}
.event-warpper .tab-list:after,
.event-warpper .tab-list:before {
    content: '';
    display: table;
}
.event-warpper .tab-list>ul {
    position: relative;
    width: 100%;
    height: 42px;
}
.event-warpper .tab-list>ul:after {
    content: '';
    display: block;
    position: absolute;
    left: 0;
    bottom: 0;
    z-index: 2;
    width: 100%;
    height: 1px;
    background-color: #4aa8d8;
}
.event-warpper .tab-list>ul>li:first-child:nth-last-child(4) {
    width: 25%;
}
.event-warpper .tab-list>ul>li:first-child:nth-last-child(4)~li {
    width: 25%;
}
.event-warpper .tab-list>ul>li {
    float: left;
    height: 42px;
    margin: 0;
    border: 1px solid #ebebeb;
    border-width: 1px 0 1px 1px;
}
.event-warpper .tab-list>ul>li:last-child {
    border-right: 1px solid #ebebeb;
}
.event-warpper .tab-list>ul>li.active a {
    position: relative;
    border: 1px solid #4aa8d8;
    border-bottom: 0;
    background-color: #fff;
    z-index: 3;
}
.event-warpper .tab-list>ul>li>a {
    position: relative;
    display: block;
    width: 100%;
    height: 41px;
    line-height: 40px;
    padding: 0;
    text-align: center;
    color: #222;
    font-size: 1.0667em;
    text-decoration: none;
}
.event-warpper .tab-content {
    padding: 0 0 50px;
}
.event-warpper .tit-util {
    margin: 50px 0 10px;
}
.event-warpper .tit-util:after {
    clear: both;
}
.event-warpper .tit-util:after,
.event-warpper .tit-util:before {
    content: '';
    display: block;
}
.event-warpper h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #222;
    line-height: 1.1;
}
.event-warpper .tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}
.event-warpper .tit-util .float-end a {
    color: #333;
}
.event-warpper .event-list {
    margin-top: 15px;
    overflow: hidden;
}
.event-warpper .event-list ul {
    overflow: hidden;
    margin: 0 0 0 -40px;
}
.event-warpper .event-list ul li {
    position: relative;
    float: left;
    width: 22%;
    margin: 0 0 0 40px;
    padding: 0;
}
.event-warpper .event-list ul li a {
    overflow: hidden;
    display: block;
    border: 1px solid #e4e4e4;
    border-radius: 10px;
    min-height: 364px;
}
.event-warpper .event-list ul li a .img {
    width: 100%;
    height: 244px;
    font-size: 0;
    line-height: 0;
    border-bottom: 1px solid #e4e4e4;
    background-color: #eee;
}
.event-warpper .event-list ul li a .img img {
    width: 100%!important;
    height: 243px!important;
}
.event-warpper .event-list p {
    display: block;
    margin: 0;
    padding: 0;
}
.event-warpper .event-list ul li a .tit {
    overflow: hidden;
    height: 60px;
    margin: 0 0 10px 0;
    padding: 20px 17px 0 17px;
    line-height: 1.3;
    font-weight: 700;
    color: #222;
}
.event-warpper .event-list ul li a .date {
    padding: 0 17px 20px 17px;
    font-size: .8667em;
    line-height: 1.1;
    color: #666;
}
.inner-wrap {
    width: auto;
    margin: 0 auto;
}
.mt40 {
    margin-top: 40px!important;
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
button, select {
    text-transform: none;
}
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
}
.input-text {
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    vertical-align: middle;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-size: 1em;
}
.board-list-util .result-count b {
    color: #01738b;
}
.event-list ul li.no-list {
    width: 100%;
    padding: 50px 0;
    text-align: center;
    border-top: 1px solid #555;
    border-bottom: 1px solid #e4e4e4;
}

#snb {
    float: left;
    width: 204px;
    background: #fff;
    zoom: 1;
}
#snb .snb_header {
    height: 100px;
    text-align: center;
}
#snb .snb_header h2 {
    padding: 18px 0 10px 0;
    font-size: 20px;
    letter-spacing: -1px;
}

#snb .snb_header h2 i {
    height: 36px;
    font-size: 30px;
    color: #888;
    display: block;
}

.fa-truck:before {
    content: "\f0d1";
}
#snb dl {
    margin-bottom: 100px;
}
#snb dt {
    background: #f6f6f6 url(/admin/img/sflex_icon.png) 174px -302px no-repeat;
    border-top: 1px solid #cfcfcf;
    padding: 0 0 0 17px;
    font-size: 12px;
    line-height: 2.8;
    font-weight: 600;
    vertical-align: middle;
    cursor: pointer;
}
#snb dd {
    display: block;
    position: relative;
}

#snb dd a {
    display: block;
    padding: 7px 0 7px 17px;
    text-decoration: none;
    background: #fff;
    color: #555;
    vertical-align: middle;
}
#snb:after {
    display: block;
    visibility: hidden;
    clear: both;
    content: "";
}

</style>



<div class="event-warpper">
	<div class="container">
		<h2 class="event-title">진행중인 이벤트 </h2>
		<div class="tab-list fixed">
			<ul class="nav nav-tabs">
				<li class="nav-item active" data-bs-toggle="tab" href="#main"><a href="javascript:;">전체</a></li>
				<li class="nav-item" data-bs-toggle="tab" href="#movie"><a href="javascript:;">영화</a></li>
				<li class="nav-item" data-bs-toggle="tab" href="#theater"><a href="javascript:;">극장</a></li>
				<li class="nav-item" data-bs-toggle="tab" href="#premiere"><a href="javascript:;">시사회/무대인사</a></li>
			</ul>
		</div>
		<div class="tab-content">
			<div class="tab-pane fade show active" id="main">
				<div class="tit-util">
					<h3 class="tit">영화</h3>
					<div class="float-end">
						<a data-bs-toggle="tab" href="#movie" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
					</div>
				</div>
				  <div class="event-list">
					<ul>
						<li>
							<a href="<%=request.getContextPath()%>/event/eventDetail.do" data-no="13565" data-netfunnel="N" class="eventBtn" title="[여름방학 특집!] 내 생애 첫 미술관 강연 안내 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/27/BMbeiQGzlWVsgHJCqmzvnUAXVS1dKhl5.jpg" alt="[여름방학 특집!] 내 생애 첫 미술관 강연 안내" onerror="noImg(this);"></p>
								<p class="tit">
									[여름방학 특집!] 내 생애 첫 미술관 강연 안내
								</p>
								<p class="date">
									2023.07.27 ~ 2023.08.19
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13621" data-netfunnel="N" class="eventBtn" title="<비밀의 언덕> 굿즈패키지 상영회 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/05/wImn8PcYkoklSDEhAZplm69ngbSrWKv9.jpg" alt="<비밀의 언덕> 굿즈패키지 상영회" onerror="noImg(this);"></p>
								<p class="tit">
									&lt;비밀의 언덕&gt; 굿즈패키지 상영회
								</p>
								<p class="date">
									2023.07.18 ~ 2023.07.18
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13489" data-netfunnel="N" class="eventBtn" title="[2023 사건 읽는 영화관] 7월의 사건 : ep06. 마약사건 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/16/GwCeHGK15XqtjH7AlkW9d9GdfdOjztby.jpg" alt="[2023 사건 읽는 영화관] 7월의 사건 : ep06. 마약사건" onerror="noImg(this);"></p>
									<p class="tit">
									[2023 사건 읽는 영화관] 7월의 사건 : ep06. 마약사건
								</p>
								<p class="date">
									2023.07.16 ~ 2023.07.16
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13605" data-netfunnel="N" class="eventBtn" title="<몬스터 패밀리2> 메가박스 X 휘닉스 평창 패키지 프로모션 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/03/nNQsxrvDKLtuAYjyX4Czfj5TQZ0KCiqV.jpg" alt="<몬스터 패밀리2> 메가박스 X 휘닉스 평창 패키지 프로모션" onerror="noImg(this);"></p>
								<p class="tit">
									&lt;몬스터 패밀리2&gt; 메가박스 X 휘닉스 평창 패키지 프로모션
								</p>
								<p class="date">
									2023.07.15 ~ 2023.08.06
								</p>
							</a>
						</li>
					</ul>
				</div>
				<div class="tit-util">
					<h3 class="tit">극장</h3>
					<div class="float-end">
						<a href="#" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
					</div>
				</div>
				<div class="event-list">
					<ul>
						<li>
							<a href="#" data-no="13527" data-netfunnel="N" class="eventBtn" title="[금정AK플라자] 오픈 1주년 기념 이벤트 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/22/lYvh9Hm1azfGygwBm4ew3sAwY6y04FEP.jpg" alt="[금정AK플라자] 오픈 1주년 기념 이벤트" onerror="noImg(this);"></p>
								<p class="tit">
									[금정AK플라자] 오픈 1주년 기념 이벤트
								</p>
								<p class="date">
									2023.07.13 ~ 2023.07.13
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13594" data-netfunnel="N" class="eventBtn" title="[목동] 리뉴얼 오픈 기념 이벤트 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/30/8Wn3auNq9MoN128Dy5j6074n1dfktnDk.jpg" alt="[목동] 리뉴얼 오픈 기념 이벤트" onerror="noImg(this);"></p>
								<p class="tit">
									[목동] 리뉴얼 오픈 기념 이벤트
								</p>
								<p class="date">
									2023.07.01 ~ 2023.07.31
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13631" data-netfunnel="N" class="eventBtn" title="[구미강동] 영화보면 팝콘R, 탄산R 증정 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/06/i9uQ59cRIEC4mSucMNpuC6XvmtTiHt94.jpg" alt="[구미강동] 영화보면 팝콘R, 탄산R 증정" onerror="noImg(this);"></p>
								<p class="tit">
									[구미강동] 영화보면 팝콘R, 탄산R 증정
								</p>
								<p class="date">
									2023.07.05 ~ 2023.09.27
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13543" data-netfunnel="N" class="eventBtn" title="[백석벨라시타] 시원~한 만원 관람 왔썸머!(SUMMER) 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/23/LTLGHvAglnNGUGiyE9ia5Sk51rvmtJTL.jpg" alt="[백석벨라시타] 시원~한 만원 관람 왔썸머!(SUMMER)" onerror="noImg(this);"></p>
								<p class="tit">
									[백석벨라시타] 시원~한 만원 관람 왔썸머!(SUMMER)
								</p>
								<p class="date">
									2023.07.03 ~ 2023.08.18
								</p>
							</a>
						</li>
					</ul>
				</div>
				<div class="tit-util">
					<h3 class="tit">시사회/무대인사</h3>
					<div class="float-end">
						<a href="#" title="더보기">더보기 <i class="bi bi-chevron-right"></i></a>
					</div>
				</div>
				<div class="event-list">
					<ul>
						<li>
							<a href="#" data-no="13577" data-netfunnel="N" class="eventBtn" title="<해피 메리 엔딩> 무대인사 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/28/3MqLAzGtNUtEYqqdalMMKrirsrqr8jRz.jpg" alt="<해피 메리 엔딩> 무대인사" onerror="noImg(this);"></p>
								<p class="tit">
									&lt;해피 메리 엔딩&gt; 무대인사
								</p>
								<p class="date">
									2023.07.14 ~ 2023.07.14
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13607" data-netfunnel="N" class="eventBtn" title="<악마들> 개봉주 무대인사 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/03/VVulTlSKPhX0Aa9uwpkjkx5001Fj3tjc.jpg" alt="<악마들> 개봉주 무대인사" onerror="noImg(this);"></p>
								<p class="tit">
									&lt;악마들&gt; 개봉주 무대인사
								</p>
								<p class="date">
									2023.07.08 ~ 2023.07.09
								</p>
							</a>
						</li>
						<li>
								<a href="#" data-no="13579" data-netfunnel="N" class="eventBtn" title="<몸값> 개봉주 무대인사 &amp; 전우성 감독X이충현 감독 GV 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/28/rDqozT67Q44EDmSsn9bfP04T9OgiSdQA.jpg" alt="<몸값> 개봉주 무대인사 &amp; 전우성 감독X이충현 감독 GV" onerror="noImg(this);"></p>
								<p class="tit">
									&lt;몸값&gt; 개봉주 무대인사 &amp; 전우성 감독X이충현 감독 GV
								</p>
								<p class="date">
									2023.07.08 ~ 2023.07.09
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13597" data-netfunnel="N" class="eventBtn" title="<빈틈없는 사이> 개봉주 무대인사 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/30/gdPzCANdWJv0nmOIgzi860ZIcDnk7ZvI.jpg" alt="<빈틈없는 사이> 개봉주 무대인사" onerror="noImg(this);"></p>
								<p class="tit">
									&lt;빈틈없는 사이&gt; 개봉주 무대인사
								</p>
								<p class="date">
									2023.07.05 ~ 2023.07.09
								</p>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- --------------------------------------- -->
			<!-- -----------------영화 -------------------- -->
			<!-- --------------------------------------- -->
			<div class="tab-pane fade" id="movie">
				<div id="boardSearch" class="inner-wrap" style="">
					<div class="board-list-util mt40">
						<p class="result-count"><strong>전체 <b>4</b>건</strong></p>
							<div class="board-search">
								<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
								<button type="button" class="btn-search-input">검색</button>
							</div>
					</div>
				</div>
				  <div class="event-list">
					<ul>
						<li>
							<a href="<%=request.getContextPath()%>/event/eventDetail.do" data-no="13565" data-netfunnel="N" class="eventBtn" title="[여름방학 특집!] 내 생애 첫 미술관 강연 안내 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/27/BMbeiQGzlWVsgHJCqmzvnUAXVS1dKhl5.jpg" alt="[여름방학 특집!] 내 생애 첫 미술관 강연 안내" onerror="noImg(this);"></p>
								<p class="tit">
									[여름방학 특집!] 내 생애 첫 미술관 강연 안내
								</p>
								<p class="date">
									2023.07.27 ~ 2023.08.19
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13621" data-netfunnel="N" class="eventBtn" title="<비밀의 언덕> 굿즈패키지 상영회 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/05/wImn8PcYkoklSDEhAZplm69ngbSrWKv9.jpg" alt="<비밀의 언덕> 굿즈패키지 상영회" onerror="noImg(this);"></p>
								<p class="tit">
									&lt;비밀의 언덕&gt; 굿즈패키지 상영회
								</p>
								<p class="date">
									2023.07.18 ~ 2023.07.18
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13489" data-netfunnel="N" class="eventBtn" title="[2023 사건 읽는 영화관] 7월의 사건 : ep06. 마약사건 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/16/GwCeHGK15XqtjH7AlkW9d9GdfdOjztby.jpg" alt="[2023 사건 읽는 영화관] 7월의 사건 : ep06. 마약사건" onerror="noImg(this);"></p>
									<p class="tit">
									[2023 사건 읽는 영화관] 7월의 사건 : ep06. 마약사건
								</p>
								<p class="date">
									2023.07.16 ~ 2023.07.16
								</p>
							</a>
						</li>
						<li>
							<a href="#" data-no="13605" data-netfunnel="N" class="eventBtn" title="<몬스터 패밀리2> 메가박스 X 휘닉스 평창 패키지 프로모션 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/03/nNQsxrvDKLtuAYjyX4Czfj5TQZ0KCiqV.jpg" alt="<몬스터 패밀리2> 메가박스 X 휘닉스 평창 패키지 프로모션" onerror="noImg(this);"></p>
								<p class="tit">
									&lt;몬스터 패밀리2&gt; 메가박스 X 휘닉스 평창 패키지 프로모션
								</p>
								<p class="date">
									2023.07.15 ~ 2023.08.06
								</p>
							</a>
						</li>
					</ul>
				</div>
			</div>
				<!-- --------------------------------------- -->
			<!-- -----------------rm극장  -------------------- -->
			<!-- --------------------------------------- -->
			<div class="tab-pane fade" id="theater">
				<div id="boardSearch" class="inner-wrap" style="">
					<div class="board-list-util mt40">
						<p class="result-count"><strong>전체 <b>1</b>건</strong></p>
							<div class="board-search">
								<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
								<button type="button" class="btn-search-input">검색</button>
							</div>
					</div>
				</div>
				  <div class="event-list">
					<ul>
						
						<li>
							<a href="#" data-no="13527" data-netfunnel="N" class="eventBtn" title="[금정AK플라자] 오픈 1주년 기념 이벤트 상세보기">
								<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
								<p class="img"> <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/22/lYvh9Hm1azfGygwBm4ew3sAwY6y04FEP.jpg" alt="[금정AK플라자] 오픈 1주년 기념 이벤트" onerror="noImg(this);"></p>
								<p class="tit">
									[금정AK플라자] 오픈 1주년 기념 이벤트
								</p>
								<p class="date">
									2023.07.13 ~ 2023.07.13
								</p>
							</a>
						</li>
						
						
					</ul>
				</div>
			</div>	
				<!-- --------------------------------------- -->
			<!-- -----------------시사회 무대인사   -------------------- -->
			<!-- --------------------------------------- -->
			<div class="tab-pane fade" id="premiere">
				<div id="boardSearch" class="inner-wrap" style="">
					<div class="board-list-util mt40">
						<p class="result-count"><strong>전체 <b>1</b>건</strong></p>
							<div class="board-search">
								<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
								<button type="button" class="btn-search-input">검색</button>
							</div>
					</div>
				</div>
				  <div class="event-list">
					<ul>
						<li class="no-list">해당 이벤트가 없습니다.</li>
					</ul>
				</div>
			</div>	
				
				
				
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>