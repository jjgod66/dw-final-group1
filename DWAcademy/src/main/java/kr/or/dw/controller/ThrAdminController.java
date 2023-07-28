package kr.or.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.ThrAdminService;
import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;
import kr.or.dw.vo.TheaterVO;

@Controller
@RequestMapping("/thrAdmin")
public class ThrAdminController {

	private static final Logger logger = LoggerFactory.getLogger(SysAdminController.class);
	
	@Autowired
	private ThrAdminService thrAdminService;
	
	@Resource(name ="moviePicUploadPath")
	private String moviePicUploadPath;
	
	@Resource(name ="storePicUploadPath")
	private String storePicUploadPath;
	

	@RequestMapping("/theaterAdminMain")
	public ModelAndView placeAdmin(ModelAndView mnv, HttpServletRequest req) throws SQLException {
		
		String url = "/thrAdmin/theaterAdminMain";
		
		HttpSession session = req.getSession();
		session.setAttribute("admin_cd", "T202307090001");
		String admin_cd = (String) session.getAttribute("admin_cd");
		
		Map<String, Object> thr = thrAdminService.selectThrByAdmin_cd(admin_cd);
		mnv.addAllObjects(thr);
		
		List<Map<String, Object>> houseList = thrAdminService.selectHouseListByAdmin_cd(admin_cd);
		mnv.addObject("houseList", houseList);
		
		Map<String, Object> subjectMap = addSubject("HOME", "지점관리", "지점 정보", url);
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/theaterAdminModifyInfo")
	public ResponseEntity<String> theaterAdminModifyInfo(@RequestBody TheaterVO thr) throws SQLException {
		
		ResponseEntity<String> entity = null;
		
		thrAdminService.modifyThrInfo(thr);
		
		try {
			
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/theaterAdminRegistHouse")
	public ResponseEntity<HouseVO> theaterAdminRegistHouse(@RequestBody HouseVO house) throws SQLException {
		
		ResponseEntity<HouseVO> entity = null;
		
		thrAdminService.registHouse(house);
		HouseVO newHouse = thrAdminService.selectHouseByHouse_no(house.getHouse_no());
		
		try {
			entity = new ResponseEntity<>(newHouse, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(newHouse, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/theaterRegistForm")
	public ModelAndView theaterRegistForm(ModelAndView mnv) throws SQLException {
		
		String url = "thrAdmin/theaterAdminRegist";
//		Map<String, Object> subjectMap = new HashMap<String, Object>(); 
//		 
//		if (thr_name != null) {	// 수정일 때
//			TheaterVO thr = sysAdminService.selectTheaterByName(thr_name);
//			mnv.addObject("thr", thr);
//			subjectMap = addSubject("HOME", "지점 관리", "지점 수정");
//		} else {				// 등록일 때
//			subjectMap = addSubject("HOME", "지점 관리", "지점 등록");
//		}
//		
//		List<String> locList = sysAdminService.selectLocList();
//		
//		mnv.addAllObjects(subjectMap);
//		mnv.addObject("locList", locList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/movieAdminMain")
	public ModelAndView movieAdmin(ModelAndView mnv,SearchCriteria cri) throws SQLException {
		String url = "/thrAdmin/movieAdminMain";
		
	    cri.setPerPageNum("5");
//	    List<MovieVO> allScreenList = thrAdminService.getAllScreens1();
	    Map<String, Object> response = thrAdminService.getAllScreens(cri);
	    List<Map<String, Object>> allScreens = (List<Map<String, Object>>) response.get("allScreens");
	    response.put("allScreens", allScreens);
		mnv.addAllObjects(response);
		
		List<Map<String, Object>> allRe = null;
		allRe = thrAdminService.getAllRe();
		List<JSONObject> newAllRe = new ArrayList<>();
		for( Map<String,Object> map : allRe){
		    JSONObject json = new JSONObject();
		    for( Map.Entry<String,Object> entry : map.entrySet() ){
		        String key = entry.getKey();
		        Object value = entry.getValue();
		        json.put(key, value);	
		    }	
		    newAllRe.add(json);
		}
		
		System.out.println(newAllRe);
		mnv.addObject("allRe", newAllRe);
//		mnv.addObject("allScreenList", allScreenList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/loadMovies")
	public ResponseEntity<Map<String, Object>> loadMovies(@RequestParam("pageNo") int pageNo,SearchCriteria cri) throws SQLException {
	    
		cri.setPerPageNum("5");
		System.out.println(cri);
		System.out.println(pageNo);
		
		Map<String, Object> response = thrAdminService.getAllScreens(cri);
		List<Map<String, Object>> allScreens = (List<Map<String, Object>>) response.get("allScreens");
		response.put("allScreens", allScreens);
	    System.out.println(pageNo);
	    return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	
//	@RequestMapping("/movieAdminMain")
//	public ModelAndView movieAdmin(ModelAndView mnv, SearchCriteria cri) throws SQLException {
//		String url = "/thrAdmin/movieAdminMain";
//		cri.setPerPageNum("2");
//		System.out.println(cri);
//		
//		Map<String, Object> dataMap = thrAdminService.selectMovieList(cri);
//		List<Map<String, Object>> movieList = (List<Map<String, Object>>)dataMap.get("movieList");
//		
//		dataMap.put("movieList", movieList);
//		
//		List<MovieVO> allScreenList = null;
//		allScreenList = thrAdminService.getAllScreens();
//		
//		List<Map<String, Object>> allRe = null;
//		allRe = thrAdminService.getAllRe();
//		
//		List<JSONObject> newAllRe = new ArrayList<>();
//		for( Map<String,Object> map : allRe){
//		    JSONObject json = new JSONObject();
//		    for( Map.Entry<String,Object> entry : map.entrySet() ){
//		        String key = entry.getKey();
//		        Object value = entry.getValue();
//		        json.put(key, value);	
//		    }	
//		    newAllRe.add(json);
//		}
//		System.out.println(newAllRe);
//		mnv.addAllObjects(dataMap);
//		mnv.addObject("allRe", newAllRe);
//		mnv.addObject("allScreenList", allScreenList);
//		mnv.setViewName(url);
//		return mnv;
//	}
	


	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mnv, String movie_cd) throws SQLException {
		String url = "/thrAdmin/main";
		if(movie_cd == null) {
			movie_cd = "";
		}
//		List<MovieVO> allScreenList = null;
//		allScreenList = thrAdminService.getAllScreens();
		
		List<Map<String, Object>> allRe = null;
		allRe = thrAdminService.getAllRe();
		
		List<JSONObject> newAllRe = new ArrayList<>();
		for( Map<String,Object> map : allRe){
		    JSONObject json = new JSONObject();
		    for( Map.Entry<String,Object> entry : map.entrySet() ){
		        String key = entry.getKey();
		        Object value = entry.getValue();
		        json.put(key, value);	
		    }	
		    newAllRe.add(json);
		}
		System.out.println(newAllRe);
		mnv.addObject("allRe", newAllRe);
//		mnv.addObject("allScreenList", allScreenList);
		mnv.addObject("movie_cd", movie_cd);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/getPicture")
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
	@GetMapping("/api/getMovieInfo")
	public ClickMovieInfoVO getMovieInfo (@RequestParam("screenCd") String screenCd) throws SQLException {
		return thrAdminService.getMovieInfoByScreenCd(screenCd);
	}
	
	@GetMapping("/supportAdminMain")
	public String customerAdmin() {
		
		String url = "/thrAdmin/supportAdminMain";
		
		return url;
	}
	@GetMapping("/movieA")
	public String movieA() {
		
		String url = "/thrAdmin/movieA";
		
		return url;
	}
	
	@GetMapping("/eventAdminMain")
	public String eventAdmin() {
		
		String url = "/thrAdmin/eventAdminMain";
		
		return url;
	}
	
	@GetMapping("/eventAdminPast")
	public String eventAdminPast() {
		
		String url="/thrAdmin/eventAdminPast";
		
		return url;
	}
	
	@GetMapping("/eventAdminWinner")
	public String eventAdminWinner() {
		
		String url="/thrAdmin/eventAdminWinner";
		
		return url;
	}
	
	@GetMapping("/eventRegist")
	public String eventRegist() {
		
		String url="/thrAdmin/eventRegist";
		
		return url;
	}
	
	// admin_contentHeader에 넣을 정보들
	private Map<String, Object> addSubject(String subject, String item1, String item2, String url) {
		Map<String, Object> subjectMap = new HashMap<String, Object>();
		subjectMap.put("subject", subject);
		subjectMap.put("item1", item1);
		subjectMap.put("item2", item2);
		subjectMap.put("url", url);
		return subjectMap;
	}
}
