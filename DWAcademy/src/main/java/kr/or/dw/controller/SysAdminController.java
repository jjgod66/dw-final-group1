package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/theaterRegistForm")
	public ModelAndView theaterRegistForm(ModelAndView mnv, String thr_name) throws SQLException {
		String url = "sysAdmin/theaterRegist";
		
		if (thr_name != null) {
			System.out.println("test!!");
			sysAdminService.selectTheaterByName(thr_name);
		}
		
		List<String> locList = sysAdminService.selectLocList();
		
		mnv.addObject("locList", locList);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping("/theaterRegist")
	public void theaterRegist(TheaterVO thr, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		System.out.println(thr);
		sysAdminService.theaterRegist(thr);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('새 지점이 등록되었습니다.')");
		out.println("location.href='sysAdmin/theaterList.do';");
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
	@GetMapping("/movieRegist")
	public String movieRegist() {
		String url ="/sysAdmin/movieRegist";
		return url;
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
	
}
