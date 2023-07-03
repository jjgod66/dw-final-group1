<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/member_header.jsp" %>
    <div class="login-container">
        <div class="login">
            <div class="login__header">회원 로그인</div>
            <a href="/index" class="login__close">X</a>
            <form id="signInForm" name="signIn">
    
                <div class="login__field">
                    <input type="text" name="username" class="login__input login__input-id" placeholder=" " value="">
                    <input type="hidden" name="userid" id="userid" value="">
                    <label class="login__label">아이디 또는 이메일</label>
                    <div id="usernameCheck" class="login__checked login__checked--false"></div>
                </div>
    
                <div class="login__field">
                    <input type="password" name="password" class="login__input login__input--pw" placeholder=" ">
                    <label class="login__label">비밀번호</label>
                    <div id="passwordCheck" class="login__checked login__checked--false"></div>
                </div>
    
                            <div class="login__invalid-msg">아이디와 비밀번호를 입력해주세요.</div>
                            <div class="login__field login__field--remember-id">
                    <input type="checkbox" name="chkSaveID" id="chkSaveID" class="login__remember-id">
                    <label for="chkSaveID" class="login__remember-id-label">아이디 기억하기</label>
                </div>
                <a href="#" id="loginCheck" class="login__button" onclick="signInSubmit();return false;">로그인</a>
            </form>
            <!-- 로그인 버튼 활성화
            a href="#" class="login__button login__button--active">로그인</a>
            -->
            <div class="login__account">
                <div class="login__id-pw">
                    <a href="" class="login__find-id">아이디</a>
                    또는
                    <a href="" class="login__find-pw">비밀번호</a>를 잊으셨나요?
                </div>
                <a href="" class="login__sign-up">회원가입</a>
            </div>
    
            <div class="login__divider">
                <span class="login__or">또는</span>
            </div>
    
            <div class="login__auth-by">
                <a href="" class="login__auth"><i class="login__icon-naver"></i>Naver 계정으로 로그인</a>
                <a href="" class="login__auth"><i class="login__icon-facebook"></i>Facebook 계정으로 로그인</a>
                <a href="" class="login__auth"><i class="login__icon-google"></i>Google 계정으로 로그인</a>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        window.history.forward();
    
        $(document).ready( function(){ usridFocus(); } );
    
        function usridFocus()
        {
            var login_id = "";
            if ( $("input[name=username]") )
            {
                try {
                    if ( "" == $("input[name=username]").val() )
                        $("input[name=username]").focus();
                    else if ( "" != $("input[name=username]").val() && "" == $("input[name=password]").val() )
                        $("input[name=password]").focus ();
                }
                catch(e) {}
            }
            return true;
        }
    
        $(function() {
            $("input[name=chkSaveID]").keyup(function (event) {
                if (event.keyCode === 13) {
                    signInSubmit();
                }
            });
    
            $("input[name=username], input[name=password]").keyup(function (event) {
                if (event.keyCode === 13) {
                    signInSubmit();
                } else if (8 === event.keyCode || 46 === event.keyCode) {
                    if ("" != $("input[name=username]").val() && null != $("input[name=username]").val() && "" != $("input[name=password]").val() && null != $("input[name=password]").val())
                        $("#loginCheck").attr("class", "login__button login__button--active");
                    else
                        $("#loginCheck").attr("class", "login__button");
                } else {
                    if ("" != $("input[name=username]").val() && "" != $("input[name=password]").val())
                        $("#loginCheck").attr("class", "login__button login__button--active");
                    else
                        $("#loginCheck").attr("class", "login__button");
                }
            });
    
            $("input[name=username]").keyup(function (event) {
                if ("" != $("input[name=username]").val() && null != $("input[name=username]").val())
                    $("#usernameCheck").attr("class", "login__checked login__checked--true");
                else
                    $("#usernameCheck").attr("class", "login__checked login__checked--false");
    
            });
    
            $("input[name=password]").keyup(function (event) {
                if ("" != $("input[name=password]").val() && null != $("input[name=password]").val()) {
                    $("#passwordCheck").attr("class", "login__checked login__checked--true");
                } else {
                    $("#passwordCheck").attr("class", "login__checked login__checked--false");
                }
            });
        });
    
        $.fn.serializeObject = function () {
            var o = {};
            var a = this.serializeArray();
    
            $.each(a, function () {
    
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
    
            return o;
        };
    
        function signInSubmit() {
            if ("" == $("input[name=username]").val() || null == $("input[name=username]").val() || "" == $("input[name=password]").val() || null == $("input[name=password]").val()) {
                return;
            }
    
            if (6 > $("input[name=password]").val().length) {
                $('.login__invalid-msg').text("비밀번호를 6자리 이상 입력해주세요.");
                return;
            }
    
            var formData = $("#signInForm").serializeObject();
    
            var strAction = "/";
    
            $.support.cors = true;
            $.ajax({
                url: strAction,
                data: formData,
                dataType: "json",
                type: "POST",
                crossDomain: true,
                xhrFields : {
                     withCredentials : true
                },
                headers : { 'X-Requested-With' : "XMLHttpRequest" }
            }).done(function (retVal) {
                if ("alert" == retVal.type) {
                    alert(retVal.message);
                } else if ("redirect" == retVal.type) {
                    if (null != retVal.message) {
                        location.href = toTag(retVal.message);
                    }
                    else {
                        alert(retVal.data);
                        location.href = "/";
                    }
                } else {
                    location.reload();
                }
            });
        }
    </script>
<%@include file="../include/member_footer.jsp" %>