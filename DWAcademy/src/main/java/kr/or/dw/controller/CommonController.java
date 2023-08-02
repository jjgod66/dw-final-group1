package kr.or.dw.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.IndexMovieCommand;
import kr.or.dw.service.EventService;
import kr.or.dw.service.MovieService;
import kr.or.dw.service.NaverLoginBO;
import kr.or.dw.service.SupportService;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.NoticeVO;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private SupportService supportService;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse res) throws Exception{
		String url = "security/accessDenied.open";
		
		res.setStatus(302);
		
		return url;
	}
	
	@RequestMapping(value = "/main", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView index(ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "/main";
		List<Map<String, Object>> movieListMap = null;
		movieListMap = movieService.getIndexBoxOfficeMovie10();
		
		List<IndexMovieCommand> movieList = new ArrayList<>();
		
		for(Map<String, Object> movieMap : movieListMap) {
			IndexMovieCommand imc = new IndexMovieCommand(movieMap);
			movieList.add(imc);
			
		}
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		mnv.addObject("url", naverAuthUrl);
		
		
		List<EventVO> eventList = null;
		eventList = eventService.getEvent4();
		
		List<NoticeVO> noticeList = null;
		noticeList = supportService.getNotice2();
		
		mnv.addObject("noticeList", noticeList);
		mnv.addObject("eventList", eventList);
		mnv.addObject("movieList", movieList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/common/LoginTimeOut")
	public void loginTimeOut(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println(req.getParameter("test"));
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다.\\n다시 로그인하세요!')");
		out.println("location.href='/';");
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping("/common/login")
	public String login(HttpServletRequest req, HttpServletResponse res) {
		String url = "/common/login";
		
		return url;
		
	}
	

	
	
}
