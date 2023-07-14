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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.IndexMovieCommand;
import kr.or.dw.dao.SnsDAO;
import kr.or.dw.service.KakaoService;
import kr.or.dw.service.MemberService;
import kr.or.dw.service.MovieService;
import kr.or.dw.service.SnsService;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.SnsVO;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private SnsService snsService;

	
	@Autowired
	private KakaoService ka;
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse res) throws Exception{
		String url = "security/accessDenied.open";
		
		res.setStatus(302);
		
		return url;
	}
	
	@RequestMapping("/main")
	public ModelAndView index(ModelAndView mnv) throws SQLException {
		String url = "/main";
		List<Map<String, Object>> movieListMap = null;
		movieListMap = movieService.getIndexBoxOfficeMovie10();
		
		List<IndexMovieCommand> movieList = new ArrayList<>();
		
		for(Map<String, Object> movieMap : movieListMap) {
			IndexMovieCommand imc = new IndexMovieCommand(movieMap);
			movieList.add(imc);
		}

		mnv.addObject("movieList", movieList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/common/LoginTimeOut")
	public void loginTimeOut(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println(req.getParameter("test"));
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
//		req.getSession().setMaxInactiveInterval(10);
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다.\\n다시 로그인하세요!')");
		out.println("location.href='/';");
		out.println("</script>");
		out.close();
	}
	
	// 카카오 소셜로그인
	@RequestMapping(value="/kakaoCode", method=RequestMethod.GET)
	public String kakaoCode(@RequestParam(value = "code", required = false) String code) throws Exception {
		
		
		System.out.println("#########" + code);
		
		Map<String, String> access_Token = ka.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		return "/member/PrivacyInfo";
		/*
		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
		 * 없는 페이지를 넣어도 무방합니다.
		 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
		 */
    	}
	
	@RequestMapping(value="/kakao/callback", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callback(ModelAndView mnv, @RequestParam String code, HttpSession session) throws SQLException {
		String url = "/member/PrivacyInfo";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		SnsVO sns = snsService.selectSnsInfo(member);

		System.out.println(member.getMem_cd());
		
		System.out.println("#########" + code);
		Map<String, String> tokenMap = new HashMap<>();
		tokenMap = ka.getAccessToken(code);
		String access_Token = tokenMap.get("access_Token");
		String refresh_Token = tokenMap.get("refresh_Token");
		HashMap<String, Object> userInfo = ka.getUserInfo(access_Token);
		
		
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("sns_name"));
		System.out.println("###email#### : " + userInfo.get("sns_email"));
		
		userInfo.put("access_Token", access_Token);
		userInfo.put("refresh_Token", refresh_Token);
		userInfo.put("mem_cd", member.getMem_cd());
		if(sns != null) {
			userInfo.put("linkDate", sns.getLinkdate());
		}
		
		System.out.println(userInfo);
		
		snsService.insertSocal(userInfo);
		
		mnv.addAllObjects(userInfo);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/common/kakaoLogin")
	public ResponseEntity<String>kakaoLogin(String email) throws SQLException {
		ResponseEntity<String> entity = null;
		
		
		SnsVO sns = snsService.selectByMemberCode(email);
		
		System.out.println(sns);
		
		if(sns == null) {
			try {
				entity = new ResponseEntity<String>(HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}else {
			MemberVO member = memberService.selectMemberCode(sns);
			try {
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return entity;
		
	}

	
	
	
}
