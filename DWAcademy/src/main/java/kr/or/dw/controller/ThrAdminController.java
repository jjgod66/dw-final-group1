package kr.or.dw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import kr.or.dw.command.EventModifyCommand;
import kr.or.dw.command.EventRegistCommand;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.CommonAdminService;
import kr.or.dw.service.SysAdminService;
import kr.or.dw.service.ThrAdminService;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.QnaAttachVO;
import kr.or.dw.vo.QnaVO;
import kr.or.dw.vo.ScreenVO;
import kr.or.dw.vo.TheaterVO;
import kr.or.dw.vo.WinnerBoardVO;

@Controller
@RequestMapping("/thrAdmin")
public class ThrAdminController {

	private static final Logger logger = LoggerFactory.getLogger(ThrAdminController.class);
	
	@Autowired
	private ThrAdminService thrAdminService;
	
	@Autowired
	private SysAdminService sysAdminService;
	
	@Autowired
	private CommonAdminService commonAdminService;
	
	@Resource(name ="moviePicUploadPath")
	private String moviePicUploadPath;
	
	@Resource(name ="storePicUploadPath")
	private String storePicUploadPath;
	
	@Resource(name ="eventPicUploadPath")
	private String eventPicUploadPath;
	
	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mnv, HttpServletRequest req) throws SQLException {
		
		String url = "/thrAdmin/main";
		
		HttpSession session = req.getSession();
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
		String admin_cd = (String) admin.get("CD");
		
		List<MovieVO> currentMovieList = sysAdminService.selectCurrentMovieForMain();
		mnv.addObject("currentMovieList", currentMovieList);
		
		List<NoticeVO> noticeList = thrAdminService.selectNoticeForMain(admin_cd);
		mnv.addObject("noticeList", noticeList);
		
		List<QnaVO> qnaList = thrAdminService.selectQnaForMain(admin_cd);
		mnv.addObject("qnaList", qnaList);
		
		List<EventVO> eventList = thrAdminService.selectEventForMain(admin_cd);
		mnv.addObject("eventList", eventList);
		
		int unreadedNoteCnt = commonAdminService.selectUnreadedNoteCnt(admin_cd);
		mnv.addObject("unreadedNoteCnt", unreadedNoteCnt);
		session.setAttribute("unreadedNoteCnt", unreadedNoteCnt);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/theaterAdminMain")
	public ModelAndView placeAdmin(ModelAndView mnv, HttpServletRequest req) throws SQLException {
		
		String url = "/thrAdmin/theaterAdminMain";
		
		HttpSession session = req.getSession();
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
		String admin_cd = (String) admin.get("CD");
		
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
		
		int result = thrAdminService.modifyHouse(house);
			HouseVO modifiedHouse = new HouseVO();
		if (result == 0) {
			modifiedHouse = thrAdminService.selectHouseByHouse_no(house.getHouse_no());
		} else {
			modifiedHouse = null;
		}
		
		try {
			entity = new ResponseEntity<>(modifiedHouse, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping("/theaterAdminDeleteHouse")
	public ResponseEntity<String> theaterAdminDeleteHouse(@RequestBody Object data) throws SQLException {
		int house_no = Integer.parseInt((String)data);
		ResponseEntity<String> entity = null;
		System.out.println(data);
		int result = thrAdminService.deleteHouse(house_no);
		String resultString = "";
		if (result > 0) {
			resultString = "X";
		} else {
			resultString = "O";
		}
		try {
			entity = new ResponseEntity<String>(resultString, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/noticeAdminMain")
	public ModelAndView noticeAdminMain(ModelAndView mnv, HttpServletRequest req, SearchCriteria cri) throws SQLException {
		String url = "/thrAdmin/noticeAdminMain";
		HttpSession session = req.getSession();
		
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
		String admin_cd = (String) admin.get("CD");
		
		if (cri.getAdminType().equals("")) {
			cri.setAdminType(admin_cd);
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
		System.out.println(notice);
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
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
		String admin_cd = (String) admin.get("CD");
		
		if (cri.getAdminType().equals("")) {
			cri.setAdminType(admin_cd);
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
	public void answerRegist(AnswerVO ans, HttpServletRequest req, HttpServletResponse res) throws IOException, SQLException {
		
		HttpSession session = req.getSession();
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
		String admin_cd = (String) admin.get("CD");
		
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
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
		String admin_cd = (String) admin.get("CD");
		
		if (cri.getAdminType().equals("")) {
			cri.setAdminType(admin_cd);
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
		System.out.println(registReq.getRelate_cd());
		EventVO event = registReq.toEventVO();
		
		// 이벤트 테이블에 등록
		sysAdminService.registEvent(event);
		int event_no = event.getEvent_no();
		String newContent = registReq.getEvent_content().replace("/common/getTempImg.do?fileName="+registReq.getOldFileName() 
																 ,"/common/getPicture.do?name="+registReq.getEvent_pic_path()+"&item_cd="+event_no+"&type=eventImg");
		
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
		if (modifyReq.getEvent_content().contains("/commonAdmin/getTempImg.do?fileName=")) {
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
	public ModelAndView eventAdminPastMain(ModelAndView mnv, HttpServletRequest req, SearchCriteria cri) throws SQLException {
		String url="/thrAdmin/eventAdminPastMain";
		
		HttpSession session = req.getSession();
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
		String admin_cd = (String) admin.get("CD");
		
		if (cri.getAdminType().equals("")) {
			cri.setAdminType(admin_cd);
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
	@RequestMapping("/movieAdminMain")
	public ModelAndView movieAdminMain (ModelAndView mnv, HttpServletRequest req, String date) throws SQLException, ParseException {
		
		String url = "/thrAdmin/movieAdminMain";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");

		Map<String, Object> data = new HashMap<String, Object>();
		
		HttpSession session = req.getSession();
		Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
		String admin_cd = (String) admin.get("CD");
		
		Date today = null;
		if (date == null) {
			today = new Date();
			data.put("date", new Date());
		} else {
			today = formatter.parse(date.trim());
			data.put("date", today);
			String today_String = formatter.format(today);
			mnv.addObject("today", today_String);
		}
		
		List<Map<String, Object>> movieList = thrAdminService.selectMovieListforMovieMain(today);
		mnv.addObject("movieList", movieList);
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
	@RequestMapping("/CheckScreenTimeClash")
	public ResponseEntity<String> checkScreenTimeClash (@RequestBody Map<String, Object> data) throws ParseException, SQLException {
		ResponseEntity<String> entity = null;
		
		int house_no = Integer.parseInt((String)data.get("house_no"));
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		Calendar cal = Calendar.getInstance();
		Date markTime = null;
		String startTime1 = ((String)data.get("startTime")).split("T")[0];
		String startTime2 = (((String)data.get("startTime")).split("T")[1]).split(".000Z")[0];
		String startTime3 = startTime1 + " " + startTime2;
		Date startTime = formatter.parse(startTime3);
		cal.setTime(startTime);
		cal.add(Calendar.HOUR, 9);
		startTime = cal.getTime();
		if (startTime.getHours() == 0 || startTime.getHours() == 1 ||startTime.getHours() == 2 || startTime.getHours() == 3) {
			markTime = formatter.parse(startTime3);
		} else {
			markTime = startTime;
		}
		String endTime1 = ((String)data.get("endTime")).split("T")[0];
		String endTime2 = (((String)data.get("endTime")).split("T")[1]).split(".000Z")[0];
		String endTime3 = endTime1 + " " + endTime2;
		Date endTime = formatter.parse(endTime3);
		cal.setTime(endTime);
		cal.add(Calendar.HOUR, 9);
		endTime = cal.getTime();
		
		data.put("house_no", house_no);
		data.put("startTime", startTime);
		data.put("endTime", endTime);
		data.put("markTime", markTime);
		
		int clashCnt = thrAdminService.checkScreenTimeClash(data);
		
		try {
			entity = new ResponseEntity<String>("" + clashCnt, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity; 
	}
	
	@RequestMapping("/addNewScreen")
	public void addNewScreen (ScreenVO screen, HttpServletResponse res) throws IOException, SQLException {
		Calendar cal = Calendar.getInstance();
		cal.setTime(screen.getStartdate());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if (7 <= hour && hour < 9) {
			screen.setGb_jojo("Y");
		} else {
			screen.setGb_jojo("N");
		}
		String date = "" + year
						 + (month < 10 ? "0" + month : month) 
						 + (day < 10 ? "0" + day : day); 

		System.out.println(screen);
		thrAdminService.addNewScreen(screen);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('새 영화가 상영표에 등록되었습니다.')");
		out.println("location.href='movieAdminMain.do?date="+date+"';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/screenDetail")
	public ResponseEntity<Map<String, Object>> screenDetail(@RequestBody Object screen_cd) throws SQLException {
		ResponseEntity<Map<String, Object>> entity = null;
		System.out.println(screen_cd);
		Map<String, Object> screen = thrAdminService.selectScreenByScreen_cd((String)screen_cd);
		
		try {
			entity = new ResponseEntity<>(screen, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		System.out.println(screen);
		return entity;
	}
	
	@RequestMapping("/screenModify")
	public void screenModify (ScreenVO screen, HttpServletResponse res) throws IOException, SQLException {
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(screen.getStartdate());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if (7 <= hour && hour < 9) {
			screen.setGb_jojo("Y");
		} else {
			screen.setGb_jojo("N");
		}
		String date = "" + year
						 + (month < 10 ? "0" + month : month) 
						 + (day < 10 ? "0" + day : day); 

		System.out.println(screen);
		thrAdminService.modifyScreen(screen);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('상영영화 수정이 완료되었습니다.')");
		out.println("location.href='movieAdminMain.do?date="+date+"';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/screenDelete")
	public void screenDelete (ScreenVO screen, HttpServletResponse res) throws IOException, SQLException {
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(screen.getStartdate());
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String date = "" + year
						 + (month < 10 ? "0" + month : month) 
						 + (day < 10 ? "0" + day : day); 

		System.out.println(screen);
		thrAdminService.deleteScreen(screen);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('상영영화 삭제가 완료되었습니다.')");
		out.println("location.href='movieAdminMain.do?date="+date+"';");
		out.println("</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/movieAdminStatistics")
	public ModelAndView movieAdminStatistics(ModelAndView mnv, SearchCriteria cri, HttpServletRequest req) throws SQLException {
		String url = "/thrAdmin/movieAdminStatistics";
		
		if (cri.getSearchType() == "") {
			HttpSession session = req.getSession();
			Map<String, Object> admin = (Map<String, Object>) session.getAttribute("loginUser");
			String admin_cd = (String) admin.get("CD");
			cri.setSearchType(admin_cd);
		}
		
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
		String url = "/thrAdmin/movieAdminStatistics_movie";
		
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
