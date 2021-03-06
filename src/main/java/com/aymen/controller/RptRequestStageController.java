package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.ProcessStage;
import com.aymen.entity.Staff;
import com.aymen.service.ProcessStageService;
import com.aymen.service.RequestService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/rptrequeststage")
public class RptRequestStageController {

    private static final Logger logger = LoggerFactory.getLogger(RptRequestStageController.class);

    @Autowired
    ProcessStageService prcStgSvc;

    @Autowired
    RequestService reqSvc;

    @Autowired
    UserCreationService ucs;

    @RequestMapping(method = RequestMethod.GET)
    public String home(ModelMap model) {
        logger.info("Welcome home! The client locale is {}.");

        if (getPrincipal().equals("anonymousUser")) {
            logger.info("anonymousUser");
            return "errors_403";
        }

        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
        model.addAttribute("stfId", staff.getStfId());
        model.addAttribute("stfDivId", staff.getDivision().getDivId());
        model.addAttribute("stfDivName", staff.getDivision().getDivName());
        model.addAttribute("userName", getPrincipal());
        model.addAttribute("role", getUserRole());

        model.addAttribute("user", getPrincipal());
        return "reports/process/rpt_request_stage";
    }

    @RequestMapping(value = "/loadallreqstage", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<ProcessStage> getProcessStg(Model model) {
        return this.prcStgSvc.listSvcReqStg();
    }

    @RequestMapping(value = "/loadreqstage/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<ProcessStage> getData(@ModelAttribute("maReqStg") ProcessStage prcStg,
            BindingResult result, @PathVariable("id") int reqId, Model model) {
        return this.prcStgSvc.listSvcReqStgByReqId(reqId);
    }

    // This method sends JSON response to the client (REST)
    @RequestMapping(value = "/loadrequestStage", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Object> getData() {
        return this.prcStgSvc.filterSvcAllRequestStage();
    }

    // display the count in the batch
    @RequestMapping(value = "/filterby/{reqId}/{sbjId}/{pubId}/{divId}/{statusId}/{staffId}/{fromDate}/{toDate}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Object> filterReport(@PathVariable("reqId") int reqId, @PathVariable("sbjId") int sbjId,
            @PathVariable("pubId") int pubId, @PathVariable("divId") int divId, @PathVariable("statusId") int statusId,
            @PathVariable("staffId") int staffId, @PathVariable("fromDate") String fromDate,
            @PathVariable("toDate") String toDate) {

        return this.prcStgSvc.filterSvcRequestStage(reqId, sbjId, pubId, divId, statusId, staffId, fromDate, toDate);
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
