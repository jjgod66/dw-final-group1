<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
let checkNum = "";
let SMSChecked = false;
$('#sendSMS').on('click', function(){
	if($('input[name=mem_name]') == ""){
		alert('이름을 입력해주세요.');
		$('input[name=mem_name]').focus();
		return;
	}
	if($('input[name=mem_bir]') == ""){
		alert('생년월일을 입력해주세요.');
		$('input[name=mem_bir]').focus();
		return;
	}
	let phone = $('#phone').val();
	$.ajax({
		url : '<%=request.getContextPath()%>/SMS/send.do',
		method : 'post',
		data : {"phone" : phone},
		success : function(res){
			console.log(res);
			checkNum = res;
		},
		error : function(err){
			alert(err.status);
		}
	})
})
$('#SMSCheck').on('click', function(){
	let SMSCheckInput = $('#SMSCheckInput').val();
	let target = document.getElementById('joinFormGo');
	
	if(checkNum == SMSCheckInput){
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