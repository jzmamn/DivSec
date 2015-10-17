package com.aymen.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.Test;

import com.aymen.entity.Division;
import com.aymen.service.DivisionService;

@Test
@ContextConfiguration(locations = { "classpath:test-servlet-context.xml" })
public class DvisionServiceTest extends AbstractTestNGSpringContextTests {

	@Autowired
	DivisionService divDao;

	@Test()
	public void createDivision() {
		Division div = new Division();
		div.setDivName("TestDiv");
		div.setDivActive(true);
		divDao.createSvcDivision(div);

	}

}
