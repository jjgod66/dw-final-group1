package kr.or.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;

import kr.or.dw.command.EventModifyCommand;
import kr.or.dw.command.EventRegistCommand;
import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.SysAdminService;
import kr.or.dw.service.ThrAdminService;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.QnaVO;
import kr.or.dw.vo.ScreenVO;
import kr.or.dw.vo.TheaterVO;
import kr.or.dw.vo.WinnerBoardVO;

@Controller
@RequestMapping("/thrAdmin")
public class ThrAdminController {

	private static final Logger logger = LoggerFactory.getLogger(SysAdminController.class);
	
	@Autowired
	private ThrAdminService thrAdminService;
	
	@Autowired
	private SysAdminService sysAdminService;
	
	@Resource(name ="moviePicUploadPath")
	private String moviePicUploadPath;
	
	@Resource(name ="storePicUploadPath")
	private String storePicUploadPath;
	
	@Resource(name ="eventPicUploadPath")
	private String eventPicUploadPath;

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
	
	@RequestMapping("/theaterAdminModifyHouse")
	public ResponseEntity<HouseVO> theaterAdminModifyHouse(@RequestBody HouseVO house) throws SQLException {
		
		ResponseEntity<HouseVO> entity = null;
		
		thrAdminService.modifyHouse(house);
		HouseVO newHouse = thrAdminService.selectHouseByHouse_no(house.getHouse_no());
		
		try {
			entity = new ResponseEntity<>(newHouse, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(newHouse, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/noticeAdminMain")
	public ModelAndView noticeAdminMain(ModelAndView mnv, HttpServletRequest req, SearchCriteria cri) throws SQLException {
		String url = "/thrAdmin/noticeAdminMain";
		HttpSession session = req.getSession();
		if (cri.getAdminType().equals("")) {
			cri.setAdminType((String)session.getAttribute("admin_cd"));
		}
		
		Map<String, Object> dataMap = thrAdminService.selectNoticeList(cri);
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객 관리", "공지사항 메인", url+".do");
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/noticeAdminDetail")
	public ModelAndView noticeAdminDetail(ModelAndView mnv, String notice_no, String type) throws SQLException {
		String url = "/thrAdmin/noticeAdminDetail";
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
		thrAdminService.registNotice(notice);
		
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
	
	@RequestMapping("qnaAdminMain")
	public ModelAndView qnaAdminMain (ModelAndView mnv, HttpServletRequest req, SearchCriteria cri) throws SQLException {
		String url = "/thrAdmin/qnaAdminMain";
		
		HttpSession session = req.getSession();
		if (cri.getAdminType().equals("")) {
			cri.setAdminType((String)session.getAttribute("admin_cd"));
		}
		
		Map<String,Object> dataMap = thrAdminService.selectQnaList(cri);
		mnv.addAllObjects(dataMap);
		Map<String, Object> subjectMap = addSubject("HOME", "고객 관리", "1:1문의 메인", url+".do");
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("qnaAdminDetail")
	public ModelAndView qnaAdminDetail (ModelAndView mnv, String que_no) throws NumberFormatException, SQLException {
		String url = "/thrAdmin/qnaAdminDetail";
		
		QnaVO qna = sysAdminService.selectQnaByQue_no(Integer.parseInt(que_no));
		mnv.addObject("qna", qna);
		
		AnswerVO ans = sysAdminService.selectAnsByQue_no(Integer.parseInt(que_no));
		mnv.addObject("ans", ans);
		
		Map<String, Object> subjectMap = addSubject("HOME", "고객 관리", "1:1문의 게시글", url+".do?que_no="+que_no);
		mnv.addAllObjects(subjectMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("answerRegist")
	public void answerRegist(AnswerVO ans, HttpServletRequest req, HttpServletResponse res) throws IOException, SQLException {
		
		HttpSession session = req.getSession();
		String admin_cd = (String)session.getAttribute("admin_cd");
		ans.setAdmin_cd(admin_cd);
		
		thrAdminService.registAns(ans);
		
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
	public ModelAndView eventAdmin(ModelAndView mnv, HttpServletRequest req, SearchCriteria cri) throws SQLException {
		String url = "/thrAdmin/eventAdminMain";
		
		HttpSession session = req.getSession();
		if (cri.getAdminType().equals("")) {
			cri.setAdminType((String)session.getAttribute("admin_cd"));
		}
		
		Map<String, Object> dataMap = thrAdminService.selectEventList(cri);
		mnv.addAllObjects(dataMap);
		Map<String, Object> subjectMap = addSubject("HOME", "이벤트 관리", "진행중인 이벤트", url+".do");
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/eventAdminDetail")
	public ModelAndView eventAdminDetail (ModelAndView mnv, String event_no, String type) throws NumberFormatException, SQLException {
		String url = "/thrAdmin/eventAdminDetail";
		
		if (event_no != null) {
			EventVO event = sysAdminService.selectEventByEvent_no(Integer.parseInt(event_no));
			mnv.addObject("event", event);
		}
		mnv.addObject("type", type);
		
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
		String newContent = registReq.getEvent_content().replace("/sysAdmin/getTempImg.do?fileName="+registReq.getOldFileName() 
																 ,"/sysAdmin/getPicture.do?name="+registReq.getEvent_pic_path()+"&item_cd="+event_no+"&type=eventImg");
		
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
		
		// 새 썸네일 파일이 없다면 event_thum_path 를 null로 설정
		if (modifyReq.getEvent_thum_path().getSize() == 0) {
			modifyReq.setEvent_thum_path(null);
		}
		
		EventVO event = modifyReq.toEventVO();
		
		// 새 썸네일 파일이 있다면
		if (!modifyReq.getRemoveFileName().equals("")) {
			event.setEvent_thum_path(modifyReq.getEvent_thum_path().getOriginalFilename());
		}
		
		sysAdminService.modifyEvent(event);
		
		int event_no = event.getEvent_no();
		Map<String, Object> modifyEventContentMap = new HashMap<>();
		if (modifyReq.getEvent_content().contains("/sysAdmin/getTempImg.do?fileName=")) {
			String newContent = modifyReq.getEvent_content().replace("/sysAdmin/getTempImg.do?fileName="+modifyReq.getOldFileName() 
																	,"/sysAdmin/getPicture.do?name="+modifyReq.getEvent_pic_path()+"&item_cd="+event_no+"&type=eventImg");
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
	public ModelAndView eventAdminPastMain(ModelAndView mnv, HttpServletRequest req, SearchCriteria cri) throws SQLException {
		String url="/thrAdmin/eventAdminPastMain";
		
		HttpSession session = req.getSession();
		if (cri.getAdminType().equals("")) {
			cri.setAdminType((String)session.getAttribute("admin_cd"));
		}
		
		Map<String, Object> dataMap = thrAdminService.selectEventListforPast(cri);
		mnv.addAllObjects(dataMap);
		
		Map<String, Object> subjectMap = addSubject("HOME", "이벤트 관리", "지난 이벤트", url+".do");
		mnv.addAllObjects(subjectMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/eventAdminWinnerRegistForm")
	public ModelAndView eventAdminWinnerRegistForm (ModelAndView mnv, String event_no, String type) throws NumberFormatException, SQLException {
		String url="/thrAdmin/eventAdminRegistWinner";
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
	@RequestMapping("/test")
	public ModelAndView test (ModelAndView mnv, HttpServletRequest req) throws SQLException {
		String url = "/thrAdmin/movieAdminMainMain";
		List<Map<String, Object>> movieList = thrAdminService.selectMovieListforMovieMain(new Date());
		System.out.println(movieList);
		mnv.addObject("movieList", movieList);
		
		Map<String, Object> data = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		String admin_cd = (String) session.getAttribute("admin_cd");
		data.put("date", new Date());
		data.put("admin_cd", admin_cd);
		List<Map<String, Object>> screenList = thrAdminService.selectScreenListforMovieMain(data);
		mnv.addObject("screenList", screenList);
		List<Map<String, Object>> houseList = thrAdminService.selectHouseListByAdmin_cd(admin_cd);
		mnv.addObject("houseList", houseList);
		
		Map<String, Object> subjectMap = addSubject("HOME", "영화 관리", "상영 시간표 관리", url+".do");
		mnv.addAllObjects(subjectMap);
		
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
