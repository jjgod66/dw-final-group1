package kr.or.dw.security;


import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.or.dw.dao.MemberDAO;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_id = (String) auth.getPrincipal();	// 로그인 시도한 ID를 가져온다.
		String login_pwd = (String) auth.getCredentials();	// 로그인 시도한 PASSWORD 를 가져온다.
		
		
		Map<String, Object> member = null;
		
		try {
			member = memberDAO.selectMemberById(login_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String mem_pwd = "";
		if(member != null) {
			mem_pwd = (String) member.get("PWD");
		}
		
		if(member != null && login_pwd.equals(mem_pwd)) {	// 로그인 성공
			User authUser = new User(member);

			if(member.get("GB_BAN").equals("Y")) {
				throw new DisabledException("정지된 계정입니다. \\n관리자에게 문의하세요.");
			}
			if(member.get("GB_SLEEP").equals("Y")) {
				throw new DisabledException("휴면 계정입니다. 휴면을 해제 하신 후에 사용하세요");
			}
			
			// 스프링 시큐리티 내부 클래스로 인증 토큰 생성한다.
			UsernamePasswordAuthenticationToken result =
					new UsernamePasswordAuthenticationToken(authUser.getUsername(), authUser.getPassword(), authUser.getAuthorities());
			// 전달할 내용을 설정한 후
			result.setDetails(authUser);
			// 리턴. default-target-url 로 전송된다.
			return result;
		}else {	// 로그인 실패
			throw new BadCredentialsException("Bad ID or Password");
		}
		
		
		
	}

	@Override
	public boolean supports(Class<?> auth) {
		// UsernamePasswordAuthenticationToken 리턴할 때 파라미터와 같은 레퍼런스인지 비교를 하고 리턴을 한다.
		// default-target-url로 전송된다.
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}

}
