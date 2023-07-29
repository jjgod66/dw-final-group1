<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
#content {
	max-width: 80rem;
	margin : 2rem auto 2rem auto;
    padding-bottom: 100px;
    border: 1px solid #ccc;
}
</style>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">상영관 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row gy-2 houseForm">
        	<input type="hidden" id="house_no" name="house_no" value="">
        	<div class="col-md-4" style="height: 38px; line-height: 38px;">상영관명 :</div>
        	<div class="col-md-8"><input id="house_name" name="house_name" type="text" class="form-control"></div>
        	<div class="col-md-2" style="height: 38px; line-height: 38px;">행 :</div>
        	<div class="col-md-4"><input type="text" id="house_row" name="house_row" class="form-control" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3"></div>
        	<div class="col-md-2" style="height: 38px; line-height: 38px;">열 :</div>
        	<div class="col-md-4"><input type="text" id="house_column" name="house_column" class="form-control" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3"></div>
        	<div class="col-md-12 text-end" style="display:none;" id="confirmYourFormDiv"><b class="red">작성 양식을 확인하세요</b></div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"  id="cancelModalBtn" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn" id="registHouseBtn" style="background-color: #ef4836; color: white;">등록</button>
        <button type="button" class="btn" id="modifyHouseBtn" style="background-color: #ef4836; color: white;">수정</button>
      </div>
    </div>
  </div>
</div>
<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		<div class="s_wrap">
			<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
			<h2>지점정보 </h2>
				<input type="hidden" name="code" value="list">
				<div class="tbl_frm02" style="margin-left:auto;margin-right:auto;">
					<table class="hh" style="margin-left:auto;margin-right:auto;">
						<colgroup>
							<col class="ww30">
							<col class="w100">
						</colgroup>
						<tbody>
							<tr>
								<td id="tblth">영화관명</td>
								<td>${THR_NAME }  </td>
							</tr>
							<tr>
								<td id="tblth">지역구분 </td>
								<td>${THR_LOC }</td>
							</tr>
							<tr>
								<td id="tblth">주소 </td>
								<td>[${THR_ADDR_POST }] ${THR_ADDR } ${THR_ADDR_DETAIL } </td>
							</tr>
							<tr>
								<td id="tblth">전화번호 </td>
								<td>${THR_TEL } </td>
							</tr>
							<tr>
								<td id="tblth">등록일자 </td>
								<td><fmt:formatDate value="${REGDATE }" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<td id="tblth">영화관 소개 </td>
								<td>
									<textarea name="thr_info" id="thr_info" class="frm_textbox" style="resize:none;">${THR_INFO }</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="btn_confirm">
					 <input type="button" value="수정" id="modifyInfoBtn" class="btn_medium" style="background-color: #4aa8d8; border: none;">
				</div>
				
				<div class="local_ov mart30">
					전체 : <b class="fc_red">${fn:length(houseList)}</b> 건 조회
				</div>
				
				<div class="local_frm01" style="margin-left:auto;margin-right:auto;">
				<a class="fr btn_lsmall red" id="registModalBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer;">+ 상영관추가</a></div>
				<div class="tbl_head01" style="margin-left:auto;margin-right:auto;">
					<table style="margin-left:auto;margin-right:auto;">
						<colgroup>
							<col class="w100">
							<col class="w100">
							<col class="w100">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상영관명 </th>
								<th scope="col">행 </th>
								<th scope="col">열 </th>
							</tr>
						</thead>
						<tbody class="list">
							
							<c:forEach items="${houseList }" var="house">
								<tr class="list0">
									<td><input type="hidden" class="house_no" value="${house.HOUSE_NO }"><a class="house_name" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer;">${house.HOUSE_NAME }</a></td>
									<td class="house_row">${house.HOUSE_ROW }</td>
									<td class="house_column">${house.HOUSE_COLUMN }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	</div>
</div>
<script>

	// 영화관 소개글 수정버튼 클릭시
	$('#modifyInfoBtn').on('click', function(){
		let modifiedInfo = $('#thr_info').val();
		let admin_cd = '${ADMIN_CD}';
		let data = {
					"thr_info" : modifiedInfo,
					"admin_cd" : admin_cd
		};
		$.ajax({
			url : "<%=request.getContextPath()%>/thrAdmin/theaterAdminModifyInfo",
			type: "post",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(data) {
				alert('소개글이 수정되었습니다.')
				console.log(data);
				
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
	
	
	// 작성폼 재작성시
	$('input').on('keyup', function(){
		if ($(this).hasClass('is-invalid')) {
			$(this).removeClass('is-invalid');
		}
		if ($('input.is-invalid').length == 0 ) {
			$('#confirmYourFormDiv').hide();
		}
	});
	
	// 상영관 폼 양식 확인
	function checkForm(house_name, house_row, house_column) {
		
		if (house_name == "") {
			$('#house_name').addClass('is-invalid');
		}
		if (house_row == "") {
			$('#house_row').addClass('is-invalid');
		}
		if (house_column == "") {
			$('#house_column').addClass('is-invalid');
		}
		if ($('.is-invalid').length > 0) {
			$('#confirmYourFormDiv').show();
			return 1;
		}
	}
	// 상영관 등록시
	$('#registHouseBtn').on('click', function(){
		let house_name = $('#house_name').val();
		let house_row = $('#house_row').val();
		let house_column = $('#house_column').val();
		let thr_name = '${THR_NAME}';
		
		if (checkForm(house_name, house_row, house_column) == 1) {
			return;	
		}
		
		let data = {
				"thr_name" : thr_name,
				"house_name" : house_name,
				"house_row" : house_row,
				"house_column" : house_column
		};
		
		$.ajax({
			url : "<%=request.getContextPath()%>/thrAdmin/theaterAdminRegistHouse",
			type : "post",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(data){
				console.log(data);
				addHouseRow(data.house_name, data.house_row, data.house_column, data.house_no);
				alert("상영관이 추가되었습니다.");
				$('#cancelModalBtn').click();
			},
			error : function(err){
				console.log(err);
			}
		});
	});
	
	// 상영관 수정시
		$('#modifyHouseBtn').on('click', function(){
		let house_no = $('#house_no').val();
		let house_name = $('#house_name').val();
		let house_row = $('#house_row').val();
		let house_column = $('#house_column').val();
		let thr_name = '${THR_NAME}';
		
		if (checkForm(house_name, house_row, house_column) == 1) {
			return;	
		}
		
		let data = {
				"house_no" : house_no,
				"thr_name" : thr_name,
				"house_name" : house_name,
				"house_row" : house_row,
				"house_column" : house_column
		};
		
		$.ajax({
			url : "<%=request.getContextPath()%>/thrAdmin/theaterAdminModifyHouse",
			type : "post",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(data){
				console.log(data);
				modifyHouseRow(data.house_name, data.house_row, data.house_column, data.house_no);
				alert("상영관이 수정되었습니다.");
				$('#cancelModalBtn').click();
			},
			error : function(err){
				console.log(err);
			}
		});
	});
	
	
	// 상영관등록모달 취소버튼 클릭시
	$('#cancelModalBtn').on('click', function(){
		
		$('input.is-invalid').removeClass('is-invalid');
		$('.houseForm input').val('');
		$('#confirmYourFormDiv').hide();
	});
	
	// 추가된 상영관 바로 preview
	function addHouseRow(hnm, hr, hc, hno){
		
		$('tbody.list').append('<tr class="list0"><td><input type="hidden" class="house_no" value="'+hno+'">'
												  +   '<a class="house_name" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer;">'+hnm+'</a></td>'
												  +'<td class="house_row">'+hr+'</td>'
												  +'<td class="house_column">'+hc+'</td></tr>');
	}
	
	// 수정된 상영관 바로 preview
	function modifyHouseRow(hnm, hr, hc, hno){
		
		let houseTr = $('input[value='+hno+']').closest('.list0');
		houseTr.find('.house_name').text(hnm);
		houseTr.find('.house_row').text(hr);
		houseTr.find('.house_column').text(hc);
	}
	
	// 상영관 등록버튼 클릭시
	$('#registModalBtn').on('click', function(){
		
		$('#registHouseBtn').show();
		$('#modifyHouseBtn').hide();
		
	});
	
	// 상영관 수정버튼 클릭시
	$(document).on('click', '.house_name',function(){
		
		let house_no = $(this).closest('.list0').find('.house_no').val();
		let house_name = $(this).text();
		let house_row = $(this).closest('.list0').find('.house_row').text();
		let house_column = $(this).closest('.list0').find('.house_column').text();
		
		$('#house_no').val(house_no);
		$('#house_name').val(house_name);
		$('#house_row').val(house_row);
		$('#house_column').val(house_column);
		
		$('#registHouseBtn').hide();
		$('#modifyHouseBtn').show();
		
	});
	
</script>

<%@ include file="thrAdminFooter.jsp"%>