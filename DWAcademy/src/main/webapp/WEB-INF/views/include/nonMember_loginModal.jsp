<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>


</style>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<script>
	Kakao.init('4d3eb758ca79e46a21afa1951cdbec30'); //발급받은 키 중 javascript키를 사용해준다.
</script>
<div class="modal fade" id="nonMemLogin_modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2">비회원 예매확인</h3>
            	<div class="row mb-3">
	                <form id="formForNonMemLogin" method="POST" action="<%=request.getContextPath()%>/nonMem/login.do">
		                
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>이름</b>
		                	</div>
		                	<div class="col-md-8">
			                    <input class="form-control" type="text" name="non_mem_name" maxlength="30" placeholder="" name="text">
		                	</div>
		                </div>
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>생년월일</b>
		                	</div>
		                	<div class="col-md-8">
			                    <input class="form-control" type="text" name="non_mem_bir" maxlength="8" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="생년월일 앞 8자리 " name="text">
		                	</div>
		                </div>
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>휴대폰번호</b>
		                	</div>
		                	<div class="col-md-8">
			                    <input class="form-control" type="text" name="non_mem_phone" maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="-없이 입력" name="text">
		                	</div>
		                </div>
		               
		                <div class="input-group row mb-2">
		                	<div class="col-md-4" style="text-align: center; align-self: center;">
		                		<b>비밀번호</b>
		                	</div>
		                	<div class="col-md-8">
			                    <input class="form-control" type="password" name="non_mem_pwd" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자(4자리)" name="text">
		                	</div>
		                </div>
		                </form>
            	</div>
            	<div class="text-center">
					<button type="button" id="submitNonMemberLoginBtn"style="background-color: #4aa8d8; border: none; border-radius: 0.5rem; padding: 0.5rem 0.8rem; color: white;">확 인</button> 
				</div>
            </div>
        </div>
    </div>
</div>
<script>

$('#submitNonMemberLoginBtn').on('click', function(){
	
	let formValues = $("#formForNonMemLogin").serialize();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/nonMem/nonMemLoginChk.do',
		method : 'post',
		data : formValues,
		success : function(res){
			console.log(res);
			if(res == 'Y'){
				$('#formForNonMemLogin').submit();
			}else{
				alert('입력한 정보로 조회되는 정보가 없습니다.');
				return;
			}
		},
		error : function(err){
			alert(err.status);
		}
	})
})
</script>
<%@ include file = "login_modal_js.jsp" %>