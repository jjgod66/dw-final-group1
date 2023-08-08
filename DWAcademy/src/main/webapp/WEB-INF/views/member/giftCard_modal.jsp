<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

#giftCard-modal .modal-content{
    border-radius: 0.7rem;
}
#giftCard-modal .modal-header img{
    width: 100px;
}
#giftCard-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#giftCard-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#giftCard-modal .modal-footer{
    border-top: none;
}
#giftCard-modal button:active{
    outline: none;
}
#giftCard-modal button:focus{
   outline: none;
}
#giftCard-modal .modal-body{
    text-align: center;
}
#giftCard-modal form{
    padding: 3vh;
}
#giftCard-modal input {
    outline: none;
    margin: 0;
    border: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    width: 100%;
    font-size: 14px;
    font-family: inherit;
}
#giftCard-modal .input-group {
    margin-bottom: 1rem;
}
#giftCard-modal .input--style-3 {
    padding: 0.75rem !important;
    outline: none;
    width: 100% !important;
    min-width: unset;
    border: none;
    border-radius: 0;
    box-shadow: none !important;
    background: #f9f9f9;
    border: 1px solid #eee;
}
#giftCard-modal .btn {
    display: inline-block;
    line-height: 42px;
    padding: 0 33px;
    font-family: Poppins;
    cursor: pointer;
    color: #fff;
    -webkit-transition: all 0.4s ease;
    -o-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    transition: all 0.4s ease;
    font-size: 18px;
    width: 100%
}

#giftCard-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#giftCard-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border: solid 1px #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
    margin-top: 10px;
}
#giftCard-modal .btn-cancel:hover {
    background: #4aa8d8;
    color: #fff;
}
#giftCard-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#giftCard-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#giftCard-modal .col{
      padding: 2vh 10px 4vh;
}
#giftCard-modal .new{
      padding-bottom: 0;
}
#giftCard-modal .btn-primary{
      width:40%;
      margin:30%
}
#giftCard-modal .btn:focus{
    box-shadow: none;
    outline: none;
}

table {
  border-collapse: collapse;
  border: 0;
}
th, td {
  border: 1px solid #aaa;
}
tbody tr:last-child th,
tbody tr:last-child td {
/*   border-bottom: 0; */
}
tbody tr td:last-child {
   border-right: 0; 
}
tbody tr td:first-child {
   border-left: 0; 
}
thead tr th:last-child {
   border-right: 0; 
}
thead tr th:first-child {
   border-left: 0; 
}

 th, td { 
   padding-top: 0.6rem; 
   padding-bottom: 0.6rem; 
/*    min-width: 6rem;  */
 } 


thead th,
tbody th {
  background-color: #f8f8f8;
}

.layer-con {
    overflow-y: auto;
    background-color: #fff;
    padding: 20px 20px 0 20px;
}

.pop-gray {
    position: relative;
    padding: 20px;
    background-color: #f2f4f5;
    text-align: center;
}
.input-text+.button {
    height: 32px;
    line-height: 29px;
}
.button.gray {
    color: #fff;
    line-height: 36px;
    border: 0;
    background: #666;
}
.ml05 {
    margin-left: 5px!important;
}

.box-border.v1 {
    padding: 15px;
    border-color: #ebebeb;
}
.mt20 {
    margin-top: 20px!important;
}
.box-border {
    padding: 20px;
    border: 1px solid #d8d9db;
    background-color: #fff;
    border-radius: 5px;
}
.mr20 {
    margin-right: 20px!important;
}
label {
    display: inline-block;
    vertical-align: middle;
    cursor: pointer;
}
* {
    box-sizing: border-box;
}
.w250px {
    width: 250px!important;
}
.input-text {
    display: inline-block;
    width: 100%;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}

.box-border .tit, .box-border .tit-box {
    margin: 0;
    padding: 0 0 5px 0;
    font-weight: 400;
    color: #222;
    font-size: 1.0667em;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
}
.dash-list>li {
    position: relative;
    padding: 0 0 0 11px;
    font-size: .9333em;
}
</style>
<div class="modal fade" id="giftCard-modal">
    <div class="modal-dialog modal-dialog-centered" style="--bs-modal-width:700px;">
        <div class="modal-content" style="height: 500px;">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5>기프트카드 등록</h5>
                <div class="layer-con">
                        <p class="reset mb10">보유하신 기프트카드 상품코드를 입력해 주세요.</p>

                        <div class="pop-gray">
                            <label for="couponnum01" class="mr20">기프트카드 코드</label>
                            <input type="text" id="inputGiftCardCode" class="input-text w250px" placeholder="문자포함 17자리를 입력해주세요." title="기프트카드 코드 입력" maxlength="17">
                            <button class="button gray ml05" id="gifyCardRegBtn">등록</button>
                        </div>

                        <div class="box-border v1 mt20">
                            <p class="tit-box">이용안내</p>

                            <ul class="dash-list">
                                <li>코드는 구매내역 > 구매정보 > 상품코드에서 확인 가능합니다.</li><br>
                                <li>등록된 기프트 카드는 삭제가 불가능합니다.</li><br>
                    			<li>등록 시 바로 사용 가능한 포인트로 적립됩니다.</li>
                    			<li>적립된 포인트는 마이페이지 &gt; 포인트 이용내역에서 확인 가능합니다.</li>
                            </ul>
                        </div>
                    </div>
                <div class="p-t-10" style="display: flex;">
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" id="giftCardCancelBtn">닫기</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
	$('#giftCardCancelBtn').on('click', function(){
		$('#giftCard-modal').modal('hide');
	})
	$('#giftCard-modal').on('hidden.bs.modal', function (e) {
		$('#inputGiftCardCode').val('');
		location.reload();
	})
	
	$('#gifyCardRegBtn').on('click', function(){
		let mem_product_cd = $('#inputGiftCardCode').val();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/member/giftCardReg.do',
			method : 'post',
			data : {'mem_product_cd' : mem_product_cd},
			success : function(res){
				console.log(res);
				if(res == 'S'){
					alert("등록되었습니다.");
					$('#inputGiftCardCode').val('');
				}else if(res == 'Y'){
					alert('이미 사용된 코드입니다.');
				}else{
					alert("존재하지 않는 코드입니다.");
				}
				
			},
			error : function(err){
				alert(err.status);
			}
		})
	})
	
})

</script>