<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



        .form-label {
            font-weight: bold;
        }


        .custom-select {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
             background:#f8f9fa;
	  border:0px;
	  border-bottom:1px solid lightgray;
            appearance: none;
        }

        .custom-file-label::after {
            content: "첨부파일 선택";
        }

        .custom-file-label.selected::after {
            content: attr(data-content);
        }

        .btn {
            background-color: #ced4da;
            color: #636363;
            padding: 10px 15px;
            border: none;
            border-radius: 99px;
            cursor: pointer;
        }
        .btn1 {
            background-color: #ffc9c9;
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
	textarea {background:#f8f9fa; border-color: lightgray; }
	

    .btn1:hover{
        background-color: #ffa8a8;
        color: #757575;
    }
</style>
 
 <div class="sub_visual">
    <h3>1:1 문의 </h3>
    <h6>support inquiry</h6>
</div>
<%@ include file="sideMenu.jsp" %>
<form id="qnaRegForm" enctype="multipart/form-data" method="post" action="<%=request.getContextPath() %>/support/qnaReg.do">
<div id="wrapper"> 
	<div class="container mt-5">
        <div class="mb-3">
            <label for="que_sel" class="form-label">문의 선택 항목</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="que_sel" id="customerInquiry" value="S" checked>
                <label class="form-check-label" for="customerInquiry">고객센터 문의</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="que_sel" id="theaterInquiry" value="T">
                <label class="form-check-label" for="theaterInquiry">극장 문의</label>
            </div>
        </div>

        <div class="mb-3" style="display: none" id="thrSel">
            <label for="inquiryCategory" class="form-label">극장 문의 선택</label>
            <select class="custom-select" id="inquiryLoc">
                <option selected disabled>지역선택</option>
                <option value="서울">서울</option>
                <option value="강원">강원</option>
                <option value="경기">경기</option>
                <option value="광주/전라">광주/전라</option>
                <option value="대전/충청">대전/충청</option>
                <option value="부산/대구/경상">부산/대구/경상</option>
                <option value="제주">제주</option>
            </select>
            <select class="custom-select" id="theaterSelect" name="thr_name">
                <option selected disabled>극장 선택</option>
                <option value="DW시네마" selected>DW시네마</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="inquiryTypeSelect" class="form-label">문의 유형</label>
            <select class="custom-select" id="inquiryTypeSelect" name="que_type">
                <option selected disabled>선택하세요.</option>
                  <option value="영화정보문의">영화정보문의</option>
                <option value="예매/결제관련문의">예매/결제관련문의</option>
                <option value="이벤트문의">이벤트문의</option>
                <option value="일반문의">일반문의</option>
                <option value="제안/건의">제안/건의</option>
                <option value="회원 및 포인트문의">회원 및 포인트문의</option>
            </select>
        </div>
		<input type="hidden" name="mem_cd" value="${mem_cd }">
        <div class="mb-3">
            <c:if test="${mem_name eq ''}">
            	<input type="text" class="" name="writer_name" placeholder="이름을 입력하세요" required="required">
            </c:if>
            <c:if test="${mem_name ne ''}">
            	<input type="text" class="" name="writer_name" placeholder="이름을 입력하세요" value="${mem_name }" readonly>
            </c:if>
        </div>

        <div class="mb-3">
	        <c:if test="${mem_email eq ''}">
	            <input type="email" class="" name="writer_email" placeholder="이메일을 입력하세요" required="required">
            </c:if>
             <c:if test="${mem_email ne ''}">
            	<input type="email" class="" name="writer_email" placeholder="이메일을 입력하세요" value="${mem_email }" readonly>
            </c:if>
        </div>

<!--         <div class="mb-3"> -->
<%--         	<c:if test="${mem_phone ne ''}"> --%>
<%--             	<input type="tel" class="" name="writer_phone" placeholder="휴대전화번호를 입력하세요(숫자만)" value="${mem_phone }" readonly> --%>
<%--             </c:if> --%>
<%--             <c:if test="${mem_phone eq ''}"> --%>
<!--             	<input type="tel" class="" name="writer_phone" placeholder="휴대전화번호를 입력하세요(숫자만)"> -->
<!-- 	            <button type="button" class="btn btn-secondary" id="phoneSMSBtn">인증</button> -->
<%--             </c:if> --%>
<!--         </div> -->
<!-- 		<div class="mb-3 phoneSMSchkDiv" style="display: none"> -->
<!-- 	        <div> -->
<!-- 	            <input type="text" class="" id="phoneSMSNum" placeholder="인증번호를 입력하세요"> -->
<!-- 	             <button type="button" class="btn btn-secondary" id="phoneSMSNumChkBtn">확인</button> -->
<!-- 	        </div> -->
<!-- 	            <p style="display: none; color: red;" id="noneEq">일치하지 않습니다. 다시 입력해주세요.</p> -->
<!--         </div> -->
        <div class="mb-3">
            <input type="text" class="" name="que_title" placeholder="제목을 입력하세요" required="required">
        </div>

        <div class="mb-3">
            <textarea class="" name="que_content" rows="6" placeholder="내용을 입력하세요" style="width: 100%" required="required"></textarea>
        </div>

        <div class="mb-3">
            <div class="custom-file">
                <input type="file" class="" name="attachment" style="border: none;">
            </div>
        </div>
 		<c:if test="${mem_cd eq ''}">
	      	 <div class="mb-3">
	        	 <input type="password" class="" name="writer_pwd" placeholder="비밀번호를 입력하세요" required="required">
	        </div>
        </c:if>
        <button type="button" class="btn1 btn-secondary" onclick="goBack();">뒤로가기</button>
        <button type="button" class="btn btn-secondary" id="qnaRegist">등록</button>
        <br><br><br>
    </div>
</div>
</form>
<script>
function goBack() {
	window.history.back();
};
mem_cd = $('input[name="mem_cd"]').val();
let smsCheckNum = 0;
let SMSYN = 'N';
$(function(){
	
	
	$('#qnaRegist').on('click', function(){
		let que_sel = $('input[name="que_sel"]:checked').val();
		if(que_sel == 'T'){
			if($('#theaterSelect').val() == '' || $('#theaterSelect').val() == null){
				alert("극장을 선택해주세요.");
				return;
			}
			
		}
		if($('#inquiryTypeSelect').val() == '' || $('#inquiryTypeSelect').val() == null){
			alert("문의 유형을 선택해주세요.");
			return;
		}
		
		if($('input[name="writer_name"]').val() == ''){
			alert("이름을 입력해주세요.");
			$('input[name="writer_name"]').focus();
			return;
		}
		
		if($('input[name="writer_email"]').val() == ''){
			alert("이메일을 입력해주세요.");
			$('input[name="writer_email"]').focus();
			return;
		}
// 		if(SMSYN == 'N'){
// 			alert("휴대폰 인증을 완료해주세요.");
// 			$('input[name="writer_phone"]').focus();
// 			return;
// 		}
		
		if($('input[name="que_title"]').val() == ''){
			alert("제목을 입력해주세요.");
			$('input[name="que_title"]').focus();
			return;
		}
		if($('input[name="que_content"]').val() == ''){
			alert("내용을 입력해주세요.");
			$('input[name="que_content"]').focus();
			return;
		}
		
		if(mem_cd == ''){
			if($('input[name="writer_pwd"]').val() == ''){
				alert("비밀번호를 입력해주세요.");
				$('input[name="writer_pwd"]').focus();
				return;
			}
		}
		$('#qnaRegForm').submit();
	});
	
	$('#inquiryLoc').on('change', function(){
		let thr_loc = $('#inquiryLoc').val();
		$.ajax({
			url : '<%=request.getContextPath()%>/support/locThrList.do',
			method : 'post',
			data : {"thr_loc" : thr_loc},
			success : function(res){
				console.log(res);
				thrNameSuc(res);
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
	$('input[name="que_sel"]').on('change', function(){
		let que_sel = $('input[name="que_sel"]:checked').val();
		$.ajax({
			url : '<%=request.getContextPath()%>/support/queType.do',
			method : 'post',
			data : {'que_sel' : que_sel},
			success : function(res){
				queTypeSuc(res);
				
			},
			error : function(err){
				alert(err.status);
			}
		})
		if(que_sel == 'T'){
			$('#thrSel').css('display', '');
			let target = $('#theaterSelect');
			let show = '<option selected disabled>극장 선택</option>';
			target.html(show);
			$('#theaterSelect').prop('disabled', 'disabled');
		}else{
			$('#thrSel').css('display', 'none');
			let target = $('#theaterSelect');
			let show = '<option selected value="DW시네마">DW시네마</option>';
			target.html(show);
			$('#theaterSelect').val('DW시네마');
			$('#theaterSelect').prop('disabled', '');
		}
	})
	
	$('#phoneSMSBtn').on('click', function(){
		SMSYN = 'N';
		let phone = $('#inqForm input[name="writer_phone"]').val();
		if(phone != ""){
			$.ajax({
				url : '<%=request.getContextPath()%>/SMS/send.do',
				method : 'post',
				data : {"phone" : phone},
				success : function(res){
					alert('메세지를 보냈습니다.')
					$('.phoneSMSchkDiv').css('display', '');
					$('#phoneSMSBtn').text('재전송');
					smsCheckNum = res;
				},
				error : function(err){
					alert(err.status);
				}
			});
		}else{
			alert('번호를 입력해주세요.');
		}
	});
	
	$('#phoneSMSNumChkBtn').on('click', function(){
		let memInputSMSNum = $('#phoneSMSNum').val();
		if(memInputSMSNum == smsCheckNum){
			SMSYN = 'Y';
			alert("인증되었습니다.");
			$('.phoneSMSchkDiv').css('display', 'none');
			$("#noneEq").css('display', 'none');
			$('#inqForm input[name="writer_phone"]').prop('readonly', 'readonly');
			$('#phoneSMSBtn').text('인증완료');
			$('#phoneSMSBtn').prop('disabled', 'disabled');
		}else{
			$("#noneEq").css('display', 'inline');
			SMSYN = 'N';
		}
	});
	
});

function queTypeSuc(res){
	let target = $('#inquiryTypeSelect');
	$('#inquiryTypeSelect').prop('disabled', '');
	let show = '';
	show += '<option selected disabled>선택하세요</option>';
	for(let i = 0; i < res.length; i++){
		show += '<option value="' + res[i] + '">' + res[i] + '</option>';
	}
	target.html(show);
}

function thrNameSuc(res){
	let target = $('#theaterSelect');
	$('#theaterSelect').prop('disabled', '');
	let show = '';
	show += '<option selected disabled>극장 선택</option>';
	for(let i = 0; i < res.length; i++){
		show += '<option value="' + res[i] + '">' + res[i] + '</option>';
	}
	target.html(show);
}
</script>






<%@ include file="../include/footer.jsp" %>