package com.project.god.dao;

import java.util.List;

import com.project.god.domain.FaqVO;

/**
 * Faq 게시판 DAO
 * 자주묻는 질문 
 * 
 * @author god
 *
 */

public interface FaqDAO {
	
	/**
	 * 글쓰기 Faq
	 * 
	 * @param faqVO 객체
	 * @return 글쓰기 성공여부
	 * 
	 */
	boolean writeFaq(FaqVO faqVO);
	
	/**
	 * Faq 게시판 마지막 Seq
	 * 
	 * @return Faq 게시판 마지막 Seq
	 */
	int getFaqNumByLastSeq();
	
    /**
     * Faq 게시판  레코드(튜플) 조회(read)
     * 
     * @param page 페이지
     * @param rowsPerPage 페이지 당 행수
     * @return Faq 리스트
     * 
     */
	List<FaqVO> getArticleFaqList(int page, int rowsPerPage);
	
	/**
	 * 게시글 목록 수 조회
	 * 
	 * @return 게시글 목록 수
	 * 
	 */
	int getFaqListCount();
	
	/**
	 * 개별 게시글 조회
	 * 
	 * @param faqId 게시글 번호
	 * @return Faq 게시글 객체
	 * @throws Exception 예외처리
	 * 
	 */
	public FaqVO getFaq(int faqId) throws Exception;
	
	/**
	 * 게시글 조회수 증가
	 * 
	 * @param faqId 게시글 번호
	 * @throws Exception 예외처리
	 * 
	 */
	public void increaseFaqViewcnt(int faqId) throws Exception;
	
	/**
	 * 이전 게시글
	 * 
	 * @param faqId 게시글 번호
	 * @return 이전 게시글 번호
	 */
	int getPre(int faqId);
	
	/**
	 * 다음 게시글
	 * 
	 * @param faqId 게시글 번호
	 * @return 다음 게시글 번호
	 */
	int getNext(int faqId);

	/**
	 * 게시글 수정
	 * 
	 * @param faqVO 게시판 객체
	 * @throws Exception 예외처리
     * 
     */
	public void updateFaq(FaqVO faqVO) throws Exception;
	
	/**
	 * 게시글 삭제
	 * 
	 * @param faqId 게시글 번호
	 * @throws Exception 예외처리
     * 
     */
	public void deleteFaq(int faqId) throws Exception;

	/**
	 * 검색/페이징을 이용한 게시글 조회
	 * 
	 * @param searchDate 검색기간
	 * @param searchKind 검색종류
	 * @param searchWord 검색단어
	 * @param page 페이지
     * @param rowsPerPage 페이지 당 행수
	 * @return 검색 결과 게시글 객체
	 * 
	 */
	List<FaqVO> getFaqBySearch(String searchDate,
							   String searchKind, 
							   String searchWord, 
							   int rowsPerPage,
							   int page);
	
	/**
	 * 검색/페이징을 이용한 전체 게시글 조회수
	 * 
	 * @param searchDate 검색기간
	 * @param searchKind 검색종류
	 * @param searchWord 검색단어
	 * @return 검색 결과 전체 게시글 수
	 * 
	 */
	int getAllFaqsBySearch(String searchDate,
						   String searchKind, 
						   String searchWord);
	
}
