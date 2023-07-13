package kr.or.dw.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.MemberDAO;
import kr.or.dw.vo.MemberVO;

public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO selectMemberById(String id) {
		return memberDAO.selectMemberById(id);
	}

	@Override
	public void join(MemberVO memVO) {
		memberDAO.insert(memVO);
	}

	@Override
	public MemberVO selectMemberByName(String email) {
		return memberDAO.selectMemberByName(email);
	}

}
