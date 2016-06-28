package com.aymen.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.ProcessStage;
import com.aymen.entity.Staff;
import com.aymen.service.ProcessStageService;
import com.aymen.service.UserCreationService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

@Controller
@RequestMapping(value = "/processstg")
public class ProcessStageController {

    @Autowired
    ProcessStageService prcStgSvc;

    @Autowired
    UserCreationService ucs;

    private static final Logger logger = LoggerFactory.getLogger(ProcessStageController.class);

    // @RequestMapping(method = RequestMethod.GET)
    // public String home(ModelMap model) {
    // logger.info("Welcome home! The client locale is {}.");
    // return "process/requestprocess";
    // }
    @RequestMapping(value = "/loadreqstage/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<ProcessStage> getData(@ModelAttribute("maReqStg") ProcessStage prcStg,
            BindingResult result, @PathVariable("id") int reqId, Model model) {
        return this.prcStgSvc.listSvcReqStgByReqId(reqId);
    }

    // Update request after status changing
    @RequestMapping("/reqstgid/{reqStgtId}/statusid/{statusId}/note/{note}")
    public @ResponseBody
    String updateReqStatus(@PathVariable("reqStgtId") int reqId,
            @PathVariable("statusId") int reqStatusId, @PathVariable("note") String note) {
        try {
            Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
            this.prcStgSvc.updateSvcStageStatus(reqId, reqStatusId, note, staff);

            return "1";
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            return "Request Status Updated ! " + "\n" + e.toString();
        }

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
