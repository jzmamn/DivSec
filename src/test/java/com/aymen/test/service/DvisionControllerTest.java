package com.aymen.test.service;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.aymen.controller.DivisionController;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("/root-context.xml")

public class DvisionControllerTest {
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(new DivisionController()).build();
	}

	@Test
	public void testgetData() throws Exception {
		mockMvc.perform(get("/create1", 42).accept(MediaType.APPLICATION_JSON));
	}

	@Test
	public void testHome() throws Exception {
		mockMvc.perform(get("/", 42).accept(MediaType.APPLICATION_JSON));
	}
}
