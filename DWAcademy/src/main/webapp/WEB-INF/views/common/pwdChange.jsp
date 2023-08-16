<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>
<style>
.button {
    display: inline-block;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #4aa8d8;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #4aa8d8;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}
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
.w230px {
    width: 230px!important;
}

.button.disabled {
    color: #777!important;
    background-color: #e0e0e0!important;
    border-color: #e0e0e0!important;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}
.font-gblue {
    color: #01738b!important;
}
.mt15 {
    margin-top: 15px!important;
}
.mt20 {
    margin-top: 20px!important;
}
</style>

</head>
<body>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
<div class="member-wrap">

		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">

				<p class="tit-member" style="font-weight: 900;">비밀번호 재설정<!--비밀번호 재설정--></p>

				<ul class="dot-list gblue">
							<li class="font-gblue">보안인증이 완료되었습니다. 새로 사용하실 비밀번호를 입력해주세요.<!--보안인증이 완료되었습니다. 새로 사용하실 비밀번호를 입력해주세요.--></li>
				</ul>

				<div class="table-wrap mt15">
					<form action="<%=request.getContextPath()%>/changePwd.do" method="post" id="pwdChangeForm">
						<table class="board-form">
							<caption>아이디, 새 비밀번호, 새 비밀번호 확인 항목을 가진 아이디 등록 표<!--아이디, 새 비밀번호, 새 비밀번호 확인 항목을 가진 아이디 등록 표--></caption>
							<colgroup>
								<col style="width:130px;">
								<col>
							</colgroup>
							<tbody>
										<tr>
											<th scope="row">아이디<!--아이디--></th>
											<td>
												${mem_id }
												<input id="ibxPwdReSetLoginId" maxlength="20" type="hidden" class="input-text" value="${mem_id }" name="change_mem_id">
											</td>
										</tr>
								<tr id="pwdReSet" style="">
									<th scope="row"><label for="ibxPwdReSetLoginPwd">새 비밀번호<!--새 비밀번호--></label></th>
									<td>
										<input id="ibxPwdReSetLoginPwd" maxlength="16" type="password" placeholder="영문 숫자 조합 8자리 이상" class="input-text w300px" name="change_mem_pwd"><!--영문,숫자,특수기호 중 2가지 이상 조합-->
										<div id="pwdSet-error-text" class=""></div>
									</td>
								</tr>
								<tr id="pwdReSetConfirm" style="">
									<th scope="row"><label for="ibxPwdReSetLoginPwdConfirm">비밀번호 확인<!--새 비밀번호 확인--></label></th>
									<td>
										<input id="ibxPwdReSetLoginPwdConfirm" maxlength="16" type="password" placeholder="영문 숫자 조합 8자리 이상" class="input-text w300px"><!--영문,숫자,특수기호 중 2가지 이상 조합-->
										<!--
											오류메시지가 업을때는 tag 자체가 나오지 않아야 합니다.
										 -->
										<div id="pwdReSet-error-text" class=""></div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>

				<ul class="dot-list gblue mt20">
					<li>비밀번호는 영문 숫자 조합 8자리 이상으로 설정해주세요.</li><li>생년월일, 휴대폰번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 사용을 자제해주세요.</li><li>비밀번호는 3개월마다 변경해주세요.</li><li>비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</li><!--<li>비밀번호는 영문, 숫자, 특수문자 중 2가지 이상 조합 10자리 이상으로 설정해주세요.</li><li>생년월일, 휴대폰번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 사용을 자제해주세요.</li><li>비밀번호는 3개월마다 변경해주세요.</li><li>비밀번호 변경시 로그인된 모든 디바이스에서 로그아웃됩니다. 변경한 비밀번호로 다시 로그인 후 이용해주세요.</li>-->
				</ul>

				<div class="btn-member-bottom">
					<button id="btnPwdResetButton" type="button" class="button purple large">확인<!--확인--></button>
				</div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>

<script>
let change_pwd_reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;
let changePwdCheck = false;
let changePwdReCheck = false;

let change_pwd = $('#ibxPwdReSetLoginPwd');
let change_pwdRe = $('#ibxPwdReSetLoginPwdConfirm');

$('#ibxPwdReSetLoginPwd').on('keyup', function(){
	if(change_pwd_reg.test(change_pwd.val())){
		$('#pwdSet-error-text').html("사용할 수 있는 비밀번호입니다.").css("color", "green");
		changePwdCheck = true;
	}else{
		console.log(change_pwd.val());
		$('#pwdSet-error-text').html("비밀번호는 영문 숫자 조합 8자리 이상입니다.").css("color", "red");
		changePwdCheck = false;
	}
	
})

$('#ibxPwdReSetLoginPwdConfirm').on('keyup', function(){
	if(change_pwd.val() == change_pwdRe.val()){
		$('#pwdReSet-error-text').html("<i class='bi bi-check-lg'></i>").css("color", "green");
		changePwdReCheck = true;
	}else{
		$('#pwdReSet-error-text').html("<i class='bi bi-x-lg'></i>").css("color", "red");
		changePwdReCheck = false;
	}
})
$('#btnPwdResetButton').on('click', function(){
	if(!changePwdCheck){
		alert('비밀번호가 양식에 맞지 않습니다.');
		$('#ibxPwdReSetLoginPwd').focus();
		return;
	}
	if(!changePwdReCheck){
		alert('비밀번호가 일치하지 않습니다.');
		$('#ibxPwdReSetLoginPwdConfirm').focus();
		return;
		
	}
	$('#pwdChangeForm').submit();
	
	
})

</script>
<%@ include file="../include/footer.jsp" %>