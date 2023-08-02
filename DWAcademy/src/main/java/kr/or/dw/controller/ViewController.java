package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.MemberService;
import kr.or.dw.service.SnsService;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

@Controller
public class ViewController {

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SnsService snsService;

	/*
	 * 맴버 뷰어 컨트롤러 
	 */
	@RequestMapping("/member/main")
	public ModelAndView memberMain(ModelAndView mnv, HttpSession session) {
		String url = "/member/main";
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		
		mnv.addObject("member", member);
		mnv.setViewName(url);
		
		return mnv;
	}
	@GetMapping("/member/moviestory")
	public String memberMoviestory() {
		String url = "/member/moviestory";
		return url;
	}
	@GetMapping("/member/myinquiry")
	public String memberMyinquiry() {
		String url = "/member/myinquiry";
		return url;
	}
	@GetMapping("/member/point-list")
	public String memberPointlist() {
		String url = "/member/point-list";
		return url;
	}
	@GetMapping("/member/additionalinfo")
	public ModelAndView memberAdditionalinfo(ModelAndView mnv, HttpSession session) {
		String url = "/member/additionalinfo";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		mnv.addObject("member", member);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/member/membership")
	public String memberShip() {
		String url = "/member/membership";
		return url;
	}
	

	/*
	 * 극장 뷰어 컨트롤러 
	 */
//	@GetMapping("/theater/main")
//	public String theaterMain() {
//		String url = "/theater/main";
//		return url;
//	}

	/*
	 * 예매 뷰어 컨트롤러 
	 */
//	@GetMapping("/booking/cinema")
//	public String bookingCinema() {
//		String url = "/booking/cinema";
//		return url;
//	}
//	@GetMapping("/booking/movie")
//	public String bookingMovie() {
//		String url = "/booking/movie";
//		return url;
//	}
//	@GetMapping("/booking/detail")
//	public String bookingDetail() {
//		String url = "/booking/detail";
//		return url;
//	}
//	@GetMapping("/booking/payment")
//	public String bookingPayment() {
//		String url = "/booking/payment";
//		return url;
//	}

	
//	/*
//	 * 스토어 뷰어 컨트롤러 
//	 */
//	@GetMapping("/store/index")
//	public String storeIndex() {
//		String url = "/store/index";
//		return url;
//	}
//
//	@GetMapping("/store/detail")
//	public String storeDetail() {
//		String url = "/store/detail";
//		return url;
//	}


	/*
	 * 이벤트 뷰어 컨트롤러 
	 */
//	@GetMapping("/event/main")
//	public String eventMain() {
//		String url = "/event/main";
//		return url;
//	} 
//	@GetMapping("/event/eventDetail")
//	public String eventDetail() {
//		String url = "/event/eventDetail";
//		return url;
//	}
//	@GetMapping("/event/eventPast")
//	public String eventPast() {
//		String url = "/event/eventPast";
//		return url;
//	}
//	@GetMapping("/event/prizeWinner")
//	public String prizeWinner() {
//		String url = "/event/prizeWinner";
//		return url;
//	}
//	@GetMapping("/event/prizeWinnerResult")
//	public String prizeWinnerResult() {
//		String url = "/event/prizeWinnerResult";
//		return url;
//	}
		
	
	

	/*
	 * 고객센터 뷰어 컨트롤러 
	 */
	@GetMapping("/support/test")
	public String supportTest() {
		return "/support/test"; 
	}
	
	@GetMapping("/support/test2")
	public String supportTest2() {
		return "/support/test2"; 
	}
	@GetMapping("/support/test3")
	public String supportTest3() {
		return "/support/test3"; 
	}
	@GetMapping("/support/test4")
	public String supportTest4() {
		return "/support/test4"; 
	}
	@GetMapping("/support/test5")
	public String supportTest5() {
		return "/support/test5"; 
	}
	
//	여기부터시작 
	

	
	
//	@GetMapping("/support/main")
//	public String supportMain() {
//		return "/support/main"; 
//	}
//	
//	@GetMapping("/support/notice")
//	public String supportNotice() {
//		String url = "/support/notice";
//		return url;
//	}
//	
//	@GetMapping("/support/noticeDetail")
//	public String supportNoticeDetail() {
//		String url = "/support/noticeDetail";
//		return url;
//	}
//	@GetMapping("/support/faq")
//	public String supportFaq() {
//		String url = "/support/faq";
//		return url;
//	}
//	@GetMapping("/support/inquiry")
//	public String supportin() {
//		String url = "/support/inquiry";
//		return url;
//	}
//	@GetMapping("/support/inquiry_nonMember")
//	public String supportinNon() {
//		String url = "/support/inquiry_nonMember";
//		return url;
//	}
//	@GetMapping("/support/inquiry_nonMember_list")
//	public String supportinNonList() {
//		String url = "/support/inquiry_nonMember_list";
//		return url;
//	}
//	@GetMapping("/support/inquiry_nonMember_list_login_result")
//	public String supportinNonListResult() {
//		String url = "/support/inquiry_nonMember_list_login_result";
//		return url;
//	}
//	@GetMapping("/support/agreeUse")
//	public String supportAgreeUse() {
//		String url = "/support/agreeUse";
//		return url;
//	}
//	@GetMapping("/support/agreeWhere")
//	public String supportAgreeW() {
//		String url = "/support/agreeWhere";
//		return url;
//	}
//	@GetMapping("/support/agreePrivacy")
//	public String supportAgreeP() {
//		String url = "/support/agreePrivacy";
//		return url;
//	}
//	@GetMapping("/support/agreeScreen")
//	public String supportAgreeS() {
//		String url = "/support/agreeScreen";
//		return url;
//	}
}
