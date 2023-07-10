package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dw.service.MemberService;
import kr.or.dw.vo.MemberVO;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member/join")
	public void join(MemberVO memVO, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("test");
		
		
		memberService.join(memVO);
		
		res.setContentType("text/html; charset=utf-8");
	    PrintWriter out = res.getWriter();
	    out.println("<script>");
	    out.println("alert('회원가입이 정상적으로 되었습니다.');");
	    out.println("location.href='" + req.getContextPath() + "/main.do';");
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
	
	
}
