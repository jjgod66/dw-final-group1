package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.SysAdminService;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.TheaterVO;

@Controller
@RequestMapping("/sysAdmin")
public class SysAdminController {

	private static final Logger logger = LoggerFactory.getLogger(SysAdminController.class);
	
	@Autowired
	private SysAdminService sysAdminService;
	
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
	
/*	@GetMapping("/adminCinemaMain")
	public String adminCinemaMain() {
		String url = "/sysAdmin/adminCinemaMain";
		return url;
	}*/
	
	
	@GetMapping("/movieAdminMain")
	public String movieAdmin() {
		String url = "/sysAdmin/movieAdminMain";
		return url;
	}
	
	@RequestMapping("/movieRegistForm")
	public ModelAndView movieRegist(ModelAndView mnv, String movie_cd) throws SQLException {
		
		String url ="/sysAdmin/movieRegist";
		Map<String, Object> subjectMap = new HashMap<String, Object>(); 
		
		
		if (movie_cd != null) {	// 수정일 때
			subjectMap = addSubject("HOME", "영화 관리", "영화 상세정보 수정");
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
}
