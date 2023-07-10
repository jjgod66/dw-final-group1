<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35e6d1bccbd666fa1a2827012cbc4203&libraries=services,clusterer,drawing"></script>
<%@ include file="sysAdminHeader.jsp"%>
<style>
#wrapper {
	background-color: #fff;
	z-index: 5;
	min-width: 1210px;
	zoom: 1;
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
	background: #f6f6f6 url(/admin/img/sflex_icon.png) 174px -302px
		no-repeat;
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

#content {
	margin-left: 150px;
	margin-right:150px;
	padding-bottom: 100px;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
}

.breadcrumb {
	padding: 0 0 0 25px;
	color: #000;
	line-height: 34px;
	border-bottom: 1px solid #e9e9e9;
	text-align: left;
}

.breadcrumb span {
	font-weight: 400;
}

.breadcrumb .ionicons {
	margin: 0 7px 1px;
	vertical-align: middle;
}

.ion-ios-arrow-right:before {
	content: "\f3d3";
}

.s_wrap {
	margin: 30px 25px;
}

#content h1 {
	margin: 0 0 20px;
	padding-bottom: 15px;
	border-bottom: 1px solid #888;
	font-size: 20px;
	line-height: 1em;
	letter-spacing: -1px;
}

#content h2 {
	margin: 30px 0 0;
	position: relative;
	font-size: 16px;
	font-weight: 600;
	letter-spacing: -1px;
	line-height: 1em;
	padding: 0 0 10px 10px;
}

#content h2:before {
	display: inline-block;
	position: absolute;
	left: 0;
	top: 0;
	width: 4px;
	height: 16px;
	background: #1a4e99;
	content: '';
}

form {
	margin: 0;
}

input, textarea {
	box-sizing: border-box;
	border-radius: 0;
	background: none;
}

.tbl_frm01 {
	border-top: 1px solid #888;
}

.tbl_frm01 table {
	width: 100%;
}

.w100 {
	width: 100px !important;
}

.tbl_frm01 th {
	font-weight: 600;
}

.tbl_frm01 th, .tbl_frm01 td {
	padding: 8px 14px;
	height: 23px;
	border-bottom: 1px solid #e4e5e7;
	text-align: left;
	vertical-align: middle;
}

select {
	font-size: 12px;
	height: 23px;
	padding: 1px;
	border: 1px solid #ccc;
	background: #fff;
}

.frm_input {
	padding: 0 4px 1px 4px;
	font-size: 12px;
	font-weight: normal;
	border: 1px solid #ddd;
	background-color: #fff;
	border-radius: 0;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
}

.sound_only {
	display: inline-block !important;
	position: absolute;
	top: 0;
	left: 0;
	margin: 0 !important;
	padding: 0 !important;
	font-size: 0;
	line-height: 0;
	border: 0 !important;
	overflow: hidden !important;
}

.btn_group {
	position: static !important;
	margin: 0;
	padding: 0;
}

.btn_group .btn_small:first-child {
	margin-left: 0 !important;
}

/* .white, .white:active {
	background: #fff;
	border: 1px solid #ccc;
	color: #181c1f !important;
} */

.btn_small {
	padding: 2px 8px;
	font-size: 11px;
	line-height: 1.555;
	font-weight: normal !important;
}

.btn_confirm {
	margin-top: 20px;
	text-align: center;
}

.btn_confirm a, .btn_confirm input, .btn_confirm button {
	margin: 0 1.5px;
}

.btn_ssmall, .btn_small, .btn_lsmall, .btn_medium, .btn_large {
	background: #333;
	border: 1px solid #333;
	color: #fff !important;
}

.btn_medium {
	padding: 8px 15px;
	font-size: 13px;
	line-height: 1.444;
	font-weight: 600;
}

.grey {
	background: #888;
	border: 1px solid #888;
	color: #fff !important;
}

.local_ov {
	margin: 0;
	padding: 10px;
	border-top: 1px solid #aeaeae;
}

.mart30 {
	margin-top: 30px !important;
}

.fc_red {
	color: #ec0e03 !important;
}

.local_frm01 {
	border-top: 1px solid #ececec;
}

.local_frm01, .local_frm02 {
	overflow: hidden;
	margin: 0;
	padding: 7px 10px;
	background: #fcfcfc;
}

.bx-white {
	background: #fff;
	border: 1px solid #ccc;
	color: #222 !important;
}

.btn_lsmall {
	padding: 3px 10px;
	font-size: 12px;
	line-height: 1.666;
	font-weight: normal !important;
}

.tbl_head01 {
	border-top: 1px solid #aeaeae;
	border-bottom: 1px solid #e4e5e7;
}

.tbl_head01 table {
	width: 100%;
}

.w50 {
	width: 50px !important;
}

.w80 {
	width: 80px !important;
}

.w100 {
	width: 100px !important;
}

.w130 {
	width: 130px !important;
}
.w130 {
	width: 140px !important;
}

.w300 {
	width: 300px !important;
}

thead, tfoot {
	font-size: 12px;
	line-height: 1em;
	vertical-align: baseline;
}

.tbl_head01 th {
	padding: 8px 10px;
	line-height: 1em;
	font-weight: 600;
	background: #f1f1f1;
}

.list0 {
	background-color: #ffffff !important;
}

.tbl_head01 td {
	height: 22px;
	padding: 8px 8px;
	line-height: 1.6em;
	border-top: 1px solid #e4e5e7;
}

.tbl_head01 th, .tbl_head01 td {
	border-left: 1px solid #e4e5e7;
	text-align: center;
	vertical-align: middle;
}
.btn_large {
    padding: 10px 21px;
    font-size: 15px;
    line-height: 1.222;
    font-weight: 600;
}
#snb dd.active a {
    font-weight: 600;
    color: #fa2828 !important;
    background: #eeeeee !important;
}
</style>

<div id="wrapper">
	<div id="content">
		 <div class="breadcrumb">
			<span>HOME</span>&nbsp  &gt 지점관리 &gt 지점등록  
		 </div>







	
		<div class="s_wrap">
		<br>
			<h1>지점 신규등록</h1>
			<form role="form" action="theaterRegist.do" name="registForm" method="post">
				<h2>지점 영화관 정보</h2>
				<div class="tbl_frm01">
					<table class="tablef">
						<colgroup>
							<col class="w140">
							<col>
							<col class="w140">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">지역구분</th>
								<td><select id="thr_loc" name="thr_loc">
										<c:forEach items="${locList }" var="loc">
											<option value="${loc }">${loc }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row">영화관명</th>
								<td><input type="text" name="thr_name" required
									class="required frm_input" size="30"
									style="background-position: right top; background-repeat: no-repeat;"></td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td><input type="text" name="thr_tel" class="frm_input"
									size="30" placeholder="숫자만 입력하세요. 예) 0212345678"></td>
							</tr>
							<tr>
								<th scope="row">영화관주소</th>
								<td colspan="3">
									<p>
										<input type="text" name="thr_addr_post" id="addr_post"
											class="frm_input" size="8" maxlength="10">
										<button class="btn_small grey"
											onclick="sample6_execDaumPostcode()">주소검색</button>
									</p>
									<p class="mart3">
										<input type="text" name="thr_addr" id="addr" class="frm_input"
											size="60"> 기본주소
									</p>
									<p class="mart3">
										<input type="text" name="thr_addr_detail" id="addr_detail"
											class="frm_input" size="60"> 상세주소
									</p>
								</td>
							</tr>

						</tbody>
					</table>
				</div>

				<h2>지점 관리자 정보</h2>
				<div class="tbl_frm01">
					<table class="tablef">
						<colgroup>
							<col class="w130">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">관리자 아이디</th>
								<td><input type="text" name="admin_id" id="admin_id"
									class="frm_input" size="30"></td>
							</tr>
							<tr>
								<th scope="row">관리자 비밀번호</th>
								<td><input type="text" name="admin_pwd" id="admin_pwd"
									class="frm_input" size="30"></td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="btn_confirm">
					<button type="submit" id="registBtn" class="btn_large">등록</button>
				</div>
				<input type="hidden" value="" id="thr_y" name="thr_y">
				<input type="hidden" value="" id="thr_x" name="thr_x">
			</form>
		</div>
	</div>
</div>

<script>

$('#registBtn').on('click', function(){
	let form = $('form[role="form"]');
	
	var geocoder = new kakao.maps.services.Geocoder();
	
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        $('#thr_y').val(result[0].y);
	        $('#thr_x').val(result[0].x);
	        console.log($('#thr_y').val());
	    }
	};
	
	let fullAddr = $('#addr').val() + " " + $('#addr_detail').val();
	
	geocoder.addressSearch(fullAddr, callback);
	
	form.submit();
});
</script>


<%@ include file="../common/searchAdress.jsp" %>
<%@ include file="sysAdminFooter.jsp"%>