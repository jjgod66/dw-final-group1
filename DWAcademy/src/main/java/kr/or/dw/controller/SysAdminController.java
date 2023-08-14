package kr.or.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.UrlResource;
import org.springframework.core.io.support.ResourceRegion;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRange;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.MediaTypeFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import kr.or.dw.command.EventModifyCommand;
import kr.or.dw.command.EventRegistCommand;
import kr.or.dw.command.MovieModifyCommand;
import kr.or.dw.command.MovieRegistCommand;
import kr.or.dw.command.ProductModifyCommand;
import kr.or.dw.command.ProductRegistCommand;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.CommonAdminService;
import kr.or.dw.service.StoreService;
import kr.or.dw.service.SysAdminService;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.FaqVO;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MoviePostVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.QnaAttachVO;
import kr.or.dw.vo.QnaVO;
import kr.or.dw.vo.ReplyVO;
import kr.or.dw.vo.ReviewVO;
import kr.or.dw.vo.TheaterVO;
import kr.or.dw.vo.WinnerBoardVO;

@Controller
@RequestMapping("/sysAdmin")
public class SysAdminController {

	private static final Logger logger = LoggerFactory.getLogger(SysAdminController.class);
	
	@Autowired
	private SysAdminService sysAdminService;
	
	@Autowired
	private CommonAdminService commonAdminService;
	
	@Autowired
	private StoreService storeService;
	
	@Resource(name ="moviePicUploadPath")
	private String moviePicUploadPath;
	
	@Resource(name ="storePicUploadPath")
	private String storePicUploadPath;
	
	@Resource(name ="eventPicUploadPath")
	private String eventPicUploadPath;
	
	@Resource(name ="memberPicUploadPath")
	private String memberPicUploadPath;
	
	@RequestMapping("/main")
	public ModelAndView sysAdminIndex(ModelAndView mnv, HttpServletRequest req) throws SQLException {
		
		String url = "/sysAdmin/main";
		
		HttpSession session = req.getSession();
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
		String admin_cd = (String) admin.get("CD");
		
		List<MovieVO> currentMovieList = sysAdminService.selectCurrentMovieForMain();
		mnv.addObject("currentMovieList", currentMovieList);
		
		List<NoticeVO> noticeList = sysAdminService.selectNoticeForMain();
		mnv.addObject("noticeList", noticeList);
		List<QnaVO> qnaList = sysAdminService.selectQnaForMain();
		mnv.addObject("qnaList", qnaList);
		List<EventVO> eventList = sysAdminService.selectEventForMain();
		mnv.addObject("eventList", eventList);
		
		int unreadedNoteCnt = commonAdminService.selectUnreadedNoteCnt(admin_cd);
		mnv.addObject("unreadedNoteCnt", unreadedNoteCnt);
		session.setAttribute("unreadedNoteCnt", unreadedNoteCnt);
		
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/theaterAdminMain")
	public ModelAndView placeAdmin(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		
		String url = "/sysAdmin/theaterAdminMain";
		
		Map<String, Object> dataMap = sysAdminService.selectTheaterList(cri);
		mnv.addAllObjects(dataMap);
		Map<String, Object> subjectMap = addSubject("HOME", "지점 관리", "지점 리스트", url+".do");
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/theaterRegistForm")
	public ModelAndView theaterRegistForm(ModelAndView mnv, String thr_name) throws SQLException {
		
		String url = "/sysAdmin/theaterRegist";
		Map<String, Object> subjectMap = new HashMap<String, Object>(); 
		 
		if (thr_name != null) {	// 수정일 때
			TheaterVO thr = sysAdminService.selectTheaterByName(thr_name);
			mnv.addObject("thr", thr);
			subjectMap = addSubject("HOME", "지점 관리", "지점 수정", url+"Form.do?thr_name="+thr_name);
		} else {				// 등록일 때
			subjectMap = addSubject("HOME", "지점 관리", "지점 등록", url+"Form.do");
		}
		
		List<String> locList = sysAdminService.selectLocList();
		
		mnv.addAllObjects(subjectMap);
		mnv.addObject("locList", locList);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping("/theaterRegist")
	public void theaterRegist(TheaterVO thr, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.theaterRegist(thr);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('새 지점이 등록되었습니다.')");
		out.println("location.href='theaterAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/theaterModify")
	public void theaterModify (TheaterVO thr, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.theaterModify(thr);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('지점이 수정되었습니다.')");
		out.println("location.href='theaterAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	
	}
	
	@RequestMapping("/theaterDelete")
	public void theaterDelete (TheaterVO thr, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		String result = "비활성화";
		if  (thr.getGb_del().equals("Y")) {
			result = "활성화";
		}

		sysAdminService.theaterDelete(thr);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('지점이 "+result+"되었습니다.')");
		out.println("location.href='theaterAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/movieAdminMain")
	public ModelAndView movieAdmin(ModelAndView mnv, SearchCriteria cri) throws SQLException, IOException {
		String url = "/sysAdmin/movieAdminMain";
		cri.setPerPageNum("12");
		System.out.println(cri);
		System.out.println("keyword : " + cri.getKeyword());
		Map<String, Object> dataMap = sysAdminService.selectMovieList(cri);
		List<Map<String, Object>> movieList = (List<Map<String, Object>>)dataMap.get("movieList");
		
		dataMap.put("movieList", movieList);
		mnv.addAllObjects(dataMap);
		
		
		Map<String, Object> subjectMap = addSubject("HOME", "영화 관리", "영화 리스트", url+".do");
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/movieRegistForm")
	public ModelAndView movieRegist(ModelAndView mnv, String movie_cd) throws SQLException {
		
		String url ="/sysAdmin/movieRegist";
		Map<String, Object> subjectMap = new HashMap<String, Object>(); 
		
		
		if (movie_cd != null) {	// 수정일 때
			subjectMap = addSubject("HOME", "영화 관리", "영화 상세정보 수정", url+"Form.do?movie_cd="+movie_cd);
			Map<String, Object> movie = sysAdminService.selectMovieByMovie_cd(movie_cd);
			List<Map<String, Object>> movieVideoList = sysAdminService.selectMoiveVideoByMovie_cd(movie_cd);
			movie.put("movieVideoList", movieVideoList);
			mnv.addAllObjects(movie);
		} else {				// 등록일 때
			subjectMap = addSubject("HOME", "영화 관리", "영화 등록", url+"Form.do");
		}
		
		List<GenreVO> genreList = sysAdminService.selectGenreList();
		List<String> gradeList = sysAdminService.selectGradeList();
		
		mnv.addObject("genreList", genreList);
		mnv.addObject("gradeList", gradeList);
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/movieRegist")
	public void movieRegist (MovieRegistCommand registReq, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String moviePicUploadPath = this.moviePicUploadPath;
		
		MovieVO movie = registReq.toMovieVO();
		
		// 영화 테이블에 등록
		sysAdminService.registMovie(movie);
		
		// 영화 장르테이블에 등록
		String[] genres = registReq.getGenre_cd();
		String movie_cd = movie.getMovie_cd();
		sysAdminService.registMovieGenre_c(genres, movie_cd);
		
		// 영화 타입 테이블에 등록
		List<String> movie_types = new ArrayList<String>();
		for (String dub : registReq.getIsdub()) {
			for (String dim : registReq.getIs3d()) {
				movie_types.add(dub.concat(dim));
			}
		}
		sysAdminService.registMovieType_c(movie_types, movie_cd);
		
		// 관련 이미지파일 이름 DB에 저장
		List<String> movie_pics = new ArrayList<>();
		if(registReq.getUploadImg() != null) {
			
			for ( MultipartFile pic : registReq.getUploadImg()) {
				movie_pics.add(pic.getOriginalFilename());
			}
			sysAdminService.registMoviePic(movie_pics, movie_cd);
		}
		
		// 관련 예고편파일 이름 DB에 저장
		List<String> movie_pres = new ArrayList<>();
		if(registReq.getUploadVideo() != null) {
				
			for ( MultipartFile pre : registReq.getUploadVideo()) {
				movie_pres.add(pre.getOriginalFilename());
			}
			sysAdminService.registMoviePre(movie_pres, movie_cd);
		}
		
		// 포스터 이미지파일 로컬에 저장
		MultipartFile poster = registReq.getMovie_mainPic_path();
		if (poster != null) {
			String fileName = poster.getOriginalFilename();
			File target = new File(moviePicUploadPath  + File.separator + movie_cd + File.separator + "mainPoster", fileName);
			
			if (!target.exists()) {
				target.mkdirs();
			}
			
			poster.transferTo(target);
		}
		
		// 관련 이미지파일 로컬에 저장
		if (registReq.getUploadImg() != null) {
			for (MultipartFile multi : registReq.getUploadImg()) {
				String fileName = multi.getOriginalFilename();
				File target = new File(moviePicUploadPath  + File.separator + movie_cd + File.separator + "pictures", fileName);
				
				if (!target.exists()) {
					target.mkdirs();
				}
				
				multi.transferTo(target);
			}
		}
		
		// 관련 동영상파일 로컬에  저장
		if (registReq.getUploadVideo() != null) {
			for (MultipartFile multi : registReq.getUploadVideo()) {
				String fileName = multi.getOriginalFilename();
				File target = new File(moviePicUploadPath  + File.separator + movie_cd + File.separator + "videos", fileName);
				
				if (!target.exists()) {
					target.mkdirs();
				}
				
				multi.transferTo(target);
			}
		}
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('영화 등록이 완료되었습니다.')");
		out.println("location.href='movieAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/movieModify")
	public void movieModify (MovieModifyCommand modifyReq, HttpServletResponse res) throws Exception {
		MovieVO movie = modifyReq.toParseMovie();
		
		// 포스터 수정 + 로컬 파일 수정
		String fileName = savePicture(modifyReq.getMovie_mainPic_path(), modifyReq.getOldPicture(), modifyReq.getMovie_cd(), "moviePoster");
		movie.setMovie_mainpic_path(fileName);
		
		if (modifyReq.getMovie_mainPic_path().isEmpty()) {
			movie.setMovie_mainpic_path(modifyReq.getOldPicture());
		}
		
		sysAdminService.modifyMovie(movie);
		
		// 장르 수정
		String[] genres = modifyReq.getGenre_cd();
		String movie_cd = movie.getMovie_cd();
		sysAdminService.modifyMovieGenre_c(genres, movie_cd);
		
		// 영화 타입 수정
		List<String> movie_types = new ArrayList<String>();
		for (String dub : modifyReq.getIsdub()) {
			for (String dim : modifyReq.getIs3d()) {
				movie_types.add(dub.concat(dim));
			}
		}
		sysAdminService.modifyMovieType_c(movie_types, movie_cd);
		
		// 영화 관련 사진 수정
		// 삭제된 파일을 로컬 서버에서 삭제
		if (modifyReq.getDeleteImg() != null && modifyReq.getDeleteImg().length > 0) {
			for (int pno : modifyReq.getDeleteImg()) {
				String imgName = sysAdminService.selectMovieDelImgByPno(pno);
				File deleteFile = new File(moviePicUploadPath  + File.separator + movie_cd + File.separator + "pictures" , imgName);
				if (deleteFile.exists()) {
					deleteFile.delete();
				}
				sysAdminService.deleteMovieImg(pno);
			}
		}
		// 관련 이미지파일 이름 DB에 저장
		List<String> movie_pics = new ArrayList<>();
		
		for ( MultipartFile pic : modifyReq.getUploadImg()) {
			if (pic != null && pic.getOriginalFilename() != "") {
				movie_pics.add(pic.getOriginalFilename());
			}
		}
		sysAdminService.registMoviePic(movie_pics, movie_cd);
		// 관련 이미지파일 로컬에 저장
		if (modifyReq.getUploadImg() != null) {
			for (MultipartFile multi : modifyReq.getUploadImg()) {
				if (multi != null && multi.getOriginalFilename() != "") {
					String imgName = multi.getOriginalFilename();
					File target = new File(moviePicUploadPath  + File.separator + movie_cd + File.separator + "pictures", imgName);
					
					if (!target.exists()) {
						target.mkdirs();
					}
					
					multi.transferTo(target);
				}
			}
		}
		
		// 영화 관련 예고편 수정
		// 삭제된 파일을 로컬 서버에서 삭제
			if (modifyReq.getDeleteVideo() != null && modifyReq.getDeleteVideo().length > 0) {
				for (int pno : modifyReq.getDeleteVideo()) {
					String videoName = sysAdminService.selectMovieDelVideoByPno(pno);
					File deleteFile = new File(moviePicUploadPath  + File.separator + movie_cd + File.separator + "videos" , videoName);
					if (deleteFile.exists()) {
						deleteFile.delete();
					}
					sysAdminService.deleteMovieVideo(pno);
				}
			}
			// 관련 예고편파일 이름 DB에 저장
			if(modifyReq.getUploadVideo() != null) {
				List<String> movie_videos = new ArrayList<>();
				for ( MultipartFile video : modifyReq.getUploadVideo()) {
					if (video != null && video.getOriginalFilename() != "") {
						movie_videos.add(video.getOriginalFilename());
					}
				}
			sysAdminService.registMoviePre(movie_videos, movie_cd);
			}
			// 관련 예고편파일 로컬에 저장
			if (modifyReq.getUploadVideo() != null) {
				for (MultipartFile multi : modifyReq.getUploadVideo()) {
					if (multi != null && multi.getOriginalFilename() != "") {
						String videoName = multi.getOriginalFilename();
						File target = new File(moviePicUploadPath  + File.separator + movie_cd + File.separator + "videos", videoName);
						
						if (!target.exists()) {
							target.mkdirs();
						}
						
						multi.transferTo(target);
					}
				}
			}
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('영화 수정이 완료되었습니다.')");
			out.println("location.href='movieAdminMain.do';");
			out.println("</script>");
			out.flush();
			out.close();
			
	}
	
	@RequestMapping("/movieAdminStatistics")
	public ModelAndView movieAdminStatistics(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/sysAdmin/movieAdminStatistics";
		
		List<Map<String, Object>> theaterList = commonAdminService.selectThrList(" ");
		mnv.addObject("theaterList", theaterList);
		System.out.println(cri);
		Map<String, Object> dataMap = commonAdminService.selectStatisticsMovie(cri);
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "영화 관리", "영화 통계", url);
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/movieAdminStatistics_movie")
	public ModelAndView movieAdminStatistics_movie(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/sysAdmin/movieAdminStatistics_movie";
		
		List<Map<String, Object>> theaterList = commonAdminService.selectThrList(" ");
		mnv.addObject("theaterList", theaterList);
		System.out.println(theaterList);
		System.out.println(cri);
		Map<String, Object> dataMap = commonAdminService.selectStatisticsMovieByMovieName(cri);
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "영화 관리", "영화 통계", url);
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/storeAdminMain")
	public ModelAndView storeAdmin(ModelAndView mnv, String CategoryIdx) throws SQLException {
		String url = "/sysAdmin/storeAdminMain";
		
		List<ProductVO> productList = null;
		productList = sysAdminService.selectproductList(CategoryIdx);
		System.out.println(CategoryIdx);
		Map<String, Object> subjectMap = null;
		String item2 = "";
		if (CategoryIdx.equals("1")) {
			item2 = "기프트카드 목록";
			subjectMap = addSubject("HOME", "스토어 관리", item2, url+".do?CategoryIdx=1");
		} else if (CategoryIdx.equals("2")) {
			item2 = "팝콘/음료/굿즈 목록";
			subjectMap = addSubject("HOME", "스토어 관리", item2, url+".do?CategoryIdx=2");
		}
		mnv.addAllObjects(subjectMap);
		mnv.addObject("productList", productList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("storeAdminDetail")
	public ModelAndView storeAdminDetail (ModelAndView mnv, String product_cd) throws SQLException {
		String url = "/sysAdmin/storeAdminDetail";
		
		ProductVO product = new ProductVO();
		product = storeService.selectProDetail(product_cd);
		
		mnv.addObject("product", product);
		
		Map<String, Object> subjectMap = addSubject("HOME", "스토어 관리", "상품 상세", url+".do?product_cd="+product_cd);
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("storeAdminProductRegistForm")
	public ModelAndView storeAdminProductRegist(ModelAndView mnv, String product_cd) throws SQLException {
		String url = "/sysAdmin/storeAdminProductRegist";
		Map<String, Object> subjectMap = null;
		if (product_cd != null) {
			subjectMap = addSubject("HOME", "스토어 관리", "상품 수정", url+"Form.do?product_cd="+product_cd);
			ProductVO product = null;
			product = storeService.selectProDetail(product_cd);
			
			mnv.addObject("product", product);
		} else {
			subjectMap = addSubject("HOME", "스토어 관리", "상품 등록", url+".do");
		}
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("storeAdminProductRegist")
	public void storeAdminProductRegist(ProductRegistCommand registReq, HttpServletResponse res) throws SQLException, IOException {
		String storePicUploadPath = this.storePicUploadPath;
		ProductVO product = registReq.toParseProduct();
		sysAdminService.registProduct(product);
		String product_cd = product.getProduct_cd();
		// 이미지파일 로컬에 저장
		MultipartFile image = registReq.getProduct_pic_path();
		if (image != null) {
			String fileName = image.getOriginalFilename();
			
			File target = new File(storePicUploadPath  + File.separator + product_cd, fileName);
			
			if (!target.exists()) {
				target.mkdirs();
			}
			
			image.transferTo(target);
		}
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('상품 등록이 완료되었습니다.')");
		out.println("location.href='storeAdminDetail.do?product_cd=" + product_cd + "';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/storeAdminProductModify")
	public void storeAdminProductModify(ProductModifyCommand modifyReq, HttpServletResponse res) throws Exception {
		ProductVO product = modifyReq.toParseProduct();
		
		// 포스터 수정 + 로컬 파일 수정
		String fileName = savePicture(modifyReq.getProduct_pic_path(), modifyReq.getOldPicture(), modifyReq.getProduct_cd(), "productImg");
		product.setProduct_pic_path(fileName);
		
		if (modifyReq.getProduct_pic_path().isEmpty()) {
			product.setProduct_pic_path(modifyReq.getOldPicture());
		}
		
		sysAdminService.modifyProduct(product);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('상품 수정이 완료되었습니다.')");
		out.println("location.href='storeAdminDetail.do?product_cd=" + modifyReq.getProduct_cd() + "';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/storeAdminProductUnactive")
	public void storeAdminProductUnactive(ProductModifyCommand modifyReq, HttpServletResponse res) throws Exception {
		
		sysAdminService.unactiveProduct(modifyReq.getProduct_cd());
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('상품 비활성화가 완료되었습니다.')");
		out.println("location.href='storeAdminDetail.do?product_cd=" + modifyReq.getProduct_cd() + "';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/storeAdminProductActive")
	public void storeAdminProductActive(ProductModifyCommand modifyReq, HttpServletResponse res) throws Exception {
		
		sysAdminService.activeProduct(modifyReq.getProduct_cd());
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('상품 활성화가 완료되었습니다.')");
		out.println("location.href='storeAdminDetail.do?product_cd=" + modifyReq.getProduct_cd() + "';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/noticeAdminMain")
	public ModelAndView noticeAdminMain(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/sysAdmin/noticeAdminMain";
		
		Map<String, Object> dataMap = sysAdminService.selectNoticeList(cri);
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객 관리", "공지사항 메인", url+".do");
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/noticeAdminDetail")
	public ModelAndView noticeAdminDetail(ModelAndView mnv, String notice_no, String type) throws SQLException {
		String url = "/sysAdmin/noticeAdminDetail";
		if (notice_no != null) {
			NoticeVO notice = sysAdminService.selectNoticeByNotice_no(Integer.parseInt(notice_no));
			mnv.addObject("notice", notice);
		}
		mnv.addObject("type", type);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객 관리", "공지사항 게시글", url+".do?"+(notice_no == null ? "" : "notice_no="+notice_no+"&")+"type="+type);
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("noticeAdminRegist")
	public void noticeAdminRegist (NoticeVO notice, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.registNotice(notice);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('공지사항 게시물 등록이 완료되었습니다.')");
		out.println("location.href='noticeAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("noticeAdminModify")
	public void noticeAdminModify (NoticeVO notice, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.modifyNotice(notice);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('공지사항 게시물 수정이 완료되었습니다.')");
		out.println("location.href='noticeAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("noticeAdminDelete")
	public void noticeAdminDelete (NoticeVO notice, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.deleteNotice(notice);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('공지사항 게시물 삭제가 완료되었습니다.')");
		out.println("location.href='noticeAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("faqAdminMain")
	public ModelAndView faqAdminMain (ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/sysAdmin/faqAdminMain";
		
		Map<String, Object> dataMap = sysAdminService.selectFaqList(cri);
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객 관리", "FAQ 메인", url+".do");
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("faqAdminModify")
	public void faqAdminModify (FaqVO faq, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.modifyFaq(faq);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('FAQ 게시물 수정이 완료되었습니다.')");
		out.println("location.href='faqAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("faqAdminRegist")
	public void faqAdminRegist (FaqVO faq, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.registFaq(faq);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('FAQ 게시물 등록이 완료되었습니다.')");
		out.println("location.href='faqAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("faqAdminDelete")
	public void faqAdminDelete (FaqVO faq, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.deleteFaq(faq);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('FAQ 게시물 삭제가 완료되었습니다.')");
		out.println("location.href='faqAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}

	@RequestMapping("qnaAdminMain")
	public ModelAndView qnaAdminMain (ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/sysAdmin/qnaAdminMain";
		Map<String,Object> dataMap = sysAdminService.selectQnaList(cri);
		mnv.addAllObjects(dataMap);
		Map<String, Object> subjectMap = addSubject("HOME", "고객 관리", "1:1문의 메인", url+".do");
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("qnaAdminDetail")
	public ModelAndView qnaAdminDetail (ModelAndView mnv, String que_no) throws NumberFormatException, SQLException {
		String url = "/sysAdmin/qnaAdminDetail";
		
		QnaVO qna = sysAdminService.selectQnaByQue_no(Integer.parseInt(que_no));
		mnv.addObject("qna", qna);
		
		QnaAttachVO attach = sysAdminService.selectQnaAttachByQue_no(Integer.parseInt(que_no));
		if (attach != null) {
			String fileName = attach.getAttach_path().substring(attach.getAttach_path().lastIndexOf("$$") + 2);
			attach.setAttach_path(fileName);
			mnv.addObject("attach", attach);
		}
		
		AnswerVO ans = sysAdminService.selectAnsByQue_no(Integer.parseInt(que_no));
		mnv.addObject("ans", ans);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객 관리", "1:1문의 게시글", url+".do?que_no="+que_no);
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("answerRegist")
	public void answerRegist(AnswerVO ans, HttpServletResponse res) throws IOException, SQLException {
		
		sysAdminService.registAns(ans);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('답변 등록이 완료되었습니다.')");
		out.println("location.href='qnaAdminDetail.do?que_no=" + ans.getQue_no() + "';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("answerModify")
	public void answerModify(AnswerVO ans, HttpServletResponse res) throws IOException, SQLException {
		
		sysAdminService.modifyAns(ans);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('답변 수정이 완료되었습니다.')");
		out.println("location.href='qnaAdminDetail.do?que_no=" + ans.getQue_no() + "';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/eventAdminMain")
	public ModelAndView eventAdmin(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/sysAdmin/eventAdminMain";
		Map<String, Object> dataMap = sysAdminService.selectEventListForMain();
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "이벤트 관리", "진행중인 이벤트", url+".do");
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/eventAdminTypeMain")
	public ModelAndView eventAdminTypeMain(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "/sysAdmin/eventAdminTypeMain";
	
		Map<String, Object> dataMap = sysAdminService.selectEventList(cri);
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "이벤트 관리", "진행중인 이벤트", "/sysAdmin/eventAdminMain.do");
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/eventAdminDetail")
	public ModelAndView eventAdminDetail (ModelAndView mnv, String event_no, String type) throws NumberFormatException, SQLException {
		String url = "/sysAdmin/eventAdminDetail";
		
		if (event_no != null) {
			EventVO event = sysAdminService.selectEventByEvent_no(Integer.parseInt(event_no));
			mnv.addObject("event", event);
		}
		mnv.addObject("type", type);
		
		List<Map<String, Object>> movieList = sysAdminService.selectMovieListForEventRegist();
		mnv.addObject("movieList", movieList);
		
		Map<String, Object> subjectMap = addSubject("HOME", "이벤트 관리", "진행중인 이벤트", url+".do?"+(event_no == null ? "" : "event_no="+event_no+"&")+"type="+type);
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/eventAdminRegist")
	public void eventAdminRegist (EventRegistCommand registReq, HttpServletRequest req, HttpServletResponse res) throws SQLException, IllegalStateException, IOException {
		String eventPicUploadPath = this.eventPicUploadPath;
		EventVO event = registReq.toEventVO();
		
		// 이벤트 테이블에 등록
		sysAdminService.registEvent(event);
		int event_no = event.getEvent_no();
		String newContent = registReq.getEvent_content().replace("/common/getTempImg.do?fileName="+registReq.getOldFileName() 
																 ,"/common/getPicture.do?name="+registReq.getEvent_pic_path()+"&item_cd="+event_no+"&type=eventImg");
		
		// event_content 안에 이미지 경로를 재설정해준다.(temp에서 진짜위치로)
		Map<String, Object> modifyEventContentMap = new HashMap<>();
		modifyEventContentMap.put("event_no", event_no);
		modifyEventContentMap.put("newContent", newContent);
		sysAdminService.modifyEventContent(modifyEventContentMap);
		
		// 이벤트 썸네일 로컬에 저장
		MultipartFile thumb = registReq.getEvent_thum_path();
		if (thumb != null) {
			String fileName = thumb.getOriginalFilename();
			File target = new File(eventPicUploadPath + File.separator + event.getEvent_no() + File.separator + "thumb", fileName);
			
			if (!target.exists()) {
				target.mkdirs();
			}
			
			thumb.transferTo(target);
		}
		
		// 이벤트 이미지 로컬에 저장
		if (registReq.getEvent_pic_path() != null && registReq.getEvent_pic_path() != "") {
			String fileName = event.getEvent_pic_path();
			File oldFile = new File(eventPicUploadPath + File.separator + "temp", registReq.getOldFileName());
			File newFilePath = new File(eventPicUploadPath + File.separator + event.getEvent_no() + File.separator + "img");
			if (!newFilePath.exists()) {
				newFilePath.mkdirs();
			}
			boolean renameTo = oldFile.renameTo(new File(newFilePath, fileName));
		}
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('이벤트 등록이 완료되었습니다.')");
		out.println("location.href='eventAdminDetail.do?type=read&event_no=" + event_no + "'");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/eventAdminModify")
	public void eventAdminModify (EventModifyCommand modifyReq, HttpServletRequest req, HttpServletResponse res) throws SQLException, IllegalStateException, IOException {
		
		String eventPicUploadPath = this.eventPicUploadPath;
		System.out.println(modifyReq);
		
		// 새 썸네일 파일이 없다면 event_thum_path 를 null로 설정
		if (modifyReq.getEvent_thum_path().getSize() == 0) {
			modifyReq.setEvent_thum_path(null);
		}
		
		EventVO event = modifyReq.toEventVO();
		System.out.println(event);
		
		// 새 썸네일 파일이 있다면
		if (!modifyReq.getRemoveFileName().equals("")) {
			event.setEvent_thum_path(modifyReq.getEvent_thum_path().getOriginalFilename());
		}
		
		sysAdminService.modifyEvent(event);
		
		int event_no = event.getEvent_no();
		Map<String, Object> modifyEventContentMap = new HashMap<>();
		if (modifyReq.getEvent_content().contains("/common/getTempImg.do?fileName=")) {
			String newContent = modifyReq.getEvent_content().replace("/common/getTempImg.do?fileName="+modifyReq.getOldFileName() 
																	,"/common/getPicture.do?name="+modifyReq.getEvent_pic_path()+"&item_cd="+event_no+"&type=eventImg");
			modifyEventContentMap.put("event_no", event.getEvent_no());
			modifyEventContentMap.put("newContent", newContent);
			sysAdminService.modifyEventContent(modifyEventContentMap);
		}

		
		// 이벤트 썸네일 로컬에 저장
		if (!modifyReq.getRemoveFileName().equals("")) {
			MultipartFile thumb = modifyReq.getEvent_thum_path();
			String fileName = thumb.getOriginalFilename();
			File filePath = new File(eventPicUploadPath + File.separator + event_no + File.separator + "thumb");
			File[] fileList = filePath.listFiles();
			for (File file : fileList) {
				file.delete();
			}
			File target = new File(eventPicUploadPath + File.separator + event_no + File.separator + "thumb", fileName);
			if (!target.exists()) {
				target.mkdirs();
			}
			
			thumb.transferTo(target);
		}
		
		// 이벤트 이미지 로컬에 저장
		if (!modifyReq.getEvent_pic_path().equals("")) {
			String fileName = event.getEvent_pic_path();
			File newFilePath = new File(eventPicUploadPath + File.separator + event_no + File.separator + "img");
			File[] fileList = newFilePath.listFiles();
			for (File file : fileList) {
				file.delete();
			}
			if (!newFilePath.exists()) {
				newFilePath.mkdirs();
			}
			File oldFile = new File(eventPicUploadPath + File.separator + "temp", modifyReq.getOldFileName());
			boolean renameTo = oldFile.renameTo(new File(newFilePath, fileName));
		}
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('이벤트 수정이 완료되었습니다.')");
		out.println("location.href='eventAdminDetail.do?type=read&event_no=" + event_no + "'");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/eventAdminDelete")
	public void eventAdminDelete (EventModifyCommand modifyReq, HttpServletResponse res) throws SQLException, IOException {
		String eventPicUploadPath = this.eventPicUploadPath;
		
		int event_no = modifyReq.getEvent_no();
		sysAdminService.deleteEvent(event_no);
		
		File directory = new File(eventPicUploadPath + File.separator + event_no);
		FileUtils.deleteDirectory(directory);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('이벤트 게시물 삭제가 완료되었습니다.')");
		out.println("location.href='eventAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/eventAdminPastMain")
	public ModelAndView eventAdminPastMain(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url="/sysAdmin/eventAdminPastMain";
		
		Map<String, Object> dataMap = sysAdminService.selectEventListforPast(cri);
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "이벤트 관리", "지난 이벤트", url+".do");
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/eventAdminWinnerRegistForm")
	public ModelAndView eventAdminWinnerRegistForm (ModelAndView mnv, String event_no, String type) throws NumberFormatException, SQLException {
		String url="/sysAdmin/eventAdminRegistWinner";
		EventVO event = sysAdminService.selectEventByEvent_no(Integer.parseInt(event_no));
		mnv.addObject("event", event);
		if (type.equals("create")) {
			Map<String, Object> subjectMap = addSubject("HOME", "이벤트 관리", "당첨자 발표 작성", url+".do?event_no=" + event_no + "&type=" + type);
			mnv.addAllObjects(subjectMap);
		} else if (type.equals("read")) {
			Map<String, Object> subjectMap = addSubject("HOME", "이벤트 관리", "당첨자 발표 조회", url+".do?event_no=" + event_no + "&type=" + type);
			mnv.addAllObjects(subjectMap);
			WinnerBoardVO wb = sysAdminService.selectWbByEvent_no(Integer.parseInt(event_no));
			mnv.addObject("wb", wb);
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/eventAdminWinnerRegist")
	public void eventAdminWinnerRegist(WinnerBoardVO wb, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.registWinnerBoard(wb);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('당첨자 게시물  등록이 완료되었습니다.')");
		out.println("location.href='eventAdminPastMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/eventAdminWinnerModify")
	public void eventAdminWinnerModify(WinnerBoardVO wb, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.modifyWinnerBoard(wb);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('당첨자 게시물  수정이 완료되었습니다.')");
		out.println("location.href='eventAdminPastMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/eventAdminWinnerDelete")
	public void eventAdminWinnerDelete(WinnerBoardVO wb, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.deleteWinnerBoard(wb);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('당첨자 게시물 삭제가 완료되었습니다.')");
		out.println("location.href='eventAdminPastMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/memberAdminMain")
	public ModelAndView memberAdminMain (ModelAndView mnv, SearchCriteria cri) throws SQLException {
		
		String url="/sysAdmin/memberAdminMain";
		
		Map<String, Object> dataMap = sysAdminService.selectMemberList(cri);
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객관리", "회원 목록", url+".do");
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/memeberAdminDetail")
	public ModelAndView memeberAdminDetail (ModelAndView mnv, String mem_cd) throws SQLException {
		String url = "/sysAdmin/memberAdminDetail";
		
		Map<String, Object> member = sysAdminService.selectMemberByMem_cd(mem_cd);
		mnv.addAllObjects(member);
		
		List<Map<String, Object>> watchedMovieList = sysAdminService.selectWatchedMoviePreviewListByMem_cd(mem_cd);
		mnv.addObject("watchedMovieList", watchedMovieList);
		
		List<Map<String, Object>> reviewList = sysAdminService.selectReviewPreviewListByMem_cd(mem_cd);
		mnv.addObject("reviewList", reviewList);
		
		List<Map<String, Object>> mpList = sysAdminService.selectMpPreviewListByMem_cd(mem_cd);
		mnv.addObject("mpList", mpList);
		
		List<Map<String, Object>> mpReplyList = sysAdminService.selectMpReplyPreviewListByMem_cd(mem_cd);
		mnv.addObject("mpReplyList", mpReplyList);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객관리", "회원 상세", url+".do?mem_cd="+mem_cd);
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	} 
	
	@RequestMapping("/memberAdminWatchedMovieList")
	public ModelAndView memberAdminWatchedMovieList (ModelAndView mnv, String mem_cd) throws SQLException {
		String url = "/sysAdmin/memberAdminWatchedMovieList";
		
		List<Map<String, Object>> watchedMovieList = sysAdminService.selectWatchedMovieListByMem_cd(mem_cd);
		mnv.addObject("watchedMovieList", watchedMovieList);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객관리", "관람내역 목록", url+".do?mem_cd="+mem_cd);
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/memberAdminReviewList")
	public ModelAndView memberAdminReviewList (ModelAndView mnv, String mem_cd) throws SQLException {
		String url = "/sysAdmin/memberAdminReviewList";
		
		List<Map<String, Object>> reviewList = sysAdminService.selectReviewListByMem_cd(mem_cd);
		mnv.addObject("reviewList", reviewList);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객관리", "리뷰내역 목록", url+".do?mem_cd="+mem_cd);
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/memberAdminMoviepostList")
	public ModelAndView memberAdminMoviepostList (ModelAndView mnv, String mem_cd) throws SQLException {
		String url = "/sysAdmin/memberAdminMoviepostList";
		
		List<Map<String,Object>> mpList = sysAdminService.selectMpListByMem_cd(mem_cd);
		mnv.addObject("mpList", mpList);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객관리", "무비포스트 목록", url+".do?mem_cd="+mem_cd);
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/memberAdminMoviepostReplyList")
	public ModelAndView memberAdminMoviepostReplyList (ModelAndView mnv, String mem_cd) throws SQLException {
		String url = "/sysAdmin/memberAdminMoviepostReplyList";
		
		List<Map<String,Object>> mpReplyList = sysAdminService.selectMpReplyListByMem_cd(mem_cd);
		mnv.addObject("mpReplyList", mpReplyList);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객관리", "무비포스트 댓글 목록", url+".do?mem_cd="+mem_cd);
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/memberAdminBan")
	public void memberAdminBan (String mem_cd, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.banMember(mem_cd);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('해당 회원이 정지되었습니다.')");
		out.println("location.href='memeberAdminDetail.do?mem_cd=" + mem_cd + "';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/memberAdminCancelBan")
	public void memberAdminCancelBan (String mem_cd, HttpServletResponse res) throws SQLException, IOException {
		sysAdminService.cancelBanMember(mem_cd);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('해당 회원의 정지가 해제되었습니다.')");
		out.println("location.href='memeberAdminDetail.do?mem_cd=" + mem_cd + "';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/deleteReview")
	public void deleteReview (int review_no, HttpServletResponse res) throws SQLException, IOException {
		ReviewVO review = new ReviewVO();
		review.setReview_no(review_no);
		
		sysAdminService.deleteReview(review);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('해당 관람평이 삭제되었습니다.');");
		out.println("location.href='memberAdminReviewList.do?mem_cd="+review.getMem_cd()+"';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/deleteMoviePost")
	public void deleteMoviePost (int mpost_no, HttpServletResponse res) throws SQLException, IOException {
		MoviePostVO mp = new MoviePostVO();
		mp.setMpost_no(mpost_no);
		
		sysAdminService.deleteMoviePost(mp);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('해당 무비포스트가 삭제되었습니다.');");
		out.println("location.href='memberAdminMoviepostList.do?mem_cd="+mp.getMem_cd()+"';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/deleteReply")
	public void deleteReply (int reply_no, HttpServletResponse res) throws SQLException, IOException {
		ReplyVO reply = new ReplyVO();
		reply.setReply_no(reply_no);
		
		sysAdminService.deleteReply(reply);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('해당 댓글이 삭제되었습니다.');");
		out.println("location.href='memberAdminMoviepostReplyList.do?mem_cd="+reply.getMem_cd()+"';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	
	private Map<String, Object> addSubject(String subject, String item1, String item2, String url) {
		Map<String, Object> subjectMap = new HashMap<String, Object>();
		subjectMap.put("subject", subject);
		subjectMap.put("item1", item1);
		subjectMap.put("item2", item2);
		subjectMap.put("url", url);
		return subjectMap;
	}
	
	private String savePicture(MultipartFile multi, String oldPicture, String item_cd, String type) throws Exception {
		
		String fileName = null;
		
		// 파일 유무 확인
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 10)) {
			// 파일 저장 폴더 설정
			String imgPath = "";
			if (type.equals("moviePoster")) {
				imgPath = this.moviePicUploadPath + File.separator + item_cd + File.separator + "mainPoster";
			} else if (type.equals("movieImg")) {
				imgPath = this.moviePicUploadPath + File.separator + item_cd + File.separator + "pictures";
			} else if (type.equals("movieVideo")) {
				imgPath = this.moviePicUploadPath + File.separator + item_cd + File.separator + "videos";
			} else if (type.equals("productImg")) {
				imgPath = this.storePicUploadPath + File.separator + item_cd;
			}
			fileName = multi.getOriginalFilename();
			File storeFile = new File(imgPath, fileName);
			
			storeFile.mkdirs();
			
			// local HDD에 저장
			multi.transferTo(storeFile);
			
			if (!oldPicture.isEmpty()) {
				File oldFile = new File(imgPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		
		return fileName;
	}

}



