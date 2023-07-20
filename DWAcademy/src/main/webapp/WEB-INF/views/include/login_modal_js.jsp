<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script>
const URLSearch = new URLSearchParams(location.search);
	let email = "";
 $.ajax({
        method: "POST",
        url: 'https://kauth.kakao.com/oauth/token',
        data: {
            grant_type: 'authorization_code',
            client_id: '4d3eb758ca79e46a21afa1951cdbec30',
            redirect_uri: 'http://localhost/main',
            code : URLSearch.get('code')
        }
        , contentType:'application/x-www-form-urlencoded;charset=utf-8'
        , success : function(response) {
        	console.log(response)
            Kakao.Auth.setAccessToken(response.access_token);
			Kakao.API.request({
		   		url: '/v2/user/me'
			})
		   	.then(function(res) {
		   		console.log(res);
				email = JSON.stringify(res);
				$.ajax({
					method : "post",
					url : "<%=request.getContextPath()%>/common/kakaoLogin.do",
					data : {email : res.kakao_account.email},
					success : function(res){
						console.log(res);
						if(res.gb == "non_member"){
							$('#authentication-modal').modal('show');
							$('input[name="mem_email"]').val(res.mem_email);
						}else if(res.gb == "noConnect"){
							alert('연동된 계정이 없습니다! 소셜로그인은 [마이페이지 > 개인정보수정] 에서 연동 후 사용해주세요.');
						}else {
							location.reload();
						}
					},
					error : function(err){
						alert(err.status);
					}
				})
		   	})
		   	.catch(function(err) {
		   		alert('err');
		   	});
        }
        ,error : function(jqXHR, error) {
        	console.log(error.status);
        }
    });
$('#kakaoLogin').on('click', function(){
	Kakao.Auth.authorize({
		  redirectUri: 'http://localhost/main',
		});
	
})
$('#kakapLogout').on('click', function(){
	Kakao.Auth.logout()
	  .then(function(response) {
	    console.log(Kakao.Auth.getAccessToken()); // null
	  })
	  .catch(function(error) {
	    console.log('Not logged in.');
	  });
})
</script>