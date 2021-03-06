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

import com.aymen.entity.PublicIndividual;
import com.aymen.entity.Staff;
import com.aymen.service.PublicDetailService;
import com.aymen.service.UserCreationService;

@Controller
@RequestMapping(value = "/public")
public class PublicDetailController {
    
    private static final Logger logger = LoggerFactory.getLogger(PublicDetailController.class);
    
    @Autowired
    PublicDetailService pds;
    
    @Autowired
    UserCreationService ucs;
    
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String home(@ModelAttribute("maPublic") PublicIndividual pi, ModelMap model) {
        logger.info("Welcome home! The client locale is {}.");
        
        if (getPrincipal().equals("anonymousUser")) {
            logger.info("anonymousUser");
            return "errors_403";
        }
        
        Staff staff = ucs.getSvcStaffByUserId(getPrincipal());
        model.addAttribute("stfId", staff.getStfId());
        model.addAttribute("stfName", staff.getStfName());
        model.addAttribute("stfDivId", staff.getDivision().getDivId());
        model.addAttribute("stfDivName", staff.getDivision().getDivName());
        model.addAttribute("userName", getPrincipal());
        model.addAttribute("role", getUserRole());
        
        model.addAttribute("cmdPublic", new PublicIndividual());
        return "process/public";
    }

    // This method sends JSON response to the client (REST)
    @RequestMapping(value = "/loadpi", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<PublicIndividual> getListOfPI() {
        return this.pds.listSvcPublicIndividual();
    }
    
    @RequestMapping("/getpibyid/{id}")
    public @ResponseBody
    PublicIndividual getPIById(@PathVariable("id") int id) {
        return this.pds.getSvcPublicIndividualById(id);
    }

    // Create User or staff accounts - save and update
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public @ResponseBody
    String addPuclicDetail(@ModelAttribute("maPublic") PublicIndividual pi, BindingResult result,
            ModelMap model) {
        
        if (result.hasErrors()) {
            logger.error("addPuclicDetail", result.getAllErrors());
            System.out.println("c  " + result.getAllErrors());
            return "error/error";
        }
        
        model.addAttribute("piId", pi.getPiId());
        model.addAttribute("notification", pi.getNotification().getNtnId());
        model.addAttribute("piName", pi.getPiName());
        model.addAttribute("piAddress1", pi.getPiAddress1());
        model.addAttribute("piAddress2", pi.getPiAddress2());
        model.addAttribute("piAddress3", pi.getPiAddress3());
        model.addAttribute("piLandPhone", pi.getPiLandPhone());
        model.addAttribute("piMobilePhone", pi.getPiMobilePhone());
        model.addAttribute("piEmail", pi.getPiEmail());
        model.addAttribute("piIndUserId", pi.getPiIndUserId());
        model.addAttribute("piUserPwd", pi.getPiUserPwd());
        model.addAttribute("piNic", pi.getPiNic());
        model.addAttribute("piDob", pi.getPiDob());
        model.addAttribute("piGender", pi.getPiGender());
        model.addAttribute("piNote", pi.getPiNote());
        model.addAttribute("piUserId", pi.getPiUserId());
        model.addAttribute("piActive", pi.getPiActive());
        
        try {
            if (pi.getPiId() == null) {
                pi.getNotification().setNtnId(1);
                this.pds.createSvcPublicIndividual(pi);
                return "1";
            } else {
                this.pds.updateSvcPublicIndividual(pi);
                return "1";
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            // return "Save Failed ! " + "\n" + e.toString();
            logger.error(e.toString());
            return "Save Failed ! ";
        }
        
    }
    
    @RequestMapping("/delete/{id}")
    public @ResponseBody
    String deletePublicIndividual(@ModelAttribute("maPublicIndividual") PublicIndividual pi,
            BindingResult result, @PathVariable("id") int id, Model model) {
        try {
            this.pds.deleteSvcPublicIndividual(id);
            return "1";
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            logger.error(e.toString());
            return "Delete Failed ! " + "\n" + "Subject could not be deleted";
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
