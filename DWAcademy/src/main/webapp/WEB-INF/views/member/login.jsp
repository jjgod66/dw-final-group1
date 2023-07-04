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
                        <div class="col-lg-7 col-xl-6 mx-auto">
                            <h3 class="display-4">회원 로그인</h3>
                            <br />
                            <form>
                                <div class="form-group mb-3"><input id="inputEmail" type="text" placeholder="회원 아이디" required="" autofocus="" class="form-control" /></div>
                                <div class="form-group"><input id="inputPassword" type="password" placeholder="비밀번호" required="" class="form-control" /><br /></div>
                                <div class="custom-control custom-checkbox mb-3">
                                    <input id="customCheck1" type="checkbox" class="custom-control-input" /> <label for="customCheck1" class="custom-control-label">자동 로그인</label>
                                </div>
                                <button type="submit" class="btn btn-login mb-2">로그인</button>
                                <div class="text-center d-flex justify-content-between mt-4">
                                    <p>
                                        <a href="<%=request.getContextPath()%>/member/find.do" class="font-italic text-muted"><u>아이디/비밀번호 찾기</u></a> OR <a href="<%=request.getContextPath()%>/member/join.do" class="font-italic text-muted"><u>회원가입</u></a>
                                    </p>
                                </div>
                                
							    <div class="row justify-content-center text-center my-3">
					   			    <h5>간편 로그인</h5>
							    </div>

							    <!-- Social Media Login buttons -->
					   		    <div class="justify-content-center">
					   		        <div class="row justify-content-center">
					   		            <p class="my-1"><a class="btn btn-naver py-3 !tw-block" href="">네이버로 시작하기</a></p>
							            <p class="my-1"><a class="btn btn-kakao py-3 !tw-block" id="custom-login-btn">카카오로 시작하기</a></p>
    							   	</div>
		    					</div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/member_footer.jsp" %>