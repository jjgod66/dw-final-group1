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
</style>
 
 <div class="sub_visual">
    <h3>1:1 문의 </h3>
    <h6>support inquiry</h6>
</div>
<%@ include file="sideMenu.jsp" %>

<div id="wrapper"> 
	<div class="container mt-5">
        <div class="mb-3">
            <label for="inquiryType" class="form-label">문의 선택 항목</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inquiryType" id="customerInquiry" value="customer">
                <label class="form-check-label" for="customerInquiry">고객센터 문의</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inquiryType" id="theaterInquiry" value="theater">
                <label class="form-check-label" for="theaterInquiry">극장 문의</label>
            </div>
        </div>

        <div class="mb-3">
            <label for="inquiryCategory" class="form-label">극장 문의 선택</label>
            <select class="custom-select" id="inquiryCategory" disabled>
                <option selected disabled>선택하세요</option>
                <option value="category1">카테고리1</option>
                <option value="category2">카테고리2</option>
            </select>
            <select class="custom-select" id="theaterSelect" disabled>
                <option selected disabled>극장 선택</option>
                <option value="theater1">극장1</option>
                <option value="theater2">극장2</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="inquiryTypeSelect" class="form-label">문의 유형</label>
            <select class="custom-select" id="inquiryTypeSelect">
                <option selected disabled>선택하세요</option>
                <option value="type1">유형1</option>
                <option value="type2">유형2</option>
            </select>
        </div>

        <div class="mb-3">
            <input type="text" class="" id="name" placeholder="이름을 입력하세요">
        </div>

        <div class="mb-3">
            <input type="email" class="" id="email" placeholder="이메일을 입력하세요">
        </div>

        <div class="mb-3">
            <input type="tel" class="" id="phone" placeholder="휴대전화번호를 입력하세요">
            <button class="btn btn-secondary">인증</button>
        </div>

        <div class="mb-3">
            <input type="text" class="" id="subject" placeholder="제목을 입력하세요">
        </div>

        <div class="mb-3">
            <textarea class="" id="content" rows="6" placeholder="내용을 입력하세요" style="width: 100%"></textarea>
        </div>

        <div class="mb-3">
            <div class="custom-file">
                <input type="file" class="" id="attachment" style="border: none;">
            </div>
        </div>

        <div class="mb-3">
            <input type="password" class="" id="password" placeholder="비밀번호를 입력하세요">
        </div>

        <button type="submit" class="btn ">등록</button>
        <br><br><br>
    </div>
</div>








<%@ include file="../include/footer.jsp" %>