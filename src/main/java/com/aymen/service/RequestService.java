package com.aymen.service;

import com.aymen.entity.Aproval;
import com.aymen.entity.EmailLog;
import java.util.List;

import com.aymen.entity.Request;
import com.aymen.entity.SmsLog;
import com.aymen.entity.Staff;

public interface RequestService {

    public void createSvcRequest(Request req);

    public void updateSvcRequest(Request req);

    public List<Request> listSvcRequest();

    public List<Request> listSvcRequestByDivision(int divId);

    public Request getSvcRequestById(int id);

    public void updateSvcRequestStatus(int reqId, int statusId, boolean isVoid, String note,Staff staff);

    public void deleteSvcRequest(int id);

    public List<Object> listSvcBatchCount();

    public List<Request> getSvcReqByStatus(int statusId);

    public List<Request> getSvcReqByStatusByDivision(int statusId, int divId);

    public Aproval getApprovalByRequestIdSvc(int reqId);

    // Save Approvals
    public void saveApprovalsSvc(int requestId, int appReqStatus, int appUserId);

    // Update Approvals
    public void updateApprovalsSvc(int requestId, int appReqStatus, int appUserId);

    //Print Approvals 
    public String printApprovalSvc();

    //Update Printed approvals
    public void updatePrintedApprovalsSvc();

    //Undo/Redo printed approvals
    public List<Object> listUndoPrintedSvc();

    //Undo/Redo the printed approvals
    public void undoPrintedSvc(int requestId, boolean flag, int staffId);

    // SMS Area
    public List<Object> getSvcSMSContent(int reqId);

    // SMS BULK Area
    public List<Object> getBulkSMSContentSvc();

    //Save SMS Log
    public void SaveSMSLogSvc(SmsLog smsLog);

    //Get SMS log
    public List<Object> listSMSLogSvc();

    //Email Bulik Area
    public List<Object> getBulkEmailContentSvc();

    //Save Email Log
    public void SaveEmailLogSvc(EmailLog emailLog);

    //Get Email Log
    public List<Object> listEmailLogSvc();

    // For Request Report
    public List<Request> filterRequest(int rqId, int sbId, int pbId, int dvId, int stsId, int staffId, String fromDate,
            String toDate);

    public List<Request> filterSvcAllRequest();

    public List<Object> getSvcRequestTrail(int rqId, int sbId, int pbId, int dvId, int stsId, int staffId,
            String fromDate, String toDate);

    public List<Object> getSvcOverDueRequests(int reqId, String fromDate, String toDate);

    public List<Object> getReminderRequestsSvc(int reqId, String fromDate, String toDate);

    public List<Object> getDivPeriodStatus(int divId, int month, int year);

    public List<Object> listSvcBatchCountByDivision(int divId);

}
