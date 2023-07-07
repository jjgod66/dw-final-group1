<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#join-modal .modal-content{
    border-radius: 0.7rem;
}
#join-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#join-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#join-modal .modal-footer{
    border-top: none;
}
</style>
<div class="modal fade" id="join-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2">회원가입</h3>
                    <div class="row">
                        <div class="col-lg-10 col-xl-9 mx-auto">
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