<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
 <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
 
 <style>
body{font-family: 'IBM Plex Sans KR', sans-serif; background:#f8f9fa;} #wrapper { margin-left:auto; margin-right:auto; width: 40%;}
 

        .btn {
            background-color: #ced4da;
            color: #636363;
            padding: 10px 15px;
            border: none;
            border-radius: 99px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
        input{
        background:#f8f9fa;
	  border:0px;
	  border-bottom:1px solid lightgray;
	  margin-bottom:15px;
	  padding: 8px 5px;
	  width:60%;
}

.pp{
	font-size: 11px;
	margin-left: 10px;
	margin-bottom: 20px;
}
 </style>
 
 
<div class="sub_visual">
    <h3>비회원 문의내역  </h3>
    <h6>NonMember inquiry</h6>
</div>
<%@ include file="sideMenu.jsp" %>



<div id="wrapper"> 
	<div class="container mt-5">
		<form id="nonMemQLoginForm" action="<%=request.getContextPath()%>/support/inquiry_nonMember_list.do" method="post">
	        <div class="mb-3">
	            <input type="text" class="" id="name" name="writer_name" placeholder="*이름을 입력하세요" required>
	        </div>
	
	        <div class="mb-3">
	            <input type="email" class="" id="email" name="writer_email" placeholder="*이메일을 입력하세요" required>
	        </div>
	
	        <div class="mb-3">
	            <input type="password" class="" id="pwd" name="writer_pwd" placeholder="*작성시 입력한 비밀번호를 입력하세요" required>
	        </div>
	        <p class="pp">* 비회원 정보 오 입력 시 문의내역 확인이 어려울 수 있으니 다시 한번 확인해 주시기 바랍니다.</p>
	<!--         s나중에 타입을 서브밋으로 바꾸어주세 -->
	        <button type="button" class="btn btn-secondary" id="nonMemQBtn">비회원 문의내역 확인</button>
	        <br><br><br>
		</form>
    </div>
</div>

<script>
	$(function(){
		$('#nonMemQBtn').on('click', function(){
			let formValues = $("#nonMemQLoginForm").serialize();
			
			$.ajax({
				url : '<%=request.getContextPath()%>/support/nonMemInqChk.do',
				method : 'post',
				data : formValues,
				success : function(res){
					console.log(res);
					if(res == 'Y'){
						$('#nonMemQLoginForm').submit();
					}else{
						alert('입력한 정보로 조회되는 문의가 없습니다.');
						return;
					}
				},
				error : function(err){
					alert(err.status);
				}
			})
		})
	})

</script>









<%@ include file="../include/footer.jsp" %>