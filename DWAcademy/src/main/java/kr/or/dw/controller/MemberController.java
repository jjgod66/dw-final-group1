package kr.or.dw.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.dao.MovieDAO;
import kr.or.dw.service.CouponService;
import kr.or.dw.service.MemberService;
import kr.or.dw.service.MovieService;
import kr.or.dw.service.NaverLoginBO;
import kr.or.dw.service.NaverLoginBO2;
import kr.or.dw.service.SnsService;
import kr.or.dw.vo.CouponVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.MoviePictureVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SnsVO;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SnsService snsService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private CouponService couponService;
	
	
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
	
	@RequestMapping("/member/addition")
	public ResponseEntity<String> additionUpdate(String gb_sms_alert, String gb_email_alert, HttpSession session) throws SQLException{
		ResponseEntity<String> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		MemberVO id = (MemberVO) session.getAttribute("loginUser");
		dataMap.put("gb_sms_alert", gb_sms_alert);
		dataMap.put("gb_email_alert", gb_email_alert);
		dataMap.put("mem_id", id.getMem_id());
		memberService.additionUpdate(dataMap);
		try {
			
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/member/bookinglist")
	public ModelAndView memberBookinglist(ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "/member/bookinglist";
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mem_cd = member.getMem_cd();
		if(member != null) {
		
			List<Map<String, Object>> movieInfo = movieService.selectMovieInfo(mem_cd);
			List<ProductVO> memberBuyInfo = memberService.selectBuyInfo(mem_cd);
			mnv.addObject("memBuyInfo", memberBuyInfo);
			mnv.addObject("movieInfo", movieInfo);
			
			System.out.println(memberBuyInfo);
			System.out.println(movieInfo.size());
			System.out.println(movieInfo);
		}
		
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/member/searchResDate")
	public ResponseEntity<List<Map<String, Object>>> searchResDate(String searchVal, HttpSession session) throws SQLException{
		ResponseEntity<List<Map<String, Object>>> entity = null;
		
		System.out.println(searchVal);
		try {
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mem_cd = member.getMem_cd();
			List<Map<String, Object>> searchMovieInfo = null;
		if(member != null) {
		
			searchMovieInfo = movieService.searchMovieInfo(mem_cd, searchVal);
		
			System.out.println(searchMovieInfo.size());
			System.out.println(searchMovieInfo);
		
		}
			entity = new ResponseEntity<List<Map<String, Object>>>(searchMovieInfo, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Map<String, Object>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/member/searchBuyDate")
	public ResponseEntity<List<Map<String, Object>>> searchBuyDate(String searchVal, HttpSession session) throws SQLException{
		ResponseEntity<List<Map<String, Object>>> entity = null;
		
		System.out.println(searchVal);
		try {
			
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			String mem_cd = member.getMem_cd();
			List<Map<String, Object>> searchBuyInfo = null;
				
			searchBuyInfo = memberService.searchBuyInfo(mem_cd, searchVal);
			
			System.out.println(searchBuyInfo.size());
			System.out.println(searchBuyInfo);
			entity = new ResponseEntity<List<Map<String, Object>>>(searchBuyInfo, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Map<String, Object>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/member/discount-coupon")
	public ModelAndView memberDiscountcoupon(ModelAndView mnv, HttpSession session) {
		String url = "/member/discount-coupon";
		
		String mem_cd = (String) session.getAttribute("loginUser");
		
		CouponVO coupon = couponService.selectCoupon(mem_cd);
		
		mnv.addObject("coupon", coupon);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
}
