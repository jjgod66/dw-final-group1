package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.MovieViewerCommand;
import kr.or.dw.service.MovieService;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.ReviewVO;


@Controller
@RequestMapping("/movie")
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	private MovieService movieService;

	@RequestMapping("/viewer")
	public ModelAndView detail(ModelAndView mnv, String movie_cd, HttpSession session) throws SQLException{
		String url = "/movie/viewer";
		MovieViewerCommand mvc = null;
		Map<String, Object> movieMap = null;
		mvc = movieService.getMovieView(movie_cd);
		
		int likeCount = movieService.getMoiveLikeCount(movie_cd);
		String mem_cd = "";
		String active = "";
		if(session.getAttribute("loginUser") != null) {
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			mem_cd = member.getMem_cd();
			int exist = movieService.memLikeMovieExist(mem_cd, movie_cd);
			if(exist == 1) {
				active = "active";
			}
		}
		Map<String, Integer> reserMap = null;
		reserMap = movieService.getMovieReserve(movie_cd);
		
		List<ReviewVO> review3List = null;
		review3List = movieService.getMovieReview3(movie_cd);
		
		mnv.addObject("mem_cd", mem_cd);
		mnv.addObject("reviewList", review3List);
		mnv.addObject("reserMap", reserMap);
		mnv.addObject("active", active);
		mnv.addObject("likeCount", likeCount);
		mnv.addObject("movieView", mvc);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/allMovie")
	public ModelAndView allMovie(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "/movie/allMovie";
		
		if(searchType == null || ("").equals(searchType)) {
			searchType = "reserve";
		}
		
		if(keyword == null) {
			keyword = "";
		}
		List<Map<String, Object>> movieList = null;
		movieList = movieService.searchAllMovieList(searchType, keyword);
		
		mnv.addObject("movieList", movieList);
		mnv.addObject("keyword", keyword);
		mnv.addObject("searchType", searchType);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/screenMovie")
	public ModelAndView screenMovie(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "/movie/screenMovie";
		
		if(searchType == null || ("").equals(searchType)) {
			searchType = "reserve";
		}
		
		if(keyword == null) {
			keyword = "";
		}
		List<Map<String, Object>> movieList = null;
		movieList = movieService.searchScreenMovieList(searchType, keyword);
		
		mnv.addObject("movieList", movieList);
		mnv.addObject("keyword", keyword);
		mnv.addObject("searchType", searchType);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/comingMovie")
	public ModelAndView comingMovie(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "/movie/comingMovie";
		
		if(searchType == null || ("").equals(searchType)) {
			searchType = "reserve";
		}
		
		if(keyword == null) {
			keyword = "";
		}
		List<Map<String, Object>> movieList = null;
		movieList = movieService.searchComingMovieList(searchType, keyword);
		
		mnv.addObject("movieList", movieList);
		mnv.addObject("keyword", keyword);
		mnv.addObject("searchType", searchType);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/likeMovie")
	public ResponseEntity<String> movieLike(String movie_cd, HttpSession session){
		ResponseEntity<String> entity = null;
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mem_cd = member.getMem_cd();
		
		String result = null;
		try {
			result = movieService.clickMovieLike(movie_cd, mem_cd);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/watchYN")
	public ResponseEntity<String> movieWatchYN(HttpSession session, String movie_cd){
		ResponseEntity<String> entity = null;
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mem_cd = member.getMem_cd();
		
		String result = null;
		try {
			result = movieService.getMovieWatchYN(mem_cd, movie_cd);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
		
	}
	
	@RequestMapping("/reviewRegist")
	public void reviewRegist(ReviewVO review, HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mem_cd = member.getMem_cd();
		
		review.setMem_cd(mem_cd);
		movieService.registReview(review);
		
		res.setContentType("text/html; charset=utf-8");
	    PrintWriter out = res.getWriter();
	    out.println("<script>");
	    out.println("alert('리뷰가 등록되었습니다.');");
	    out.println("location.href='" + req.getContextPath() + "/movie/viewer.do?movie_cd=" + review.getMovie_cd() + "';");
	    out.println("</script>");
	    out.flush();
	    out.close();
	}
}
