<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$('#phone').on('click', function(){
	$(this).value = $(this).value.replace(/[^0-9]/gi, "");
})
let checkNum = "";
let SMSChecked = false;
$('#sendSMS').on('click', function(){
	if($('input[name="name"]') == ""){
		alert('이름을 입력해주세요.');
		$('input[name=name]').focus();
		return;
	}
	if($('input[name="mem_bir"]') == ""){
		alert('생년월일을 입력해주세요.');
		$('input[name=mem_bir]').focus();
		return;
	}
	let phone = $('#phone').val();
	if(phone != ""){
		$.ajax({
			url : '<%=request.getContextPath()%>/SMS/send.do',
			method : 'post',
			data : {"phone" : phone},
			success : function(res){
				alert('메세지를 성공적으로 보냈습니다!')
				console.log(res);
				checkNum = res;
			},
			error : function(err){
				alert(err.status);
			}
		})
	}else{
		alert('번호를 입력해주세요.');
	}
})
$('#SMSCheck').on('click', function(){
	let SMSCheckInput = $('#SMSCheckInput').val();
	let mem_phone = $('#phone').val();
	let target = document.getElementById('joinFormGo');
	$.ajax({
		method : "post",
		url : "<%=request.getContextPath()%>/member/CheckMember.do",
		data : {mem_phone : mem_phone},
		success : function(res){
			$('input[name="mem_phone"]').val(mem_phone);
			$('input[name="mem_name"]').val($('input[name="name"]').val());
			$('input[name="mem_bir"]').val($('input[name="bir"]').val());
			if(res != ""){
				alert('이미 가입된 회원입니다! 소셜로그인은 [마이페이지 > 개인정보수정] 에서 연동 후 사용해주세요.');
				$('#authentication-modal').modal('hide');
				location.reload();
			}
		},
		error : function(err){
			alert(err.status);
		}
	})
	
	if(checkNum == SMSCheckInput && checkNum != "" && SMSCheckInput != ""){
		$('#result_checkCode').html("<i class='bi bi-check-lg'></i>").css("color", "green");
		SMSChecked = true;
	}else{
		alert('인증번호가 일치하지 않습니다! \n 인증번호를 다시 요청해주세요.');
		$('#result_checkCode').html("");
		checkNum = "";
		SMSChecked = false;
	}
	if(SMSChecked){
		target.disabled = false;
	}else{
		target.disabled = true;
	}
})




</script>