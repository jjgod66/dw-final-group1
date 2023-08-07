package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.CommonAdminDAO;
import kr.or.dw.vo.Admin_NoteVO;

@Service
public class CommonAdminServiceImpl implements CommonAdminService {
	
	@Autowired
	private CommonAdminDAO commonAdminDAO;
	
	@Override
	public List<Map<String, Object>> selectThrList(String admin_cd) throws SQLException {
		return commonAdminDAO.selectThrList(admin_cd);
	}

	@Override
	public void sendNote(Admin_NoteVO note) throws SQLException {
		if (note.getNote_receiver().equals("allTheater")) {
			System.out.println("test success");
			List<Map<String, Object>> thrList = commonAdminDAO.selectThrList(note.getNote_sender());
			System.out.println(thrList);
			for (Map<String, Object> thr : thrList) {
				note.setNote_receiver((String)thr.get("ADMIN_CD"));
				commonAdminDAO.insertNote(note);
			}
		} else {
			System.out.println("Test fail");
			commonAdminDAO.insertNote(note);
		}
			
	}

	@Override
	public Map<String, Object> selectReceivedNoteList(Map<String, Object> dataMap) throws SQLException {
		
		int totalCount = commonAdminDAO.selectReceivedNoteListCount((String)dataMap.get("admin_cd"));
		dataMap.put("perPageNum", 5);
		dataMap.put("totalCount", totalCount);
		
		List<Map<String, Object>> noteList = commonAdminDAO.selectReceivedNoteList(dataMap);
		
		dataMap.put("noteList", noteList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectSendedNoteList(Map<String, Object> dataMap) throws SQLException {
		
		int totalCount = commonAdminDAO.selectSendedNoteListCount((String)dataMap.get("admin_cd"));
		dataMap.put("perPageNum", 5);
		dataMap.put("totalCount", totalCount);
		
		List<Map<String, Object>> noteList = commonAdminDAO.selectSendedNoteList(dataMap);
		
		dataMap.put("noteList", noteList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectNoteByNote_no(Map<String, Object> data) throws SQLException {
		commonAdminDAO.updateGb_read(data);
		return commonAdminDAO.selectNoteByNote_no(data);
	}

	@Override
	public void deleteNote(Map<String, Object> data) throws SQLException {
		commonAdminDAO.deleteNote(data);
	}

	@Override
	public int selectUnreadedNoteCnt(String admin_cd) throws SQLException {
		return commonAdminDAO.selectUnreadedNoteCnt(admin_cd);
	}

	@Override
	public List<Map<String, Object>> selectStatisticsMovie() throws SQLException {
		List<Map<String, Object>> resultList = null;
		resultList = commonAdminDAO.selectStatisticsMovie();
		return resultList;
	}
}
