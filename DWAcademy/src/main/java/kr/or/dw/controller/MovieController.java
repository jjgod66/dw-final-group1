package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.MovieViewerCommand;
import kr.or.dw.service.MovieService;


@Controller
@RequestMapping("/movie")
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	private MovieService movieService;

	@RequestMapping("/viewer")
	public ModelAndView detail(ModelAndView mnv, String movie_cd) throws SQLException{
		String url = "/movie/viewer";
		MovieViewerCommand mvc = null;
		Map<String, Object> movieMap = null;
		mvc = movieService.getMovieView(movie_cd);
		
		mnv.addObject("movieView", mvc);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/allMovie")
	public ModelAndView allMovie(ModelAndView mnv) {
		String url = "/movie/allMovie";
		
		mnv.setViewName(url);
		return mnv;
	}
	
}
