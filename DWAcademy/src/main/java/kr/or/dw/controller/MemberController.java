package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.CouponService;
import kr.or.dw.service.MemberService;
import kr.or.dw.service.MovieService;
import kr.or.dw.service.NaverLoginBO2;
import kr.or.dw.service.PointService;
import kr.or.dw.service.SnsService;
import kr.or.dw.service.SupportService;
import kr.or.dw.service.TheaterService;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.QnaVO;
import kr.or.dw.vo.SnsVO;
import kr.or.dw.vo.TheaterVO;

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
	
	@Autowired
	private SupportService supportService;
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private PointService pointService;
	
	
	/* NaverLoginBO */
	private NaverLoginBO2 naverLoginBO2;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO2 naverLoginBO2) {
		this.naverLoginBO2 = naverLoginBO2;
	}
	
	@RequestMapping("/member/main")
	public ModelAndView memberMain(ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "/member/main";
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		
		String mem_cd = (String) member.get("CD");
		List<Map<String, Object>> movieInfoList = movieService.getMy2ResInfo(mem_cd);
		List<Map<String, Object>> buyInfoList = memberService.select3BuyInfo(mem_cd);
		
		mnv.addObject("buyInfoList", buyInfoList);
		mnv.addObject("movieInfoList", movieInfoList);
		mnv.addObject("member", member);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/member/PrivacyInfo")
	public ModelAndView PrivacyInfo(ModelAndView mnv, HttpServletRequest req, HttpSession session) throws SQLException {
		String url = "/member/PrivacyInfo";
		
		
		Map<String, Object> member =  (Map<String, Object>) session.getAttribute("loginUser");
		System.out.println(member);
		SnsVO kakao = new SnsVO();
		SnsVO naver = new SnsVO();
		
//		kakao = snsService.selectKakaoInfo(member);
		System.out.println(kakao);
		req.setAttribute("kakao", kakao);

//		naver = snsService.selectNaverInfo(member);
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
			Map<String, Object> member = memberService.selectMemberById(id);
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
	public ResponseEntity<Map<String, Object>> CheckMember(String mem_phone) throws SQLException {
		ResponseEntity<Map<String, Object>> entity = null;
		System.out.println(mem_phone);
		
		Map<String, Object> member = memberService.CheckMember(mem_phone);
		System.out.println(member);
		
		try {
			entity = new ResponseEntity<Map<String, Object>>(member, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/member/dormantAccount")
	public void dormantAccount(String phone, HttpServletResponse res, HttpServletRequest req) throws IOException, SQLException {
		System.out.println(phone);
		
		memberService.accountRecovery(phone);
		
		res.setContentType("text/html; charset=utf-8");
	    PrintWriter out = res.getWriter();
	    out.println("<script>");
	    out.println("alert('휴면이 해제 되었습니다.');");
	    out.println("location.href='" + req.getContextPath() + "/';");
	    out.println("</script>");
		
	}
	
	@RequestMapping("/member/additionalinfo")
	public ModelAndView memberAdditionalinfo(ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "/member/additionalinfo";
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
		String id = (String) member.get("ID");
		String mem_cd = (String) member.get("CD");
		List<TheaterVO> theaterList = theaterService.getAllTheaterList();
		List<GenreVO> genreList = memberService.selectAllGenreList();
		Map<String, Object> mem_alert = memberService.selectAllMemberInfo(id);
		List<Map<String, Object>> mem_like_theater = theaterService.selectMemLikeTheater(mem_cd);
		
		System.out.println(mem_alert);
		System.out.println(mem_like_theater);
		
		String[] mlt = new String[mem_like_theater.size()];
		for(int i = 0; i < mem_like_theater.size(); i++) {
			mlt[i] += mem_like_theater.get(i);
		}
		System.out.println(Arrays.toString(mlt));
		
		mnv.addObject("genreList", genreList);
		mnv.addObject("theaterList", theaterList);
		mnv.addObject("member", member);
		mnv.addObject("mem_alert", mem_alert);
		mnv.addObject("mem_like_theater", mem_like_theater);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/member/searchTheater")
	public ResponseEntity<List<TheaterVO>> searchTheater(String selectLocData) throws SQLException{
		ResponseEntity<List<TheaterVO>> entity = null;
		
		List<TheaterVO> theaterNameList = theaterService.searchTheaterName(selectLocData);
		try {
			entity = new ResponseEntity<List<TheaterVO>>(theaterNameList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<TheaterVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		
		return entity;
	}
	
	@RequestMapping("/member/addition")
	public ModelAndView additionUpdate(ModelAndView mnv, String selectThrName ,String gb_sms_alert, String gb_email_alert, HttpSession session) throws SQLException{
		String url = "redirect:/member/additionalinfo.do";
		String[] thrArr = selectThrName.split(",");
		List<String> thrNames = new ArrayList<>();
		
		for(int i = 0; i < thrArr.length; i++) {
			if(!"".equals(thrArr[i])) {
				thrNames.add(thrArr[i]);
			}
		}
		System.out.println(thrNames);
		
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
		member.put("gb_email_alert", gb_email_alert);
		member.put("gb_sms_alert", gb_sms_alert);
		String id = (String) member.get("ID");
		String mem_cd = (String) member.get("CD");
		System.out.println(member);
		memberService.additionUpdate(member);
		memberService.memLikeThr(thrNames, mem_cd);
		
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/member/bookinglist")
	public ModelAndView memberBookinglist(SearchCriteria cri, ModelAndView mnv, HttpSession session, String on) throws SQLException {
		String url = "/member/bookinglist";
		System.out.println("on : " + on);
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String)member.get("CD");
		cri.setPerPageNum("5");
		Map<String, Object> dataMap = movieService.selectMovieInfo(cri, mem_cd);
		
		mnv.addAllObjects(dataMap);
		System.out.println(dataMap);
		
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/member/searchResDate")
	public ModelAndView searchResDate(ModelAndView mnv, SearchCriteria cri, HttpSession session) throws SQLException{
		String url = "/member/bookinglist";
		System.out.println("cri : " + cri);
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		cri.setPerPageNum("5");
		Map<String, Object> dataMap = movieService.searchMovieInfo(cri, mem_cd);
	
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("/member/searchBuyDate")
	public ModelAndView searchBuyDate(ModelAndView mnv, SearchCriteria cri, HttpSession session) throws SQLException{
		String url = "/member/bookinglist";
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		cri.setPerPageNum("5");
		Map<String, Object> dataMap = memberService.searchBuyInfo(mem_cd, cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/member/discount-coupon")
	public ModelAndView memberDiscountcoupon(ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "/member/discount-coupon";
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		List<Map<String, Object>> coupon = couponService.selectAllCoupon(mem_cd);
		
		mnv.addObject("coupon", coupon);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/member/moviestory")
	public ModelAndView memberMoviestory(ModelAndView mnv, HttpSession session) {
		String url = "/member/moviestory";
		
		
		
		return mnv;
	}
	
	@RequestMapping("/member/myinquiry")
	public ModelAndView memberMyinquiry(ModelAndView mnv, HttpSession session, SearchCriteria cri) throws SQLException {
		String url = "/member/myinquiry";
		
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		cri.setPerPageNum("5");
		
		Map<String, Object> dataMap = supportService.getAllMyQuestionList(cri, mem_cd);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/member/myInquiryDetail")
	public ModelAndView memberMyInquiryDetail(ModelAndView mnv, int que_no) throws SQLException {
		String url = "/member/inquiry_detail";
		
		QnaVO qna = null;
		AnswerVO answer = null;
		qna = supportService.getQnaByQueNo(que_no);
		answer = supportService.getAnswerByQueNo(que_no);
		
		mnv.addObject("answer", answer);
		mnv.addObject("qna", qna);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/member/searchMyQuestion")
	public ModelAndView searchMyQuestion(ModelAndView mnv, HttpSession session, SearchCriteria cri) throws SQLException {
		String url = "/member/myinquiry";
		
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		cri.setPerPageNum("5");
		
		Map<String, Object> dataMap = supportService.searchMyQuestionList(cri, mem_cd);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/member/point-list")
	public ModelAndView memberPointlist(ModelAndView mnv, SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "/member/point-list";
		
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		Map<String, Object> dataMap = null;
		dataMap = pointService.getMemPointList(mem_cd, cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}

}
