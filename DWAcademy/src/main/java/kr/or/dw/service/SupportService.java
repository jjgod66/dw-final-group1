package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.FaqVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.QnaAttachVO;
import kr.or.dw.vo.QnaVO;

public interface SupportService {

	/**
	 * 자주묻는질문 목록
	 * @param cri
	 * @return
	 */
	Map<String, Object> getFaQList(SearchCriteria cri) throws SQLException;

	/**
	 * 고객센터 메인이 띄울 자주묻는질문 5개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<FaqVO> getFaQ5() throws SQLException;

	/**
	 * 입력한 비회원 정보로 질문한게 있는지 확인하는 메서드
	 * @param qna
	 * @return
	 * @throws SQLException
	 */
	String nonMemInqYN(QnaVO qna) throws SQLException;

	/**
	 * 비회원 문의내역 리스트
	 * @param qna
	 * @param keyword 
	 * @return
	 * @throws SQLException
	 */
	List<QnaVO> getNonMemQnaList(QnaVO qna, String keyword) throws SQLException;

	/**
	 * 질문 가져오기
	 * @param que_no
	 * @return
	 */
	QnaVO getQnaByQueNo(int que_no) throws SQLException;

	/**
	 * 답변 가져오기
	 * @param que_no
	 * @return
	 */
	AnswerVO getAnswerByQueNo(int que_no) throws SQLException;

	/**
	 * 문의 삭제
	 * @param que_no
	 * @throws SQLException
	 */
	void deleteQna(int que_no) throws SQLException;

	/**
	 * 문의 선택에 따른 타입 가져오는 메서드
	 * @param que_sel
	 * @return
	 * @throws SQLException
	 */
	List<String> getQueType(String que_sel) throws SQLException;

	/**
	 * 지역에 따른 지점들 가져오는 메서드
	 * @param thr_loc
	 * @return
	 * @throws SQLException
	 */
	List<String> getThrList(String thr_loc) throws SQLException;

	/**
	 * 문의 작성
	 * @param qna
	 * @param attach
	 * @throws SQLException
	 */
	void registQna(QnaVO qna, QnaAttachVO attach) throws SQLException;

	/**
	 * 공지사항 5개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<NoticeVO> getNotice5() throws SQLException;

	/**
	 * 공지사항 리스트
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException;

	/**
	 * 공지사항 2개
	 * @return
	 * @throws SQLException
	 */
	List<NoticeVO> getNotice2() throws SQLException;

	/**
	 * 공지사항 상세보기
	 * @param notice_no
	 * @return
	 * @throws SQLException
	 */
	NoticeVO getNoticeDetail(int notice_no) throws SQLException;

	/**
	 * 나의 문의 내역 조회
	 * @param cri
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> getAllMyQuestionList(SearchCriteria cri, String mem_cd) throws SQLException;

	/**
	 * 나의 문의 내역 검색
	 * @param cri
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> searchMyQuestionList(SearchCriteria cri, String mem_cd) throws SQLException;

	/**
	 * 1대1문의 첨부파일 가져오는 메서드
	 * @param que_no
	 * @return
	 * @throws SQLException
	 */
	QnaAttachVO getQnaAttachByQnaNo(int que_no) throws SQLException;

	/**
	 * 문의 내역 5개 가져오기
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> get5MyQuestionList(String mem_cd) throws SQLException;

}
