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
		commonAdminDAO.insertNote(note);
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
		return commonAdminDAO.selectNoteByNote_no(data);
	}
}
