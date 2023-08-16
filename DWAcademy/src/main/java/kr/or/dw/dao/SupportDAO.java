package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.FaqVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.QnaAttachVO;
import kr.or.dw.vo.QnaVO;

@Mapper
public interface SupportDAO {

	/**
	 * 자주묻는질문 리스트
	 * @param cri
	 * @param rowBounds
	 * @return
	 * @throws SQLException
	 */
	List<FaqVO> selectFaQList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/**
	 * 자주묻는질문 갯수
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	int selectFaQListCount(SearchCriteria cri) throws SQLException;

	/**
	 * 고객센터 메인에 띄울 자주묻는질문 5개
	 * @return
	 * @throws SQLException
	 */
	List<FaqVO> selectFaQ5() throws SQLException;

	/**
	 * 입력한 정보로 질문한 내역 갯수
	 * @param qna
	 * @return
	 * @throws SQLException
	 */
	int selectNonMemInqCount(QnaVO qna) throws SQLException;

	/**
	 * 비회원 문의내역 리스트
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	List<QnaVO> selectNonMemQnaList(Map<String, Object> param) throws SQLException;

	/**
	 * 질문
	 * @param que_no
	 * @return
	 */
	QnaVO selectQnaByQueNo(int que_no) throws SQLException;

	/**
	 * 답변
	 * @param que_no
	 * @return
	 */
	AnswerVO selectAnswerByQueNo(int que_no) throws SQLException;

	/**
	 * 문의 삭제
	 * @param que_no
	 * @throws SQLException
	 */
	void deleteQna(int que_no) throws SQLException;

	/**
	 * 문의 선택에 따른 문의 타입 가져오는 메서드
	 * @param que_sel
	 * @return
	 * @throws SQLException
	 */
	List<String> selectQueTypeList(String que_sel) throws SQLException;

	/**
	 * 지역에 따른 지점 목록 가져오는 메서드
	 * @param thr_loc
	 * @return
	 * @throws SQLException
	 */
	List<String> selectThrList(String thr_loc) throws SQLException;

	/**
	 * 문의 파일 등록
	 * @param attach
	 * @throws SQLException
	 */
	void registQnaAttach(QnaAttachVO attach) throws SQLException;

	/**
	 * 회원 문의 작성
	 * @param qna
	 */
	void registQnaMem(QnaVO qna) throws SQLException;

	/**
	 * 비회원 문의 작성
	 * @param qna
	 * @throws SQLException
	 */
	void registQnaNonMem(QnaVO qna) throws SQLException;

	/**
	 * 공지사항 5개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<NoticeVO> selectNotice5() throws SQLException;

	/**
	 * 공지사항 리스트
	 * @param cri
	 * @param rowBounds
	 * @return
	 * @throws SQLException
	 */
	List<NoticeVO> selectNoticeList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/**
	 * 공지사항 갯수
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	int selectNoticeCount(SearchCriteria cri) throws SQLException;

	/**
	 * 공지사항 2개
	 * @return
	 * @throws SQLException
	 */
	List<NoticeVO> selectNotice2() throws SQLException;

	/**
	 * 공지사항 상세보기
	 * @param notice_no
	 * @return
	 * @throws SQLException
	 */
	NoticeVO selectNoticeDetail(int notice_no) throws SQLException;

//	/**
//	 * 나의 문의 내역 조회
//	 * @param cri
//	 * @param rowBounds
//	 * @param mem_cd
//	 * @return
//	 */
//	List<Map<String, Object>> getAllMyQuestionList(SearchCriteria cri, RowBounds rowBounds, @Param("mem_cd")String mem_cd) throws SQLException;
//
//	/**
//	 * 나의 문의 내역 총 개수
//	 * @param cri
//	 * @param mem_cd
//	 * @return
//	 */
//	int MyQuestionListCnt(SearchCriteria cri, @Param("mem_cd")String mem_cd) throws SQLException;

	/**
	 * 나의 문의 내역 검색
	 * @param cri
	 * @param rowBounds
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> searchMyQuestionList(@Param("cri")SearchCriteria cri, RowBounds rowBounds, @Param("mem_cd")String mem_cd) throws SQLException;

	/**
	 * 나의 문의 내역 검색 총 개수
	 * @param cri
	 * @param mem_cd
	 * @return
	 */
	int searchMyQuestionListCnt(@Param("cri")SearchCriteria cri, @Param("mem_cd")String mem_cd) throws SQLException;

	/**
	 * 나의문의내역 조회
	 * @param param
	 * @param rowBounds
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> getAllMyQuestionList(Map<String, Object> param, RowBounds rowBounds) throws SQLException;

	/**
	 * 나의 문의내역 갯수
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	int MyQuestionListCnt(Map<String, Object> param)throws SQLException ;

	/**
	 * 1대1문의 첨부파일 가져오는 메서드
	 * @param que_no
	 * @return
	 * @throws SQLException
	 */
	QnaAttachVO selectAttachByQnaNo(int que_no) throws SQLException;

	/**
	 * 문의 내역 5개 가져오기
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> get5MyQuestionList(String mem_cd) throws SQLException;

}
