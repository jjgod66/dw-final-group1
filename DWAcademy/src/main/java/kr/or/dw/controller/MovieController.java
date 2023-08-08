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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.MovieViewerCommand;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.MemberService;
import kr.or.dw.service.MovieService;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ReplyVO;
import kr.or.dw.vo.MoviePictureVO;
import kr.or.dw.vo.MoviePostVO;
import kr.or.dw.vo.MoviePreviewVO;
import kr.or.dw.vo.ReviewVO;
import oracle.net.aso.s;


@Controller
@RequestMapping("/movie")
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private MemberService memberService;

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
			Map<String, Object> member = (Map) session.getAttribute("loginUser");
			mem_cd = (String) member.get("CD");
			int exist = movieService.memLikeMovieExist(mem_cd, movie_cd);
			if(exist == 1) {
				active = "active";
			}
		}
		Map<String, Integer> reserMap = null;
		reserMap = movieService.getMovieReserve(movie_cd);
		
		List<Map<String, Object>> review3List = null;
		review3List = movieService.getMovieReview3(movie_cd, session);
		
		List<MoviePreviewVO> moviePreviewList = null;
		moviePreviewList = movieService.getMoviePreview(movie_cd);
		
		List<MoviePictureVO> moviePicList = null;
		moviePicList = movieService.getMoviePicture(movie_cd);
		
		double movie_rate_avg = 0.0;
		movie_rate_avg = movieService.getMovieRateAvg(movie_cd);
		
		List<Map<String, Object>> moviePostList = null;
		moviePostList = movieService.getMoviePost4(movie_cd);
		
		mnv.addObject("moviePostList", moviePostList);
		mnv.addObject("movie_rate_avg", movie_rate_avg);
		mnv.addObject("previewList", moviePreviewList);
		mnv.addObject("pictureList", moviePicList);
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
	
	@RequestMapping("/likeGenreMovie")
	public ModelAndView likeGenreMovie(ModelAndView mnv, String searchType, String keyword, HttpSession session) throws Exception {
		String url = "/movie/likeGenreMovie";
		
		if(searchType == null || ("").equals(searchType)) {
			searchType = "reserve";
		}
		
		if(keyword == null) {
			keyword = "";
		}
		String genreYN = "Y";
		List<Map<String, Object>> movieList = null;
		
		if(session.getAttribute("loginUser") != null) {
			Map<String, Object> member = (Map) session.getAttribute("loginUser");
			String mem_cd = (String) member.get("CD");
			List<String> memLikeGenreList = null;
			memLikeGenreList = movieService.getMemLikeGenre(mem_cd);
			
			
			if(memLikeGenreList.isEmpty()) {
				genreYN = "N";
			}else {
				movieList = movieService.searchLikeGenreMovieList(searchType, keyword, memLikeGenreList);
			}
			
		}
		mnv.addObject("genreYN", genreYN);
		mnv.addObject("movieList", movieList);
		mnv.addObject("keyword", keyword);
		mnv.addObject("searchType", searchType);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/likeMovie")
	public ResponseEntity<String> movieLike(String movie_cd, HttpSession session){
		ResponseEntity<String> entity = null;
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
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
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
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
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
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
	
	@RequestMapping("/reviewUpdate")
	public void reviewUpdate(ReviewVO review, HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		review.setMem_cd(mem_cd);
		movieService.updateReview(review);
		
		String referer = (String)req.getHeader("REFERER");
		
		res.setContentType("text/html; charset=utf-8");
	    PrintWriter out = res.getWriter();
	    out.println("<script>");
	    out.println("alert('리뷰가 수정되었습니다.');");
	    if(referer.equals("http://localhost/movie/review.do")) {
	    	out.println("location.href='" + req.getContextPath() + "/movie/review.do';");
		}else {
			out.println("location.href='" + req.getContextPath() + "/movie/viewer.do?movie_cd=" + review.getMovie_cd() + "';");
		}
	    out.println("</script>");
	    out.flush();
	    out.close();
	}
	
	@RequestMapping("/reviewLike")
	public ResponseEntity<String> reviewLike(String review_no, HttpSession session){
		ResponseEntity<String> entity = null;
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		try {
			movieService.reviewLike(review_no, mem_cd);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/reviewLikeDel")
	public ResponseEntity<String> reviewLikeDel(String review_no, HttpSession session){
		ResponseEntity<String> entity = null;
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		try {
			movieService.reviewLikeDel(review_no, mem_cd);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/reviewReport")
	public void reviewReport(int review_no, String movie_cd, HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception {
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		System.out.println(movie_cd);
		String result = movieService.reviewReport(review_no, mem_cd);
		if(result.equals("S")) {
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('신고가 접수되었습니다.');");
			if(movie_cd == null || movie_cd == "") {
				out.println("location.href='" + req.getContextPath() + "/movie/review.do';");
			}else {
				out.println("location.href='" + req.getContextPath() + "/movie/viewer.do?movie_cd=" + movie_cd  + "';");
			}
			out.println("</script>");
			out.flush();
			out.close();
		}else {
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('이미 신고한 리뷰입니다.');");
			if(movie_cd == null || movie_cd == "") {
				out.println("location.href='" + req.getContextPath() + "/movie/review.do';");
			}else {
				out.println("location.href='" + req.getContextPath() + "/movie/viewer.do?movie_cd=" + movie_cd  + "';");
			}
			out.println("</script>");
			out.flush();
			out.close();
		}
	}
	
	@RequestMapping("/moviePost")
	public ModelAndView moviePost(ModelAndView mnv, SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "/movie/moviepost";
		
		
		cri.setPerPageNum("12");
		if("".equals(cri.getSearchType())) {
			cri.setSearchType("regdate");
		}
		Map<String, Object> dataMap = movieService.getMoviePost(cri, session);
		
		List<Map<String, Object>> mpostTop5MoiveList = null;
		mpostTop5MoiveList = movieService.getMpostTop5Movie();
		dataMap.put("top5Moive", mpostTop5MoiveList);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/moviePic")
	public ResponseEntity<List<MoviePictureVO>> getMoviePic(String movie_cd){
		ResponseEntity<List<MoviePictureVO>> entity = null;
		
		List<MoviePictureVO> moviePicList = null;
		try {
			moviePicList = movieService.getMoviePicture(movie_cd);
			entity = new ResponseEntity<List<MoviePictureVO>>(moviePicList, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MoviePictureVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/moviePostRegist")
	public void moviePostRegist(MoviePostVO moviePost, HttpServletResponse res, HttpSession session) throws Exception {
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		moviePost.setMem_cd(mem_cd);;
		
		movieService.registMoviePost(moviePost);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('등록되었습니다.')");
		out.println("location.href='moviePost.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/moviePostView")
	public ResponseEntity<Map<String, Object>> moviePostView(int mpost_no, HttpSession session){
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> mpostMap = null;
		
		String mem_cd = "";
		if(session.getAttribute("loginUser") != null) {
			Map<String, Object> member = (Map) session.getAttribute("loginUser");
			mem_cd = (String) member.get("CD");
		}
		
		try {
			mpostMap = movieService.getMoivePostView(mpost_no, mem_cd);
			System.out.println("mpostMap : " + mpostMap);
			entity = new ResponseEntity<Map<String,Object>>(mpostMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/moviePostReplyRegist")
	public ResponseEntity<Map<String, Object>> replyRegist(ReplyVO reply, HttpSession session){
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		reply.setMem_cd(mem_cd);
		Map<String, Object> replyMap = null;
		try {
			replyMap = movieService.registReply(reply);
			entity = new ResponseEntity<Map<String,Object>>(replyMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping("/mpLike")
	public ResponseEntity<String> mpLike(int mpost_no, HttpSession session){
		ResponseEntity<String> entity = null;
	
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		try {
			movieService.clickMoviePostLike(mpost_no, mem_cd);
			entity = new ResponseEntity<String>("S", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/replyUpdate")
	public ResponseEntity<String> replyUpdate(String reply_content, int reply_no){
		ResponseEntity<String> entity = null;
		
		try {
			movieService.updateReply(reply_content, reply_no);
			entity = new ResponseEntity<String>("S", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping("/replyDelete")
	public ResponseEntity<String> replyDelete(int reply_no){
		ResponseEntity<String> entity = null;
		
		try {
			movieService.deleteReply(reply_no);
			entity = new ResponseEntity<String>("S", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/replyReport")
	public ResponseEntity<String> replyReport(int reply_no, HttpSession session){
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		ResponseEntity<String> entity = null;
		String result = "S";
		try {
			result = movieService.replyReport(reply_no, mem_cd);
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/mpostReport")
	public ResponseEntity<String> mpostReport(int mpost_no, HttpSession session){
		ResponseEntity<String> entity = null;
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		String result = "S";
		try {
			result = movieService.mpostReport(mpost_no, mem_cd);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/mpostDelete")
	public ResponseEntity<String> mpostDelete(int mpost_no){
		ResponseEntity<String> entity = null;
		
		try {
			movieService.deleteMpost(mpost_no);
			entity = new ResponseEntity<String>("S", HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/mpostUpdateInfo")
	public ResponseEntity<Map<String, Object>> mpostUpdateInfo(int mpost_no){
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> moviePost = null;
		try {
			moviePost = movieService.getMoivePostUpdateInfo(mpost_no);
			entity = new ResponseEntity<Map<String,Object>>(moviePost, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
	}
	
	@RequestMapping("/moviePostUpdate")
	public void moviePostUpdate(MoviePostVO moviePost, HttpServletResponse res, HttpSession session) throws Exception {
		
		Map<String, Object> member = (Map) session.getAttribute("loginUser");
		String mem_cd = (String) member.get("CD");
		
		moviePost.setMem_cd(mem_cd);;
		
		movieService.updateMoviePost(moviePost);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('수정되었습니다.')");
		out.println("location.href='moviePost.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/review")
	public ModelAndView movieReview(SearchCriteria cri, ModelAndView mnv, HttpSession session, HttpServletResponse res, HttpServletRequest req) throws SQLException, IOException {
		String url = "/movie/review";
		if("".equals(cri.getSearchType())) {
			cri.setSearchType("regdate");
		}
		Map<String, Object> dataMap = movieService.getAllMovieReview(session, cri);
		System.out.println(dataMap);
		
		List<Map<String, Object>> reviewTop5MoiveList = null;
		reviewTop5MoiveList = movieService.getReviewTop5Movie();
		dataMap.put("top5Moive", reviewTop5MoiveList);
		
		
		String mem_cd = "";
		if(session.getAttribute("loginUser") != null) {
			Map<String, Object> member = (Map) session.getAttribute("loginUser");
			mem_cd = (String) member.get("CD");

		}
		
		mnv.addObject("mem_cd", mem_cd);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/searchReview")
	public ModelAndView searchReview(ModelAndView mnv,String keyword, HttpSession session) throws SQLException{
		String url = "movie/review";
		
		System.out.println(keyword);
		if(keyword != null) {
			List<Map<String, Object>> review = movieService.searchReview(keyword, session);
			System.out.println(review);
			mnv.addObject("reviewList", review);
		}
		mnv.setViewName(url);
			
		return mnv;
		
		
	}
	
	@RequestMapping("/reviewDelete")
	public ResponseEntity<String> reviewDelete(int review_no){
		ResponseEntity<String> entity = null;
		String result = null;
		
		try {
			result = movieService.deleteReview(review_no);
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}
