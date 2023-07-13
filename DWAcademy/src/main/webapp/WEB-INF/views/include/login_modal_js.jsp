<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$('#kakaoLogin').on('click', function(){
	$.ajax({
		method : "get",
		url : "https://kauth.kakao.com/oauth/authorize?client_id=bf62309a02d7160678300f689ce8d447&redirect_uri=http://localhost/kakao/callback&response_type=code",
		success : function(res){
			console.log(res);
			console.log(res.member);
			console.log(res.email);
			console.log(res.access_token);
		},
		statusCode: {
			200: function(args){
				alert("test")
			}
		},
		error : function(err){
			alert(err.status);
		}
	})
})

</script>