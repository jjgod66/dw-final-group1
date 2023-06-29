<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("아이디 ${member.id} 님을 삭제했습니다.");
	window.opener.location.reload(true);	//true는 서버에서, false(default)는 클라이언트캐시에서
	window.close();
</script>