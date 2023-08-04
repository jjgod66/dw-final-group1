package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dw.service.CommonAdminService;
import kr.or.dw.service.ThrAdminService;
import kr.or.dw.vo.Admin_NoteVO;

@Controller
@RequestMapping("/commonAdmin")
public class CommonAdminController {

	private static final Logger logger = LoggerFactory.getLogger(SysAdminController.class);
	
	@Autowired
	private CommonAdminService commonAdminService;
	
	@RequestMapping("/thrNameList")
	public ResponseEntity<List<Map<String,Object>>> thrNameList (@RequestBody Object data) throws SQLException {
		ResponseEntity<List<Map<String,Object>>> entity = null;
		String admin_cd = (String) data;
		List<Map<String, Object>> thrList = commonAdminService.selectThrList(admin_cd);
		
		try {
			entity = new ResponseEntity<List<Map<String,Object>>>(thrList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<Map<String,Object>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/sendNote")
	public ResponseEntity<String> sendNote (@RequestBody Admin_NoteVO note) throws SQLException {
		ResponseEntity<String> entity = null;
		System.out.println(note);
		commonAdminService.sendNote(note);
		try {
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/receivedNoteList")
	public ResponseEntity<Map<String, Object>> receivedNoteList (@RequestBody Map<String, Object> dataMap) throws SQLException {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> newDataMap = commonAdminService.selectReceivedNoteList(dataMap);
		System.out.println(newDataMap);
		
		try {
			entity = new ResponseEntity<Map<String, Object>>(newDataMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/sendedNoteList")
	public ResponseEntity<Map<String, Object>> sendedNoteList (@RequestBody Map<String, Object> dataMap) throws SQLException {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> newDataMap = commonAdminService.selectSendedNoteList(dataMap);
		System.out.println(newDataMap);
		
		try {
			entity = new ResponseEntity<Map<String, Object>>(newDataMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/readNote")
	public ResponseEntity<Map<String, Object>> readNote (@RequestBody Map<String, Object> data, HttpServletRequest req) throws SQLException {
		ResponseEntity<Map<String, Object>> entity = null;
		System.out.println(data);
		Map<String, Object> note = commonAdminService.selectNoteByNote_no(data);
		System.out.println("unreaded : " + note.get("UNREADEDCNT"));
		HttpSession session = req.getSession();
		session.setAttribute("unreadedNoteCnt", note.get("UNREADEDCNT"));
		try {
			entity = new ResponseEntity<Map<String, Object>>(note, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	@RequestMapping("/deleteNote")
	public ResponseEntity<String> deleteNote (@RequestBody Map<String, Object> data) throws SQLException {
		ResponseEntity<String> entity = null;
		System.out.println(data);
		commonAdminService.deleteNote(data);
		
		try {
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
