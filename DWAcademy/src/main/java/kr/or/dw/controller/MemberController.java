package kr.or.dw.controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.MemberService;
import kr.or.dw.service.NaverLoginBO;
import kr.or.dw.service.NaverLoginBO2;
import kr.or.dw.service.SnsService;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SnsService snsService;
	
	/* NaverLoginBO */
	private NaverLoginBO2 naverLoginBO2;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO2 naverLoginBO2) {
		this.naverLoginBO2 = naverLoginBO2;
	}
	
	@RequestMapping("/member/PrivacyInfo")
	public ModelAndView PrivacyInfo(ModelAndView mnv, HttpServletRequest req, HttpSession session) throws SQLException {
		String url = "/member/PrivacyInfo";
		System.out.println(session.getAttribute("loginUser"));
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		SnsVO kakao = new SnsVO();
		SnsVO naver = new SnsVO();
		
		kakao = snsService.selectKakaoInfo(member);
		System.out.println(kakao);
		req.setAttribute("kakao", kakao);

		naver = snsService.selectNaverInfo(member);
		System.out.println(naver);
		req.setAttribute("naver", naver);
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO2.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		mnv.addObject("url", naverAuthUrl);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/member/join")
	public void join(String sns, MemberVO memVO, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("test");
		System.out.println(sns);
		
		memberService.join(memVO);
		
		
		
		res.setContentType("text/html; charset=utf-8");
	    PrintWriter out = res.getWriter();
	    out.println("<script>");
	    out.println("alert('회원가입이 정상적으로 되었습니다.');");
	    out.println("location.href='" + req.getContextPath() + "/';");
	    out.println("</script>");
	}
	
	@RequestMapping("/member/idCheck")
	public ResponseEntity<String> idCheck(String id, HttpServletRequest req) {
		
		ResponseEntity<String> entity = null;
		
		try {
			MemberVO member = memberService.selectMemberById(id);
			entity = new ResponseEntity<String>(member == null ? id : "", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping("/member/joinForm")
	public String joinForm() {
		return "/include/join_modal";
		
	}
	
	@RequestMapping("/member/CheckMember")
	public ResponseEntity<MemberVO> CheckMember(String mem_phone) throws SQLException {
		ResponseEntity<MemberVO> entity = null;
		System.out.println(mem_phone);
		
		MemberVO member = memberService.CheckMember(mem_phone);
		System.out.println(member);
		
		try {
			entity = new ResponseEntity<MemberVO>(member, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MemberVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	
	
}
