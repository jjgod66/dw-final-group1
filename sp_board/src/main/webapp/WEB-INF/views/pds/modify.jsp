<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="min-height: 800px;">
	<jsp:include page="../content_header.jsp">
		<jsp:param value="자유게시판" name="subject" />
		<jsp:param value="수정" name="item" />
	</jsp:include>
	
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width: 950px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">자료등록</h3>
					</div>
					<div class="card-body pad">
						<form enctype="multipart/form-data" role="form" method="post" action="modify.do" name="modifyForm">
							<div class="form-group">
								<label for="title">제 목</label>
								<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력하세요." value="${pds.title }">
							</div>
							<div class="form-group">
								<label for="writer">작성자</label>
								<input type="text" id="writer" name="writer" class="form-control" value="${pds.writer }" readonly>
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea id="content" name="content" rows="20" placeholder="1000자 내외로 작성하세요." style="display: block; width: 100%;">${pds.content }</textarea>
							</div>
							<div class="form-group">
								<div class="card card-outline card-success">
									<div class="card-header">
										<h5 style="display:inline; line-height:40px;">첨부파일 : </h5>
										<button class="btn btn-xs btn-primary" type="button" id="addFileBtn">ADD FILE</button>
									</div>
									<div class="card-footer fileInput">
										<ul class="mailbox-attachments d-flex align-items-stretch clreafix">
											<c:forEach items="${pds.attachList }" var="attach">
												<li class="attach-item">
													<div class="mailbox-attachment-info">
														<a class="mailbox-attachment-name" name="attachedFile"
															attach-fileName="${attach.filename }" attach-no="${attach.ano }"
															href="<%=request.getContextPath()%>/pds/getFile.do?ano=${attach.ano }">
														<i class="fas fa-paperclip"></i>
														${attach.filename }&nbsp;&nbsp;
														<button type="button" style="border: 0; outline: 0;" class="badge bg-red">X</button>
														</a>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary" id="registBtn">등 록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-warning" id="cancelBtn">취 소</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<%@ include file="../common/summernote.jsp" %>
<%@ include file="modify_js.jsp" %>