<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#login-modal .modal-content{
    border-radius: 0.7rem;
}
#login-modal .modal-header img{
    width: 100px;
}
#login-modal .modal-title{
    margin-left:auto;
    margin-right: auto;
}
#login-modal .modal-header{
    border-bottom: none;
    padding-bottom: 0;
    padding-top: 4vh;
}
#login-modal .modal-footer{
    border-top: none;
}
#login-modal button:active{
    outline: none;
}
#login-modal button:focus{
   outline: none;
}
#login-modal .modal-body{
    text-align: center;
}
#login-modal form{
    padding: 3vh;
}
#login-modal input {
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
#login-modal .input-group {
    margin-bottom: 1rem;
}
#login-modal .input--style-3 {
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
#login-modal .btn {
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
#login-modal .btn--naver {
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
#login-modal .btn--kakao {
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
#login-modal .btn--login {
    background: #4aa8d8;
    color: #fff;
    font-size: 13px;
    border-color: #4aa8d8;
    margin-bottom: 3vh;
}
#login-modal .extra{
      padding-bottom: 4vh;
      color: rgb(143, 141, 141);
     font-size:13px;
}
#login-modal .extra a{
    color: rgb(143, 141, 141);
    font-size:13px;
}
#login-modal .col{
      padding: 2vh 10px 4vh;
}
#login-modal .new{
      padding-bottom: 0;
}
#login-modal .btn-primary{
      width:40%;
      margin:30%
}
#login-modal .btn:focus{
    box-shadow: none;
    outline: none;
}
</style>
<div class="modal fade" id="login-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
            	<h3 class="fs-3 text-center my-2">회원 로그인</h3>
                <form action="<%=request.getContextPath()%>/common/login.do" method="POST">
                <div class="input-group">
                    <input class="input--style-3" type="text" placeholder="회원 아이디" name="text">
                </div>
                <div class="input-group">
                    <input class="input--style-3" type="password" placeholder="비밀번호" name="password">
                </div>
                <div class="p-t-10">
                    <button class="btn btn--login" type="submit" data-target="#">로그인</button>
                </div>
                <p class="title">간편로그인</p>
                <div class="row">
                    <div class="col">
                        <div class="p-t-10"><button class="btn btn--naver" type="submit">네이버로 시작하기</button></div> 
                    </div>
                    <div class="col">
                        <div class="p-t-10"><button class="btn btn--kakao" type="submit">카카오로 시작하기</button></div> 
                    </div>
                </div>
                <p class="extra new">회원이 아니신가요 ? <a href="#" data-bs-toggle="modal" data-bs-target="#join-modal"><u>회원가입</u></a></p>
                <p class="extra">로그인 정보가 기억나지 않나요 ? <a href="#"><u>회원정보 찾기</u></a></p>
                </form>
            </div>
        </div>
    </div>
</div>