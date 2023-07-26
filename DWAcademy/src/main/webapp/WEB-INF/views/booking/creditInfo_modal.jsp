<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

#creditInfo-modal .modal-content{
    border-radius: 0.7rem;
}
#creditInfo-modal .modal-header img{
    width: 100px;
}
#creditInfo-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#creditInfo-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#creditInfo-modal .modal-footer{
    border-top: none;
}
#creditInfo-modal button:active{
    outline: none;
}
#creditInfo-modal button:focus{
   outline: none;
}
#creditInfo-modal .modal-body{
    text-align: center;
}
#creditInfo-modal form{
    padding: 3vh;
}
#creditInfo-modal input {
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
#creditInfo-modal .input-group {
    margin-bottom: 1rem;
}
#creditInfo-modal .input--style-3 {
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
#creditInfo-modal .btn {
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
#creditInfo-modal .btn--naver {
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
#creditInfo-modal .btn--kakao {
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
#creditInfo-modal .btn--login {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
#creditInfo-modal .btn-regist {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#creditInfo-modal .btn-cancel {
    background: #fff;
    color: #4aa8d8;
    font-size: 13px;
    border-color: #4aa8d8;
    width: 50%;
    margin-bottom: 3vh;
    margin-left: 10px;
    margin-right: 10px;
}
#creditInfo-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#creditInfo-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#creditInfo-modal .col{
      padding: 2vh 10px 4vh;
}
#creditInfo-modal .new{
      padding-bottom: 0;
}
#creditInfo-modal .btn-primary{
      width:40%;
      margin:30%
}
#creditInfo-modal .btn:focus{
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
<div class="modal fade" id="creditInfo-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2"></h3>
            	<h5>결제정보</h5>
<!--                 <div class="input-group"> -->
<!-- 	                <div style="display: flex;"> -->
<!-- 	                    	사용할 쿠폰을 선택해주세요. -->
<!-- 	                </div> -->
<!--                 </div> -->
                <div class="input-group" style="margin-top: 10px; display: ;">
<!--                     		<div> -->
	                    	<table style="width: 100%;">
	                    		<tr style="font-size: 11px;">
	                    			<th style="width: 20%;">상품금액</th>
	                    			<td style="width: 80%;">214455</th>
	                    		</tr>
	                    		<tr style="font-size: 11px;">
	                    			<th style="width: 20%;">할인금액</th>
	                    			<td style="width: 80%;">214455</th>
	                    		</tr>
	                    		<tr style="font-size: 11px;">
	                    			<th style="width: 20%;">최종 결제금액</th>
	                    			<td style="width: 80%;">214455</th>
	                    		</tr>
	                    		<tr style="font-size: 11px;">
	                    			<th style="width: 20%;">결제일시</th>
	                    			<td style="width: 80%;">214455</th>
	                    		</tr>
                    		</table>
<!--                    		</div> -->
                </div>
                
                <div class="p-t-10" style="display: flex;">
<!-- 	                <div style="width: 50%; margin: 0 auto;" id="regDiv"> -->
<!-- 	                    <button class="btn btn-regist" type="button" data-target="#" style="float: right;" id="couRegistBtn">적용</button> -->
<!-- 	                </div> -->
	               
	                <div style="width: 50%; margin: 0 auto;">
	                    <button class="btn btn-cancel" type="button" data-target="#" style="float: left;" id="couCancelBtn">취소</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

</script>