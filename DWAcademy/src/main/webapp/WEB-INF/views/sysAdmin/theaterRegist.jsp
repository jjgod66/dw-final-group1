<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35e6d1bccbd666fa1a2827012cbc4203&libraries=services,clusterer,drawing"></script>
<%@ include file="sysAdminHeader.jsp"%>
<style>
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
</style>

<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		
		<div class="s_wrap">
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
											<option value="${loc }" ${loc eq thr.thr_loc ? 'selected' : '' }>${loc }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th scope="row">영화관명</th>
								<td><input type="text" name="thr_name" class="required frm_input" value="${thr.thr_name }" size="30" style="background-position: right top; background-repeat: no-repeat;" ${thr.thr_name eq null ? '':'readonly' } required></td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td><input type="text" name="thr_tel" class="frm_input" size="30" value="${thr.thr_tel }" placeholder="숫자만 입력하세요. 예) 0212345678"></td>
							</tr>
							<tr>
								<th scope="row">영화관주소</th>
								<td colspan="3">
									<p>
										<input type="text" name="thr_addr_post" id="addr_post" class="frm_input" value="${thr.thr_addr_post }" size="8" maxlength="10" readonly>
										<button type="button" id="searchAddr" class="btn_small grey" onclick="sample6_execDaumPostcode();">주소검색</button>
									</p>
									<p class="mart3">
										기본 주소 <input type="text" name="thr_addr" id="addr" class="frm_input" value="${thr.thr_addr }" size="60" readonly>
									</p>
									<p class="mart3">
										상세 주소 <input type="text" name="thr_addr_detail" id="addr_detail" class="frm_input" value="${thr.thr_addr_detail }" size="60">
									</p>
								</td>
							</tr>
							<tr>
								<th scope="row">영화관 소개상세</th>
								<td colspan="3">
									<p class="mart3">
										<textarea name="thr_info" id="info" class="frm_input" rows="10" cols="150" style="resize: none;">${thr.thr_info }</textarea>
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
							<col>
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" style="width: 15%;">관리자 아이디</th>
								<td><input type="text" name="admin_id" id="admin_id"
									class="frm_input" value="${thr.admin_id }" size="30"></td>
							</tr>
							<tr>
								<th scope="row">관리자 비밀번호</th>
								<td><input type="text" name="admin_pwd" id="admin_pwd"
									class="frm_input" value="${thr.admin_pwd }" size="30"></td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="btn_confirm">
					<c:choose>
						<c:when test="${empty thr}">
							<button type="button" id="registBtn" class="bc_dw_blue">등록</button>
						</c:when>
						<c:otherwise>
							<button type="button" id="modifyBtn" class="bc_dw_blue">수정</button>
							<button type="button" id="deleteBtn" class="bc_dw_orange" >${thr.gb_del == 'Y' ? '재등록' : '비활성화' }</button>
						</c:otherwise>
					</c:choose>
					<button type="button" id="cancelBtn" class="bc_dw_black" >뒤로가기</button>
				</div>
				<input type="hidden" value="" id="thr_y" name="thr_y">
				<input type="hidden" value="" id="thr_x" name="thr_x">
				<input type="hidden" value="${thr.gb_del }" name="gb_del">
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
	if ('${thr.gb_del}' == 'Y') {
		if(confirm('해당 지점을 재등록하시겠습니까?')) {
			let form = $('form[role="form"]');
			form.attr('action', 'theaterDelete.do');
			form.submit();
		}		
	} else if ('${thr.gb_del}' == 'N') {
		if(confirm('해당 지점을 정말로 삭제하시겠습니까?')) {
			let form = $('form[role="form"]');
			form.attr('action', 'theaterDelete.do');
			form.submit();
		}
	}
});

$('button#cancelBtn').on('click', function(){
	if(confirm('작성중인 내용은 저장되지 않습니다. 뒤로 가시겠습니까?')) {
		history.go(-1);
	}
});
</script>


<%@ include file="../common/searchAdress.jsp" %>
<%@ include file="sysAdminFooter.jsp"%>