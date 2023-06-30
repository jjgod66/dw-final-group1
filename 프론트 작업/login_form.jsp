<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // JSON 파일에서 회원 정보 읽기
    String membersJson = new String(Files.readAllBytes(Paths.get("json/members.json")));
    JSONObject members = new JSONObject(membersJson);

    // 회원 정보 검증
    if (members.has(username)) {
        JSONObject member = members.getJSONObject(username);
        String storedPassword = member.getString("password");
        if (password.equals(storedPassword)) {
            // 로그인 성공
            session.setAttribute("username", username);
            response.sendRedirect("welcome.jsp");
            return;
        }
    }

    // 로그인 실패
    response.sendRedirect("login.jsp?error=true");
%>