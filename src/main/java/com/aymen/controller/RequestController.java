package com.aymen.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aymen.entity.Instructions;
import com.aymen.entity.Request;
import com.aymen.entity.Staff;
import com.aymen.service.InstructionService;
import com.aymen.service.RequestService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/reqprocess")
public class RequestController {

    private static final Logger logger = LoggerFactory.getLogger(DivisionController.class);

    @Autowired
    RequestService reqSvc;

    @Autowired
    InstructionService instSvc;

    @Autowired
    UserCreationService ucs;

    // format date at the binding time
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    @RequestMapping(method = RequestMethod.GET)
    public String home(@ModelAttribute("maRequest") Request req, ModelMap model) {
        logger.info("Welcome home! The client locale is {}.", req);

        if (getPrincipal().equals("anonymousUser")) {
            logger.info("anonymousUser");
            return "errors_403";
        }

        model.addAttribute("maRequest", new Request());

        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
        model.addAttribute("stfId", staff.getStfId());
        model.addAttribute("stfDivId", staff.getDivision().getDivId());
        model.addAttribute("stfDivName", staff.getDivision().getDivName());
        model.addAttribute("userName", getPrincipal());
        model.addAttribute("role", getUserRole());

        return "process/requestprocess";
    }

    // Save or Update Request
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String addRequest(@ModelAttribute("maRequest") Request req, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            logger.error("addRequest", result.getAllErrors());
            System.out.println("hi this is a good" + result.getAllErrors());
            return "error/error";
        }

        if (getPrincipal().equals("anonymousUser")) {
            logger.info("anonymousUser");
            return "errors_403";
        }

        model.addAttribute("reqId", req.getReqId());
        model.addAttribute("division", req.getDivision().getDivId());
        model.addAttribute("publicIndividual", req.getPublicIndividual().getPiId());
        model.addAttribute("staff", req.getStaff().getStfId());
        model.addAttribute("subject", req.getSubject().getSbjId());
        model.addAttribute("reqEntDate", req.getReqEntDate());
        model.addAttribute("reqNote", req.getReqNote());
        model.addAttribute("reqFees", req.getReqFees());
        model.addAttribute("reqDurartion", req.getReqDurartion());
        model.addAttribute("reqStatusId", req.getRequestStatus().getRsId());
        model.addAttribute("reqIsRead", req.getReqIsRead());
        model.addAttribute("reqProcessed", req.getReqProcessed());
        model.addAttribute("reqIsVoid", req.getReqIsVoid());

        if (req.getReqId() == null) {
            this.reqSvc.createSvcRequest(req);
        } else {
            this.reqSvc.updateSvcRequest(req);
        }
        model.addAttribute("maRequest", new Request());
        return "process/requestprocess";
    }

    // This method sends JSON response to the client (REST)
    @RequestMapping(value = "/loadrequest", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Request> getData() {
        if (getPrincipal().equals("anonymousUser")) {
            logger.info("anonymousUser");
            return null;
        }
        return this.reqSvc.listSvcRequest();
    }

    // This method sends JSON response to the client (REST)
    @RequestMapping(value = "/loadrequest/{divId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody

    List<Request> getData(@PathVariable("divId") int divId) {

        if (getPrincipal().equals("anonymousUser")) {
            logger.info("anonymousUser ");
        }
        return this.reqSvc.listSvcRequestByDivision(divId);
    }

    // Delete a division using division id
    @RequestMapping("/delete/{id}")
    public @ResponseBody
    String deleteDivision(@ModelAttribute("maRequest") Request req, BindingResult result,
            @PathVariable("id") int id, Model model) {
        try {
            model.addAttribute("maRequest", new Request());
            this.reqSvc.deleteSvcRequest(id);
            return "1";
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            return "Delete Failed ! " + "\n" + e.toString();
        }

    }

    // Update request after status changing
    @RequestMapping("/requestid/{requestId}/statusid/{statusId}/void/{void}/note/{note}")
    public @ResponseBody
    String updateReqStatus(@PathVariable("requestId") int reqId,
            @PathVariable("statusId") int reqStatusId, @PathVariable("void") boolean isVoid,
            @PathVariable("note") String note) {

        try {
            Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
            int staffId = staff.getStfId();

            this.reqSvc.updateSvcRequestStatus(reqId, reqStatusId, isVoid, note, staff);

            if (reqStatusId == 5 || reqStatusId == 6 || reqStatusId == 7) {

                if (reqSvc.getApprovalByRequestIdSvc(reqId) == null) {
                    reqSvc.saveApprovalsSvc(reqId, reqStatusId, staffId);
                } else {
                    reqSvc.updateApprovalsSvc(reqId, reqStatusId, staffId);
                }
            }

            return "1";
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            return "Request Status Updated ! " + "\n" + e.toString();
        }
    }

    // display the count in the batch
    @RequestMapping(value = "/batchcount", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Object> getBatchCount() {
        return this.reqSvc.listSvcBatchCount();
    }

    @RequestMapping(value = "/batchcount/{divId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Object> getBatchCountByDivision(@PathVariable("divId") int divId) {
        return this.reqSvc.listSvcBatchCountByDivision(divId);
    }

    // display request by status
    @RequestMapping(value = "/status/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Request> loadRequestByStaus(@PathVariable("id") int id) {
        return this.reqSvc.getSvcReqByStatus(id);
    }

    // display request by status
    @RequestMapping(value = "/status/{id}/{divId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Request> loadRequestByStausByDivision(@PathVariable("id") int id,
            @PathVariable("divId") int divId) {
        return this.reqSvc.getSvcReqByStatusByDivision(id, divId);
    }

    // Add Instruction
    @RequestMapping("instruction/{requestId}/{instruction}/{isRead}")
    public @ResponseBody
    String saveInstruction(@PathVariable("requestId") int reqId,
            @PathVariable("instruction") String instruction, @PathVariable("isRead") boolean isRead) {
        try {

            Instructions inst = new Instructions();
            Request req = new Request();
            Staff staff = ucs.getSvcStaffByUserId(getPrincipal());

            req.setReqId(reqId);
            inst.setRequest(req);
            inst.setInsInstruction(instruction);

            inst.setInsIsRead(isRead);
            inst.setStaff(staff);

            this.instSvc.createSvcInstruction(inst);

            return "1";
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            return "Request Status Updated ! " + "\n" + e.toString();
        }
    }

    // Get Instruction by request id
    // display request by status
    @RequestMapping(value = "/inst/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Instructions> loadInstByReqId(@PathVariable("id") int id) {
        return this.instSvc.listSvcInstByRequest(id);
    }

    // This gets the SMS message
    @RequestMapping(value = "/send-sms/{reqId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<Object> sendSMS(@PathVariable("reqId") int reqId) {
        return this.reqSvc.getSvcSMSContent(reqId);
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
