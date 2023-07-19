<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.css" integrity="sha512-cyzxRvewl+FOKTtpBzYjW6x6IAYUCZy3sGP40hn+DQkqeluGRCax7qztK2ImL64SA+C7kVWdLI6wvdlStawhyw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.js" integrity="sha512-6lplKUSl86rUVprDIjiW8DuOniNX8UDoRATqZSds/7t6zCQZfaCe3e5zcGaQwxa8Kpn5RTM9Fvl3X2lLV4grPQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ include file="photo_modal.jsp" %>
<style>
.photocontainer {
    background-color: #fff;
    border-left: 1px solid #F4F4F5;
    border-right: 1px solid #F4F4F5;
    width: 1300px;
    margin-left: auto;
    margin-right: auto;
    height: 600px;
}

	
</style>
<div class="sub_visual">
    <h3>포토티켓</h3>
    <h6>photo ticket</h6>
</div>
<div class="wrapper">
	<div style="background-color: #f1f2f7; padding: 15px 0;">
		<div class="photocontainer row">
			<div class="col-9">
				<div style="width: 100%; text-align: center;"><h3 style="padding-top: 40px;">포토티켓 이미지 편집</h3></div>
				<div class="" style="margin: 40px 0; padding: 0 170px;">
					<div style="float: left; display: inline;">
						<div class="card" style="width: 275px; height: 425px; float: left;">
							<div class="card-body" style="text-align: center; line-height: 400px;"><a href="javascript:photomodal();" style="font-size: 20px; color: gray; text-decoration: underline;">이미지업로드</a></div>
						</div>
						<div style="text-align: center;">앞면</div>
					</div>
					<div style="float: right; display: inline;">
						<div class="card" style="width: 275px; height: 425px; float: right; padding: 10px;">
							<div class="card-body">
								<div class="" style="text-align: center; margin: 10px;"><img src="/resources/img/logo.png" style="width: 90%;"></div>
								<hr style="width: 100%; color: gray; margin: 30px auto;">
								<h4>영화제목</h4>
								<br>
								<p>2D / 전체관람가</p>
								<br>
								<p>대전유성점 1관</p>
								<br>
								<p>2023-07-19</p>
								<p>12:00 ~ 13:00</p>
								<hr style="width: 100%; color: gray; margin: 30px auto;">
								<div class="" style="text-align: center; margin: 10px;"><img src="/resources/img/logo.png" style="width: 90%;"></div>
							</div>
						</div>
						<div style="text-align: center;">뒷면</div>
					</div>
					
				</div>
			</div>
			<div class="col-3">ddd</div>
		</div>
	</div>

</div>

<script>
	$(function(){
		
	})
	
function photomodal(){
	$('#photo-modal').modal('show');
		
		
}
</script>
<%@include file="../include/footer.jsp" %>