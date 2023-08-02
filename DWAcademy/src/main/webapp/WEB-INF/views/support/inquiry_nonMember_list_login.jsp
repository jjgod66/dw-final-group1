<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/unicons.css'>
<meta charset="UTF-8">

<style>
@import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
	
*,
*::before,
*::after {
  box-sizing: border-box;
}
/* p{
	font-family: 'Poppins', sans-serif;
	font-weight: 400;
	font-size: 16px;
	line-height: 1.7;
	color: #1f2029;
} */

[type="checkbox"]:checked,
[type="checkbox"]:not(:checked){
  position: absolute;
  left: -9999px;
}
.modal-btn:checked + label,
.modal-btn:not(:checked) + label{
  cursor: pointer;
}
.modal-btn:not(:checked) + label:hover{
  background-color: #ffeba7;
  color: #102770;
}
.modal-btn:checked + label .uil,
.modal-btn:not(:checked) + label .uil{
	margin-left: 10px;
	font-size: 18px;
}

/* 엑스표 */
.modal-btn:checked + label:after,
.modal-btn:not(:checked) + label:after{
  position: fixed;
  top: 240px;
  right: 206px;
  z-index: 110;
  width: 40px;
  border-radius: 3px;
  height: 30px;
  text-align: center;
  line-height: 30px;
  font-size: 18px;
  background-color: #ffeba7;
  color: #102770;
  font-family: 'unicons';
  content: '\eac6'; 
  box-shadow: 0 12px 25px 0 rgba(16,39,112,.25);
  transition: all 200ms linear;
  opacity: 0;
  pointer-events: none;
  transform: translateY(20px);
}
.modal-btn:checked + label:hover:after,
.modal-btn:not(:checked) + label:hover:after{
  background-color: #102770;
  color: #ffeba7;
}
.modal-btn:checked + label:after{
  transition: opacity 300ms 300ms ease, transform 300ms 300ms ease, background-color 250ms linear, color 250ms linear;
  opacity: 1;
  pointer-events: auto;
  transform: translateY(0);
}
.modal1{
  position: fixed;
  display: block;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  -ms-flex-pack: center;
  justify-content: center;
  margin: 0 auto;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
  overflow-x: hidden;
  background-color: rgba(31,32,41,.75);
  pointer-events: none;
  opacity: 0;
  transition: opacity 250ms 700ms ease;
}
.modal-btn:checked ~ .modal1{
  pointer-events: auto;
  opacity: 1;
  transition: all 300ms ease-in-out;
}
.modal-wrap {
  position: relative;
  display: block;
  width: 30%;
  margin: 0 auto;
  margin-top: 20px;
  margin-bottom: 20px;
  border-radius: 4px;
  overflow: hidden;
  padding-bottom: 20px;
  background-color: #e5e9f0;
    -ms-flex-item-align: center;
    align-self: center;
    box-shadow: 0 12px 25px 0 rgba(199,175,189,.25);
  opacity: 0;
  transform: scale(0.6);
  transition: opacity 250ms 250ms ease, transform 300ms 250ms ease;
}
.modal-wrap img {
  display: block;
  width: 100%;
  height: auto;
}
.modal-wrap p {
  padding: 30px 21px 20px;
}
.modal-btn:checked ~ .modal1 .modal-wrap{
  opacity: 1;
  transform: scale(1);
  transition: opacity 250ms 500ms ease, transform 350ms 500ms ease;
}

.modal-btn:checked ~ .logo img {
  	filter: brightness(100%);
	transition: all 250ms linear;
}


@media screen and (max-width: 500px) {
	.modal-wrap {
		width: calc(100% - 40px);
		padding-bottom: 15px;
	}
	.modal-wrap p {
	  padding: 15px 20px 0 20px;
	}
}



.post-detail {
			width:80%;
            margin: 46px auto 0px;
    }

    .post-info {
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }

    .post-title {
        font-size: 20px;
    }

    .post-content p {
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 20px;
    }

    .post-buttons {
        display: flex;
        justify-content: space-between;
    }

     .next-button {
    	background-color: #ced4da;
            color: #636363;
        padding: 10px 10px;
        font-size: 14px;
        border: none;
        border-radius: 99px;
        cursor: pointer;
    }
    
        .previous-button{
    	background-color: #4ba8d8;
            color: #2e3440;
        padding: 10px 10px;
        font-size: 14px;
        border: none;
        border-radius: 99px;
        cursor: pointer;
    }

     .next-button:hover {
        background-color: #868e96;
        color: #eceff4;
    }
    .previous-button:hover{
        background-color: #0c8599;
        color: #ced4da;
    }
    #b{border-right: 1px solid #ddd; padding: 5px;}
    #password{background:#e5e9f0;border:0px;border-bottom:1px solid #8A8A8A;}
	#textAlign{text-align: center;}
</style>

</head>
<body>
<!--       	a모달창시작-->
      	<div class="modal1">		
	      	<div class="modal-wrap">
			     <div class="post-detail">
				    <div class="post-info">
				        <h2 class="post-title">비밀번호 입력 </h2>
				    </div>
				        <span id="">글 작성시 입력한 비밀번호를 입력해주세요. </span>
					<div class="mb-3 mt-3" id="textAlign">
			            <input type="password" class="" id="password" placeholder="*비밀번호를 입력하세요" id="mm">
			        </div>
				    <div class="post-buttons">
				        <button class="previous-button btn-secondary"  onclick="location.href='<%=request.getContextPath()%>/support/inquiry_nonMember_list_login_result.do'">확인</button>
				        <button class="next-button btn-secondary"  onclick="goBack();" >취소</button>
				    </div>
				</div>
					      		
	      	</div>			          		
      	</div>	
</body>
<script>
	function goBack() {
		window.history.back();
	}
	
	modal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal1")) {
	        modal.style.display = "none"
	    }
	});
</script>
</html>