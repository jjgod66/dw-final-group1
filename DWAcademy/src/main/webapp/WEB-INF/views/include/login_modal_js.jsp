<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						if(res == ""){
							$('#authentication-modal').modal('show');
						}else{
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

 function displayToken() {
   var token = getCookie('authorize-access-token');

   if(token) {
     Kakao.Auth.setAccessToken(token);
     Kakao.Auth.getStatusInfo()
       .then(function(res) {
         if (res.status === 'connected') {
             alert('login success, token: ' + Kakao.Auth.getAccessToken())
         }
       })
       .catch(function(err) {
         Kakao.Auth.setAccessToken(null);
       });
   }
 }

 function getCookie(name) {
   var parts = document.cookie.split(name + '=');
   if (parts.length === 2) { return parts[1].split(';')[0]; }
 }
</script>