<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="thrAdminHeader.jsp"%>


<style>
#wrapper {
	background-color: #fff;
	z-index: 5;
	min-width: 300px;
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
	max-width: 80rem;
	margin : 0rem auto 2rem auto;
    padding-bottom: 100px;
}
.breadcrumb {
    padding: 0 0 0 25px;
    color: #000;
    line-height: 34px;
    border-bottom: 1px solid #e9e9e9;
    text-align: left;
    font-size: 12px;
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
margin: 0px 100px 0px 185px;
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
.tbl_frm02 table {
    width: 50%;
}
.tbl_frm02 {
    border-top: 1px solid #888;
}
.tbl_frm02 th {
    font-weight: 600;
}
.tbl_frm02 th, .tbl_frm02 td {
    padding: 17px 14px;
    height: 23px;
/*     border-bottom: 1px solid #e4e5e7; */
    border: 1px solid #e4e5e7;
    text-align: left;
    vertical-align: middle;
}
#tblth {
	font-weight: 600;
	background: #f1f1f1;
	text-align: center;
}
</style>

<div id="wrapper">
	<div id="content">
		<section class="content-header">
			<div class="breadcrumb">
				<span>HOME</span> <i class="bi bi-chevron-compact-right" style="padding-top: 0.1rem; align-self: center;"></i> 지점 관리 &gt 상영관 등록  
			</div>
		</section>
		
		<div class="s_wrap">
			<form role="form" action="" name="registForm" method="post">
				<h2>지점 영화관 정보</h2>
				<div class="tbl_frm02">
					<table class="hh" style="margin-left:auto;margin-right:auto;">
						<colgroup>
							<col class="w100">
							<col class="w100">
						</colgroup>
						<tbody>
							<tr>
								<td id="tblth">상영관명 </td>
								<td><input type="text"> </td>
							</tr>
							<tr>
								<td id="tblth">행  </td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td id="tblth">열  </td>
								<td><input type="text"></td>
							</tr>
							
						</tbody>
					</table>
				</div>
							
				<div class="btn_confirm">
					<c:choose>
						<c:when test="${empty thr}">
							<button type="button" id="registBtn" class="btn_large">등록</button>
						</c:when>
						<!-- <c:otherwise>
							<button type="button" id="modifyBtn" class="btn_large">수정</button>
							<button type="button" id="deleteBtn" class="btn_large">삭제</button>
						</c:otherwise> -->
					</c:choose>
					<button type="button" id="cancelBtn" class="btn_large">뒤로가기</button>
				</div>
				<input type="hidden" value="" id="thr_y" name="thr_y">
				<input type="hidden" value="" id="thr_x" name="thr_x">
			</form>
		</div>
	</div>
</div>

<script>

// 극장 지점 등록
$('button#registBtn').on('click', function(){
	let form = $('form[role="form"]');
	
	var geocoder = new kakao.maps.services.Geocoder();
	
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        $('#thr_y').val(result[0].y);
	        $('#thr_x').val(result[0].x);
	        console.log($('#thr_y').val());
	        console.log($('#thr_x').val());
			form.submit();
	    }
	};
	
	geocoder.addressSearch($('#addr').val(), callback);
	
});

// 극장 지점 수정
$('button#modifyBtn').on('click', function(){
	let form = $('form[role="form"]');
	form.attr('action', 'theaterModify.do');
	
	var geocoder = new kakao.maps.services.Geocoder();
	
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        $('#thr_y').val(result[0].y);
	        $('#thr_x').val(result[0].x);
	        console.log($('#thr_y').val());
	        console.log($('#thr_x').val());
			form.submit();
	    }
	};
	
	geocoder.addressSearch($('#addr').val(), callback);
	
});

$('button#deleteBtn').on('click', function(){
	if(confirm('해당 지점을 정말로 삭제하시겠습니까?')) {
		let form = $('form[role="form"]');
		form.attr('action', 'theaterDelete.do');
		form.submit();
	}
});

$('button#cancelBtn').on('click', function(){
	if(confirm('작성중인 내용은 저장되지 않습니다. 뒤로 가시겠습니까?')) {
		history.go(-1);
	}
});
</script>


<%@ include file="../common/searchAdress.jsp" %>


<%@ include file="thrAdminFooter.jsp"%>