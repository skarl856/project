/**
 * 
 */
package com.project.god;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.god.domain.FaqVO;
import com.project.god.service.FaqService;

import lombok.extern.slf4j.Slf4j;

/**
 * FAQ 게시판 테스트
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
public class FaqServiceTest {

	@Autowired
	private FaqService faqService;
	
	private int limit;
	private int page;
	private String searchDate;
	private String searchKind;
	private String searchWord;
	
	
	@Before
	public void setUp() throws Exception {
		limit = 10;
		page = 2;
		searchDate = "전체";
		searchKind = "제목";
		searchWord = "제목";
	}

	@Test
	public void test() throws Exception {
		log.debug("faqService Test");
		List<FaqVO> articleFaqList = faqService.getFaqBySearch(searchDate, searchKind, searchWord.trim(), limit, page);
		assertEquals(8, articleFaqList.size());
	}

}
