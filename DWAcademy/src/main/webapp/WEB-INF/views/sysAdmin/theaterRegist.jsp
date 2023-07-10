<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/open_header.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35e6d1bccbd666fa1a2827012cbc4203&libraries=services,clusterer,drawing"></script>
<style>
	.form-group {
		margin-bottom : 1rem;
	}
</style>
<div style="min-height: 800px;">
<%-- 	<jsp:include page="../content_header.jsp">
		<jsp:param value="자유게시판" name="subject" />
		<jsp:param value="등록" name="item" />
	</jsp:include> --%>
	
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width: 950px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">지점등록</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn">취 소</button>
						</div>
					</div>
					<div class="card-body pad">
						<form role="form" method="post" action="theaterRegist.do" name="registForm">
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6">
										<label for="title">영화관명</label>
									</div>
									<div class="col-sm-6">
										<input type="text" id="title" name="title" class="form-control" placeholder="영화관명을 입력하세요.">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6">
										<label for="title">지역구분</label>
									</div>
									<div class="col-sm-6">
										<select id="title" name="title" class="form-control">
											<option></option>
											<option></option>
											<option></option>
											<option></option>
											<option></option>
											<option></option>
											<option></option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-12 mb-1">
										<label for="title">주 소</label>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="sample6_address" placeholder="주소"><br>
									</div>	
									<div class="col-sm-3">
										<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									</div>
								</div>
								<input type="text" class="form-control mb-1" id="sample6_detailAddress" placeholder="상세주소">
<!-- 								<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목"> -->
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6">
										<label for="title">관리자 ID</label>
									</div>
									<div class="col-sm-6">
										<input type="text" id="title" name="title" class="form-control" placeholder="관리자  ID를 입력하세요.">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6">
										<label for="title">관리자 비밀번호</label>
									</div>
									<div class="col-sm-6">
										<input type="text" id="title" name="title" class="form-control" placeholder="관리자 비밀번호를 입력하세요.">
									</div>
								</div>
							</div>
							<input type="hidden" value="" name="">
							<input type="hidden" value="" name="">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
var geocoder = new kakao.maps.services.Geocoder();

var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        console.log(result[0].y +','+result[0].x);
    }
};

geocoder.addressSearch('해남군 송지면', callback);


</script>
<script>
	window.onload = function(){
		
	}
</script>

<%@ include file="../common/searchAdress.jsp" %>
<%@ include file="../include/open_footer.jsp" %>