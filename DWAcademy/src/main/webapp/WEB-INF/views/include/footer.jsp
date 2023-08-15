<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<footer id="footer" style="background: #2b343b; color: white;">
<script src="<%=request.getContextPath()%>/resources/js/finder.js"></script>
    <ul class="nav justify-content-center pt-3">
<!--         <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">영화관 소개</a></li> -->
        <li class="nav-item"><a href="<%=request.getContextPath() %>/support/agreeUse.do" class="nav-link px-2 " style="color: white;">이용약관</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath() %>/support/agreePrivacy.do" class="nav-link px-2 " style="color: white;">개인정보처리방침</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath() %>/support/agreeWhere.do" class="nav-link px-2 " style="color: white;">위치기반서비스이용약관</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath() %>/support/agreeScreen.do" class="nav-link px-2 " style="color: white;">스크린배정수에관한기준</a></li>
    </ul>
    <div class="footer-info">
        <div>
            <address>대전광역시 중구 121번길 20, DWcinema(2층)</address>
            <p>ARS 042-257-8349</p>
        </div>
        <p>대표자명 홍길동</p>
        <p>· 개인정보보호책임자 홍길동</p>
        <p>· 사업자등록번호 000-00-00000</p>
        <p>· 통신판매업신고번호 2023-대전선화동-0000</p>
        <p class="copy">COPYRIGHT ⓒ DWCINEMA, Inc. All rights reserved</p>
    </div>
</footer>
</body>
</html>