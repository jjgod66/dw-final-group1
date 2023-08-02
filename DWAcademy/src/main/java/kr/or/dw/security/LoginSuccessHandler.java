package kr.or.dw.security;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.or.dw.dao.MemberDAO;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		// 위의 authentication 은 AuthenticationProvider 에서 넘어온 Token
		
		User user = (User) authentication.getDetails();
		
		Map<String, Object> member = user.getMemberVO();
		String id = (String) member.get("ID");
		System.out.println(member);
		try {
			memberDAO.updateLastLoginDt(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", member);

		System.out.println("CD : " + member.get("CD"));
		System.out.println("ID : " + member.get("ID"));
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	
	
}
