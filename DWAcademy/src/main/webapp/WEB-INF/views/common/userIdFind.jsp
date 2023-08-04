<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.member-wrap {
	width: 1000px;
	min-height: 100%;
	margin: 0 auto;
	padding: 80px 100px;
	background-color: #fff
}

.member-wrap p {
	margin: 0;
	padding: 0
}

.member-wrap .tit-member {
	margin: 0;
	padding: 0 0 30px 0;
	font-size: 1.8666em;
	color: #4aa8d8;
	text-align: center
}

.member-wrap h2.tit {
	margin: 0;
	padding: 0 0 15px 0;
	font-size: 1.3333em;
	color: #222
}

.member-wrap .ci {
	overflow: hidden;
	display: block;
	margin: 0;
	padding: 0 0 70px 0
}

.member-wrap .ci a {
	display: block;
	width: 500px;
	height: 47px;
	margin: 0 auto;
	padding: 0;
	font-size: 0;
	line-height: 0;
	background:
		url(<%=request.getContextPath()%>/resources/img/logo.png)	
		center no-repeat
}

.member-wrap .col-wrap {
	overflow: hidden
}

.member-wrap .table-wrap .board-form tr td:last-child {
	padding-right: 0
}

.member-wrap .table-wrap .board-form tr td .alert {
	margin-top: 5px;
	color: #e81002;
	font-size: .9333em
}

.member-wrap .table-wrap .board-form tr td .button {
	padding: 0 5px
}

.table-wrap .board-form tr td .alert {
	margin-top: 5px;
	color: #e81002;
	font-size: .9333em
}

.member-wrap .btn-member-bottom {
	padding: 40px 0 0 0;
	text-align: center
}

.member-wrap .btn-member-bottom.v1 {
	margin: 0 0 40px 0;
	padding: 40px 0;
	border-bottom: 1px solid #eaeaea
}

.member-wrap .btn-member-bottom .button {
	width: 200px;
	padding: 0;
	font-size: 20px
}

.member-wrap .step-member {
	overflow: hidden;
	position: relative;
	margin: 0 0 40px 0;
	padding: 0
}

.member-wrap .step-member:after {
	content: '';
	overflow: hidden;
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 1px;
	background-color: #ebebeb
}

.member-wrap .step-member ol {
	overflow: hidden
}

.member-wrap .step-member ol li {
	float: left;
	margin: 0 0 0 46px;
	padding: 0;
	text-align: center;
	font-size: .9333em
}

.member-wrap .step-member ol li:first-child {
	margin-left: 0
}

.member-wrap .step-member ol li:last-child {
	float: right
}

.member-wrap .step-member ol li .step {
	display: inline-block;
	position: relative;
	z-index: 2;
	margin: 0;
	padding: 0 0 15px 0;
	font-size: .9333em;
	letter-spacing: 0
}

.member-wrap .step-member ol li .step.on {
	border-bottom: 2px solid #4aa8d8;
	color: #503396
}

.member-wrap .page-info-txt {
	padding: 0 0 20px 0;
	line-height: 1.1
}

.member-wrap .page-info-txt strong {
	display: block;
	padding: 0 0 10px 0;
	font-size: 1.4666em;
	color: #222;
	font-weight: 400
}

.member-wrap .page-info-txt span {
	display: block
}

.member-wrap .join-chk-me:after, .member-wrap .join-chk-me:before {
	content: '';
	display: table
}

.member-wrap .join-chk-me:after {
	clear: both
}

.member-wrap .join-chk-me a {
	display: block;
	float: right;
	height: 200px;
	padding: 44px 0 0 0;
	border: 1px solid #ebebeb;
	border-radius: 10px;
	text-align: center;
	text-decoration: none
}

.member-wrap .join-chk-me a:first-child {
	float: left
}

.member-wrap .join-chk-me a i {
	display: block;
	margin: 0 auto
}

.member-wrap .join-chk-me a span {
	display: block;
	padding: 10px 0 0 0
}

.member-wrap .join-chk-me.col-1 a {
	width: 100%
}

.member-wrap .join-chk-me.col-2 a {
	width: 245px
}

.member-wrap .chk-age-14 {
	padding: 40px 0 0 0
}

.member-wrap .chk-age-14 .no-member-privacy-rule {
	height: auto
}

.member-wrap .member-rule-agree .all-chk {
	margin: 0;
	padding: 0 0 15px 0;
	font-size: 1.2em;
	color: #222;
	border-bottom: 1px solid #ebebeb
}

.member-wrap .member-rule-agree .block {
	padding: 30px 0 0 0
}

.member-wrap .member-rule-agree .block .chk {
	margin: 0;
	padding: 0 0 15px 0
}

.member-wrap .member-rule-agree .block .chk .must {
	color: #503396
}

.member-wrap .member-rule-agree .block .scroll {
	overflow: hidden;
	overflow-y: scroll;
	height: 130px;
	padding: 20px;
	border: 1px solid #d8d9db;
	font-size: 14px !important
}
.table-wrap {
	position: relative;
	border-top: 1px solid #555
}

table {
	width: 100%;
	margin: 0;
	border: 0;
	table-layout: fixed;
	border-collapse: collapse;
	empty-cells: show
}
.board-form thead th {
	padding: 7px 15px;
	background: #f7f8f9;
	border-bottom: 1px solid #d1d5dd
}

.board-form tbody td, .board-form tbody th {
	position: relative;
	height: 50px;
	padding: 7px 15px;
	text-align: left;
	border-bottom: 1px solid #d1d5dd
}

.board-form tbody th {
	background: #f7f8f9
}

.board-form .req .label {
	position: relative
}

.board-form .req .label:after {
	content: '*';
	display: inline-block;
	margin: 0 0 0 3px;
	padding: 0;
	color: #21a8e7
}

.board-form th.no-bg {
	background-color: #fff
}
.tab-list>ul>li>a {
	position: relative;
	display: block;
	width: 100%;
	height: 41px;
	line-height: 40px;
	padding: 0;
	text-align: center;
	color: #222;
	font-size: 1.0667em;
	text-decoration: none
}
.tab-list {
	position: static;
	width: 100%;
	background-color: rgba(255, 255, 255)
}

.tab-list:after, .tab-list:before {
	content: '';
	display: table
}

.tab-list:after {
	clear: both
}

.tab-list>ul {
	position: relative;
	width: 100%;
	height: 42px
}

.tab-list>ul:after {
	content: '';
	display: block;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: 2;
	width: 100%;
	height: 1px;
	background-color: #4aa8d8
}

.tab-list>ul>li {
	float: left;
	height: 42px;
	margin: 0;
	border: 1px solid #ebebeb;
	border-width: 1px 0 1px 1px
}

.tab-list>ul>li:last-child {
	border-right: 1px solid #ebebeb
}

.tab-list>ul>li.on {
	border: 1px solid #4aa8d8;
	border-bottom: 0
}

.tab-list>ul>li>a {
	position: relative;
	display: block;
	width: 100%;
	height: 41px;
	line-height: 40px;
	padding: 0;
	text-align: center;
	color: #222;
	font-size: 1.0667em;
	text-decoration: none
}

.tab-list>ul>li>a.disabled {
	color: #787878;
	background-color: #f3f4f5
}

.tab-list>ul>li.on>a {
	z-index: 3;
	color: #4aa8d8;
	background-color: #fff
}

.tab-list>ul>li.on>a:active, .tab-list>ul>li.on>a:focus, .tab-list>ul>li.on>a:hover,
	.tab-list>ul>li.on>a:visited {
	color: #4aa8d8;
	text-decoration: none
}

.tab-list>ul>li.on+li {
	border-left: 0
}

.tab-list>ul>li:first-child:nth-last-child(1), .tab-list>ul>li:first-child:nth-last-child(1)
	~li{
	width: 100%
}

.tab-list>ul>li:first-child:nth-last-child(2), .tab-list>ul>li:first-child:nth-last-child(2)
	~li{
	width: 50%
}

.tab-list>ul>li:first-child:nth-last-child(3) {
	width: 33.334%
}

.tab-list>ul>li:first-child:nth-last-child(3) ~li{
	width: 33.333%
}

.tab-list>ul>li:first-child:nth-last-child(4), .tab-list>ul>li:first-child:nth-last-child(4)
	~li{
	width: 25%
}

.tab-list>ul>li:first-child:nth-last-child(5), .tab-list>ul>li:first-child:nth-last-child(5)
	~li{
	width: 20%
}

.tab-list>ul>li:first-child:nth-last-child(6) {
	width: 17%
}

.tab-list>ul>li:first-child:nth-last-child(6) ~li{
	width: 16.6%
}

.tab-list>ul>li:first-child:nth-last-child(7) {
	width: 14.32%
}

.tab-list>ul>li:first-child:nth-last-child(7) ~li{
	width: 14.28%
}

.tab-list>ul>li:first-child:nth-last-child(8), .tab-list>ul>li:first-child:nth-last-child(8)
	~li{
	width: 12.5%
}

.tab-list.fixed.on {
	position: fixed;
	left: 0;
	right: inherit;
	top: 42px;
	z-index: 50;
	width: 100%;
	background-color: rgba(255, 255, 255, .9);
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, .12)
}

.tab-list.fixed.on>ul {
	width: 1100px;
	margin: 0 auto
}

.tab-list.fixed.on>ul:after {
	display: none
}

.tab-list.fixed.on>ul>li {
	width: auto !important;
	margin: 0 0 0 40px;
	border: 0
}

.tab-list.fixed.on>ul>li:first-child {
	margin-left: 0
}

.tab-list.fixed.on>ul>li a {
	height: 100%;
	border-bottom: 2px solid transparent
}

.tab-list.fixed.on>ul>li.on {
	background-color: transparent
}

.tab-list.fixed.on>ul>li.on a {
	background-color: transparent;
	border-color: #4aa8d8
}

body.no-scroll .tab-list.fixed {
	right: 18px;
	width: auto
}

.tab-list.fixed.movie {
	position: fixed;
	left: 0;
	right: inherit;
	top: 122px;
	z-index: 50;
	width: 100%;
	background-color: rgba(255, 255, 255, .9);
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, .12)
}

.tab-list.fixed.movie>ul {
	width: 1100px;
	margin: 0 auto
}

.tab-list.fixed.movie>ul:after {
	display: none
}

.tab-list.fixed.movie>ul>li {
	width: auto !important;
	margin: 0 0 0 40px;
	border: 0
}

.tab-list.fixed.movie>ul>li:first-child {
	margin-left: 0
}

.tab-list.fixed.movie>ul>li a {
	height: 100%;
	border-bottom: 2px solid transparent
}

.tab-list.fixed.movie>ul>li.on {
	background-color: transparent
}

.tab-list.fixed.movie>ul>li.on a {
	background-color: transparent;
	border-color: #4aa8d8
}

.tab-list.fixed.theater {
	position: fixed;
	left: 0;
	right: inherit;
	top: 122px;
	z-index: 50;
	width: 100%;
	margin-top: 0 !important;
	background-color: rgba(255, 255, 255, .9);
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, .12)
}

.tab-list.fixed.theater>ul {
	width: 1100px;
	margin: 0 auto
}

.tab-list.fixed.theater>ul:after {
	display: none
}

.tab-list.fixed.theater>ul>li {
	width: auto !important;
	margin: 0 0 0 40px;
	border: 0
}

.tab-list.fixed.theater>ul>li:first-child {
	margin-left: 0
}

.tab-list.fixed.theater>ul>li a {
	height: 100%;
	border-bottom: 2px solid transparent
}

.tab-list.fixed.theater>ul>li.on {
	background-color: transparent
}

.tab-list.fixed.theater>ul>li.on a {
	background-color: transparent;
	border-color: #4aa8d8
}

.tab-list-small>ul {
	text-align: center
}

.tab-list-small>ul>li:first-child {
	margin-left: 15px
}

.tab-list-small>ul>li {
	display: inline-block;
	text-decoration: none;
	text-align: center
}

.tab-list-small>ul>li:after {
	content: '|';
	color: #d8d9db;
	padding: 0 15px;
	vertical-align: top;
	display: inline-block;
	box-sizing: border-box
}

.tab-list-small>ul>li:last-child:after {
	content: ''
}

.tab-list-small>ul>li>a {
	font-size: 1.0667em;
	text-decoration: none;
	color: #555;
	border-bottom: 2px solid #fff;
	padding-bottom: 5px
}

.tab-list-small>ul>li>a.on, .tab-list-small>ul>li>a:hover {
	color: #351f66;
	border-color: #4aa8d8;
}

ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
* {
    box-sizing: border-box;
}
.chk-num {
    display: inline-block;
    position: relative;
    padding: 0;
    vertical-align: middle;
}
.chk-num .time-limit {
    display: block;
    position: absolute;
    right: 0;
    top: 50%;
    width: 50px;
    height: 100%;
    line-height: 34px;
    margin: -17px 0 0 0;
    padding: 0 10px 0 0;
    text-align: right;
    color: #e81002;
}

.btn {
    display: inline-block;
    line-height: 42px;
    padding: 0 33px;
    font-family: Poppins;
    cursor: pointer;
    color: #fff;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    transition: all 0.4s ease;
    font-size: 18px;
    width: 100%;
    border: solid 1px #4aa8d8;
    border-radius: 0.375rem;
}


.btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-left: 10px;
    margin-right: 10px;
}
.btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-left: 10px;
    margin-right: 10px;
}

</style>

</head>
<body>
<div class="member-wrap">
		<h1 class="ci"><a href="/main" title="메인 페이지로 이동">MEGABOX : Life Theater</a></h1>
		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">

				<p class="tit-member" style="font-weight: 900;">아이디/비밀번호 찾기<!--아이디/비밀번호 찾기--></p>

<!-- 				<div class="tab-list"> -->
<!-- 					<ul> -->
<!-- 						<li class="on"><a href="javaScript:void(0);" title="아이디찾기 선택">아이디 찾기아이디찾기</a></li> -->
<!-- 						<li><a href="/pass-find" title="비밀번호 찾기 선택">비밀번호 찾기비밀번호 찾기</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->

				<h2>아이디 찾기</h2>
				<div class="table-wrap">
					<table class="board-form">
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="ibxSchIdMbNm">이름<!--이름--></label></th>
								<td>
									<input id="ibxSchIdMbNm" maxlength="20" type="text" placeholder="이름" class="input-text w230px"><!--이름-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchIdBirthDe">생년월일<!--생년월일--></label></th>
								<td>
									<input id="ibxSchIdBirthDe" maxlength="8" type="text" placeholder="생년월일 앞8자리" class="input-text w230px"><!--생년월일 8자리-->
									<div id="schIdBirthDe-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchIdMblpTelno">휴대폰 번호<!--휴대폰 번호--></label></th>
								<td>
									<input id="ibxSchIdMblpTelno" maxlength="11" type="text" placeholder="'-' 없이 입력" class="input-text w230px"><!--'-' 없이 입력-->
									<div id="schIdMblpNo-error-text" class="alert"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="btn-member-bottom v1">
					<button id="btnSchId" type="button" class="button purple large btn btn-regist">아이디 찾기<!--아이디 찾기--></button>

				</div>
				<h2>비밀번호 찾기</h2>
				<div class="table-wrap">
					<table class="board-form">
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="ibxSchPwdLoginId">아이디<!--아이디--></label></th>
								<td>
									<input id="ibxSchPwdLoginId" maxlength="20" type="text" placeholder="아이디" class="input-text w230px"><!--아이디-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchPwdMbNm">이름<!--이름--></label></th>
								<td>
									<input id="ibxSchPwdMbNm" maxlength="20" type="text" placeholder="이름" class="input-text w230px"><!--이름-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchPwdMblpTelno">휴대폰 번호<!--휴대폰 번호--></label></th>
								<td>
									<input type="text" id="ibxSchPwdMblpTelno" maxlength="11" placeholder="'-' 없이 입력" class="input-text w230px"><!--'-' 없이 입력-->
									<button id="btnSchPwdMbCertNoSend" type="button" class="button gray w75px ml08 disabled" disabled="disabled">인증요청<!--인증요청--></button>
								</td>
							</tr>
							<tr id="schPwdMblpCertRow">
								<th scope="row"><label for="ibxSchPwdMblpCharCertNo">인증번호<!--인증번호--></label></th>
								<td>
									<div class="chk-num">
										<div class="line">
											<input maxlength="4" type="text" id="ibxSchPwdMblpCharCertNo" class="input-text w180px" title="인증번호 입력" disabled="disabled"><!--인증번호 입력-->

											<div class="time-limit" id="schPwdtimer">
												3:00
											</div>
										</div>
									</div>

									<button id="btnSchPwdMblpCharCert" type="button" class="button gray-line w75px ml08 disabled" disabled="disabled">인증확인<!--인증확인--></button>
									<div id="schPwdMblpNo-error-text" class="alert"></div>
								</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="btn-member-bottom v1">
					<button id="btnSchPwd" type="button" class="button purple large btn btn-regist">비밀번호 찾기<!--비밀번호 찾기--></button>
				</div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
</body>
</html>