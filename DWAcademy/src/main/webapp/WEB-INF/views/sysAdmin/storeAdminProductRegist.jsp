<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sysAdminHeader.jsp" %>
<style>
#wrapper {
    background-color: #fff;
    z-index: 5;
    min-width: 1210px;
    zoom: 1;
}
#content {
	max-width: 80rem;
	margin : 2rem auto 2rem auto;
    padding-bottom: 100px;
    border: 1px solid #ccc;
}
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
.btn_ssmall, .btn_small, .btn_lsmall, .btn_medium, .btn_large {
    background: #333;
    border: 1px solid #333;
    color: #fff !important;
}
.btn_small {
    padding: 2px 8px;
    font-size: 11px;
    line-height: 1.555;
    font-weight: normal !important;
}
.btn_medium {
    padding: 8px 15px;
    font-size: 13px;
    line-height: 1.444;
    font-weight: 600;
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
		</jsp:include>
	<div class="container-fluid">
		<section id="anc_sitfrm_ini">
			<form enctype="multipart/form-data" role="form" name="registForm" method="post" action="storeAdminProductRegist.do">
				<div class="row" style="margin: 2rem 6rem;">
					<div class="col-md-4 text-center">
						<div style="width: 20rem; height: 20rem; border: 1px solid black;" id="pictureView"></div>
						<div class="mt-1">
							<button class="btn_small" id="imgBtn">이미지등록</button>
							<input id="inputFileName" class="" type="text" name="" disabled>
							<input type="file" id="imgFile" name="product_pic_path" accept=".jpeg, .png, .jpg, .gif" onchange="imgChange_go();" style="display: none;">
						</div>
					</div>
					<div class="col-md-8" style="align-self: center;">
						<div class="row inputList">
							<div>상품명
								<input type="text" name="product_name" class="form-control">
							</div>
							<div>상품구분
								<div class="form-control">
									<input type="radio" name="product_div" id="giftcard" value="기프트카드"><label for="giftcard">기프트카드</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" name="product_div" id="psd" value="팝콘/스낵/음료"><label for="psd">팝콘/스낵/음료</label>
								</div>
							</div>
							<div>구성품
								<input type="text" name="product_content" class="form-control">
							</div>
							<div>가격
								<input type="text" class="form-control" name="product_price" placeholder="단위는 '원'입니다. 정수로 입력해주세요">
							</div>
							<div>유효기간
								<input type="text" class="form-control" name="product_period" placeholder="단위는 '일'입니다. 정수로 입력해주세요.">
							</div>
							<div>이용안내
								<textarea class="form-control" rows="5" name="product_info" style="resize: none;"></textarea>
							</div>
						</div>
					</div>
					<div class="col-md-12 text-center">
						<c:choose>
							<c:when test="${empty product.product_cd}">
								<button class="btn_medium" id="registBtn">등록</button>
							</c:when>
							<c:otherwise>
								<button class="btn_medium">수정</button>
							</c:otherwise>
						</c:choose>
						<button class="btn_medium" id="cancelBtn">뒤로가기</button>
					</div>
				</div>
			</form>
		</section>
	</div>
	</div>
</div>

<script>
function imgChange_go() {
	let inputImage = $('input#imgFile')[0];
	preViewPicture(inputImage, $('div#pictureView'));
}
$(function(){
		
	$('#imgBtn').on('click', function(e){
		e.preventDefault();
		$('#imgFile').click();
	});
	$('#registBtn').on('click', function(e){
		e.preventDefault();
		debugger;
		console.log($('form[role="form"]')[0]);
// 		$('form[role="form"]').attr({'method' : 'post', 'action' : 'storeAdminProductRegist.do'});
		$('form[role="form"]').submit();
	});
	$('#cancelBtn').on('click', function(e){
		e.preventDefault();
		location.href='/sysAdmin/storeAdminMain.do?CategoryIdx=1';
	});
});
</script>
<%@ include file="sysAdminFooter.jsp" %>