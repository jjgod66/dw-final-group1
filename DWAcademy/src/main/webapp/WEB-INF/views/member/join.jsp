<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/member_header.jsp" %>
<div class="container-fluid">
	<div class="row no-gutter">
		<div class="col-md-6 d-none d-md-flex bg-image">
		</div>
        <div class="col-md-6 bg-light">
            <div class="login d-flex align-items-center py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 col-xl-9 mx-auto">
                            <h3 class="fs-1 text-center mb-3">회원가입</h3>
							<div class="row register-form">
								<div class="col-md-6">
									<h3 class="form-label">* 아이디</h3>
									<div class="form-group mb-2">
										<input type="text" class="form-control" placeholder="아이디 *" value="" />
									</div>
									<h3 class="form-label">* 닉네임</h3>
									<div class="form-group mb-2">
										<input type="text" class="form-control" placeholder="닉네임 *" value="" />
									</div>
									<h3 class="form-label">* 비밀번호</h3>
									<div class="form-group mb-2">
										<input type="password" class="form-control" placeholder="비밀번호 *" value="" />
									</div>
									<h3 class="form-label">* 비밀번호 확인</h3>
									<div class="form-group mb-2">
										<input type="password" class="form-control"  placeholder="비밀번호 확인*" value="" />
									</div>
								</div>
								<div class="col-md-6">
									<h3 class="form-label">* 이름</h3>
									<div class="form-group mb-2">
										<input type="text" class="form-control" placeholder="이름 *" value="" />
									</div>
									<h3 class="form-label">* 이메일 주소</h3>
									<div class="form-group mb-2">
										<input type="email" class="form-control" placeholder="이메일 주소 *" value="" />
									</div>
									<h3 class="form-label">* 휴대폰 번호</h3>
									<div class="form-group d-flex mb-2">
										<select class="form-control" style="width: 20% !important">
											<option class="hidden"  selected>선택</option>
											<option>SKT</option>
											<option>KT</option>
											<option>LG</option>
										</select>
										<select class="form-control" style="width: 20% !important">
											<option class="hidden"  selected>선택</option>
											<option>010</option>
											<option>011</option>
										</select>
										<input type="phone" style="width: 80% !important" minlength="10" maxlength="10" name="txtEmpPhone" class="form-control" placeholder="휴대폰 번호 *" value="" />
									</div>
									<h3 class="form-label">* 생년월일</h3>
									<div class="form-group d-flex mb-2">
										<input type="number" class="form-control" maxlength="4" placeholder="YYYY" value="" />
										<input type="number" class="form-control" maxlength="2" placeholder="MM" value="" />
										<input type="number" class="form-control" maxlength="2" placeholder="DD" value="" />
									</div>
                                	<button type="submit" class="btn btn-login mt-3">회원가입</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/member_footer.jsp" %>