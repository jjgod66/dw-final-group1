<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="thrAdminHeader.jsp"%>


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
#content {
	max-width: 80rem;
	margin : 0rem auto 2rem auto;
    padding-bottom: 100px;
   /*  border: 1px solid #ccc; */
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
	width:70%;
    border-top: 1px solid #888;
}
.tbl_frm01 table {
    width: 100%;
}
.tbl_frm02 table {
	
    width: 100%;
}
.tbl_frm02 {
	width:70%;
    border-top: 1px solid #888;
}
.w100 {
    width: 100px !important;
}
.ww50 {
    width: 50px !important;
}
.tbl_frm01 th {
    font-weight: 600;
}
.tbl_frm02 th {
    font-weight: 600;
}

.tbl_frm01 th, .tbl_frm01 td {
    padding: 8px 14px;
    height: 23px;
    border-bottom: 1px solid #e4e5e7;
    text-align: left;
    vertical-align: middle;
}

.tbl_frm02 th, .tbl_frm02 td {
    padding: 17px 14px;
    height: 23px;
/*     border-bottom: 1px solid #e4e5e7; */
    border: 1px solid #e4e5e7;
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
margin: 0px 100px 0px 185px;
    margin-top: 30px !important;
}
.fc_red {
    color: #ec0e03 !important;
}
.local_frm01 {
	width:70%;
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
	width:70%;
    border-top: 1px solid #aeaeae;
    border-bottom: 1px solid #e4e5e7;
}
.tbl_head01 table {
    width: 100%;
}
.w50 {
    width: 50px !important;
}
.ww30 {
    width: 30px !important;
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
#snb dd.active a {
    font-weight: 600;
    color: #fa2828 !important;
    background: #eeeeee !important;
}
.hh {
	padding: 10px;
}
#tblth {
	font-weight: 600;
	background: #f1f1f1;
	text-align: center;
}
textarea {
    display: block;
    width: 100%;
    height: 100px;
}
.red {
    background: #ef4836;
    border: 1px solid #ef4836;
    color: #fff !important;
}
.btn_lsmall {
    padding: 9px 15px;
    font-size: 12px;
    line-height: 1.666;
    font-weight: normal !important;
}
.fr {
    float: right;
}
</style>

<div id="wrapper">
	<div id="content">
		
<section class="content-header">
	<div class="breadcrumb">
		<span>HOME</span> <i class="bi bi-chevron-compact-right" style="padding-top: 0.1rem; align-self: center;"></i> 지점 관리 &gt 상영관 목록  
	</div>
</section>
	<h1><span style="margin-left: 2rem;"> <strong>대전 중앙점 </strong></span></h1>

		<div class="s_wrap">
			<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
			<h2>지점정보 </h2>
			<form name="fsearch" id="fsearch" method="get">
				<input type="hidden" name="code" value="list">
				<div class="tbl_frm02" style="margin-left:auto;margin-right:auto;">
					<table class="hh" style="margin-left:auto;margin-right:auto;">
						<colgroup>
							<col class="ww30">
							<col class="w100">
						</colgroup>
						<tbody>
							<tr>
								<td id="tblth">영화관명 </td>
								<td>대전 중앙로  </td>
							</tr>
							<tr>
								<td id="tblth">지역구분 </td>
								<td>대전/충청</td>
							</tr>
							<tr>
								<td id="tblth">주소 </td>
								<td>대전광역시 중구 중앙로 126,(대흥동)4층 </td>
							</tr>
							<tr>
								<td id="tblth">소개 </td>
								<td><textarea name="" class="frm_textbox"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="btn_confirm">
					 <input type="button" value="수정" id="frmRest" class="btn_medium grey">
				</div>
				
			</form>
				<div class="local_ov mart30">
					전체 : <b class="fc_red">5</b> 건 조회
				</div>
				
				<div class="local_frm01" style="margin-left:auto;margin-right:auto;">
				<a href="" class="fr btn_lsmall red">+ 상영관추가</a></div>
				
				<div class="tbl_head01" style="margin-left:auto;margin-right:auto;">
					<table style="margin-left:auto;margin-right:auto;">
						<colgroup>
							<col class="w100">
							<col class="w100">
							<col class="w100">
							<col class="w100">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호 </th>
								<th scope="col">상영관명 </th>
								<th scope="col">행 </th>
								<th scope="col">열 </th>
							</tr>
						</thead>
						<tbody class="list">
							
							<c:forEach items="${theaterList }" var="thr">
								<tr class="list0">
									<td>${thr.thr_loc }1</td>
									<td><a href="theaterRegistForm.do?thr_name=${thr.thr_name }">1관 </a></td>
									<td>${thr.thr_addr }3 </td>
									<td>${thr.admin_id }10</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				
				
				
				
<div class="mt-5">
<nav aria-label="member list Nabigation">
	<ul class="pagination justify-content-center m-0" style="background-color : white;">
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(1);">
				<i class="bi bi-chevron-double-left"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(-1);">
				<i class="bi bi-chevron-left"></i>
			</a>
		</li>
		
			<li class="page-item active">
				<a class="page-link" href="javascript:searchList_go(1);">1</a>
			</li>
		
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(-1);">
				<i class="bi bi-chevron-right"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(1);">
				<i class="bi bi-chevron-double-right"></i>
			</a>
		</li>
	</ul>
</nav>



<form id="searchForm">
	<input type="hidden" name="page">
	<input type="hidden" name="perPageNum">
	<input type="hidden" name="searchType">
	<input type="hidden" name="keyword">
</form>
<script>
	function searchList_go(page, url) {
		if (page < 1) {
			return;
		}
		
		let perPageNum = 10;
		if ($('select[name="perPageNum"]').val()) {
			perPageNum = $('select[name="perPageNum"]').val();
		}
		
		let searchForm = $('#searchForm');
		searchForm.find('[name="page"]').val(page);
		searchForm.find('[name="perPageNum"]').val(perPageNum);
		searchForm.find('[name="searchType"]').val($('select[name="searchType"]').val());
		searchForm.find('[name="keyword"]').val($('input[name="keyword"]').val());
		searchForm.attr("method", "post");
		
		if (url) {
			searchForm.attr("action", url);
		} else {
			searchForm.attr("action", searchFormUrl);
		}
		searchForm.submit();
	}
</script>
				</div>
		</div>

	</div>
</div>


<%@ include file="thrAdminFooter.jsp"%>