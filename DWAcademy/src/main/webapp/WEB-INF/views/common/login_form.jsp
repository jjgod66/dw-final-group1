<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="org.json.simple.JSONObject" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // JSON íì¼ìì íì ì ë³´ ì½ê¸°
    String membersJson = new String(Files.readAllBytes(Paths.get("json/members.json")));
    JSONObject members = new JSONObject(membersJson);

    // íì ì ë³´ ê²ì¦
    if (members.has(username)) {
        JSONObject member = members.getJSONObject(username);
        String storedPassword = member.getString("password");
        if (password.equals(storedPassword)) {
            // ë¡ê·¸ì¸ ì±ê³µ
            session.setAttribute("username", username);
            response.sendRedirect("welcome.jsp");
            return;
        }
    }

    // ë¡ê·¸ì¸ ì¤í¨
    response.sendRedirect("login.jsp?error=true");
%>