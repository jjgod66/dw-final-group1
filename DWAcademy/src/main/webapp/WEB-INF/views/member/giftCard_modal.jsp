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
#giftCard-modal .btn--naver {
    background-color: #27d34a !important;
    background-image: url(https://vendor-cdn.imweb.me/images/naver_login2x.png);
    background-size: 16px;
    background-position: 15px 50%;
    background-repeat: no-repeat;
    border-color: #27d34a !important;
    color: #fff !important;
    font-size: 12px;
    padding: 0;
}
#giftCard-modal .btn--kakao {
    background-color: #ffeb00 !important;
    background-image: url(https://vendor-cdn.imweb.me/images/kakao_icon.png);
    background-size: 20px;
    background-position: 12px 49%;
    background-repeat: no-repeat;
    border-color: #ffeb00 !important ;
    color: #333 !important;
    font-size: 12px;
    padding: 0;
}
#giftCard-modal .btn--login {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
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
    border-color: #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
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
</style>
<div class="modal fade" id="giftCard-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5>쿠폰 목록</h5>
                <div class="layer-con" style="height: 388px;">
                        <p class="reset mb10">보유하신 쿠폰번호를 입력해 주세요.</p>

                        <div class="pop-gray">
                            <label for="couponnum01" class="mr20">할인쿠폰 번호</label>
                            <input type="text" id="couponnum01" class="input-text w250px" placeholder="숫자만 입력해 주세요" title="할인쿠폰번호 입력" maxlength="16">
                            <button class="button gray ml05">등록</button>
                        </div>

                        <div class="box-border v1 mt20">
                            <p class="tit-box">이용안내</p>

                            <ul class="dash-list">
                                <li>메가박스에서 발행된 매표, 매점, 포인트 쿠폰을 등록 하실 수 있습니다.</li>
                                <li>등록된 쿠폰은 삭제가 불가능합니다.</li><br>
                                <li class="noline" style="padding-left: 0px;">[포인트 적립 쿠폰]</li>
                    			<li>쿠폰 등록 시 바로 사용 가능한 포인트로 적립됩니다.</li>
                    			<li>적립된 포인트는 MY &gt; 포인트 내역에서 확인 가능합니다.</li>
                            </ul>
                        </div>
                    </div>
                <div class="p-t-10" style="display: flex;">
<!-- 	                <div style="width: 50%; margin: 0 auto;" id="regDiv"> -->
<!-- 	                    <button class="btn btn-regist" type="button" data-target="#" style="float: right;" id="couRegistBtn">적용</button> -->
<!-- 	                </div> -->
	               
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" data-target="#" style="float: left;" id="giftCardCancelBtn">닫기</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
	
	
})

</script>