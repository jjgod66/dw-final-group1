<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
    
<c:set var="cri" value="${pageMaker.cri }" />

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
	margin : 2rem auto 2rem auto;
    padding-bottom: 100px;
    border: 1px solid #ccc;
}
.breadcrumb {
    padding: 0 0 0 25px;
    color: #000;
    line-height: 34px;
    border-bottom: 1px solid #e9e9e9;
    text-align: left;
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
.nav-item > span {
	border: 1px solid #ccc;
	background-color : white;
	padding : 0.5rem;
	margin-right : 0.5rem;
	cursor : pointer;
}
#boxOffice, #futureOffice {
	padding : 0.3rem;
}
</style>

<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		<div class="card">
			<div class="card-header" style="padding-bottom: 0;">
				<ul class="nav nav-tabs" style="padding-bottom: 0.4rem;">
				  <li class="nav-item" id="boxOffice" onclick="isFuture('b'); searchList_go(1);">
				    <button class="btn_medium">박스오피스</button>
				  </li>
				  <li class="nav-item" id="futureOffice" onclick="isFuture('f'); searchList_go(1);">
				    <button class="btn_medium">상영예정작</button>
				  </li>
				</ul>
				<div class="float-end">
					<span>
						<select name="searchType" id="searchType" onchange="javascript:searchList_go(1);">
										<option value="r" ${cri.searchType eq 'r' ? 'selected' : '' }>예매율</option>
										<option value="n" ${cri.searchType eq 'n' ? 'selected' : '' }>영화명</option>
										<option value="d" ${cri.searchType eq 'd' ? 'selected' : '' }>개봉일</option>
						</select>
						<input type="hidden" id="keyword" name="keyword" value="${cri.keyword }">
					</span>
					<button type="button" class="btn_medium" id="movieRegistFormBtn" style="margin: 0.3rem;">&nbsp;&nbsp;등록&nbsp;&nbsp;</button>
				</div>
			</div>
			<div class="card-body">
				<div class="container px-4">
				<div class="movieList row gx-1 px-1" style="text-align: -webkit-center;">
					<c:forEach items="${movieList}" var="movie">
						<div class="col-md-3" style="border: 1px solid #ccc;">
							<div class="p-1" style="width: 80%; height: 20rem; overflow: hidden;">
								<img src="getPicture.do?name=${movie.MOVIE_MAINPIC_PATH}&item_cd=${movie.MOVIE_CD}&type=moviePoster" class="img-thumbnail" style="object-fit: cover; width: 100%; hegith:100%;">
							</div>
							<div>
								${movie.GRADE } <a href="movieRegistForm.do?movie_cd=${movie.MOVIE_CD }">${movie.MOVIE_NAME}</a>
							</div>
							<div>
								예매율: ${movie.reserveRatio }% / 개봉일: <fmt:formatDate value='${movie.OPENDATE }' pattern='yyyy-MM-dd'/>
							</div>
						</div>
					</c:forEach>
				</div>
				</div>
			</div>
			<div class="mt-5 mb-5">
				<%@ include file="../common/pagination.jsp" %>
			</div>
		</div>
	</div>
</div>    

<script>
 
	$(function(){
		$('#movieRegistFormBtn').on('click', function(){
			location.href="movieRegistForm.do";
		});
		
	});
	function isFuture(e){
		console.log(e);
		if (e == "b"){
			$('input[name="keyword"]').val('');			
		} else if(e == "f") {
			$('input[name="keyword"]').val('f');
		}
	}
	
	let searchFormUrl = "movieAdminMain.do";
</script>
<%@ include file="sysAdminFooter.jsp"%>