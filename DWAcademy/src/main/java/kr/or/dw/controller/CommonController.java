package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	private MovieService movieService;
	

	
	
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
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다.\\n다시 로그인하세요!')");
		out.println("location.href='/';");
		out.println("</script>");
		out.close();
	}
	

	
	
}
