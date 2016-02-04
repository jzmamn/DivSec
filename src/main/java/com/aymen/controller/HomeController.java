package com.aymen.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aymen.entity.Request;
import com.aymen.entity.Staff;
import com.aymen.service.DashboardService;
import com.aymen.service.UserCreationService;

@Controller

public class HomeController {

	@Autowired
	UserCreationService ucs;

	@Autowired
	DashboardService dbs;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private int divIdToHod = 0;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		logger.info("Welcome home! The client locale is {}.", locale);
		return "home";
	}

	@RequestMapping(value = "/getDashboard", method = RequestMethod.GET)
	public String getDashboard(ModelMap model) {

		String role = getUserRole();

		Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", staff.getStfId());
		model.addAttribute("stfDivId", staff.getDivision().getDivId());
		model.addAttribute("stfDivName", staff.getDivision().getDivName());
		model.addAttribute("userName", getPrincipal());
		model.addAttribute("role", getUserRole());

		if (role.equals("ROLE_ADMIN")) {
			return "dashboard_admin";
		} else if (role.equals("ROLE_HOD")) {
			return "dashboard_hod";
		} else {
			return "dashboard_staff";
		}
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model) {
		model.addAttribute("maRequest", new Request());

		Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", staff.getStfId());
		model.addAttribute("stfDivId", staff.getDivision().getDivId());
		model.addAttribute("stfDivName", staff.getDivision().getDivName());
		model.addAttribute("userName", getPrincipal());
		model.addAttribute("role", getUserRole());
		return "dashboard_admin";
	}

	@RequestMapping(value = "/hod", method = RequestMethod.GET)
	public String hodPage(ModelMap model) {
		model.addAttribute("maRequest", new Request());
		Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", staff.getStfId());

		if (divIdToHod == 0) {
			model.addAttribute("stfDivId", staff.getDivision().getDivId());
		} else {
			model.addAttribute("stfDivId", divIdToHod);
		}

		// model.addAttribute("stfDivId", staff.getDivision().getDivId());
		model.addAttribute("stfDivName", staff.getDivision().getDivName());
		model.addAttribute("userName", getPrincipal());
		model.addAttribute("role", getUserRole());
		return "dashboard_hod";
	}

	@RequestMapping(value = "/staff", method = RequestMethod.GET)
	public String staffPage(ModelMap model) {
		model.addAttribute("maRequest", new Request());

		Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
		model.addAttribute("stfId", staff.getStfId());
		model.addAttribute("stfDivId", staff.getDivision().getDivId());
		model.addAttribute("stfDivName", staff.getDivision().getDivName());
		model.addAttribute("userName", getPrincipal());
		model.addAttribute("role", getUserRole());
		return "dashboard_staff";
	}

	@RequestMapping(value = "/admin-to-hod/{divId}", method = RequestMethod.GET)
	public ModelAndView staffPage(ModelMap model, @PathVariable("divId") String divId) {
		model.addAttribute("maRequest", new Request());
		divIdToHod = Integer.parseInt(divId);
		return new ModelAndView("redirect:/hod");

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "errors_403";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/home?logout";
	}

	// ===================== START OF ADMIN DASHBOARD ==========================
	@RequestMapping(value = "dboard/donut-by-division/{divId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> donutByDivision(@PathVariable("divId") int divId) {
		return this.dbs.populateSvcDonutByDivision(divId);
	}

	@RequestMapping(value = "dboard/barchart-current-year", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> barchartCurrentYear() {
		return this.dbs.plotSvcBarChartCurrentYear();
	}

	@RequestMapping(value = "dboard/barchart-current-year/{year}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> barchartCurrentYear(@PathVariable("year") int year) {
		return this.dbs.plotSvcBarChartAnnual(year);
	}

	@RequestMapping(value = "dboard/table-summary-by-division", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> tableSummaryByDivision() {
		return this.dbs.populateSvcTableDivisionSummary();
	}

	@RequestMapping(value = "dboard/table-summary-by-monthly/{year}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> tableSummaryByMonthly(@PathVariable("year") int year) {
		return this.dbs.populateSvcTableMonthly(year);
	}

	@RequestMapping(value = "dboard/table-summary-by-annually", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> tableSummaryByMonthly() {
		return this.dbs.populateSvcTableAnnually();
	}

	@RequestMapping(value = "dboard/table-last-modified", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> tableLastModified() {
		return this.dbs.populateSvcTableLastModified();
	}

	// ===================== END OF ADMIN DASHBOARD ==========================

	// ===================== START OF HOD DASHBOARD ==========================
	@RequestMapping(value = "dboard/table-summary-by-month/{year}/{divId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> tableSummaryByMonthlyDivision(@PathVariable("year") int year,
			@PathVariable("divId") int divId) {
		return this.dbs.populateSvcTableMonthlyDivision(year, divId);
	}

	@RequestMapping(value = "dboard/table-summary-by-year/{year}/{divId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> tableSummaryByYearDivision(@PathVariable("year") int year,
			@PathVariable("divId") int divId) {
		return this.dbs.populateSvcTableAnnuallyDivision(year, divId);
	}

	@RequestMapping(value = "dboard/barchart_division/{year}/{divId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object> getBarchartByDivision(@PathVariable("year") int year,
			@PathVariable("divId") int divId) {
		return this.dbs.plotSvcBarChartDivsionAnnual(year, divId);
	}

	// ===================== END OF HOD DASHBOARD ============================

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	private String getUserRole() {
		String userRole = null;
		Object role = SecurityContextHolder.getContext().getAuthentication().getAuthorities();

		if (role instanceof UserDetails) {
			userRole = ((UserDetails) role).getAuthorities().toString();
		} else {
			userRole = role.toString();
		}

		userRole = userRole.replace("[", "");
		userRole = userRole.replace("]", "");
		return userRole;
	}

}
