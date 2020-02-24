/**
 * 
 */
package com.project.god;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.dao.MemberDAO;
import com.project.god.domain.MemberVO;
import com.project.god.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/**
 * 회원 관리 서비스 테스트
 * 
 * @author god
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@WebAppConfiguration
@Slf4j
public class MemberDAOTest {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberDAO memberDao;
	
	private MemberVO memberVO;
	
	private String id;
	private String email;
	
	@Before
	public void setUp() throws Exception {
		
		id="qwer1234"; // 자신 아이디
		email="qwer1234@naver.com"; // 자신 이메일
		//email="qwer123434@naver.com"; // 회원 정보에 없는 이메일
		//email="user56@abcd.com"; // 회원 정보에 타회원 이메일
		
		memberVO = new MemberVO();
		
		memberVO.setMemberId(id);
		memberVO.setMemberEmail(email);
	}

	@Test
	public void test() throws Exception {
		
		log.debug("isEnableEmail Test");
		
		int flag = sqlSession.selectOne("mapper.Member.isEnableEmailByIdAndEmail",
				memberVO);
		assertEquals(0, flag);
		
		assertTrue(flag==0 ? true:false);

		/*
		 * boolean flag2 = memberDao.isEnableEmail(id, email); assertTrue(flag2);
		 */
		
		
		
	}

}
