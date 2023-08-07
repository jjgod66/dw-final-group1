<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sysAdminHeader.jsp" %>
<style>
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
.inputList > div {
	margin-bottom: 1rem;
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
	<div class="container-fluid">
		<section id="anc_sitfrm_ini">
			<form enctype="multipart/form-data" role="form" name="registForm">
				<input type="hidden" name="product_cd" value="${product.product_cd }">
				<div class="row" style="margin: 2rem 6rem;">
					<div class="col-md-4 text-center">
						<div style="width: 20rem; height: 20rem; border: 1px solid black;" id="pictureView"></div>
						<div class="mt-1 row">
							<div class="col-md-3 p-0 ms-2">
								<button class="bc_dw_black" id="imgBtn" style="padding: 0.3rem 0.3rem;">이미지등록</button>
							</div>
							<div class="col-md-8 p-0">
								<input type="hidden" name="oldPicture" value="${product.product_pic_path }">
								<input id="inputFileName" class="form-control" type="text" name="" disabled>
								<input type="file" id="imgFile" name="product_pic_path" accept=".jpeg, .png, .jpg, .gif" onchange="imgChange_go();" style="display: none;">
							</div>
						</div>
					</div>
					<div class="col-md-8" style="align-self: center;">
						<div class="row inputList">
							<div>상품명
								<input type="text" name="product_name" value="${product.product_name }" class="form-control">
							</div>
							<div>상품구분
								<div class="form-control" id="product_div_div">
									<input type="radio" name="product_div" id="giftcard" value="기프트카드" ${product.product_div eq '기프트카드' ? 'checked' : '' }><label for="giftcard">기프트카드</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" name="product_div" id="psd" value="팝콘/스낵/음료" ${product.product_div eq '팝콘/스낵/음료' ? 'checked' : '' }><label for="psd">팝콘/스낵/음료</label>
								</div>
							</div>
							<div>구성품
								<input type="text" name="product_content" class="form-control" value="${product.product_content }">
							</div>
							<div>가격
								<input type="text" class="form-control" name="product_price" value="${product.product_price }" maxlength="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="단위는 '원'입니다. 정수로 입력해주세요">
							</div>
							<div>유효기간
								<input type="text" class="form-control" name="product_period" value="${product.product_period }" maxlength="5" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="단위는 '일'입니다. 정수로 입력해주세요.">
							</div>
							<div>이용안내
								<textarea class="form-control" rows="5" name="product_info" style="resize: none;">${product.product_info }</textarea>
							</div>
						</div>
					</div>
					<div class="col-md-12 text-center">
						<c:choose>
							<c:when test="${empty product.product_cd}">
								<button class="bc_dw_blue" id="registBtn">등록</button>
							</c:when>
							<c:otherwise>
								<button class="bc_dw_blue" id="modifyBtn">수정</button>
							</c:otherwise>
						</c:choose>
						<button class="bc_dw_black" id="cancelBtn">뒤로가기</button>
					</div>
				</div>
			</form>
		</section>
	</div>
	</div>
</div>

<script>
// 이미지 변경시 프리뷰
function imgChange_go() {
	let inputImage = $('input#imgFile')[0];
	preViewPicture(inputImage, $('div#pictureView'));
}
// 등록이 아니라 수정시 기존 이미지 프리뷰
if ('${product.product_pic_path}' != null && '${product.product_pic_path}' != '') {
	let imageURL = '/common/getPicture.do?name=${product.product_pic_path}&item_cd=${product.product_cd}&type=productImg';	// 이미지명 가지고 와서 셋팅
	$('div#pictureView').css({
							'background-image' : 'url("' + imageURL + '")',
							'background-position' : 'center',
							'background-size' : 'cover',
							'background-repeat' : 'no-repeat'
						});
	$('#inputFileName').val('${product.product_pic_path}');
}

// 작성폼 확인
function checkForm(){
	if ($('#inputFileName').val() == "") {
		$('#inputFileName').addClass('is-invalid');
	}
	if ($('input[name="product_name"]').val() == "") {
		$('input[name="product_name"]').addClass('is-invalid');
	}
	if ($('input[name="product_div"]:checked').length < 1) {
		$('#product_div_div').addClass('is-invalid');
	}
	if ($('input[name="product_content"]').val() == "") {
		$('input[name="product_content"]').addClass('is-invalid');
	}
	if ($('input[name="product_price"]').val() == "") {
		$('input[name="product_price"]').addClass('is-invalid');
	}
	if ($('input[name="product_period"]').val() == "") {
		$('input[name="product_period"]').addClass('is-invalid');
	}
	if ($('textarea[name="product_info"]').val() == "") {
		$('textarea[name="product_info"]').addClass('is-invalid');
	}
}


$(function(){
	//is-invalid 설정
	$('input').on('keyup click', function(){
		if ($(this).hasClass('is-invalid')) {
			$(this).removeClass('is-invalid');
		}
		if($(this).parents('.form-control')) {
			$(this).parents('.form-control').removeClass('is-invalid');
		}
	});
	
	// 이미지버튼 클릭
	$('#imgBtn').on('click', function(e){
		e.preventDefault();
		$('#imgFile').click();
	});
	$('#imgFile').on('change', function(){
		$('#inputFileName').removeClass('is-invalid');
	})
	
	// 등록버튼 클릭시
	$('#registBtn').on('click', function(e){
		e.preventDefault();
		checkForm();
		if ($('form[role="form"] .is-invalid').length > 0) {
			alert('작성양식을 확인하세요.');
			return;
		}
		$('form[role="form"]').attr({'method' : 'post', 'action' : 'storeAdminProductRegist.do'});
		$('form[role="form"]').submit();
	});
	
	// 수정버튼 클릭시
	$('#modifyBtn').on('click', function(e){
		e.preventDefault();
		checkForm();
		if ($('form[role="form"] .is-invalid').length > 0) {
			alert('작성양식을 확인하세요.');
			return;
		}
		$('form[role="form"]').attr({'method' : 'post', 'action' : 'storeAdminProductModify.do'});
		$('form[role="form"]').submit();
	});
	
	// 뒤로가기버튼 클릭시
	$('#cancelBtn').on('click', function(e){
		e.preventDefault();
		
		location.href='/sysAdmin/storeAdminMain.do?CategoryIdx=1';
	});
});
</script>
<%@ include file="sysAdminFooter.jsp" %>