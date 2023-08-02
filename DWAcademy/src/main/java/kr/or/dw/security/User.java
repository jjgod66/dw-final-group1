package kr.or.dw.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.or.dw.vo.MemberVO;

public class User implements UserDetails{
	
	private Map<String, String> member;
	public User(Map<String, String> member2) {
		this.member = member2;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority((String) member.get("CD")));
		return roles;
	}

	@Override
	public String getPassword() {
		return (String) member.get("PWD");
	}

	@Override
	public String getUsername() {
		return (String) member.get("ID");
	}

	@Override
	public boolean isAccountNonExpired() {	// 기간제 계정의 경우 기간만료 여부
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {	// 휴면 계정 여부
		return member.get("GB_SLEEP") == "Y";
	}

	@Override
	public boolean isCredentialsNonExpired() {	// 인증정보 만료 여부
		return true;
	}

	@Override
	public boolean isEnabled() {	// 사용 제제 여부
		return member.get("GB_BAN") == "Y";
	}
	
	public Map<String, String> getMemberVO() {
		return this.member;
	}

}
