package kr.or.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.MovieRegistCommand;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.SysAdminService;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.TheaterVO;

@Controller
@RequestMapping("/sysAdmin")
public class SysAdminController {

	private static final Logger logger = LoggerFactory.getLogger(SysAdminController.class);
	
	@Autowired
	private SysAdminService sysAdminService;
	
	@Resource(name ="moviePicUploadPath")
	private String moviePicUploadPath;
	
	@RequestMapping("/main")
	public ModelAndView sysAdminIndex(ModelAndView mnv) {
		String url = "/sysAdmin/main";
		
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/theaterAdminMain")
	public ModelAndView placeAdmin(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		
		String url = "/sysAdmin/theaterAdminMain";
		
		Map<String, Object> dataMap = sysAdminService.selectTheaterList(cri);
		mnv.addAllObjects(dataMap);
		Map<String, Object> subjectMap = addSubject("HOME", "지점 관리", "지점 리스트");
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/theaterRegistForm")
//	@PostMapping("/theaterRegistForm")
	public ModelAndView theaterRegistForm(ModelAndView mnv, String thr_name) throws SQLException {
		
		String url = "sysAdmin/theaterRegist";
		Map<String, Object> subjectMap = new HashMap<String, Object>(); 
		 
		if (thr_name != null) {	// 수정일 때
			TheaterVO thr = sysAdminService.selectTheaterByName(thr_name);
			mnv.addObject("thr", thr);
			subjectMap = addSubject("HOME", "지점 관리", "지점 수정");
		} else {				// 등록일 때
			subjectMap = addSubject("HOME", "지점 관리", "지점 등록");
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
		String thr_name = thr.getThr_name();
		sysAdminService.theaterDelete(thr_name);
	
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('지점이 삭제(비활성화)되었습니다.')");
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
		
		
		Map<String, Object> subjectMap = addSubject("HOME", "영화 관리", "영화 리스트");
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/movieRegistForm")
	public ModelAndView movieRegist(ModelAndView mnv, String movie_cd) throws SQLException {
		
		String url ="/sysAdmin/movieRegist";
		Map<String, Object> subjectMap = new HashMap<String, Object>(); 
		
		
		if (movie_cd != null) {	// 수정일 때
			subjectMap = addSubject("HOME", "영화 관리", "영화 상세정보 수정");
			Map<String, Object> movie = sysAdminService.selectMovieByMovie_cd(movie_cd);
			mnv.addAllObjects(movie);
		} else {				// 등록일 때
			subjectMap = addSubject("HOME", "영화 관리", "영화 등록");
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
		for ( MultipartFile pic : registReq.getUploadImg()) {
			movie_pics.add(pic.getOriginalFilename());
		}
		sysAdminService.registMoviePic(movie_pics, movie_cd);
		
		// 관련 예고편파일 이름 DB에 저장
		List<String> movie_pres = new ArrayList<>();
		for ( MultipartFile pre : registReq.getUploadVideo()) {
			movie_pres.add(pre.getOriginalFilename());
		}
		sysAdminService.registMoviePre(movie_pres, movie_cd);
		
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
				String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + multi.getOriginalFilename();
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
				String fileName = UUID.randomUUID().toString().replace("-", "") + "$$" + multi.getOriginalFilename();
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
		out.println("location.href='theaterAdminMain.do';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@GetMapping("/supportAdminMain")
	public String customerAdmin() {
		String url = "/sysAdmin/supportAdminMain";
		return url;
	}
	
	@GetMapping("/eventAdminMain")
	public String eventAdmin() {
		String url = "/sysAdmin/eventAdminMain";
		return url;
	}
	
	@GetMapping("/storeAdminMain")
	public String storeAdmin() {
		String url = "/sysAdmin/storeAdminMain";
		return url;
	}
	
	@GetMapping("/eventAdminPast")
	public String eventAdminPast() {
		String url="/sysAdmin/eventAdminPast";
		return url;
	}
	
	@GetMapping("/eventAdminWinner")
	public String eventAdminWinner() {
		String url="/sysAdmin/eventAdminWinner";
		return url;
	}
	
	@GetMapping("/eventRegist")
	public String eventRegist() {
		String url="/sysAdmin/eventRegist";
		return url;
	}
	
	// admin_contentHeader에 넣을 정보들
	private Map<String, Object> addSubject(String subject, String item1, String item2) {
		Map<String, Object> subjectMap = new HashMap<String, Object>();
		subjectMap.put("subject", subject);
		subjectMap.put("item1", item1);
		subjectMap.put("item2", item2);
		return subjectMap;
	}
	
	@RequestMapping("/getPicture")
	public ResponseEntity<byte[]> getPicture(String name, String movie_cd, String type) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = "";
		if (type != "" && type != null) {
			if (type.equals("p")) {
				imgPath = this.moviePicUploadPath + File.separator + movie_cd + File.separator + "mainPoster";
			} else if (type.equals("i")) {
				imgPath = this.moviePicUploadPath + File.separator + movie_cd + File.separator + "pictures";
			} else if (type.equals("v")) {
				imgPath = this.moviePicUploadPath + File.separator + movie_cd + File.separator + "videos";
			}
		} 
		try {
			in = new FileInputStream(new File(imgPath, name));
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}
}



