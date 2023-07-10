package kr.or.dw.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.IndexMovieCommand;
import kr.or.dw.service.MemberService;
import kr.or.dw.service.MovieService;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse res) throws Exception{
		String url = "security/accessDenied.open";
		
		res.setStatus(302);
		
		return url;
	}
	
	@RequestMapping("/index")
	public ModelAndView index(ModelAndView mnv) {
		String url = "/index";
		
		List<IndexMovieCommand> movieList = null;
		
		
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	
	
}
