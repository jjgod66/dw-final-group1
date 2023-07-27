package kr.or.dw.service;

import java.net.StandardSocketOptions;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.SystemPropertyUtils;

import kr.or.dw.command.MovieViewerCommand;
import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.MovieDAO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.MoviePictureVO;
import kr.or.dw.vo.MoviePostVO;
import kr.or.dw.vo.MoviePreviewVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ReplyVO;
import kr.or.dw.vo.ReviewVO;

public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public List<Map<String, Object>> getIndexBoxOfficeMovie10() throws SQLException{
		List<Map<String, Object>> movieList = null;
		
		movieList = movieDAO.selectBoxOfficeMovie10();
		int yes_all_reserver = movieDAO.selectYesAllReserver();
		for(Map<String, Object> movie : movieList) {
			movie.put("all_reserver", yes_all_reserver);
		}
		return movieList;
	}

	@Override
	public MovieViewerCommand getMovieView(String movie_cd) throws SQLException {
		MovieVO movie = movieDAO.selectMovieDetail(movie_cd);
		List<MoviePictureVO> movie_picture_list = movieDAO.selectMoviePicture(movie_cd);
		List<MoviePreviewVO> movie_preview_list = movieDAO.selectMoviePreview(movie_cd);
		List<MoviePostVO> moviepost_list = movieDAO.selectMoviePostByCd(movie_cd);
		List<ReviewVO> review_list = movieDAO.selectReviewByCd(movie_cd);
		String[] type_list = movieDAO.selectMovieTypeByCd(movie_cd);
		String[] genre_list = movieDAO.selectMovieGenreByCd(movie_cd);
		
		MovieViewerCommand mvc = new MovieViewerCommand();
		mvc.setMovie(movie);
		mvc.setMovie_picture_list(movie_picture_list);
		mvc.setMovie_preview_list(movie_preview_list);
		mvc.setMoviepost_list(moviepost_list);
		mvc.setReview_list(review_list);
		mvc.setGenre_list(genre_list);
		mvc.setType_list(type_list);
		
		return mvc;
	}

	@Override
	public List<Map<String, Object>> searchAllMovieList(String searchType, String keyword) throws SQLException {
		List<Map<String, Object>> movieList = null;
		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		movieList = movieDAO.selectSearchAllMovie(param);
		
		int yes_all_reserver = movieDAO.selectYesAllReserver();
		for(Map<String, Object> movie : movieList) {
			movie.put("all_reserver", yes_all_reserver);
			double resRate = 0.0;
			if(yes_all_reserver > 0) {
				resRate = (double)Integer.parseInt(String.valueOf(movie.get("RESERVE"))) / yes_all_reserver * 100;
			}
			movie.put("resRate", resRate);
		}
		
		return movieList;
	}

	@Override
	public List<Map<String, Object>> searchScreenMovieList(String searchType, String keyword) throws SQLException {
		List<Map<String, Object>> movieList = null;
		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		movieList = movieDAO.selectSearchScreenMovie(param);
		
		int yes_all_reserver = movieDAO.selectYesAllReserver();
		for(Map<String, Object> movie : movieList) {
			movie.put("all_reserver", yes_all_reserver);
			double resRate = 0.0;
			if(yes_all_reserver > 0) {
				resRate = (double)Integer.parseInt(String.valueOf(movie.get("RESERVE"))) / yes_all_reserver * 100;
			}
			movie.put("resRate", resRate);
		}
		return movieList;
	}

	@Override
	public List<Map<String, Object>> searchComingMovieList(String searchType, String keyword) throws SQLException {
		List<Map<String, Object>> movieList = null;
		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		movieList = movieDAO.selectSearchComingMovie(param);
		
		int yes_all_reserver = movieDAO.selectYesAllReserver();
		for(Map<String, Object> movie : movieList) {
			movie.put("all_reserver", yes_all_reserver);
			double resRate = 0.0;
			if(yes_all_reserver > 0) {
				resRate = (double)Integer.parseInt(String.valueOf(movie.get("RESERVE"))) / yes_all_reserver * 100;
			}
			movie.put("resRate", resRate);
		}
		
		return movieList;
	}

	@Override
	public List<Map<String, Object>> searchLikeGenreMovieList(String searchType, String keyword,
			List<String> memLikeGenreList) throws SQLException {
		List<Map<String, Object>> movieList = null;

		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		for(int i = 0; i < memLikeGenreList.size(); i++) {
			param.put("likegenre" + (i+1), memLikeGenreList.get(i));
		}
		
		movieList = movieDAO.selectLikeGenreMovie(param);
		
		int yes_all_reserver = movieDAO.selectYesAllReserver();
		for(Map<String, Object> movie : movieList) {
			movie.put("all_reserver", yes_all_reserver);
			double resRate = 0.0;
			if(yes_all_reserver > 0) {
				resRate = (double)Integer.parseInt(String.valueOf(movie.get("RESERVE"))) / yes_all_reserver * 100;
			}
			movie.put("resRate", resRate);
		}
		
		return movieList;
	}
	
	@Override
	public String clickMovieLike(String movie_cd, String mem_cd) throws SQLException {
		String result = null;
		
		Map<String, String> param = new HashMap<>();
		param.put("movie_cd", movie_cd);
		param.put("mem_cd", mem_cd);
		
		int exist = 0;
		exist = movieDAO.selectMovieLikeExist(param);
		
		if(exist == 0) {
			movieDAO.insertMovieLike(param);
			result = "insert";
		}else {
			movieDAO.deleteMovieLike(param);
			result = "delete";
		}
		
		return result;
	}

	@Override
	public int getMoiveLikeCount(String movie_cd) throws SQLException {
		int count = 0;
		count = movieDAO.selectMovieLikeCount(movie_cd);
		
		return count;
	}

	@Override
	public int memLikeMovieExist(String mem_cd, String movie_cd) throws SQLException {
		Map<String, String> param = new HashMap<>();
		param.put("movie_cd", movie_cd);
		param.put("mem_cd", mem_cd);
		
		int exist = 0;
		exist = movieDAO.selectMovieLikeExist(param);
		return exist;
	}

	@Override
	public Map<String, Integer> getMovieReserve(String movie_cd) throws SQLException {
		Map<String, Integer> reserMap = new HashMap<>();
		
		int all_reservers = movieDAO.selectMovieAllReservers(movie_cd);
		
		int yes_all_reservers = movieDAO.selectYesAllReserver();
		
		int yes_movie_reservers = movieDAO.selectYesMovieReserver(movie_cd);
		
		reserMap.put("all_reservers", all_reservers);
		reserMap.put("yes_all_reservers", yes_all_reservers);
		reserMap.put("yes_movie_reservers", yes_movie_reservers);
		
		return reserMap;
	}

	@Override
	public String getMovieWatchYN(String mem_cd, String movie_cd) throws SQLException {
		Map<String, String> param = new HashMap<>();
		param.put("mem_cd", mem_cd);
		param.put("movie_cd", movie_cd);
		
		String result = "non";
		int count = 0;
		count = movieDAO.selectMovieWatchYN(param);
		
		int review = 0;
		if(count > 0) {
			result = "watch";
			review = movieDAO.selectMovieReviewYN(param);
		}
		
		if(review > 0) {
			result = "write";
		}
		return result;
	}

	@Override
	public void registReview(ReviewVO review) throws SQLException {

		movieDAO.insertReview(review);
	}

	@Override
	public List<Map<String, Object>> getMovieReview3(String movie_cd, HttpSession session) throws SQLException {
		List<Map<String, Object>> reviewList = null;
		reviewList = movieDAO.selectReview3(movie_cd);

		for(Map<String, Object> review : reviewList) {
			String reviewLikeActive = "N";
			if(session.getAttribute("loginUser") != null) {
				int count = 0;
				Map<String, Object> param = new HashMap<>();
				param.put("review_no", review.get("REVIEW_NO"));
				param.put("mem_cd", ((MemberVO)session.getAttribute("loginUser")).getMem_cd());
				count = movieDAO.selectReviewLikeYN(param);
				if(count > 0) {
					reviewLikeActive = "Y";
				}
			}
			review.put("reviewLikeActive", reviewLikeActive);
		}
		
		
		return reviewList;
	}

	@Override
	public void reviewLike(String review_no, String mem_cd) throws SQLException {
		Map<String, String> param = new HashMap<>();
		param.put("review_no", review_no);
		param.put("mem_cd", mem_cd);
		
		movieDAO.insertReviewLike(param);
	}

	@Override
	public void reviewLikeDel(String review_no, String mem_cd) throws SQLException {
		Map<String, String> param = new HashMap<>();
		param.put("review_no", review_no);
		param.put("mem_cd", mem_cd);
		
		movieDAO.deleteReviewLike(param);
		
	}

	@Override
	public String reviewReport(int review_no, String mem_cd) throws SQLException {
		String result = "S";
		Map<String, Object> param = new HashMap<>();
		param.put("review_no", review_no);
		param.put("mem_cd", mem_cd);
		
		int cnt = 0;
		cnt = movieDAO.reviewReportYN(param);
		
		if(cnt > 0) {
			result = "F";
		}else {
			movieDAO.insertReviewReport(param);
		}
		
		return result;
		
	}

	@Override
	public void updateReview(ReviewVO review) throws SQLException {
		movieDAO.updateReview(review);
		
	}

	@Override
	public List<String> getMemLikeGenre(String mem_cd) throws SQLException {
		List<String> memLikeGenreList = null;
		memLikeGenreList = movieDAO.selectMemLikeGenre(mem_cd);
		
		return memLikeGenreList;
	}

	@Override
	public Map<String, Object> getAllMovieReview(HttpSession session, SearchCriteria cri) throws SQLException {
		List<Map<String, Object>> reviewList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		reviewList = movieDAO.getAllMovieReview(cri, rowBounds);
		
		int totalCount = movieDAO.getSearchReviewListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("reviewList", reviewList);
		dataMap.put("pageMaker", pageMaker);
		
		
		for(Map<String, Object> review : reviewList) {
			String reviewLikeActive = "N";
			if(session.getAttribute("loginUser") != null) {
				int count = 0;
				Map<String, Object> param = new HashMap<>();
				param.put("review_no", review.get("REVIEW_NO"));
				param.put("mem_cd", ((MemberVO)session.getAttribute("loginUser")).getMem_cd());
				count = movieDAO.selectReviewLikeYN(param);
				if(count > 0) {
					reviewLikeActive = "Y";
				}
			}
			review.put("reviewLikeActive", reviewLikeActive);
			System.out.println(review);

		}
		
		return dataMap;
		
	}

	public List<MoviePreviewVO> getMoviePreview(String movie_cd) throws SQLException {
		List<MoviePreviewVO> moviePreList = null;
		moviePreList = movieDAO.selectMoviePreview(movie_cd);
		return moviePreList;
	}

	@Override
	public List<MoviePictureVO> getMoviePicture(String movie_cd) throws SQLException {
		List<MoviePictureVO> moviePicList = null;
		moviePicList = movieDAO.selectMoviePicture(movie_cd);
		return moviePicList;
	}

	@Override
	public double getMovieRateAvg(String movie_cd) throws SQLException {
		double movie_rate_avg = 0.0;
		movie_rate_avg = movieDAO.selectMovieRateAvg(movie_cd);
		
		return movie_rate_avg;
	}

	@Override
	public List<Map<String, Object>> searchReview(String keyword, HttpSession session) throws SQLException {
		List<Map<String, Object>> reviewList = null;
		reviewList = movieDAO.searchReview(keyword);
		
		for(Map<String, Object> review : reviewList) {
			String reviewLikeActive = "N";
			if(session.getAttribute("loginUser") != null) {
				int count = 0;
				Map<String, Object> param = new HashMap<>();
				param.put("review_no", review.get("REVIEW_NO"));
				param.put("mem_cd", ((MemberVO)session.getAttribute("loginUser")).getMem_cd());
				count = movieDAO.selectReviewLikeYN(param);
				if(count > 0) {
					reviewLikeActive = "Y";
				}
			}
			review.put("reviewLikeActive", reviewLikeActive);
			System.out.println(review);
		
		}
		return reviewList;
	}
	@Override
	public List<Map<String, Object>> getMoviePost4(String movie_cd) throws SQLException {
		List<Map<String, Object>> allMoviePostList = null;
		allMoviePostList = movieDAO.selectMoviePostMap(movie_cd);
		
		int cnt = 4;
		if(allMoviePostList.size() < 4) {
			cnt = allMoviePostList.size();
		}
		
		List<Map<String, Object>> moviePostList = new ArrayList<Map<String, Object>>();
		if(cnt > 0) {
			for(int i = 0; i < cnt; i++) {
				moviePostList.add(allMoviePostList.get(i));
			}
		}
		
		return moviePostList;
	}

	@Override
	public Map<String, Object> getMoviePost(SearchCriteria cri, HttpSession session) throws SQLException {
		
		List<Map<String, Object>> moviePostList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		moviePostList = movieDAO.selectSearchMoviePostList(cri, rowBounds);
		
		int totalCount = movieDAO.selectSearchMoviePostcnt(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("moviePostList", moviePostList);
		dataMap.put("pageMaker", pageMaker);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		
		if(member != null) {
			String mem_cd = member.getMem_cd();
			List<MovieVO> watchMovie = null;
			watchMovie = movieDAO.selectMovieCode(mem_cd);
			dataMap.put("watchMovie", watchMovie);
		}
		
		return dataMap;
	}

	@Override
	public List<Map<String, Object>> selectMovieInfo(String mem_cd) throws SQLException {
		return movieDAO.selectMovieInfo(mem_cd);
	}

	@Override
	public void registMoviePost(MoviePostVO moviePost) throws SQLException {
		movieDAO.insertMoviePost(moviePost);
		
		
	}

	@Override
	public Map<String, Object> getMoivePostView(int mpost_no, String mem_cd) throws SQLException {
		Map<String, Object> mpostMap = new HashMap<>();
		Map<String, Object> mpost = null;
		mpost = movieDAO.selectMoviePostView(mpost_no);
		
		System.out.println(mpost);
		
		mpostMap.put("mpost", mpost);
		
		List<Map<String, Object>> mpostReplyList = null;
		mpostReplyList = movieDAO.selectMoviePostReply(mpost_no);
		
		
		mpostMap.put("mpostReplyList", mpostReplyList);
		

		String likeYN = "N";
		int likeYnCnt = 0;
		
		if(!mem_cd.equals("")) {
			Map<String, Object> param = new HashMap<>();
			param.put("mem_cd", mem_cd);
			param.put("mpost_no", mpost_no);
			likeYnCnt = movieDAO.selectMemMpostLikeYN(param);
			if(likeYnCnt > 0) {
				likeYN = "Y";
			}
		}
		mpostMap.put("likeYN", likeYN);
		return mpostMap;
	}

	@Override
	public Map<String, Object> registReply(ReplyVO reply) throws SQLException {
		Map<String, Object> replyMap = null;
		
		movieDAO.insertReply(reply);
		int reply_no = reply.getReply_no();
		
		replyMap = movieDAO.selectRegReply(reply_no);
		return replyMap;
	}

	@Override
	public void clickMoviePostLike(int mpost_no, String mem_cd) throws SQLException {
		Map<String, Object> param = new HashMap<>();
		param.put("mpost_no", mpost_no);
		param.put("mem_cd", mem_cd);
		int cnt = 0;
		cnt = movieDAO.selectMemMpostLikeYN(param);
		if(cnt == 0) {
			movieDAO.insertMoviePostLike(param);
		}else {
			movieDAO.deleteMoviePostLike(param);
		}
		
		
	}


}
