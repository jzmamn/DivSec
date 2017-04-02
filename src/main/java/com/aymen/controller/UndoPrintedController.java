package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Division;
import com.aymen.entity.Staff;
import com.aymen.service.RequestService;
import com.aymen.service.UserCreationService;
import org.springframework.security.core.userdetails.User;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/undoprinted")
public class UndoPrintedController {

    private static final Logger logger = LoggerFactory.getLogger(UndoPrintedController.class);

    @Autowired
    RequestService reqSvc;

    @Autowired
    UserCreationService ucs;

    // This method is called just before the division.jsp file is loading on the
    // browser.
    @RequestMapping(method = RequestMethod.GET)
    public String home(@ModelAttribute("maDivision") Division division, ModelMap model) {
        logger.info("Welcome home! The client locale is {}.", division);
        if (getPrincipal().equals("anonymousUser")) {
            logger.info("anonymousUser", division);
            return "errors_403";
        }

        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
        model.addAttribute("stfId", staff.getStfId());
        model.addAttribute("stfName", staff.getStfName());
        model.addAttribute("stfDivId", staff.getDivision().getDivId());
        model.addAttribute("stfDivName", staff.getDivision().getDivName());
        model.addAttribute("userName", getPrincipal());
        model.addAttribute("role", getUserRole());
        model.addAttribute("cmdDivision", new Division());
        return "print/undoprinted";
    }

    @RequestMapping(value = "/loadundo", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Object> getUndoRedoPrinted() {
        return this.reqSvc.listUndoPrintedSvc();
    }

    @RequestMapping(value = "/mark_as_printed", method = RequestMethod.POST, params = "btnMarkAsPrinted")
    public String setAsPrinted(@RequestParam(value = "chkMa", required = true) String[] row,
            @RequestParam(value = "btnMarkAsPrinted", required = true) String btnMarkAsPrinted,
            ModelMap model) {

        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());

        try {
            for (int i = 0; i < row.length; i++) {
                int reqId = Integer.parseInt(row[i]);
                this.reqSvc.undoPrintedSvc(reqId, true, staff.getStfId());
            }
        } catch (Exception e) {
            logger.error(e.toString());
        }

        model.addAttribute("undo", "1");
        return "redirect:/undoprinted";

    }

    @RequestMapping(value = "/mark_as_printed", method = RequestMethod.POST, params = "btnMarkAsNotPrinted")
    public String setAsNotPrinted(@RequestParam(value = "chkMa", required = true) String[] row,
            @RequestParam(value = "btnMarkAsNotPrinted", required = true) String btnMarkAsNotPrinted,
            ModelMap model) {

        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());

        try {
            for (int i = 0; i < row.length; i++) {
                int reqId = Integer.parseInt(row[i]);
                this.reqSvc.undoPrintedSvc(reqId, false, staff.getStfId());
            }
        } catch (Exception e) {
            logger.error(e.toString());
        }

        model.addAttribute("undo", "0");
        return "redirect:/undoprinted";
    }

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
