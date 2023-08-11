<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="thrAdminHeader.jsp"%>
<style>
.local_frm01 {
	width: 100%;
}
.tbl_head01 {
	width: 100%;
}

</style>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="screenModifyModal_title" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-sm">
    <div class="modal-content"  style="border-color: #4aa8d8;">
      <div class="modal-header" style="background-color: #4aa8d8; color: white;">
        <h1 class="modal-title fs-5" id="screenModifyModal_title">상영관 추가</h1>
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
        	<div class="col-md-12 text-end" style="display:none;" id="confirmYourFormDiv"><b class="red"></b></div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn" id="registHouseBtn" style="background-color: #4aa8d8; color: white;">등록</button>
        <button type="button" class="btn" id="modifyHouseBtn" style="background-color: #4aa8d8; color: white;">수정</button>
        <button type="button" class="btn" id="deleteHouseBtn" style="background-color: #ef4836; color: white;">삭제</button>
        <button type="button" class="btn btn-secondary"  id="cancelModalBtn" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div id="wrapper">
	<div id="content" style="padding-bottom: 20px;">
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
					<div class="text-end" style="font-size: 0.8rem;">*영화관 소개 이외의 정보 수정은 주 관리자에게 문의하세요.</div>
				</div>
				<div class="btn_confirm mb-3">
					 <input type="button" value="수정" id="modifyInfoBtn" class="bc_dw_blue" style="padding: 0.5rem 1rem; border: none;">
				</div>
				
				<div class="local_ov mart30">
					전체 : <b class="fc_red">${fn:length(houseList)}</b> 관
				</div>
				
				<div class="local_frm01" style="margin-left:auto;margin-right:auto;">
				<a class="fr btn_lsmall bc_dw_orange" id="registModalBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer;">+ 상영관추가</a></div>
				<div class="tbl_head01" style="margin-left:auto;margin-right:auto;">
					<table class="mt-2 mb-2" style="width: 90%; margin-left:auto;margin-right:auto; border: 1px solid #e4e5e7;">
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
									<td><input type="hidden" class="house_no" value="${house.HOUSE_NO }"><a class="house_name" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer;"><b>${house.HOUSE_NAME }</b></a></td>
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
window.onload = function(){
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
		if (Number($('#house_row').val()) > 20 || $('#house_column').val() > 20) {
			$('#confirmYourFormDiv b').html('상영관 행과 열은 각각<br>20석을 넘을 수 없습니다.')
			$('#confirmYourFormDiv').show();
			return 1;
		}
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
			$('#confirmYourFormDiv b').text('작성 양식을 확인하세요');
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
				if (data != "") {
					modifyHouseRow(data.house_name, data.house_row, data.house_column, data.house_no);
					alert("상영관이 수정되었습니다.");
				} else {
					alert("해당 상영관에 상영 예정인 영화가 남아있습니다.");
				}
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
	
	// 삭제된 상영관 바로 없애기
	function removeHouseRow(hno){
		$('input.house_no[value="'+hno+'"]').closest('.list0').hide();
	}
	
	// 수정된 상영관 바로 preview
	function modifyHouseRow(hnm, hr, hc, hno){
		
		let houseTr = $('input[value='+hno+']').closest('.list0');
		houseTr.find('.house_name').text(hnm);
		houseTr.find('.house_row').text(hr);
		houseTr.find('.house_column').text(hc);
	}
	
	$('#deleteHouseBtn').on('click',function(){
		if(confirm('정말 해당 상영관을 삭제하시겠습니까?')) {
			let house_no = $('#house_no').val();
			let data = house_no;
			
			$.ajax({
				url : "<%=request.getContextPath()%>/thrAdmin/theaterAdminDeleteHouse",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(data){
					console.log(data);
					if (data == 'X') {
						alert('해당 상영관에 상영 예정인 영화가 남아있습니다.');
						return;
					} else if (data == 'O') {
						alert('상영관이 삭제되었습니다.');
						removeHouseRow(house_no);
						$('#cancelModalBtn').click();
					}
				},
				error : function(err){
					console.log(err);
				}
			});
		}
	});
	
	
	
	// 상영관 등록버튼 클릭시
	$('#registModalBtn').on('click', function(){
		$('#screenModifyModal_title').text('상영관 등록');
		$('#registHouseBtn').show();
		$('#modifyHouseBtn').hide();
		$('#deleteHouseBtn').hide();
		
	});
	
	// 상영관 수정버튼 클릭시
	$(document).on('click', '.house_name',function(){
		$('#screenModifyModal_title').text('상영관 수정');
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
		$('#deleteHouseBtn').show();
		
	});
	
}	
</script>
<%@ include file="thrAdminFooter.jsp"%>