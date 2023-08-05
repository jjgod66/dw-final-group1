package kr.or.dw.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.MovieRegistCommand;
import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.SysAdminDAO;
import kr.or.dw.vo.AdminVO;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.FaqVO;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.QnaVO;
import kr.or.dw.vo.TheaterVO;
import kr.or.dw.vo.WinnerBoardVO;

public class SysAdminServiceImpl implements SysAdminService {

	@Autowired
	private SysAdminDAO sysAdminDAO;
	
	@Override
	public Map<String, Object> selectTheaterList(SearchCriteria cri) throws SQLException {
		
		List<TheaterVO> theaterList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		theaterList = sysAdminDAO.selectSearchTheaterList(cri, rowBounds);
		
		int totalCount = sysAdminDAO.selectSearchTheaterListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("theaterList", theaterList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<String> selectLocList() throws SQLException {
		List<String> locList = null;
		
		locList = sysAdminDAO.selectLocList();
		
		return locList;
	}

	@Override
	public void theaterRegist(TheaterVO thr) throws SQLException {
		AdminVO adminVO = new AdminVO();
		adminVO.setAdmin_id(thr.getAdmin_id());
		adminVO.setAdmin_pwd(thr.getAdmin_pwd());
		adminVO.setThr_name(thr.getThr_name());
		System.out.println("NEW ADMIN : " + adminVO);
		sysAdminDAO.insertAdmin(adminVO);
		thr.setAdmin_cd(adminVO.getAdmin_cd());
		sysAdminDAO.insertTheater(thr);
	}

	@Override
	public TheaterVO selectTheaterByName(String thr_name) throws SQLException {
		TheaterVO thr = null;
		
		thr = sysAdminDAO.selectTheaterByName(thr_name);
		
		return thr;
	}

	@Override
	public void theaterModify(TheaterVO thr) throws SQLException {
		AdminVO adminVO = new AdminVO();
		adminVO.setAdmin_id(thr.getAdmin_id());
		adminVO.setAdmin_pwd(thr.getAdmin_pwd());
		adminVO.setThr_name(thr.getThr_name());
		System.out.println(thr);
		System.out.println(adminVO);
		sysAdminDAO.updateAdmin(adminVO);
		sysAdminDAO.updateTheater(thr);
	}

	@Override
	public void theaterDelete(TheaterVO thr) throws SQLException {
		if (thr.getGb_del().equals("N")) {
			sysAdminDAO.updateDelTheater(thr);
		} else if (thr.getGb_del().equals("Y")) {
			sysAdminDAO.updateUndelTheater(thr);
		}
	}

	@Override
	public List<GenreVO> selectGenreList() throws SQLException {
		List<GenreVO> genreList = null;
		
		genreList = sysAdminDAO.selectGenreList();
		
		return genreList;
	}

	@Override
	public List<String> selectGradeList() throws SQLException {
		List<String> gradeList = null;
		
		gradeList = sysAdminDAO.selectGradeList();
		
		return gradeList;
	}

	@Override
	public void registMovie(MovieVO movie) throws SQLException {
		sysAdminDAO.insertMovie(movie);
	}

	@Override
	public void registMovieGenre_c(String[] genres, String movie_cd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String genre : genres) {
			map.put("genre", genre);
			sysAdminDAO.insertGenre_c(map);
		}
	}

	@Override
	public void registMovieType_c(List<String> movie_types, String movie_cd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String movie_type : movie_types) {
			map.put("movie_type_cd", movie_type);
			sysAdminDAO.insertMovieType_c(map);
		}
	}

	@Override
	public void registMoviePic(List<String> movie_pics, String movie_cd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String pic : movie_pics) {
			map.put("movie_pic_path", pic);
			sysAdminDAO.insertMoviePic(map);
		}
	}

	@Override
	public void registMoviePre(List<String> movie_pres, String movie_cd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String pre : movie_pres) {
			map.put("movie_pre_path", pre);
			sysAdminDAO.insertMoviePre(map);
		}
		
	}

	@Override
	public Map<String, Object> selectMovieList(SearchCriteria cri) throws SQLException {
		List<Map<String, Object>> movieList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		movieList = sysAdminDAO.selectSearchMovieList(cri, rowBounds);
		
		for (Map<String, Object> movie : movieList) {
			String movie_cd = (String)movie.get("MOVIE_CD");
			double reserveRatio = sysAdminDAO.selectReservRatio(movie_cd);
			movie.put("reserveRatio", reserveRatio);
		}
		int totalCount = sysAdminDAO.selectSearchMovieListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("movieList", movieList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectMovieByMovie_cd(String movie_cd) throws SQLException {
		//영화 기본정보
		Map<String, Object> movie = sysAdminDAO.selectMovieByMovie_cd(movie_cd);
		//영화 장르
		List<String> movieGenreList = sysAdminDAO.selectGenreByMovie_cd(movie_cd);
		movie.put("movieGenreList", movieGenreList);
		//영화 타입
		List<String> movieTypeListBefore = sysAdminDAO.selectTypeByMovie_cd(movie_cd);
		Set<String> set = new HashSet<>();
		for (String movieType : movieTypeListBefore) {
			set.add(movieType.substring(0, 2));
			set.add(movieType.substring(2));
		}
		List<String> movieTypeListAfter = new ArrayList<String>(set);
		movie.put("movieTypeList", movieTypeListAfter);
		//영화 관련 사진
		List<Map<String, Object>> movieImgList = sysAdminDAO.selectMoiveImgByMovie_cd(movie_cd);
		movie.put("movieImgList", movieImgList);
		return movie;
	}

	@Override
	public void modifyMovie(MovieVO movie) throws SQLException {
		sysAdminDAO.updateMovie(movie);
	}

	@Override
	public void modifyMovieGenre_c(String[] genres, String movie_cd) throws SQLException {
		sysAdminDAO.deleteMovieGenre_c(movie_cd);
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String genre : genres) {
			map.put("genre", genre);
			sysAdminDAO.insertGenre_c(map);
		}
	}

	@Override
	public void modifyMovieType_c(List<String> movie_types, String movie_cd) throws SQLException {
		sysAdminDAO.deleteMovieType_c(movie_cd);
		Map<String, String> map = new HashMap<>();
		map.put("movie_cd", movie_cd);
		for (String movie_type : movie_types) {
			map.put("movie_type_cd", movie_type);
			sysAdminDAO.insertMovieType_c(map);
		}
	}

	@Override
	public String selectMovieDelImgByPno(int pno) throws SQLException {
		
		return sysAdminDAO.selectMovieDelImgByPno(pno);
	}

	@Override
	public void deleteMovieImg(int pno) throws SQLException {
		sysAdminDAO.deleteMovieImg(pno);
	}

	@Override
	public String selectMovieDelVideoByPno(int pno) throws SQLException {
		return sysAdminDAO.selectMovieDelVideoByPno(pno);
	}

	@Override
	public void deleteMovieVideo(int pno) throws SQLException {
		sysAdminDAO.deleteMovieVideo(pno);
	}

	@Override
	public List<Map<String, Object>> selectMoiveVideoByMovie_cd(String movie_cd) throws SQLException {
		List<Map<String, Object>> selectMoiveVideoByMovie_cd = null;
		
		selectMoiveVideoByMovie_cd = sysAdminDAO.selectMoiveVideoByMovie_cd(movie_cd);
		
		return selectMoiveVideoByMovie_cd;
	}

	@Override
	public void registProduct(ProductVO product) throws SQLException {
		sysAdminDAO.insertProduct(product);
	}

	@Override
	public void modifyProduct(ProductVO product) throws SQLException {
		sysAdminDAO.updateProduct(product);
	}

	@Override
	public Map<String, Object> selectNoticeList(SearchCriteria cri) throws SQLException {
		List<NoticeVO> noticeList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		noticeList = sysAdminDAO.selectNoticeList(cri, rowBounds);
		
		int totalCount = sysAdminDAO.selectSearchNoticeListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public NoticeVO selectNoticeByNotice_no(int notice_no) throws SQLException {
		NoticeVO notice = sysAdminDAO.selectNoticeByNotice_no(notice_no);
		return notice;
	}

	@Override
	public void registNotice(NoticeVO notice) throws SQLException {
		sysAdminDAO.insertNotice(notice);
	}

	@Override
	public void modifyNotice(NoticeVO notice) throws SQLException {
		sysAdminDAO.updateNotice(notice);
	}

	@Override
	public void deleteNotice(NoticeVO notice) throws SQLException {
		sysAdminDAO.deleteNotice(notice);
		
	}

	@Override
	public Map<String, Object> selectFaqList(SearchCriteria cri) throws SQLException {
		List<FaqVO> faqList = null;
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		faqList = sysAdminDAO.selectFaqList(cri, rowBounds);
		
		int totalCount = sysAdminDAO.selectSearchFaqListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("faqList", faqList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public void modifyFaq(FaqVO faq) throws SQLException {
		sysAdminDAO.updateFaq(faq);
	}

	@Override
	public void deleteFaq(FaqVO faq) throws SQLException {
		sysAdminDAO.deleteFaq(faq);
	}

	@Override
	public void registFaq(FaqVO faq) throws SQLException {
		sysAdminDAO.insertFaq(faq);
	}

	@Override
	public Map<String, Object> selectQnaList(SearchCriteria cri) throws SQLException {
		List<QnaVO> qnaList = null;
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		qnaList = sysAdminDAO.selectQnaList(cri, rowBounds);
		
		int totalCount = sysAdminDAO.selectSearchQnaListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("qnaList", qnaList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public QnaVO selectQnaByQue_no(int que_no) throws SQLException {
		QnaVO qna = sysAdminDAO.selectQnaByQue_no(que_no);
		return qna;
	}

	@Override
	public AnswerVO selectAnsByQue_no(int que_no) throws SQLException {
		AnswerVO ans = sysAdminDAO.selectAnsByQue_no(que_no);
		return ans;
	}

	@Override
	public void registAns(AnswerVO ans) throws SQLException {
		sysAdminDAO.insertAns(ans);
	}

	@Override
	public void modifyAns(AnswerVO ans) throws SQLException {
		sysAdminDAO.updateAns(ans);
	}

	@Override
	public Map<String, Object> selectEventList(SearchCriteria cri) throws SQLException {

		List<EventVO> eventList = null;
		eventList = sysAdminDAO.selectEventList(cri);
		
		int totalCount = sysAdminDAO.selectSearchEventListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("eventList", eventList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public Map<String, Object> selectEventListForMain() throws SQLException {
		
		List<EventVO> movEventList = sysAdminDAO.selectmovEventList();
		List<EventVO> thrEventList = sysAdminDAO.selectThrEventList();
		List<EventVO> actorEventList = sysAdminDAO.selectactorEventList();
		
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("movEventList", movEventList);
		dataMap.put("thrEventList", thrEventList);
		dataMap.put("actorEventList", actorEventList);
		return dataMap;
		
	}

	@Override
	public void registEvent(EventVO event) throws SQLException {
		sysAdminDAO.insertEvent(event);
		
	}

	@Override
	public EventVO selectEventByEvent_no(int event_no) throws SQLException {
		EventVO event = sysAdminDAO.selectEventByEvent_no(event_no);
		return event;
	}

	@Override
	public void modifyEventContent(Map<String, Object> modifyEventContentMap) throws SQLException {
		sysAdminDAO.updateEventContent(modifyEventContentMap);
	}

	@Override
	public void modifyEvent(EventVO event) throws SQLException {
		sysAdminDAO.updateEvent(event);
		
	}

	@Override
	public void deleteEvent(int event_no) throws SQLException {
		sysAdminDAO.deleteEvent(event_no);
		
	}

	@Override
	public Map<String, Object> selectEventListforPast(SearchCriteria cri) throws SQLException {
		
		List<EventVO> eventList = null;
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		eventList = sysAdminDAO.selectEventListforPast(cri, rowBounds);
		
		int totalCount = sysAdminDAO.selectEventListforPastCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("eventList", eventList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void registWinnerBoard(WinnerBoardVO wb) throws SQLException {
		sysAdminDAO.insertWinnerBoard(wb);
	}

	@Override
	public WinnerBoardVO selectWbByEvent_no(int event_no) throws SQLException {
		return sysAdminDAO.selectWbByEvent_no(event_no);
	}

	@Override
	public void modifyWinnerBoard(WinnerBoardVO wb) throws SQLException {
		sysAdminDAO.updateWinnerBoard(wb);
	}

	@Override
	public void deleteWinnerBoard(WinnerBoardVO wb) throws SQLException {
		sysAdminDAO.deleteWinnerBoard(wb);
	}

	@Override
	public List<NoticeVO> selectNoticeForMain() throws SQLException {
		return sysAdminDAO.selectNoticeForMain();
	}

	@Override
	public List<QnaVO> selectQnaForMain() throws SQLException {
		return sysAdminDAO.selectQnaForMain();
	}

	@Override
	public List<EventVO> selectEventForMain() throws SQLException {
		return sysAdminDAO.selectEventForMainPage();
	}

	@Override
	public List<MovieVO> selectCurrentMovieForMain() throws SQLException {
		return sysAdminDAO.selectCurrentMovieForMain();
	}

	@Override
	public Map<String, Object> selectMemberList(SearchCriteria cri) throws SQLException {
		
		List<MemberVO> memberList = null;
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum(); 
		RowBounds rowBounds = new RowBounds(offset, limit);
		memberList = sysAdminDAO.selectMemberList(cri, rowBounds);
		
		int totalCount = sysAdminDAO.selectMemberListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("memberList", memberList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
		
	}

	@Override
	public Map<String, Object> selectMemberByMem_cd(String mem_cd) throws SQLException {
		return sysAdminDAO.selectMemberByMem_cd(mem_cd);
	}


	@Override
	public List<Map<String, Object>> selectWatchedMoviePreviewListByMem_cd(String mem_cd) throws SQLException {
		return sysAdminDAO.selectWatchedMoviePreviewListByMem_cd(mem_cd);
	}

	@Override
	public List<Map<String, Object>> selectReviewPreviewListByMem_cd(String mem_cd) throws SQLException {
		return sysAdminDAO.selectReviewPreviewListByMem_cd(mem_cd);
	}

	@Override
	public List<Map<String, Object>> selectMpPreviewListByMem_cd(String mem_cd) throws SQLException {
		return sysAdminDAO.selectMpPreviewListByMem_cd(mem_cd);
	}

	@Override
	public List<Map<String, Object>> selectMpReplyPreviewListByMem_cd(String mem_cd) throws SQLException {
		return sysAdminDAO.selectMpReplyPreviewListByMem_cd(mem_cd);
	}
	
	@Override
	public List<Map<String, Object>> selectWatchedMovieListByMem_cd(String mem_cd) throws SQLException {
		return sysAdminDAO.selectWatchedMovieListByMem_cd(mem_cd);
	}

	@Override
	public List<Map<String, Object>> selectReviewListByMem_cd(String mem_cd) throws SQLException {
		return sysAdminDAO.selectReviewListByMem_cd(mem_cd);
	}
	
	@Override
	public List<Map<String, Object>> selectMpListByMem_cd(String mem_cd) throws SQLException {
		return sysAdminDAO.selectMpListByMem_cd(mem_cd);
	}

	@Override
	public List<Map<String, Object>> selectMpReplyListByMem_cd(String mem_cd) throws SQLException {
		return sysAdminDAO.selectMpReplyListByMem_cd(mem_cd);
	}

	@Override
	public void banMember(String mem_cd) throws SQLException {
		sysAdminDAO.banMember(mem_cd);
		
	}

	@Override
	public void cancelBanMember(String mem_cd) throws SQLException {
		sysAdminDAO.cancelBanMember(mem_cd);
	}

	@Override
	public List<Map<String, Object>> selectMovieListForEventRegist() throws SQLException {
		return sysAdminDAO.selectMovieListForEventRegist();
	}

}
