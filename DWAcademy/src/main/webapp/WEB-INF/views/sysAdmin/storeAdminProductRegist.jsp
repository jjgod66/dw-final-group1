<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
		</jsp:include>
	<div class="container-fluid">
		<form enctype="multipart/form-data" role="form" name="registForm">
			<section id="anc_sitfrm_ini">
				<div class="row" style="margin: 2rem 6rem;">
					<div class="col-md-4">
						<div style="width: 20rem; height: 20rem; border: 1px solid black;">
							이미지
						</div>
					</div>
					<div class="col-md-8" style="align-self: center;">
						<div class="row">
							<div><input type="text" class="form-control" style="margin-bottom : 1rem;"></div>
							<div><input type="text" class="form-control" style="margin-bottom : 1rem;"></div>
							<div><input type="text" class="form-control" style="margin-bottom : 1rem;"></div>
							<div><input type="text" class="form-control" style="margin-bottom : 1rem;"></div>
							<div><input type="text" class="form-control" style="margin-bottom : 1rem;"></div>
						</div>
					</div>
					<div class="col-md-12">ccc</div>
				</div>
			</section>
		</form>
	</div>
	</div>
</div>
<%@ include file="sysAdminFooter.jsp" %>