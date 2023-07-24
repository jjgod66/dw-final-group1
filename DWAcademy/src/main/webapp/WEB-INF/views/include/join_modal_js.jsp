<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	// 아이디 중복확인으로 확인된 아이디가 저장될 곳
	let checkedID = "";
	let pwd_reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;
	let email_reg = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
	
	let pwdCheck = false;
	let pwdReCheck = false;
	let emailCheck = false;
	
	
	let input_pwd = $('input[name=mem_pwd]');
	let input_pwdRe = $('input[name=pwd_re]');
	let input_email = $('input[name=mem_email]');

	$('.pwdCheck').on('keyup', function(){
		if(pwd_reg.test(input_pwd.val())){
			$('#result_pwdCheck').html("사용할 수 있는 비밀번호입니다.").css("color", "green");
			pwdCheck = true;
		}else{
			console.log(input_pwd.val());
			$('#result_pwdCheck').html("비밀번호는 영문 숫자 조합 8자리 이상입니다.").css("color", "red");
			pwdCheck = false;
		}
		
	})

	$('.pwdCheck').on('keyup', function(){
		if(input_pwd.val() == input_pwdRe.val()){
			$('#result_pwdReCheck').html("<i class='bi bi-check-lg'></i>").css("color", "green");
			pwdReCheck = true;
		}else{
			$('#result_pwdReCheck').html("<i class='bi bi-x-lg'></i>").css("color", "red");
			pwdReCheck = false;
		}
	})
	
	$('input[name=mem_email]').on('keyup', function(){
		if(email_reg.test(input_email.val())){
			$('#result_emailCheck').html("<i class='bi bi-check-lg'></i>").css("color", "green");
			emailCheck = true;
		}else{
			$('#result_emailCheck').html("이메일 형식에 맞게 작성해주세요.").css("color", "red");
			emailCheck = false;
		}
	})
	
	let input_ID = $('input[name=mem_id');
	$('input[name=mem_id]').on('keyup', function(){
		$("#result_checkId").html("")
	})
	
	function idCheck_go(){
		if(input_ID.val() == ""){
			alert("아이디를 입력하세요.");
			input_ID.focus();
			return;
		}else{
			// 아이디는 4~13 글자의 영문자와 숫자로만 입력
			let reqID = /^[a-z]{1}[a-zA-Z0-9]{3,12}$/;
			if(!reqID.test(input_ID.val())){
				alert("아이디는 첫 글자는 영소문자이며, \n4~13자리의 영문자와 숫자로만 입력해야 합니다.");
				input_ID.focus();
				return;
			};
		};
		// 중복확인
		let data = {id : input_ID.val().trim()};
		$.ajax({
			url : "<%=request.getContextPath()%>/member/idCheck.do",
			data : data,
			type : 'post',
			success : function(result){
				if(result){	// 빈 스트링은 false 처리 됨
					checkedID = result;
					$('input[name=id]').val(checkedID);
					$("#result_checkId").html("사용가능한 아이디 입니다.").css("color", "green");
				}else{
					$("#result_checkId").html("중복된 아이디 입니다.").css("color", "red");
					input_ID.focus();
				};
			},
			error : function(err){
				alert(err.status);
			}
		});
	};
	
	function submit_go(){
		
		if(input_ID.val() == ""){
			alert('아이디를 입력해주세요.')
			input_ID.focus();
			return;
		};
		if(checkedID != input_ID.val()){
			alert('아이디 중복확인을 해주세요.');
			return;
		};
		if(!pwdCheck){
			alert('비밀번호를 양식에 맞게 입력해주세요.');
			input_pwd.focus();
			return;
		};
		if(!pwdReCheck){
			alert('비밀번호 확인의 비밀번호가 다릅니다!');
			input_pwdRe.focus();
			return;
		};
		if(!emailCheck){
			alert('이메일을 양식에 맞게 입력해주세요.')
			input_email.focus();
			return;
		};
		
		$('#personInfoUtilAgreeAt').modal('show');
	}
	
</script>