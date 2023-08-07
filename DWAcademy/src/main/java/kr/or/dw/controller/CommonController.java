package kr.or.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.IndexMovieCommand;
import kr.or.dw.service.EventService;
import kr.or.dw.service.MovieService;
import kr.or.dw.service.NaverLoginBO;
import kr.or.dw.service.SupportService;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.NoticeVO;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Resource(name ="moviePicUploadPath")
	private String moviePicUploadPath;
	
	@Resource(name ="storePicUploadPath")
	private String storePicUploadPath;
	
	@Resource(name ="eventPicUploadPath")
	private String eventPicUploadPath;
	
	@Resource(name ="memberPicUploadPath")
	private String memberPicUploadPath;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private SupportService supportService;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse res) throws Exception{
		String url = "/security/accessDenied";
		
		res.setStatus(302);
		
		return url;
	}
	
	@RequestMapping("/common/loginSuccess")
	public ModelAndView loginSuccess(ModelAndView mnv, HttpSession session) {
		String url = "";
		
		Map<String, Object> loginUser = (Map<String, Object>) session.getAttribute("loginUser");
		System.out.println(loginUser);
		String AUTH = (String) loginUser.get("AUTH");
		System.out.println(AUTH);
		
		if(AUTH.equals("S")) {
			System.out.println("1");
			url = "redirect:/sysAdmin/main.do";
		}else if(AUTH.equals("T")) {
			System.out.println("2");
			url = "redirect:/thrAdmin/main.do";
		}else {
			url = "redirect:/main";
		}
		System.out.println(url);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping(value = "/main", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView index(ModelAndView mnv, HttpSession session, String login) throws SQLException {
		String url = "/main";
		
		System.out.println(login);
		List<Map<String, Object>> movieListMap = null;
		movieListMap = movieService.getIndexBoxOfficeMovie10();
		
		List<IndexMovieCommand> movieList = new ArrayList<>();
		
		for(Map<String, Object> movieMap : movieListMap) {
			IndexMovieCommand imc = new IndexMovieCommand(movieMap);
			movieList.add(imc);
			
		}
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		mnv.addObject("url", naverAuthUrl);
		
		
		List<EventVO> eventList = null;
		eventList = eventService.getEvent4();
		
		List<EventVO> eventList2 = null;
		eventList2 = eventService.getEvent2();
		
		List<NoticeVO> noticeList = null;
		noticeList = supportService.getNotice2();
		
		mnv.addObject("loginNeed", login);
		mnv.addObject("noticeList", noticeList);
		mnv.addObject("eventList", eventList);
		mnv.addObject("eventList2", eventList2);
		mnv.addObject("movieList", movieList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/common/LoginTimeOut")
	public void loginTimeOut(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println(req.getParameter("test"));
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다.\\n다시 로그인하세요!')");
		out.println("location.href='/';");
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping("/common/getPicture")
	public ResponseEntity<byte[]> getPicture(String name, String item_cd, String type) throws IOException  {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = "";
		if (type != "" && type != null) {
			if (type.equals("moviePoster")) {
				imgPath = this.moviePicUploadPath + File.separator + item_cd + File.separator + "mainPoster";
			} else if (type.equals("movieImg")) {
				imgPath = this.moviePicUploadPath + File.separator + item_cd + File.separator + "pictures";
			} else if (type.equals("productImg")) {
				imgPath = this.storePicUploadPath + File.separator + item_cd;
			} else if (type.equals("eventThumb")) {
				imgPath = this.eventPicUploadPath + File.separator + item_cd + File.separator + "thumb";
			} else if (type.equals("eventImg")) {
				imgPath = this.eventPicUploadPath + File.separator + item_cd + File.separator + "img";
			} else if (type.equals("memberPic")) {
				imgPath = this.memberPicUploadPath + File.separator + item_cd;
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
	
	@RequestMapping("common/login")
	public String loginFrom() {
		String url = "/common/login";

		return url;
	}
	
	@RequestMapping("/common/userIdFind")
	public String userIdFind() {
		String url = "/common/userIdFind";
		return url;
	}
	
}
